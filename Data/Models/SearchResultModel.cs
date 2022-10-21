using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Kentico.Search;

namespace ShopBeer.Data.Models
{
    public class SearchResultModel
    {
        public string Query { get; set; }

        public IEnumerable<Product> Products { get; set; }

        public int ProductCount{ get; set; }
    }
}
