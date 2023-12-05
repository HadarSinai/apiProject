﻿using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class ProductRepository : IProductRepository
    {
        private readonly InsertProductContext _InsertProductContext;
        public ProductRepository(InsertProductContext InsertProductContext)
        {
            _InsertProductContext = InsertProductContext;
        }
        public async Task<List<Product>> getProductAsync( string? desc ,int? minPrice,int? maxPrice, int?[]categoryIds)
        {
            var quary = _InsertProductContext.Products.Where(product =>
            (desc == null) ? (true) : (product.ProductDescription.Contains(desc))
            && ((minPrice == null) ? (true) : (product.ProductPrice >= minPrice))
            && ((maxPrice == null) ? (true) : (product.ProductPrice <= maxPrice))
            && ((categoryIds.Length == 0) ? (true) : (categoryIds.Contains(product.CategoryId))))
            .OrderBy(product => product.ProductPrice);
            List<Product> products = await quary.ToListAsync();
            return products;
          
            
        }

        //=============================================================================================
        
        //public async Task<List<Product>> getCertainProducts(int[] productsIds)
        //{
        //    var query = _superMarketContext.Products.Where(product => productsIds.Contains(product.ProductId));
        //    List<Product> products = await query.ToListAsync();
        //    return products;
        //}

    }
}
