using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class UserDTO
    {
        public int UserId { get; set; }
        [EmailAddress]
        public string UserName { get; set; } = null!;
        [StringLength(30)]
        public string Password { get; set; } = null!;
        [StringLength(25)]
        public string? FirstName { get; set; }
        [StringLength(25)]
        public string? LastName { get; set; }
    }
}
