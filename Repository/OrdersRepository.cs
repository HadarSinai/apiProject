using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{

    public class OrdersRepository : IOrdersRepository
    {
        private readonly InsertProductContext _InsertProductContext;

        public OrdersRepository(InsertProductContext InsertProductContext)
        {
            _InsertProductContext = InsertProductContext;
        }
        public async Task<Order> postOrdersAsync(Order order)
        {
            await _InsertProductContext.Orders.AddAsync(order);
            await _InsertProductContext.SaveChangesAsync();
            return order;
        }
    }
}

