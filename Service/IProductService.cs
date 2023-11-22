using Entities;

namespace Service
{
    public interface IProductService
    {
        Task<IEnumerable<Product>> getProductAsync(string? desc, int? minPrice, int? MaxPrice, int?[] categoryIds);
    }
}