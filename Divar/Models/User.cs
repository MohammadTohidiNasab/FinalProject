namespace Divar.Models
{
    public class User : IdentityUser
    {
        [Required]
        public int Id { get; set; }
        [MaxLength(50)]
        public string FirstName { get; set; }
        [MaxLength(50)]
        public string LastName { get; set; }
        [MaxLength(50)]
        public string Email { get; set; }
        [MaxLength(100)]
        public string PhoneNumber { get; set; }
        [MaxLength(100)]
        public string PasswordHash { get; set; }

        public ICollection<Advertisement> ?Advertisements { get; set; }
    }
}
