using ConferenceManagementSystem.Models.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManagementSystem.Controllers
{
    
    public class ActivityLogController : Controller
        
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        // GET: ActivityLog
        public ActionResult Index()
        {
            var logs = context.ActivityLogs.Include(x=>x.User).ToList().OrderByDescending(x=>x.CreatedDate);
            return View(logs);
        }
    }
}