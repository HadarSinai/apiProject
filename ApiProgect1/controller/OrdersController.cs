using AutoMapper;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Service;
using DTO;
using System.Collections.Generic;
using Microsoft.Extensions.Hosting;



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

     
    }
}  