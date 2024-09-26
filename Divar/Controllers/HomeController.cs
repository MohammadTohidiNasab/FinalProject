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

        public IActionResult Edit(int id)
        {
            var article = _context.advertisements.FirstOrDefault(a => a.Id == id);
            if (article == null)
            {
                return NotFound();
            }
            return View(article);
        }



        [HttpPost]
        public IActionResult Edit(int id, Advertisement updatedadvertisements)
        {
            if (ModelState.IsValid)
            {
                var article = _context.advertisements.FirstOrDefault(a => a.Id == id);
                if (article == null)
                {
                    return NotFound();
                }

                // به‌روزرسانی مقاله در لیست
                article.Title = updatedadvertisements.Title;
                article.Content = updatedadvertisements.Content;
                article.Price = updatedadvertisements.Price;

                return RedirectToAction(nameof(Index));
            }
            return View(updatedadvertisements);
        }


    }
}