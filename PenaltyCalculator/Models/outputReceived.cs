namespace Angular_PenaltyCalculator.Models
{
    public class outputReceived
    {
        public double penalty { get; set; }
        public string countryCurrency { get; set; }
        public outputReceived(double penalty, string currency)
        {
            this.penalty = penalty;
            this.countryCurrency = currency;
        }
    }
}
