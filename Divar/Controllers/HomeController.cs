using Divar.Models;
using Microsoft.AspNetCore.Mvc;


namespace Divar.Controllers
{
    public class HomeController : Controller
    {
        private readonly AdvertisementDbContext _context;

        public HomeController(AdvertisementDbContext context)
        {
            _context = context;
        }

        //show all Advertisement
        public IActionResult Index()
        {
            var ads = _context.advertisements.ToList();
            return View(ads);
        }

        //show detalls
        public IActionResult Detail(int id)
        {
            var article = _context.advertisements.FirstOrDefault(c => c.Id == id);

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
            if (ModelState.IsValid)
            {
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
        // نمایش صفحه حذف مقاله
        public async Task<IActionResult> Delete(int id)
        {
            var article = await _context.advertisements.FindAsync(id);
            if (article == null)
            {
                return NotFound();
            }

            return View(article);
        }

        // تأیید حذف مقاله
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var article = await _context.advertisements.FindAsync(id);
            if (article != null)
            {
                _context.advertisements.Remove(article);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index)); // فرض می‌کنیم یک اکشن Index برای نمایش لیست مقالات دارید
        }


    }
}