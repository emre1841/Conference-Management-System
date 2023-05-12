using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.ViewModels
{
    public class RoomMessagesViewModel
    {
        public List<RoomUser> RoomUsers { get; set; }
        public List<Message> Messages { get; set; }
        public int UserId { get; set; }
        public int RoomId { get; set; }
        public string RoomName { get; set; }
    }
}