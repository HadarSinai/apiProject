using Entities;

namespace Service
{
    public interface IOrdersService
    {
        Task<Order> postOrdersAsync(Order order);
    }
}