namespace DomainModel
{
    public class OrderDetails
    {
        public double UnitPrice { get; set; }
        public int Quantity { get; set; }
        public double Discount { get; set; }
        public int ProductId { get; set; }
        public Product Product { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }
    }
}
