

using ApiProgect1;
using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Session;
using Microsoft.Extensions.Logging;
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

        private readonly ILogger<UserController> Logger;

        public UserController(IUserService _userService, IMapper mapper, ILogger<UserController> logger)
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
            UserDTO userDTO = Mapper.Map<User, UserDTO>(user);
            try
            {
                if (user != null)
                    return Ok(userDTO);
                return NoContent();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }



        [Route("login")]
        [HttpPost]
        async public Task<ActionResult<UserWithoutPassDTO>> post([FromBody] UserLoginDTO userLogin)
        {
            try
            {
                //int zero = 0;
                //int num= 10 / zero;
                User userCast = Mapper.Map<UserLoginDTO, User>(userLogin);

                User user = await userService.getUserByUserNameAndPassword(userCast.UserName, userCast.Password);
                UserWithoutPassDTO UserDTO = Mapper.Map<User, UserWithoutPassDTO>(user);
                if (UserDTO != null)
                {

                    return Ok(UserDTO);
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                Logger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }




        // POST api/<UsersController>
        [HttpPost]
        [Route("post")]
        public async Task<ActionResult<UserWithoutPassDTO>> Post([FromBody] UserDTO UserDto)
        {

            try
            {

                User user = Mapper.Map<UserDTO, User>(UserDto);
                if (user != null)
                    Logger.LogInformation($"new user {user.UserId}register");
                User sendUser = await userService.addUser(user);
                UserWithoutPassDTO UserLDTO = Mapper.Map<User, UserWithoutPassDTO>(sendUser);

                if (UserLDTO != null)
                    return CreatedAtAction(nameof(Get), new { id = sendUser.UserId }, UserLDTO);
                return BadRequest();

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

            int answer = userService.checkPassword(password);

            if (answer > 2)
            {

                return Ok(answer);
            }
            return BadRequest();


        }


        // PUT api/<NewContro>/5
        [HttpPut("{id}")]
        async public Task<ActionResult<UserWithoutPassDTO>> Put(int id, [FromBody] UserDTO userDTO)
        {
            try
            {
                userDTO.UserId = id;
                User userToUpdate = Mapper.Map<UserDTO, User>(userDTO);
                User answer = await userService.updateUser(id, userToUpdate);
                UserWithoutPassDTO userLoginDTO = Mapper.Map<User, UserWithoutPassDTO>(answer);
                if (answer != null)
                    return Ok(answer);

                return BadRequest();
            }
            catch (Exception ex)
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
