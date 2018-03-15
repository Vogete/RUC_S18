using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace EFExample
{
    class Category
    {
        // the column name mapping can be done in the context as well!

        // [Column("CategoryId")]
        public int ID { get; set; }
        // [Column("CategoryName")]
        public string Name { get; set; }
        // [Column("Description")]
        public string Description { get; set; }
        
    }
}
