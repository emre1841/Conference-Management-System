using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.Entities
{
    public class ActivityLogs
    {
        public int Id { get; set; }
        public User User { get; set; }
        public int UserId { get; set; }

        public string Activity { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}