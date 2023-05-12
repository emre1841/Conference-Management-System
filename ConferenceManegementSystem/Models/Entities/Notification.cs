using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.Entities
{
    public class Notification
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Explanation { get; set; }
    }
}