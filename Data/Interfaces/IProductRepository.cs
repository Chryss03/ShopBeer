﻿using ShopBeer.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBeer.Data.Interfaces
{
    public interface IProductRepository
    {
        IEnumerable<Product> Products { get; }

        Product GetProductById(int productId);
    }
}
