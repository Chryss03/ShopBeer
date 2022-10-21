using ShopBeer.Data.Interfaces;
using ShopBeer.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Data.mocks
{
    public class MockCategoryRepository : ICategoryRepository
    {
        public IEnumerable<Category> Categories {
            get
            {
                return new List<Category>
                {
                    new Category {CategoryName = "BlondeAle", Description = "All blonde ale beers"},
                    new Category {CategoryName = "GoldenAle", Description = "All golden ale beers"},
                    new Category {CategoryName = "AmericanPale", Description = "All american pale beers"},
                };
            }
        }
    }
}
