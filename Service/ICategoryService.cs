using Entities;

namespace Service
{
    public interface ICategoryService
    {
        Task<IEnumerable<Category>> GetCategoriesAsync();
    }
}