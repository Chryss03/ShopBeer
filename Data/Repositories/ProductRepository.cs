using Microsoft.EntityFrameworkCore;
using ShopBeer.Data.Interfaces;
using ShopBeer.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Data.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly AppDbContext _appDbContext;
        public ProductRepository(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public IEnumerable<Product> Products => _appDbContext.Products.Include(c => c.Category);

        public Product GetProductById(int productId) => _appDbContext.Products.FirstOrDefault(p => p.ProductId == productId);


    }
}
