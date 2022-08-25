
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Angular_PenaltyCalculator.Models;

namespace FinalWeb.BusinessLayer
{
    public interface IPenaltyCalculator
    {
        public List<CountryHolidays> ShowCountries();
        public outputReceived ShowPenalty(CountryHolidays country, inputTaken input);
    }
}
