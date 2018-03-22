using System.Collections.Generic;
using DomainModel;

namespace DataService
{
    public interface IDataService
    {
        IList<Category> GetCategories();
        Category GetCategory(int id);
        Category CreateCategory(string name, string description);
        bool DeleteCategory(int id);
        bool UpdateCategory(int id, string name, string description);
        Product GetProduct(int id);
        IList<ProductCategoryNameListDto> GetProductByName(string s);
        IList<ProductListDto> GetProductByCategory(int categoryId);        
        IList<ProductCategoryNameListDto> GetProducts(int page, int pageSize);
        List<OrderDetails> GetOrderDetailsByOrderId(int id);
        List<OrderDetails> GetOrderDetailsByProductId(int id);
        Order GetOrder(int id);
        IList<Order> GetOrders();

    }
}