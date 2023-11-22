using Entities;
using System.Data;
using System.Text.Json;

namespace Repository
{
    public class UserRepository : IUserRepository
    {

        //C:\\Users\\326051133\\Desktop\\users.txt
        private readonly string filePath = "C:\\Users\\326051133\\Desktop\\users.txt";

        async public Task<User> getUserById(int id)
        {
            using (StreamReader reader = System.IO.File.OpenText(filePath))
            {
                string? currentUserInFile;
                while ((currentUserInFile = await reader.ReadLineAsync()) != null)
                {
                    User user = JsonSerializer.Deserialize<User>(currentUserInFile);
                    if (user.UserId == id)
                        return user;
                }
            }
            return null;
        }

        async public Task<User> getUserByUserNameAndPassword(string userName, string password)
        {
            using (StreamReader reader = System.IO.File.OpenText(filePath))
            {
                string? currentUserInFile;
                while ((currentUserInFile = await reader.ReadLineAsync()) != null)
                {
                    User user = JsonSerializer.Deserialize<User>(currentUserInFile);
                    if (user.UserName == userName && user.Password == password)
                        return user;
                }
            }
            return null;
        }

         public User addUser(User user)
        {
            int numberOfUsers = System.IO.File.ReadLines(filePath).Count();
            user.UserId = numberOfUsers + 1;


            string userJson = JsonSerializer.Serialize(user);
            System.IO.File.AppendAllText(filePath, userJson + Environment.NewLine);
            return user;
        }
        async public Task<bool> UpdateUser(int id, User userToUpdate)
        {
            //=================
            string textToReplace = string.Empty;//=""
            using (StreamReader reader = System.IO.File.OpenText(filePath))
            {
                string currentUserInFile;
                while ((currentUserInFile = await reader.ReadLineAsync()) != null)
                {

                    User user = JsonSerializer.Deserialize<User>(currentUserInFile);
                    if (user.UserId == id)
                        textToReplace = currentUserInFile;
                }
            }

            if (textToReplace != string.Empty)
            {
                string text = System.IO.File.ReadAllText(filePath);
                text = text.Replace(textToReplace, JsonSerializer.Serialize(userToUpdate));
                System.IO.File.WriteAllText(filePath, text);
                return true;
            }
            return false;

            //===============
        }
    }
}