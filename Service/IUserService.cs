using Entities;

namespace Service
{
    public interface IUserService
    {
        Task<User> getUserById(int id);
        User addUser(User user);
        int checkPassword(string password);
        Task <User> getUserByUserNameAndPassword(string userName, string password);
        Task <bool> updateUser(int id, User user);
    }
}