using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class UserWithoutPassDTO
    {
        public int UserId { get; set; }
        [EmailAddress]
        public string UserName { get; set; } = null!;
        [MaxLength(25)]
        public string? FirstName { get; set; }
        [MaxLength(25)]
        public string? LastName { get; set; }
    }
}
