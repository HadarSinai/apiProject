using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;
using System.Collections.Generic;
using Repository;

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
            try
            {


                List<Entities.Product> products = await _productService.getProductAsync(desc, minPrice, MaxPrice, categoryIds);
                List<Product> product = products;
                List<ProductDTO> productDTO = Mapper.Map<List<Product>, List<ProductDTO>>(product);
                if (productDTO != null)
                    return Ok(productDTO);
                return BadRequest();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
       

        
    }
}
