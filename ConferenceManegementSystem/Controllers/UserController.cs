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

namespace ConferenceManegementSystem.Controllers
{
    public class UserController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();

        // GET: User
        public ActionResult Index()
        {
            var users = context.Users.Include(u => u.Role).Where(u => u.Role.RoleName != "Admin").ToList();
            return View(users);
        }
        public ActionResult Create ()
        {
            var roles = context.Roles.Where(r => r.RoleName != "Admin").ToList();
            ViewBag.Roles = roles;
            return View();
        }
        [HttpPost]
        public ActionResult Create(RegisterViewModel model)
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

                int userId = Convert.ToInt32(Session["userId"].ToString());

                logManager.SaveActivity(userId, "Created user : " + user.Name + " " + user.Surname);

            }
            catch (Exception)
            {

                throw;
            }


            return RedirectToAction("Index", "User");
        }
        public ActionResult Update(int userId)
        {
            var user = context.Users.Where(u => u.Id == userId).FirstOrDefault();
            var roles = context.Roles.ToList();
            ViewBag.Roles = new SelectList(context.Roles,"Id", "RoleName");
            return View(user);
        }
        [HttpPost]
        public ActionResult Update(User user)
        {
            var result = context.Users.Where(u => u.Id == user.Id).FirstOrDefault();
            result.Name = user.Name;
            result.Surname = user.Surname;
            result.Gender = user.Gender;
            result.RoleId = user.RoleId;
            context.Entry(result).State = EntityState.Modified;
            context.SaveChanges();
            int userId = Convert.ToInt32(Session["userId"].ToString());

            logManager.SaveActivity(userId, "Updated user : "+result.Name +" "+ result.Surname);

            return RedirectToAction("Index");
        }
        public ActionResult Delete(int userId)
        {
            var user = context.Users.Where(u => u.Id == userId).FirstOrDefault();
            context.Users.Remove(user);
            context.SaveChanges();
            int id = Convert.ToInt32(Session["userId"].ToString());

            logManager.SaveActivity(id, "Deleted user : "+user.Name+" "+user.Surname);

            return RedirectToAction("Index");

        }
        public ActionResult Profile()
        {
            int userId = Convert.ToInt32(Session["userId"].ToString());
            var user = context.Users.Include(u=>u.Role).Where(u=>u.Id == userId).FirstOrDefault();
            var room = context.RoomUsers.Include(r => r.Room).Where(r => r.UserId == userId).FirstOrDefault();
            ProfileViewModel profileViewModel = new ProfileViewModel();

            profileViewModel.User = user;
            if (Session["userRole"].ToString()!="Admin")
            {
                if (room!=null)
                {
                    profileViewModel.RoomName = room.Room.RoomName;
                   
                }

            }

            logManager.SaveActivity(userId, " Viewed the profile ");
            return View(profileViewModel);
        }
    }
}