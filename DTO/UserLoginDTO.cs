using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class UserLoginDTO

    {

        [EmailAddress]
        public string UserName { get; set; } = null!;
        [MaxLength(50)]
        public string Password { get; set; } = null!;
    }
}
