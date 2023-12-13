using Entities;

namespace Service
{
    public interface IRatingService
    {
        Task createRating(Rating rating);
    }
}