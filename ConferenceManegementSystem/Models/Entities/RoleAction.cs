using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ConferenceManagementSystem.Models.Entities
{
    public class RoleAction
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public Role Role { get; set; }
        public int RoleId { get; set; }
        public Action Action { get; set; }
        public int ActionId { get; set; }

    }
}