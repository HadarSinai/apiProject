

using ApiProgect1;
using AutoMapper;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Session;
using Service;
using System.Net.Mail;
using System.Text.Json;
using Zxcvbn;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Login.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {

        
        private readonly IUserService userService;

        private readonly IMapper Mapper;
        public UserController(IUserService _userService,IMapper mapper)
        {
            userService = _userService;
            Mapper = mapper;

        }


        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        async public Task<ActionResult> Get(int id)
        {

            User user = await userService.getUserById(id);
            if (user != null)
                return Ok(user);
            return NoContent();
        }



        // GET: api/<UsersController>
        [HttpGet]
       async public Task<ActionResult<User>> Get([FromQuery] string userName, [FromQuery] string password)
        {
            //
            User user = await userService.getUserByUserNameAndPassword(userName, password);
            if (user != null)
                return Ok(user);

            return NoContent();

        }

      
      

        // POST api/<UsersController>
        [HttpPost]
        [Route("post")]
        public ActionResult<User> Post([FromBody] User user)
        {
            //
            try
            {

                User sendUser = userService.addUser(user);
              return CreatedAtAction(nameof(Get), new { id = sendUser.UserId }, sendUser);
                //return Ok();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        [HttpPost]
        [Route("postPassword")]
         public IActionResult Post([FromBody] string password)
        {

            int answer =  userService.checkPassword(password);

            if (answer > 2)
            {
                return Ok();
            }
            return BadRequest();


        }


        // PUT api/<NewContro>/5
        [HttpPut("{id}")]
        async public Task <ActionResult<User>> Put(int id, [FromBody] User userToUpdate)
        {
            //
            bool answer = await userService.updateUser(id, userToUpdate);
            if (answer)
                return Ok();
            else
                return BadRequest();
        }




        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
