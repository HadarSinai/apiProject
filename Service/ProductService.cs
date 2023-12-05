using Entities;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _IProductRepository;
        public ProductService(IProductRepository IProductRepository)
        {
            _IProductRepository = IProductRepository;
        }
        public async Task<List<Product>> getProductAsync(string? desc, int? minPrice, int? maxPrice, int?[] categoryIds)
        {
            return await _IProductRepository.getProductAsync(desc ,  minPrice,  maxPrice, categoryIds);
        }

        //public  decimal OrderSum(IEnumerable<OrderItem> orderItem,Order order)
        //{
        //    decimal sum = 0;
        //   IEnumerable <OrderItem>orderItems= orderItem.Where(item => item.OrderId == order.OrderId);
         
        //    return sum;
        //}
  

    }
}
