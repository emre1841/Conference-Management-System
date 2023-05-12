using ConferenceManagementSystem.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Action = ConferenceManagementSystem.Models.Entities.Action;

namespace ConferenceManagementSystem.Models.Context
{
    public class ConferenceManagementDbContext:DbContext
    {
        public ConferenceManagementDbContext() : base(@"Data Source=DESKTOP-O375OD7;Initial Catalog=ConferenceDb;Integrated Security=true;")
        {

        }
        public DbSet<User> Users { get; set; }
        public DbSet<Action> Actions { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RoleAction> RoleActions { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<RoomUser> RoomUsers { get; set; }
        public DbSet<ActivityLogs> ActivityLogs { get; set; }

        public DbSet<Notification> Notifications { get; set; }
        public DbSet<Favorite> Favorites { get; set; }

    }
}