using Entities;

namespace Repository
{
    public interface IRatingRepository
    {
        Task createRating(Rating rating);
    }
}