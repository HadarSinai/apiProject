using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Http.HttpResults;
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
        public  async Task <ActionResult<IEnumerable<CategoryDTO>>> Get()
        {
            try { 
            IEnumerable <Category> categories = await _CategoryService.GetCategoriesAsync();
            IEnumerable<CategoryDTO> categoriesDTO = Mapper.Map<IEnumerable<Category>, IEnumerable<CategoryDTO>>(categories);
            if(categoriesDTO!=null)
            return Ok(categoriesDTO);
            return BadRequest();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        

  

        
    }
}
