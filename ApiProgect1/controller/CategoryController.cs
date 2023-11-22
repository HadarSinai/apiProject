using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiProgect1.controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService _CategoryService;
            public CategoryController(ICategoryService CategoryService)
        {
            _CategoryService = CategoryService;
        }
        // GET: api/<CategoryController>
        [HttpGet]
        public  async Task <IEnumerable<Category>> GetCategoriesAsync()
        {
            return await _CategoryService.GetCategoriesAsync();
        }
        

  

        //// POST api/<CategoryController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<CategoryController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<CategoryController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
