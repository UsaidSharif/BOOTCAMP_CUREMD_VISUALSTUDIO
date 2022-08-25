
using Angular_PenaltyCalculator.DataLayer;
using Angular_PenaltyCalculator.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Angular_PenaltyCalculator.Models
{
    public class inputTaken
    {

            public DateTime startDate { get; set; }
            public DateTime endDate { get; set; }
            public int id { get; set; }
        
    }
}
