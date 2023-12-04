using Entities;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Text.Json;

namespace Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly InsertProductContext _InsertProductContext;
        public UserRepository(InsertProductContext InsertProductContext)
        {
            _InsertProductContext = InsertProductContext;
        }


        async public Task<User> getUserById(int id)
        {

            return await _InsertProductContext.Users.FindAsync(id);

        }

        async public Task<User> getUserByUserNameAndPassword(string userName, string password)
        {
            return await _InsertProductContext.Users.Where(f => f.UserName == userName && f.Password == password).FirstOrDefaultAsync();

        }

        async public Task<User> addUser(User user)
        {
            await _InsertProductContext.AddAsync(user);
            await _InsertProductContext.SaveChangesAsync();
            return user;

        }
        async public Task<User> UpdateUser(int id, User userToUpdate)
        {
            userToUpdate.UserId = id;
            _InsertProductContext.Users.Update(userToUpdate);
            await _InsertProductContext.SaveChangesAsync();
            return userToUpdate;

           
        }
    }
}