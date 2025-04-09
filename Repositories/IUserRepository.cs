using System.Data;
using Onlinecom.Models;

namespace Onlinecom.Repositories
{
    public interface IUserRepository
    {
        int Register(UserModel user);
        bool Login(LoginModel user); 
        List<ProductModel> GetAllproduct();
        bool Deleteproduct(int id);
        void AddToCart(int userId, int gameId);
        DataTable GetCartItems(int userId);
        int GetUserId(LoginModel login);
        bool DeleteProductFromCart(int cartId);
    }
}
