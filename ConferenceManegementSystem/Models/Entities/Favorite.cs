using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.Entities
{
    public class Favorite
    {
        public int Id { get; set; }
        public Room Room { get; set; }
        public int RoomId { get; set; }
        public User User { get; set; }
        public int UserId { get; set; }
    }
}