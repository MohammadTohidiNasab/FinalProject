namespace Divar.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminApiController : ControllerBase
    {
        private readonly DivarDbContext _context;

        public AdminApiController(DivarDbContext context)
        {
            _context = context;
        }

        // نمایش محصولات و کاربران
        [HttpGet("dashboard")]
        public IActionResult GetDashboard()
        {
            var users = _context.Users.ToList();
            var advertisements = _context.Advertisements.ToList();
            var comments = _context.Comments.ToList();

            var viewModel = new AdminPanel
            {
                Users = users,
                Advertisements = advertisements,
                Comments = comments
            };

            return Ok(viewModel);
        }

        // دریافت یک کاربر
        [HttpGet("users/{id}")]
        public async Task<IActionResult> GetUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        // حذف کاربر
        [HttpDelete("users/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            // حذف تبلیغات مرتبط
            var advertisements = _context.Advertisements.Where(a => a.UserId == id);
            _context.Advertisements.RemoveRange(advertisements);

            // حذف کاربر
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent(); // رمز وضعیت 204: حذف موفقیت‌آمیز
        }

        // دریافت لیست کاربران
        [HttpGet("users")]
        public IActionResult GetUsers()
        {
            var users = _context.Users.ToList();
            return Ok(users);
        }

        // نمایش تبلیغات
        [HttpGet("advertisements")]
        public IActionResult GetAdvertisements()
        {
            var advertisements = _context.Advertisements.ToList();
            return Ok(advertisements);
        }

        // نمایش نظرات
        [HttpGet("comments")]
        public IActionResult GetComments()
        {
            var comments = _context.Comments.ToList();
            return Ok(comments);
        }
    }
}
