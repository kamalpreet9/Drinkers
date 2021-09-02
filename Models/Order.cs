using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Drinkers.Models
{
    public class Order
    {
        public int Id { get; set; }

        public Categories Categories { get; set; }
        public int CategoriesId { get; set; }
        public Product Product { get; set; }
        public int ProductId { get; set; }
         public int Qty { get; set; }
    }
}
