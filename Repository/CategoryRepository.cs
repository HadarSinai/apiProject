using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly InsertProductContext _InsertProductContext;
        public CategoryRepository(InsertProductContext InsertProductContext)
        {
            _InsertProductContext = InsertProductContext;
        }
        public async Task<IEnumerable<Category>> getCategoriesAsync()
        {

            return await _InsertProductContext.Categories.ToListAsync();
        }



    }
}
