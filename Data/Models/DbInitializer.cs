using ShopBeer.Data.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Linq;
using ShopBeer.Data;

namespace ShopBeer.Data
{
    public class DbInitializer
    {
        public static void Seed(IApplicationBuilder applicationBuilder)
        {
            var scopeeee = applicationBuilder.ApplicationServices.CreateScope();

            AppDbContext context = scopeeee.ServiceProvider.GetRequiredService<AppDbContext>();

            //AppDbContext context =
            //    applicationBuilder.ApplicationServices.GetRequiredService<AppDbContext>();

            if (!context.Categories.Any())
            {
                context.Categories.AddRange(Categories.Select(c => c.Value));
            }

            if (!context.Products.Any())
            {
                context.AddRange
                (
                    new Product
                    {
                        Name = "Plan Beer Golden Shower",
                        Description = "Romania, Blonda, Blonde Ale, 6%",
                        Price = 13.5M,
                        Category = Categories["BlondeAle"],
                        ImageUrl = "https://www.beeracademy.ro/4291-large_default/plan-beer-golden-shower.jpg"
                    },

                    new Product
                    {
                        Name = "Amistad Locomotiva Blonde Ale",
                        Description = "Romania, Blonda, Golden Ale, 6%",
                        Price = 13.5M,
                        Category = Categories["GoldenAle"],
                        ImageUrl = "https://www.beeracademy.ro/3999-large_default/amistad-locomotiva-blonde-ale.jpg"
                    },

                    new Product
                    {
                        Name = "Plan Beer A New Hop",
                        Description = "Romania, Blonda, American Ale, 6.2%",
                        Price = 13.5M,
                        Category = Categories["AmericanPale"],
                        ImageUrl = "https://www.beeracademy.ro/romania/1015-plan-beer-a-new-hop.html"
                    }

                );
            }

            context.SaveChanges();
        }

        private static Dictionary<string, Category> categories;

        public static Dictionary<string, Category> Categories
        {
            get
            {
                if (categories == null)
                {
                    var genresList = new Category[]
                    {
                        new Category {CategoryName = "BlondeAle", Description = "All blonde ale beers"},
                        new Category {CategoryName = "GoldenAle", Description = "All golden ale beers"},
                        new Category {CategoryName = "AmericanPale", Description = "All american pale beers"},
                    };

                    categories = new Dictionary<string, Category>();

                    foreach (Category genre in genresList)
                    {
                        categories.Add(genre.CategoryName, genre);
                    }
                }

                return categories;
            }
        }
    }
}