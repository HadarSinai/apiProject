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
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly IMapper Mapper;

        public ProductController(IProductService productService ,IMapper mapper)
        {
            _productService = productService;
            Mapper = mapper;
        }
        // GET: api/<ProductController>
        [HttpGet]
        public async Task <ActionResult<List<ProductDTO>>> Get([FromQuery] string? desc, [FromQuery] int? minPrice, [FromQuery] int? MaxPrice, [FromQuery] int?[] categoryIds)
        {

            List<Product>product= await _productService.getProductAsync(desc, minPrice, MaxPrice, categoryIds);
            List<ProductDTO> productDTO = Mapper.Map<List<Product>, List<ProductDTO>>( product);
            return productDTO;
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
