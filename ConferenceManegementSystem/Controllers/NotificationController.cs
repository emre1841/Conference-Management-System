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
    public class NotificationController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();

        public ActionResult Index()
        {
            var notifications = context.Notifications.ToList();
            return View(notifications);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Notification notification)
        {
            context.Notifications.Add(notification);
            context.SaveChanges();

            int userId = Convert.ToInt32(Session["userId"].ToString());
            logManager.SaveActivity(userId, "Created notification : "+notification.Title );

            return RedirectToAction("Index");
        }
        public ActionResult Update(int id)
        {
            var notification = context.Notifications.Where(n => n.Id == id).FirstOrDefault();
            return View(notification);
        }
        [HttpPost]
        public ActionResult Update(Notification notification)
        {
            var model = context.Notifications.Where(n => n.Id == notification.Id).FirstOrDefault();
            model.Title = notification.Title;
            model.Explanation = notification.Explanation;
            context.Entry(model).State = EntityState.Modified;
            context.SaveChanges();
            int userId = Convert.ToInt32(Session["userId"].ToString());
            logManager.SaveActivity(userId, "Updated notification : " + model.Title);

            return RedirectToAction("Index");

        }
        public ActionResult Delete(int id)
        {
            var notification = context.Notifications.Where(n => n.Id == id).FirstOrDefault();
            context.Notifications.Remove(notification);
            context.SaveChanges();
            int userId = Convert.ToInt32(Session["userId"].ToString());
            var activity = "Deleted notification : ";
            logManager.SaveActivity(userId,  activity+= notification.Title);
            return RedirectToAction("Index");
        }
        public JsonResult GetNotifications()
        {
            var notifications = context.Notifications.ToList().OrderByDescending(n => n.Id);
            return Json(notifications, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Details(int? id)
        {
            NotificationViewModel notificationView = new NotificationViewModel();
            if (id != null)
            {
                var notification = context.Notifications.Where(n => n.Id == id).FirstOrDefault();
                notificationView.Notification = notification;

            }

            notificationView.Notifications = context.Notifications.Where(n => n.Id != id).ToList();
            int userId = Convert.ToInt32(Session["userId"].ToString());
            logManager.SaveActivity(userId, "Viewed notifications" );
            return View(notificationView);
        }
    }
}