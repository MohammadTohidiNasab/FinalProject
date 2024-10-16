namespace Divar.Controllers
{
    public class HomeController : Controller
    {
        private readonly DivarDbContext _context;
        private readonly int pageSize = 8;

        public HomeController(DivarDbContext context)
        {
            _context = context;
        }

        // Show all advertisements
        public IActionResult Index(int pageNumber = 1, string category = "", string searchTerm = "")
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
            var totalPages = (int)Math.Ceiling((double)totalAds / pageSize);
            var ads = query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();

            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = pageNumber;
            ViewBag.CurrentCategory = category;
            ViewBag.CurrentSearchTerm = searchTerm; // سنجشتگیری عبارت جستجو

            return View(ads);
        }



        //show detalls
        public IActionResult Detail(int id)
        {
            var adds = _context.Advertisements
                .Include(a => a.User) // Include the User details
                .FirstOrDefault(c => c.Id == id);
            if (adds == null)
            {
                return NotFound();
            }
            return View(adds);
        }



        //to create Advertisement
        [HttpPost]
        public IActionResult Create(Advertisement advertisement)
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (ModelState.IsValid)
            {
                advertisement.UserId = userId;
                advertisement.CreatedDate = DateTime.Now;
                _context.Advertisements.Add(advertisement);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(advertisement);

        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }



        //Edit Advertisement
        [HttpPost]
        public IActionResult Edit(int id, Advertisement updatedadvertisements)
        {
            if (ModelState.IsValid)
            {
                var adds = _context.Advertisements.FirstOrDefault(c => c.Id == id);

                if (adds == null)
                {
                    return NotFound();
                }
                adds.Title = updatedadvertisements.Title;
                adds.Content = updatedadvertisements.Content;
                adds.Price = updatedadvertisements.Price;
                adds.Category = updatedadvertisements.Category;
                adds.ImageUrl = updatedadvertisements.ImageUrl;

                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(updatedadvertisements);
        }



        [HttpGet]
        public IActionResult Edit(int id)
        {
            var adds = _context.Advertisements.FirstOrDefault(a => a.Id == id);
            if (adds == null)
            {
                return NotFound();
            }
            return View(adds);
        }



        //Delete advertisements
        public async Task<IActionResult> Delete(int id)
        {
            var adds = await _context.Advertisements.FindAsync(id);
            if (adds == null)
            {
                return NotFound();
            }

            return View(adds);
        }



        // Delete Confirm
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var adds = await _context.Advertisements.FindAsync(id);


            if (adds != null)
            {
                _context.Advertisements.Remove(adds);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }




        //user dashbord 
        public IActionResult Dashboard(int pageNumber = 1)
        {
            var userId = HttpContext.Session.GetInt32("UserId"); //از سشن UserId دریافت
            var query = _context.Advertisements.Where(ad => ad.UserId == userId).AsQueryable();
            var totalAds = query.Count();
            var totalPages = (int)Math.Ceiling((double)totalAds / pageSize);
            var ads = query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();

            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = pageNumber;

            return View(ads);
        }
    }
}