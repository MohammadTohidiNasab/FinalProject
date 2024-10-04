using Divar.Models;
using Microsoft.AspNetCore.Mvc;


namespace Divar.Components
{
    public class CategoriesViewComponent : ViewComponent
    {
        private readonly DivarDbContext _context;

        public CategoriesViewComponent(DivarDbContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke()
        {
            var categories = _context.advertisements
                .Select(ad => ad.Category)
                .Distinct()
                .ToList();

            return View(categories);
        }
    }
}
