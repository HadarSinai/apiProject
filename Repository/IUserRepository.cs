using Entities;

namespace Repository
{
    public interface IUserRepository
    {
        Task<User> getUserById(int id);
        Task<User> addUser(User user);
        Task <User> getUserByUserNameAndPassword(string userName, string password);
        Task <User> UpdateUser(int id, User userToUpdate);
    }
}