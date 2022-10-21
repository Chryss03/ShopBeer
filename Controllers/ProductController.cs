using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopBeer.Data;
using ShopBeer.Data.Interfaces;
using ShopBeer.Data.Models;
using ShopBeer.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Controllers
{
    public class ProductController: Controller
    {
        private readonly ICategoryRepository _categoryRepository;
        private readonly IProductRepository _productRepository;
        private readonly AppDbContext _appDbContext;

        public ProductController(ICategoryRepository categoryRepository, IProductRepository productRepository, AppDbContext appDbContext)
        {
            _categoryRepository = categoryRepository;
            _productRepository = productRepository;
            _appDbContext = appDbContext;
        }

        //public ViewResult List()
        //{

        //    ProductListViewModel vm = new ProductListViewModel();
        //    vm.Products = _productRepository.Products;
        //    vm.CurrentCategory = "BeerCategory";

        //    return View(vm);
        //}

        public ViewResult List(string category)
        {
            string _category = category;
            IEnumerable<Product> products = _productRepository.Products.OrderBy(n => n.ProductId);
            string currentCategory = string.Empty;

            if(string.IsNullOrEmpty(category))
            {
                products = _productRepository.Products.OrderBy(n => n.ProductId);
                currentCategory = "All beers";
            }
            else
            {
                if(string.Equals("BlondeAle", _category, StringComparison.OrdinalIgnoreCase))
                {
                    products = _productRepository.Products.Where(p => p.Category.CategoryName.Equals("BlondeAle")).OrderBy(p => p.Name);
                }

                if (string.Equals("GoldenAle", _category, StringComparison.OrdinalIgnoreCase))
                {
                    products = _productRepository.Products.Where(p => p.Category.CategoryName.Equals("GoldenAle")).OrderBy(p => p.Name);
                }
                if (string.Equals("AmericanPale", _category, StringComparison.OrdinalIgnoreCase))
                {
                    products = _productRepository.Products.Where(p => p.Category.CategoryName.Equals("AmericanPale")).OrderBy(p => p.Name);
                }

                currentCategory = _category;
            }



            var productListViewModel = new ProductListViewModel
            {
                Products = products,
                CurrentCategory = currentCategory
            };

            return View(productListViewModel);
        }

        [HttpGet]
        public IActionResult Index(string searching)
        {
            ViewData["GetProducts"] = searching;

            //var prodquery = from x in _appDbContext.Products select x;
            //if(!String.IsNullOrEmpty(searching))
            //{
            //    prodquery = prodquery.Where(x => x.Name.Contains(searching));
            //}

            //return View(await prodquery.AsNoTracking().ToListAsync());

            string _searching = searching;
            IEnumerable<Product> products = _productRepository.Products.OrderBy(n => n.ProductId);
            string currentCategory = string.Empty;

            if (!string.IsNullOrEmpty(searching))
            {
                products = _productRepository.Products.Where(n => n.Name.Contains(searching));
            }

            return View(products);
        }

        public IActionResult Index()
        {
            //var displaydata = _appDbContext.Products.ToList();
            return View();
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create([Bind("Name,Description,Price,CategoryId,Category,ImageUrl,ImageThumbnailUrl")] Product product)
        {
            if (ModelState.IsValid)
            {
                _appDbContext.Add(product);
                _appDbContext.SaveChanges();
                return RedirectToAction(nameof(List));
            }
            return View(product);
        }
    }
}
