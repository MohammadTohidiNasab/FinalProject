using Divar.Models;
using Divar.ViewModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;



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


        //login to admin panel

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }


        public IActionResult Logout()
        {
            HttpContext.Session.Remove("AdminUser");
            return RedirectToAction("Login");
        }

        //ویرایش موجودیت کالا
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
                article.IsAvailable = updatedadvertisements.IsAvailable;
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



        //حذف کاربران
        public async Task<IActionResult> DeleteUser(int id)
        {
            var _user = await _context.Users.FindAsync(id);
            if (_user == null)
            {
                return NotFound();
            }

            return View(_user);
        }



        // Delete Confirm
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            // حذف تبلیغات مرتبط
            var advertisements = _context.advertisements.Where(a => a.UserId == id);
            _context.advertisements.RemoveRange(advertisements);
            HttpContext.Session.Clear();
            var _user = await _context.Users.FindAsync(id);
            if (_user != null)
            {
                _context.Users.Remove(_user);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }
    }

}



