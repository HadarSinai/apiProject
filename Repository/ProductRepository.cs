using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class ProductRepository : IProductRepository
    {
        private readonly InsertProductContext _InsertProductContext;
        public ProductRepository(InsertProductContext InsertProductContext)
        {
            _InsertProductContext = InsertProductContext;
        }
        public async Task<IEnumerable<Product>> getProductAsync( string? desc ,int? minPrice,int? MaxPrice, int?[]categoryIds)
        {
            var quary = _InsertProductContext.Products.Where(product =>
            (desc == null) ? (true) : (product.ProductDescription.Contains(desc))
            && ((minPrice == null) ? (true) : (product.ProductPrice >= minPrice))
            && ((MaxPrice == null) ? (true) : (product.ProductPrice <= minPrice))
            && ((categoryIds.Length == 0) ? (true) : (categoryIds.Contains(product.CategoryId))))
                .OrderBy(product => product.ProductPrice);
            List<Product> products = await quary.ToListAsync();
            return products;
            
        }
        
    }
}
