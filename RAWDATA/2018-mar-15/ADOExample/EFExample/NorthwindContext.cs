using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFExample
{
    class NorthwindContext : DbContext
    {
        public DbSet<Category> categories { get; set; }
        public DbSet<Product> products{ get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            string server = "178.62.226.178";
            string dbname = "northwind";
            string username = "nwuser";
            string password = "nwuser";

            string connStr = $"server={server};database={dbname};uid={username};pwd={password}"; //you can also disable ssl: SslMode=none;

            optionsBuilder.UseMySql(connStr);
            
        }


        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            //map the Category.ID to the coloumn CategoryId (and same for every property)
            modelBuilder.Entity<Category>().Property(x => x.ID).HasColumnName("CategoryId");
            modelBuilder.Entity<Category>().Property(x => x.Name).HasColumnName("CategoryName");
            modelBuilder.Entity<Category>().Property(x => x.Description).HasColumnName("Description");

            modelBuilder.Entity<Product>().Property(x => x.ID).HasColumnName("ProductId");
            modelBuilder.Entity<Product>().Property(x => x.Name).HasColumnName("ProductName");            
        }

    }
}
