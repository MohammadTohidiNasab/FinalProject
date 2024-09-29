using System.ComponentModel.DataAnnotations;

namespace Divar.Models
{
    public class Advertisement
    {
        [Required]
        public int Id { get; set; }
        [MaxLength(50)]
        public string ?Title { get; set; }
        [MaxLength(300)]
        public string ?Content { get; set; }
        public string ?ImageUrl { get; set; }
        public int ?Price { get; set; }
        public DateTime ?CreatedDate { get; set; }
        public bool ?IsAvailable { get; set; } = true;
        [MaxLength(50)]
        public string ?Category { get; set; }

        public int ?UserId { get; set; }// Foreign key to User
        public User ?User { get; set; }
    }
}
