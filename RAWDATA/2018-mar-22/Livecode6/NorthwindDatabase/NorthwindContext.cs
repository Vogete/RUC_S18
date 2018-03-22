using DomainModel;
using Microsoft.EntityFrameworkCore;

namespace NorthwindDatabase
{
    public class NorthwindContext : DbContext
    {
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetails> OrderDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            string server = "178.62.226.178";
            string database = "northwind";
            string username = "nwuser";
            string password = "nwuser";

            optionsBuilder.UseMySql($"server={server};database={database};uid={username};pwd={password}");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Category>().ToTable("categories");
            modelBuilder.Entity<Category>().Property(x => x.Id).HasColumnName("categoryid");
            modelBuilder.Entity<Category>().Property(x => x.Name).HasColumnName("categoryname");

            modelBuilder.Entity<Product>().ToTable("products");
            modelBuilder.Entity<Product>().Property(x => x.Id).HasColumnName("productid");
            modelBuilder.Entity<Product>().Property(x => x.Name).HasColumnName("productname");
            modelBuilder.Entity<Product>().Property(x => x.QuantityPerUnit).HasColumnName("quantityunit");

            modelBuilder.Entity<Order>().ToTable("orders");
            modelBuilder.Entity<Order>().Property(x => x.Id).HasColumnName("orderid");
            modelBuilder.Entity<Order>().Property(x => x.Date).HasColumnName("orderdate");
            modelBuilder.Entity<Order>().Property(x => x.Required).HasColumnName("requireddate");
            modelBuilder.Entity<Order>().Property(x => x.Shipped).HasColumnName("shippeddate");

            modelBuilder.Entity<OrderDetails>().ToTable("orderdetails");
            modelBuilder.Entity<OrderDetails>().HasKey(x => new {x.OrderId, x.ProductId});
        }
    }
}
