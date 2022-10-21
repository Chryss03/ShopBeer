using Microsoft.AspNetCore.Mvc;
using ShopBeer.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Controllers
{
    public class HomeController: Controller
    {
        public readonly IProductRepository _productRepository;

        public HomeController(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
