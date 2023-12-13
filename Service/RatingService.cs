using Entities;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class RatingService : IRatingService
    {
        IRatingRepository ratingRepository;
        public RatingService(IRatingRepository _ratingRepository)
        {
            ratingRepository = _ratingRepository;
        }
        public async Task createRating(Rating rating)
        {
            await ratingRepository.createRating(rating);
        }

    }
}
