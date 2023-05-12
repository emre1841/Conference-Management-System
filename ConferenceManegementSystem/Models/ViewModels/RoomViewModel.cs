using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.ViewModels
{
    public class RoomViewModel
    {
        public Room Room { get; set; }
        public int UserCount { get; set; }
        public bool IsFavorite { get; set; }
        public bool IsLock { get; set; }
    }
}