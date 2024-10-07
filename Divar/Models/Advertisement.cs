namespace Divar.Models
{
    public class Advertisement
    {
        [Required]
        public int Id { get; set; }
        [MaxLength(100)]
        [Required(ErrorMessage = "فیلد  تیتر الزامی است")]
        public string Title { get; set; }
        [MaxLength(500)]
        public string ?Content { get; set; }
        public string ?ImageUrl { get; set; }
        [Required(ErrorMessage = " افزودن قیمت محصول الزامی است")]

        public int Price { get; set; }
        public DateTime ?CreatedDate { get; set; }
        [MaxLength(50)]
        public string Category { get; set; }

        public int ?UserId { get; set; }// Foreign key to User
        public User ?User { get; set; }
    }
}
