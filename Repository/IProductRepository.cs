using Entities;

namespace Repository
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> getProductAsync(string? desc, int? minPrice, int? MaxPrice, int?[] categoryIds);
    }
}