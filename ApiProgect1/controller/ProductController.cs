using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiProgect1.controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }
        // GET: api/<ProductController>
        [HttpGet]
        public async Task <IEnumerable<Product>> Get([FromQuery] string? desc, [FromQuery] int? minPrice, [FromQuery] int? MaxPrice, [FromQuery] int?[] categoryIds)
        {

            return await _productService.getProductAsync( desc , minPrice, MaxPrice, categoryIds);
        }
       

        //// GET api/<ProductController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<ProductController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<ProductController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<ProductController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
