using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Kentico.Search;
using Microsoft.AspNetCore.Mvc;
using ShopBeer.Data;
using ShopBeer.Data.Models;

namespace ShopBeer.Controllers
{
    public class SearchController : Controller
    {       
        private readonly AppDbContext _appDbContext;

        public SearchController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        
        public IActionResult Index(string term)
        {
            IEnumerable<Product> Products = _appDbContext.Products.Where(s => s.Name.Contains(term)).Select(s =>
             new Product
             {
                 ProductId = s.ProductId,
                 Name = s.Name,
                 Description = s.Description,
                 Price = s.Price,
                 ImageUrl = s.ImageUrl,
                 ImageThumbnailUrl = s.ImageThumbnailUrl,
                 Category = s.Category,
                 CategoryId = s.CategoryId
             });

            return View(Products);         
        }


        public JsonResult AutoComplete(string prefix)
        {
          

            List<Product> ObjList = new List<Product>()
                {

                    new Product {Name="Plan Beer Golden Shower" },
                    new Product {Name="Amistad Locomotiva Blonde Ale" },
                    new Product {Name="Birds Bees" },


            };
           
            var Name = (from N in ObjList
                        where N.Name.StartsWith(prefix)
                        select new { N.Name });
            return Json(Name);

            
        }
        
    }
}
