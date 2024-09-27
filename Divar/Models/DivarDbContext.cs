using Microsoft.EntityFrameworkCore;

namespace Divar.Models
{

    public class DivarDbContext : DbContext
    {
        public DbSet<Advertisement> advertisements { get; set; }
        public DbSet<User> Users { get; set; }


        public DivarDbContext(DbContextOptions<DivarDbContext> options) : base(options) { }

    }

}


