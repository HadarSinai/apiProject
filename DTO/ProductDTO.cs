using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ProductDTO
    {
        public int ProductId { get; set; }

        //public int CategoryId { get; set; }

        public string ProductName { get; set; } = null!;

        public decimal ProductPrice { get; set; }

        public string? ProductDescription { get; set; }

        public string? ProductImage { get; set; }
    }
}
