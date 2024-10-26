namespace Divar.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdvertisementsController : ControllerBase
    {
        private readonly DivarDbContext _context;
        private readonly int _pageSize = 8;

        public AdvertisementsController(DivarDbContext context)
        {
            _context = context;
        }

        // GET: api/advertisements
        [HttpGet]
        public IActionResult GetAdvertisements(int pageNumber = 1, string category = "", string searchTerm = "")
        {
            var query = _context.Advertisements.AsQueryable();

            // Filter by category
            if (!string.IsNullOrWhiteSpace(category))
            {
                query = query.Where(ad => ad.Category == category);
            }

            // Filter by search term in Title
            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                query = query.Where(ad => ad.Title.Contains(searchTerm));
            }

            var totalAds = query.Count();
            var totalPages = (int)Math.Ceiling((double)totalAds / _pageSize);
            var ads = query.Skip((pageNumber - 1) * _pageSize).Take(_pageSize).ToList();

            return Ok(new { TotalPages = totalPages, CurrentPage = pageNumber, Advertisements = ads });
        }

        // GET: api/advertisements/{id}
        [HttpGet("{id}")]
        public IActionResult GetAdvertisement(int id)
        {
            var advertisement = _context.Advertisements
                .Include(a => a.User) // Include the User details
                .FirstOrDefault(c => c.Id == id);
            if (advertisement == null)
            {
                return NotFound();
            }
            return Ok(advertisement);
        }

        // POST: api/advertisements
        [HttpPost]
        public IActionResult CreateAdvertisement(Advertisement advertisement)
        {
            if (ModelState.IsValid)
            {
                var userId = HttpContext.Session.GetInt32("UserId");
                advertisement.UserId = userId;
                advertisement.CreatedDate = DateTime.Now;
                _context.Advertisements.Add(advertisement);
                _context.SaveChanges();
                return CreatedAtAction(nameof(GetAdvertisement), new { id = advertisement.Id }, advertisement);
            }

            return BadRequest(ModelState);
        }

        // PUT: api/advertisements/{id}
        [HttpPut("{id}")]
        public IActionResult UpdateAdvertisement(int id, Advertisement updatedAdvertisement)
        {
            if (id != updatedAdvertisement.Id || !ModelState.IsValid)
            {
                return BadRequest();
            }

            var advertisement = _context.Advertisements.Find(id);
            if (advertisement == null)
            {
                return NotFound();
            }

            advertisement.Title = updatedAdvertisement.Title;
            advertisement.Content = updatedAdvertisement.Content;
            advertisement.Price = updatedAdvertisement.Price;
            advertisement.Category = updatedAdvertisement.Category;
            advertisement.ImageUrl = updatedAdvertisement.ImageUrl;

            _context.Advertisements.Update(advertisement);
            _context.SaveChanges();

            return NoContent();
        }

        // DELETE: api/advertisements/{id}
        [HttpDelete("{id}")]
        public IActionResult DeleteAdvertisement(int id)
        {
            var advertisement = _context.Advertisements.Find(id);
            if (advertisement == null)
            {
                return NotFound();
            }

            _context.Advertisements.Remove(advertisement);
            _context.SaveChanges();

            return NoContent();
        }

        // GET: api/advertisements/user
        [HttpGet("user")]
        public IActionResult GetUserAdvertisements(int pageNumber = 1)
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            var query = _context.Advertisements.Where(ad => ad.UserId == userId).AsQueryable();
            var totalAds = query.Count();
            var totalPages = (int)Math.Ceiling((double)totalAds / _pageSize);
            var ads = query.Skip((pageNumber - 1) * _pageSize).Take(_pageSize).ToList();

            return Ok(new { TotalPages = totalPages, CurrentPage = pageNumber, Advertisements = ads });
        }
    }
}
