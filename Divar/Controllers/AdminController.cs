﻿namespace Divar.Controllers
{
    public class AdminController : Controller
    {
        private readonly DivarDbContext _context;

        public AdminController(DivarDbContext context)
        {
            _context = context;
        }

        //نمایش محصولات و کاربران
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



