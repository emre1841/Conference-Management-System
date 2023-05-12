using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Action = ConferenceManagementSystem.Models.Entities.Action;

namespace ConferenceManegementSystem.Controllers
{
    public class ActionController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        // GET: Action
        public ActionResult Index()
        {
            var action = context.Actions.ToList();

            return View(action);
        }

        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(string ActionName)
        {
            Action action = new Action()
            {
                ActionName = ActionName
            };
            context.Actions.Add(action);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Update(int actionId)
        {
            var action = context.Actions.Where(a=>a.Id==actionId).FirstOrDefault();
            return View(action);
        }
        [HttpPost]
        public ActionResult Update(ConferenceManagementSystem.Models.Entities.Action action)
        {
            var result = context.Actions.Where(a => a.Id == action.Id).FirstOrDefault();

            result.ActionName = action.ActionName;
            
            context.Entry(result).State = EntityState.Modified;
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int actionId)
        {
            var action = context.Actions.Where(a => a.Id == actionId).FirstOrDefault();
            context.Actions.Remove(action);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult ActionList(int roleId)
        {
            var roleActions = context.RoleActions.Include(r => r.Action).Where(r => r.RoleId == roleId).ToList();
            
            var action = context.Actions.ToList();
            ViewBag.Actions = action;
            ViewBag.RoleId = roleId;
            return View(roleActions);

        }
        [HttpPost]
        public ActionResult AddRoleAction(int actionId, int roleId)
        {
            var haveAction = context.RoleActions.Where(r=>r.ActionId == actionId && r.RoleId == roleId);
            if (haveAction.Count()==0)
            {
                RoleAction roleAction = new RoleAction();
                roleAction.ActionId = actionId;
                roleAction.RoleId = roleId;
                context.RoleActions.Add(roleAction);
                context.SaveChanges();
            }
            
            return RedirectToAction("ActionList", new {roleId = roleId });
        }
        public ActionResult DeleteRoleAction(int roleActionId)
        {
            var roleAction = context.RoleActions.Where(r=>r.Id == roleActionId).FirstOrDefault();
            context.RoleActions.Remove(roleAction);
            context.SaveChanges();
            return RedirectToAction("ActionList", new { roleId = roleAction.RoleId });
        }


    }
}