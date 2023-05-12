using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.Entities
{
    public class Room
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string RoomName { get; set; }
        public string Description { get; set; }
        public string Link { get; set; }
        public int MaxUserCount { get; set; }
        public bool IsActive { get; set; } = false;
        public DateTime CreatedDate { get; set; }
        [ForeignKey("CreatedUserId")]
        public User User { get; set; }
        public int CreatedUserId { get; set; }
        public List<RoomUser> RoomUsers { get; set; }
        public bool IsPrivate { get; set; }
        public string Password { get; set; }

    }
}