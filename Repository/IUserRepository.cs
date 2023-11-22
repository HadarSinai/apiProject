using Entities;

namespace Repository
{
    public interface IUserRepository
    {
        Task<User> getUserById(int id);
        User addUser(User user);
        Task <User> getUserByUserNameAndPassword(string userName, string password);
        Task <bool> UpdateUser(int id, User userToUpdate);
    }
}