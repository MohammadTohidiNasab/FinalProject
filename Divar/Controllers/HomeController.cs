namespace Divar.Controllers
{
    public class HomeController : Controller
    {
        private readonly DivarDbContext _context;
        private readonly int pageSize = 4;

        public HomeController(DivarDbContext context)
        {
            _context = context;
        }

        // Show all advertisements
        public IActionResult Index(int pageNumber = 1, string category = "", string searchTerm = "")
        {
            var query = _context.advertisements.AsQueryable();

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
            var article = _context.advertisements
                .Include(a => a.User) // Include the User details
                .FirstOrDefault(c => c.Id == id);
            if (article == null)
            {
                return NotFound();
            }
            return View(article);
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
                _context.advertisements.Add(advertisement);
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
                var article = _context.advertisements.FirstOrDefault(c => c.Id == id);

                if (article == null)
                {
                    return NotFound();
                }
                article.Title = updatedadvertisements.Title;
                article.Content = updatedadvertisements.Content;
                article.Price = updatedadvertisements.Price;
                article.Category = updatedadvertisements.Category;
                article.ImageUrl = updatedadvertisements.ImageUrl;

                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(updatedadvertisements);
        }



        [HttpGet]
        public IActionResult Edit(int id)
        {
            var article = _context.advertisements.FirstOrDefault(a => a.Id == id);
            if (article == null)
            {
                return NotFound();
            }
            return View(article);
        }



        //Delete advertisements
        public async Task<IActionResult> Delete(int id)
        {
            var article = await _context.advertisements.FindAsync(id);
            if (article == null)
            {
                return NotFound();
            }

            return View(article);
        }



        // Delete Confirm
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var article = await _context.advertisements.FindAsync(id);


            if (article != null)
            {
                _context.advertisements.Remove(article);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }
    }
}