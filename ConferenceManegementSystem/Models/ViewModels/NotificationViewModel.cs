using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.ViewModels
{
    public class NotificationViewModel
    {
        public Notification Notification { get; set; }
        public List<Notification> Notifications { get; set; }
    }
}