namespace Divar.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly DivarDbContext _context;

        public UserController(DivarDbContext context)
        {
            _context = context;
        }

        // Register User
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            bool emailExists = await _context.Users.AnyAsync(u => u.Email == user.Email);
            if (emailExists)
            {
                return Conflict("ایمیل تکراری است.");
            }

            // Hashing the password
            user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(user.PasswordHash);
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(Login), new { email = user.Email }, user);
        }

        // Login User
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest loginRequest)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == loginRequest.Email);
            if (user != null && BCrypt.Net.BCrypt.Verify(loginRequest.Password, user.PasswordHash))
            {
                // Here you could use JWT or some mechanism to create a session
                // For now, return user details without password
                return Ok(new
                {
                    user.Email,
                    user.FirstName,
                    user.LastName,
                    user.Id
                });
            }

            return Unauthorized("ایمیل یا رمز عبور نادرست است.");
        }

        // Logout User
        [HttpPost("logout")]
        public IActionResult Logout()
        {
            // Handle logout logic if you're using sessions or tokens
            // For a token-based approach, you'd typically just invalidate the token on the client-side
            return Ok("Logged out successfully.");
        }
    }

    public class LoginRequest
    {
        [Required]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
