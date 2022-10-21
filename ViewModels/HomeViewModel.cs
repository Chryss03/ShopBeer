using ShopBeer.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.ViewModels
{
    public class HomeViewModel
    {
        public IEnumerable<Product> Product { get; set; }
    }
}
