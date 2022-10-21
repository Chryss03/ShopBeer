using ShopBeer.Data.Interfaces;
using ShopBeer.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Data.mocks
{
    public class MockProductRepository : IProductRepository
    {
        private readonly ICategoryRepository _categoryRepository = new MockCategoryRepository();

        public IEnumerable<Product> Products { 
            get
            {
                return new List<Product>
                {
                    new Product
                    {
                        Name = "Plan Beer Golden Shower",
                        Description = "Romania, Blonda, Blonde Ale, 6%",
                        Price = 13.5M,
                        Category = _categoryRepository.Categories.First(),
                        ImageUrl = "https://www.beeracademy.ro/4291-large_default/plan-beer-golden-shower.jpg"
                    },

                    new Product
                    {
                        Name = "Amistad Locomotiva Blonde Ale",
                        Description = "Romania, Blonda, Blonde Ale, 6%",
                        Price = 13.5M,
                        Category = _categoryRepository.Categories.First(),
                        ImageUrl = "https://www.beeracademy.ro/3999-large_default/amistad-locomotiva-blonde-ale.jpg"
                    },
                };
            }
        }

        public Product GetProductById(int productId)
        {
            throw new NotImplementedException();
        }
    }
}
