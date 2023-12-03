using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiProgect1.controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService _CategoryService;

        private readonly IMapper Mapper;
            public CategoryController(ICategoryService CategoryService ,IMapper mapper)
        {
            _CategoryService = CategoryService;
            Mapper = mapper;
        }
        // GET: api/<CategoryController>
        [HttpGet]
        public  async Task <ActionResult<IEnumerable<CategoryDTO>>> GetCategoriesAsync()
        {
            IEnumerable <Category> categories = await _CategoryService.GetCategoriesAsync();
            IEnumerable<CategoryDTO> categoriesDTO = Mapper.Map<IEnumerable<Category>, IEnumerable<CategoryDTO>>(categories);
            return categoriesDTO;
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
