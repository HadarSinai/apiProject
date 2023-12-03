using Entities;

namespace Repository
{
    public interface IProductRepository
    {
        Task<List<Product>> getProductAsync(string? desc, int? minPrice, int? MaxPrice, int?[] categoryIds);
    }
}