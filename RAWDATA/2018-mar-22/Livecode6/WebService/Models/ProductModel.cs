using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebService.Models
{
    public class ProductModel : ProductListModel
    {
        public double UnitPrice { get; set; }
    }
}
