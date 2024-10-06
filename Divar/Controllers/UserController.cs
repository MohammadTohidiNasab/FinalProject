namespace Divar.Controllers
{
    public class UserController : Controller
    {
        private readonly DivarDbContext _context;


        public UserController(DivarDbContext context)
        {
            _context = context;
        }



        //register contorller
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(User user)
        {
            if (ModelState.IsValid)
            {
                // هش کردن رمز عبور و ذخیره کاربر در دیتابیس
                user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(user.PasswordHash);
                _context.Users.Add(user); // ذخیره کاربر در دیتابیس
                await _context.SaveChangesAsync(); // ثبت تغییرات در دیتابیس
                return RedirectToAction("Index", "Home");
            }
            return View(user);
        }




        //login conteroler
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string email, string password)
        {
            // پیدا کردن کاربر بر اساس ایمیل
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == email);
            if (user != null && BCrypt.Net.BCrypt.Verify(password, user.PasswordHash))
            {
                HttpContext.Session.SetString("UserEmail", user.Email);
                HttpContext.Session.SetInt32("UserId", user.Id);
                HttpContext.Session.SetString("FirstName", user.FirstName);

                return RedirectToAction("Index", "Home");
            }
            ModelState.AddModelError(string.Empty, "ایمیل یا رمز عبور نادرست است.");
            return View();
        }



        //log out
        public IActionResult Logout()
        {
            HttpContext.Session.Clear(); // پاک کردن سشن‌ها
            return RedirectToAction("Index", "Home");
        }


    }
}
