using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Angular_PenaltyCalculator.Models
{
    public class CountryHolidays
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }
        public string CountryCurrency { get; set; }
        public string CountryCurrencySymbol { get; set; }

        public double ExchangeRate { get; set; }
        public double TAX { get; set; }
      
        public List<Weekend> weekendList { get; set; }
        public List<HolidayClass> HolidayList { get; set; }

        public CountryHolidays(int CountryID, string CountryName, string CountryCurrency, string CountryCurrencySymbol, double ExchangeRate, double TAX, List<HolidayClass> HolidayList, List<Weekend> weekendList)
        {
            this.CountryID = CountryID;
            this.CountryName = CountryName;
            this.CountryCurrency = CountryCurrency;
            this.CountryCurrencySymbol = CountryCurrencySymbol;
            this.ExchangeRate = ExchangeRate;
            this.TAX = TAX;
            this.weekendList = weekendList;
            this.HolidayList = HolidayList;
            
        }

       
    }
}

