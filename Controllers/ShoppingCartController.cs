using Microsoft.AspNetCore.Mvc;
using ShopBeer.Data.Interfaces;
using ShopBeer.Data.Models;
using ShopBeer.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Controllers
{
    public class ShoppingCartController: Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly ShoppingCart _shoppingCart;

        public ShoppingCartController(IProductRepository productRepository, ShoppingCart shoppingCart)
        {
            _productRepository = productRepository;
            _shoppingCart = shoppingCart;
        }

        //[HttpGet]
        public ViewResult Index()
        {
            var items = _shoppingCart.GetShoppingCartItems();
            _shoppingCart.ShoppingCartItems = items;

            var sCVM = new ShoppingCartViewModel
            {
                ShoppingCart = _shoppingCart,
                ShoppingCartTotal = _shoppingCart.GetShoppingCartTotal()
            };

            return View(sCVM);
        }

        public IActionResult NoItemsInCart()
        {
            return View();
        }

        //[HttpPost]
        public RedirectToActionResult AddToShoppingCart(int productId)
        {
            var selectedProduct = _productRepository.Products.FirstOrDefault(p => p.ProductId == productId);
            if (selectedProduct != null)
            {
                _shoppingCart.AddToCart(selectedProduct, 1);
            }
            return RedirectToAction("Index");
        }

        public RedirectToActionResult RemoveFromShoppingCart(int productId)
        {
            var selectedProduct = _productRepository.Products.FirstOrDefault(p => p.ProductId == productId);
            if (selectedProduct != null)
            {
                _shoppingCart.RemoveFromCart(selectedProduct);
            }
            return RedirectToAction("Index");
        }

        public IActionResult Checkout()
        {
            //var items = _shoppingCart.GetShoppingCartItems();
            //_shoppingCart.ShoppingCartItems = items;
            //if (_shoppingCart.ShoppingCartItems.Count == 0)
            //{
            //    ModelState.AddModelError("", "Your card is empty, add some drinks first");
            //}

            //if (ModelState.IsValid)
            //{
                //_orderRepository.CreateOrder(order);
                _shoppingCart.ClearCart();
            //    return RedirectToAction("CheckoutComplete");
            //}

            return View();
        }

    }
}
