using Microsoft.EntityFrameworkCore;

namespace Divar.Models
{

    public class AdvertisementDbContext : DbContext
    {
        public DbSet<Advertisement> advertisements { get; set; }

        public AdvertisementDbContext(DbContextOptions<AdvertisementDbContext> options) : base(options) { }

    }

}


