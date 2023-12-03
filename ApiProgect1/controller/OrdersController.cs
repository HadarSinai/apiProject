using AutoMapper;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;
using DTO;
using System.Collections.Generic;
using Microsoft.Extensions.Hosting;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiProgect1.controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {

        private readonly IOrdersService _ordersService;

        private readonly IMapper Mapper;
        public OrdersController(IOrdersService ordersService,IMapper mapper)
        {
            _ordersService = ordersService;
            Mapper = mapper;
        }
        //// GET: api/<OrdersController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET api/<OrdersController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<OrdersController>
        [HttpPost]
        [Route("post")]
        public async Task<ActionResult<OrderDTO>>  post([FromBody]  OrderDTO order)
        {
            try {
                Order Order = Mapper.Map<OrderDTO, Order>(order);
                Order orders = await _ordersService.postOrdersAsync(Order);
            OrderDTO OrdersDto = Mapper.Map<Order, OrderDTO>(orders);
                if (OrdersDto != null)
                    return CreatedAtAction(nameof(Get), new { id = OrdersDto.OrderId }, OrdersDto);
                        return NoContent();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        //// PUT api/<OrdersController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<OrdersController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}  