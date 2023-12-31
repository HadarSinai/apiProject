﻿using Entities;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Service
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _IProductRepository;
        public ProductService(IProductRepository IProductRepository)
        {
            _IProductRepository = IProductRepository;
        }
        public async Task<List<Product>> getProductAsync(string? desc, int? minPrice, int? maxPrice, int?[] categoryIds)
        {
            return await _IProductRepository.getProductAsync(desc, minPrice, maxPrice, categoryIds);
        }


        public async Task<bool> getOrderProducts(decimal sumOrder, int[] IdProducts)
        {
            List<Product> products = await _IProductRepository.getOrderProducts(IdProducts);

            decimal sumOrderServer = products.Sum(s => s.ProductPrice);

            if (sumOrderServer == sumOrder)

                return true;
            else
                return false;


        }
    }

}

