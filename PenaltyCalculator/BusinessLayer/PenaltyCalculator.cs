
using Angular_PenaltyCalculator.DataLayer;
using Angular_PenaltyCalculator.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace FinalWeb.BusinessLayer
{
    public class PenaltyCalculator:IPenaltyCalculator
    {
        public readonly ISQLDataHelper _sQLDataHelper;
        public PenaltyCalculator(ISQLDataHelper sQLDataHelper)  //SQL DATAHELPER Allow us to access our functions from anywhere in the project
        {
            this._sQLDataHelper = sQLDataHelper;
        }

        public List<CountryHolidays> ShowCountries()
        {
            List<CountryHolidays> countryList = _sQLDataHelper.GetCountries();
            return countryList;
        }

        public outputReceived ShowPenalty(CountryHolidays country,inputTaken input)
        {

            double penalty = CalculatePenalty(country,input);
            outputReceived output = new outputReceived(penalty,country.CountryCurrencySymbol);
            return output;
        }


        public double CalculatePenalty(CountryHolidays country,inputTaken input)
        {
            int businessDays = GetBusinessDays( country,input);
            double penalty;
            if (businessDays > 10)
            {
                penalty = (businessDays - 10) * (50 * country.ExchangeRate) * (1 + (country.TAX / 100));
            }
            else
            {
                penalty = 0;
            }
            return penalty;
        }

        public int GetBusinessDays(CountryHolidays country,inputTaken input)
        {
            int days = 0;
            DateTime startDate = input.startDate;
            DateTime endDate = input.endDate;


            for (var date = startDate; date <= endDate; date = date.AddDays(1))
            {
                bool weekendCheck = false;
                bool holidayCheck = false;

                for (int i = 0; i < country.weekendList.Count; i++)
                {
                    if (date.DayOfWeek.ToString() == (country.weekendList[i].weekendDays))
                    {
                        weekendCheck = true;
                    }
                }
                for (int i = 0; i < country.HolidayList.Count; i++)
                {
                    if (date.DayOfYear == (country.HolidayList[i].HolidayDate).DayOfYear)
                    {
                        holidayCheck = true;
                    }
                }
                if (weekendCheck != true && holidayCheck!=true)
                {
                    days++;
                }


            }
            return days;
        }

    }
}
