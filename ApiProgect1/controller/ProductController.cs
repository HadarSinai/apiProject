using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;
using System.Collections.Generic;
using Repository;

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
        public async Task <ActionResult<List<ProductDTO>>> Get([FromQuery] string? desc, [FromQuery] int? minPrice, [FromQuery] int? maxPrice, [FromQuery] int?[] categoryIds)
        {
            try
            {
                List<Product> products = await _productService.getProductAsync(desc, minPrice, maxPrice, categoryIds);
                List<ProductDTO> productDTO = Mapper.Map<List<Product>, List<ProductDTO>>(products);
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
