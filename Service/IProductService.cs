using Entities;

namespace Service
{
    public interface IProductService
    {
        Task<List<Product>> getProductAsync(string? desc, int? minPrice, int? MaxPrice, int?[] categoryIds);
    }
}