using Divar.Models;
using Divar.ViewModel;
using Microsoft.AspNetCore.Mvc;


namespace Divar.Controllers
{
    public class AdminController : Controller
    {
        private readonly DivarDbContext _context;

        public AdminController(DivarDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            var users = _context.Users.ToList();
            var advertisements = _context.advertisements.ToList();

            var viewModel = new AdminPanel
            {
                Users = users,
                Advertisements = advertisements
            };

            return View(viewModel);
        }

    }
}
