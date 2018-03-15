using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace EFExample
{
    class Program
    {
        static void Main(string[] args)
        {

            var newCategory = new Category();
            newCategory.Name = "New Category";
            newCategory.Description = "This is a new Category. Please work :)";
            
            /* --- Execute Queries --- */
            //SelectCategories();
            //CreateCategory(newCategory);
            //UpdateCategory(14, "UpdatedCat");
            GetProducts();

            Console.ReadKey();
        }


        static void GetProducts()
        {
            using (var db = new NorthwindContext())
            {
                foreach (var product in db.products.Include(x => x.Category))
                {
                    Console.WriteLine($"{product.Name} | {product.Category.Name}");
                }
            }
        }

        static void UpdateCategory(int id, string name)
        {
            using (var db = new NorthwindContext())
            {
                Category category = db.categories.FirstOrDefault(x => x.ID == id);
                category.Name = name;

                if (category == null) return;

                db.SaveChanges();
            }
        }

        static void CreateCategory(Category category)
        {
            using (var db = new NorthwindContext())
            {
                db.Add(category);

                db.SaveChanges();
            }
        }


        private static void SelectCategories()
        {
            using (var db = new NorthwindContext())
            {
                foreach (var category in db.categories)
                {
                    Console.WriteLine(category.Name);
                }
            }
        }


    }
}
