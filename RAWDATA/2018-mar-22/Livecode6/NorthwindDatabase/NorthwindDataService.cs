using System.Collections.Generic;
using System.Linq;
using DataService;
using DomainModel;
using Microsoft.EntityFrameworkCore;

namespace NorthwindDatabase
{
    
    public class NorthwindDataService : IDataService
    {

        public IList<Category> GetCategories()
        {
            using (var db = new NorthwindContext())
            {
                return db.Categories.ToList();
            }
        }

        public Category GetCategory(int id)
        {
            using (var db = new NorthwindContext())
            {
                return db.Categories.FirstOrDefault(x => x.Id == id);
            }
        }

        public Category CreateCategory(string name, string description)
        {
            using (var db = new NorthwindContext())
            {
                var category = new Category { Name = name, Description = description };
                db.Categories.Add(category);
                db.SaveChanges();
                return category;
            }
        }

        public bool DeleteCategory(int id)
        {
            using (var db = new NorthwindContext())
            {
                var category = db.Categories.FirstOrDefault(x => x.Id == id);
                if (category == null) return false;
                db.Categories.Remove(category);
                db.SaveChanges();
                return true;
            }
        }

        public bool UpdateCategory(int id, string name, string description)
        {
            using (var db = new NorthwindContext())
            {
                var category = db.Categories.FirstOrDefault(x => x.Id == id);
                if (category == null) return false;
                category.Name = name;
                category.Description = description;
                db.SaveChanges();
                return true;
            }
        }

        public Product GetProduct(int id)
        {
            using (var db = new NorthwindContext())
            {
                return db.Products.Include(x => x.Category).FirstOrDefault(x => x.Id == id);
            }
        }

        public IList<ProductCategoryNameListDto> GetProductByName(string s)
        {
            using (var db = new NorthwindContext())
            {
                return db.Products
                    .Include(x => x.Category)
                    .Where(x => x.Name.Contains(s))
                    .Select(x => new ProductCategoryNameListDto
                    {
                        ProductName = x.Name,
                        CategoryName = x.Category.Name
                    })
                    .ToList();
            }
        }

        public IList<ProductListDto> GetProductByCategory(int categoryId)
        {
            using (var db = new NorthwindContext())
            {
                return db.Products
                    .Include(x => x.Category)
                    .Where(x => x.Category.Id == categoryId)
                    .Select(x => new ProductListDto
                    {
                        Name = x.Name,
                        UnitPrice = x.UnitPrice,
                        CategoryName = x.Category.Name
                    })
                    .ToList();
            }
        }

        public List<OrderDetails> GetOrderDetailsByOrderId(int id)
        {
            using (var db = new NorthwindContext())
            {
                return db.OrderDetails
                    .Include(x => x.Product)
                    .Where(x => x.OrderId == id)
                    .ToList();
            }
        }

        public List<OrderDetails> GetOrderDetailsByProductId(int id)
        {
            using (var db = new NorthwindContext())
            {
                return db.OrderDetails
                    .Include(x => x.Order)
                    .Where(x => x.ProductId == id)
                    .ToList();
            }
        }

        public Order GetOrder(int id)
        {
            using (var db = new NorthwindContext())
            {
                return db.Orders
                    .Include(x => x.OrderDetails)
                    .ThenInclude(y => y.Product)
                    .ThenInclude(z => z.Category)
                    .FirstOrDefault(x => x.Id == id);
            }
        }

        public IList<Order> GetOrders()
        {
            using (var db = new NorthwindContext())
            {
                return db.Orders.ToList();
            }
        }

        public IList<ProductCategoryNameListDto> GetProducts(int page, int pageSize)
        {
            using (var db = new NorthwindContext())
            {
                return db.Products
                    .Include(x => x.Category)
                    .OrderBy(x => x.Id)
                    .Skip(page * pageSize)
                    .Take(pageSize)
                    .Select(x => new ProductCategoryNameListDto {
                        ProductName = x.Name,
                        CategoryName = x.Category.Name,
                        //Id = x.Id
                    })
                    .ToList();
            }
        }
    }
}
