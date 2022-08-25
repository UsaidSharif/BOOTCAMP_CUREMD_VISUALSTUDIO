using Angular_PenaltyCalculator.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

namespace Angular_PenaltyCalculator.DataLayer
{
    public interface ISQLDataHelper
    {
        //Complete Abstraction can be achieved by the implementation of Interface.Along with making our code easy to maintain, concept loose coupling can be achieved.
        string GetConnectionString(IConfiguration configuration);
        public List<Weekend> GetWeekends(int WeekendID);
        public List<HolidayClass> GetHolidays(int HolidayID);
        public List<CountryHolidays> GetCountries();

    }
}
