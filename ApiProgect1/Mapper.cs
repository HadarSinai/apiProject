using AutoMapper;
using Entities;
using DTO;
namespace ApiProgect1
{
    public class Mapper : Profile
    {
       
        public Mapper()
        {
           CreateMap<Category,CategoryDTO>();
            CreateMap<Order, OrderDTO>().ReverseMap();
           CreateMap<OrderItem, OrderItemDTO>().ReverseMap();
            CreateMap<Product, ProductDTO>();
            CreateMap<User, UserDTO>().ReverseMap();
            CreateMap<User, UserLoginDTO>();
            CreateMap<User, UserWithoutPassDTO>();
        }
    }
}
