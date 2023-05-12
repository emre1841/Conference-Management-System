using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using ConferenceManagementSystem.Models.ViewModels;
using ConferenceManegementSystem.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManagementSystem.Controllers
{
    public class AccountController : Controller
    {

        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();

        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            var user = context.Users.Include(u => u.Role).Where(u => u.Email == model.Email && u.Password == model.Password).FirstOrDefault();
            try
            {
                if (user != null)
                {
                    Session["userId"] = user.Id;
                    Session["gender"] = user.Gender;
                    Session["userRole"] = user.Role.RoleName;
                    Session["userName"] = user.Name + " " + user.Surname;
                    logManager.SaveActivity(user.Id,"Login application");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.Error = "User name or password wrong!!";
                }
            }
            catch (Exception)
            {

                throw;
            }
            return View();
        }

        public ActionResult Register()
        {
            var roles = context.Roles.Where(r => r.RoleName != "Admin").ToList();
            ViewBag.Roles = roles;
            return View();
        }
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            if (model.Password != model.ConfirmPassword)
            {
                return View();
            }
            try
            {
                User user = new User
                {
                    Name = model.Name,
                    Surname = model.Surname,
                    Email = model.Email,
                    Password = model.Password,
                    RoleId = model.RoleId,
                    Gender = Convert.ToBoolean(model.Gender)

                };

                context.Users.Add(user);
                context.SaveChanges();
                logManager.SaveActivity(user.Id, "Register application");

            }
            catch (Exception)
            {

                throw;
            }


            return RedirectToAction("Login", "Account");
        }

        public ActionResult LogOut()
        {
            var userId = Convert.ToInt32(Session["userId"].ToString());
            logManager.SaveActivity(userId, "Logout application");
            Session.RemoveAll();
            return RedirectToAction("Login");
        }
        public ActionResult ChangePassword()
        {

            return View();
        }
        [HttpPost] 
        public ActionResult ChangePassword(string newPassword, string confirmPassword, string oldPassword)
        {
            var userId = Convert.ToInt32(Session["userId"].ToString());
            var user = context.Users.Where(u => u.Id == userId).FirstOrDefault();
            if (user.Password == oldPassword)
            {
                if (newPassword == confirmPassword)
                {
                    if (user.Password != newPassword)
                    {
                        user.Password = newPassword;
                        context.Entry(user).State = EntityState.Modified;
                        context.SaveChanges();
                
                        logManager.SaveActivity(userId, "Changed Password");
                    }
                    else
                    {
                        TempData["Error"] = "Your old password cannot be same your new password";
                        return RedirectToAction("Index", "Home");

                    }

                }
            }

            return RedirectToAction("LogOut", "Account");
        }
    }
}