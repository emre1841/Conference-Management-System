using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManegementSystem.Controllers
{
    public class RoleController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        public ActionResult Index()
        {
            var roles = context.Roles.ToList();
            return View(roles);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Role role)
        {
            context.Roles.Add(role);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Update(int roleId)
        {
            var role = context.Roles.Where(r => r.Id == roleId).FirstOrDefault();
            return View(role);
        }
        [HttpPost]
        public ActionResult Update(Role role)
        {
            var result = context.Roles.Where(r => r.Id == role.Id).FirstOrDefault();
            result.RoleName = role.RoleName;
            result.Description = role.Description;
            context.Entry(result).State = EntityState.Modified;
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int roleId)
        {
            var role = context.Roles.Where(r => r.Id == roleId).FirstOrDefault();
            context.Roles.Remove(role);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        
    }


}