using Drinkers.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Drinkers.Data
{
    public class DrinkerDbContext : DbContext
    {

       public DbSet<Product> Product { get; set; }
        public DbSet<Categories> Categories { get; set; }
        public DbSet<Order> Order { get; set; }
        public DrinkerDbContext(DbContextOptions<DrinkerDbContext> options)
            : base(options)
        {
        }

        public DrinkerDbContext() 
        {
        }
    }
}
