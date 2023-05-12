using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManegementSystem.Abstract
{
    public  class LogManager 
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();

        public void SaveActivity(int userId, string activity)
        {

            ActivityLogs activityLogs = new ActivityLogs()
            {
                UserId = userId,
                CreatedDate = DateTime.Now,
                Activity = activity
            };
            context.ActivityLogs.Add(activityLogs);
            context.SaveChanges();
        }
    }
}