using Entities;

namespace Repository
{
    public interface IOrdersRepository
    {
        Task<Order> postOrdersAsync(Order order);
    }
}