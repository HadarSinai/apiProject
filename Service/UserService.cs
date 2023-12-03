
using Entities;

using Repository;

namespace Service
{
    public class UserService : IUserService
    {

        private readonly IUserRepository userRepository;
        public UserService(IUserRepository _userRepository)
        {
            userRepository = _userRepository;
        }
        async public Task<User> getUserById(int id)
        {
            return await userRepository.getUserById(id);
        }
        async public Task <User> getUserByUserNameAndPassword(string userName, string password)
        {
            return await userRepository.getUserByUserNameAndPassword(userName, password);
        }
         public Task<User> addUser(User user)
        {

            return  userRepository.addUser(user);
        }
        public int checkPassword(string password)
        {
            var passwordStrength = Zxcvbn.Core.EvaluatePassword(password);

            int answer = passwordStrength.Score;
            return answer;

        }
       async  public Task <User> updateUser(int id, User user)
        {
            return await userRepository.UpdateUser(id, user);
        }

    }
}