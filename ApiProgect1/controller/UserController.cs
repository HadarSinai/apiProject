

using ApiProgect1;
using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Session;
using Service;
using System.Net.Mail;
using System.Text.Json;
using Zxcvbn;


namespace Login.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
   
    public class UserController : ControllerBase
    {

        
        private readonly IUserService userService;

        private readonly IMapper Mapper;

        private readonly ILogger <UserController> Logger;
        
        public UserController(IUserService _userService,IMapper mapper, ILogger<UserController> logger)
        {
            userService = _userService;
            Mapper = mapper;
            Logger = logger;

        }
       
       
        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        async public Task<ActionResult> Get(int id)
        {

            User user = await userService.getUserById(id);
            UserDTO userDTO = Mapper.Map<User,UserDTO>(user);
            
            if (user != null)
                return Ok(userDTO);
            return NoContent();
        }



        [Route("postLogin")]
        [HttpPost]
        async public Task<ActionResult<UserLoginDTO>> post([FromBody] User userLogin)
        {
            try { 
            User user = await userService.getUserByUserNameAndPassword(userLogin.UserName,userLogin.Password);
            UserDTO UserDTO = Mapper.Map<User, UserDTO>(user);
            if (UserDTO != null)
                return Ok(UserDTO);

            return NoContent();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        

        // POST api/<UsersController>
        [HttpPost]
        [Route("post")]
        public async Task<ActionResult<UserLoginDTO>> Post([FromBody] UserDTO UserDto)
        {
           
            try
            {
                User user = Mapper.Map<UserDTO, User>(UserDto);
                if (user != null)
                   Logger.LogInformation($"new user {user.UserName}register");
                User sendUser = await userService.addUser(user);
                UserLoginDTO UserLDTO = Mapper.Map<User, UserLoginDTO>(sendUser);
                int zero = 0;
                int num= 10 / zero;
                if(UserLDTO!=null)
              return CreatedAtAction(nameof(Get), new { id = sendUser.UserId }, UserLDTO);
                return BadRequest();
              
            }
            catch (Exception ex)
            {
                Logger.LogError(ex.Message);
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
        async public Task <ActionResult<User>> Put(int id, [FromBody] UserDTO userDTO )
        {
            try {
                User userToUpdate = Mapper.Map< UserDTO, User>(userDTO);
            User answer = await userService.updateUser(id, userToUpdate);
                UserLoginDTO userLoginDTO = Mapper.Map<User, UserLoginDTO>(answer);
            if (answer!=null)
                return Ok(answer);
            
              return BadRequest();
        }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
            }
        

       


        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
