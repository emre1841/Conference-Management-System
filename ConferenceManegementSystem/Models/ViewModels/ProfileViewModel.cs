using ConferenceManagementSystem.Models.Entities;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.ViewModels
{
    public class ProfileViewModel
    {
        public User User { get; set; }
        public string RoomName { get; set; }

    }
}