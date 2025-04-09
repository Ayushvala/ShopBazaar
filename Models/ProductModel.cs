namespace Onlinecom.Models
{
    public class ProductModel
    {
        public int Id { get; set; }
        public required string Name { get; set; }
        public required string Description { get; set; }
        public decimal Oprice { get; set; }
        public decimal Dprice { get; set; }
        public required string Photo { get; set; }
    }
}
