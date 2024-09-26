namespace Divar.Models
{
    public class Advertisement
    {
        public int Id { get; set; }
        public string ?Title { get; set; }
        public string ?Content { get; set; }
        public string ?ImageUrl { get; set; }
        public int ?Price { get; set; }
        public DateTime ?CreatedDate { get; set; }
        public bool ?IsAvailable { get; set; }
        public string ?Category { get; set; }

        //public int ?UserId { get; set; }// Foreign key to User
        //public User ?User { get; set; }
    }
}
