using Divar.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Divar.Models
{

    public class DivarDbContext : DbContext
    {
        public DivarDbContext(DbContextOptions<DivarDbContext> options) : base(options) { }

        public DbSet<Advertisement> advertisements { get; set; }
        public DbSet<User> Users { get; set; }

        internal IActionResult FindByIdAsync(int id)
        {
            throw new NotImplementedException();
        }


        //make Cascade Delete for Advertisement
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Advertisement>()
                .HasOne(a => a.User)
                .WithMany(u => u.Advertisements)
                .HasForeignKey(a => a.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        }

    }

}


