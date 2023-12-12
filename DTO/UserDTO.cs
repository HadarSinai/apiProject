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
        [MaxLength(50)]
        public string Password { get; set; } = null!;

        
        public string? FirstName { get; set; }

    
        public string? LastName { get; set; }
    }
}
