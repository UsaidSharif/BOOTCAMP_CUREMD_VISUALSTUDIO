using Angular_PenaltyCalculator.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Angular_PenaltyCalculator.DataLayer
{
    public class SQLDataHelper : ISQLDataHelper
    {
        public readonly IConfiguration configuration;
        public SQLDataHelper(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public string GetConnectionString(IConfiguration configuration) //Getting Connection string from api
        {
            var connectionString = configuration.GetConnectionString("MyConnectionString");
            return connectionString;
        }

        public List<CountryHolidays> GetCountries() //get countries function to extract country data from data base
        {

            SqlConnection cnn = new SqlConnection(GetConnectionString(configuration));
            cnn.Open();
            SqlCommand command;
            SqlDataReader dataReader;
            string sql = "select* from dbo.CountryPrimary";

            command = new SqlCommand(sql, cnn);
            dataReader = command.ExecuteReader();
            List<CountryHolidays> countriesList = new List<CountryHolidays>();
            
            while (dataReader.Read())
            {
                int CountryID = Convert.ToInt32(dataReader.GetValue(0));
                string CountryName = dataReader.GetValue(1).ToString();
                string CountryCurrency = dataReader.GetValue(2).ToString();
                string CountryCurrencySymbol = dataReader.GetValue(3).ToString();
                double ExchangeRate = Convert.ToDouble( dataReader.GetValue(4));
                double TAX = Convert.ToDouble(dataReader.GetValue(5));
               
                List<HolidayClass> HolidayList = GetHolidays(CountryID);  // FUnction to get Holidays
                List<Weekend> weekendList = GetWeekends(CountryID);       // Function to get Wekeends

                CountryHolidays country = new CountryHolidays(CountryID, CountryName, CountryCurrency, CountryCurrencySymbol, ExchangeRate, TAX, HolidayList, weekendList);
                countriesList.Add(country);

            }
            dataReader.Close();
            command.Dispose();
            cnn.Close();
            return countriesList;
        }

        public List<Weekend> GetWeekends(int WeekendID)
        {
            SqlConnection con = new SqlConnection(GetConnectionString(configuration));
            con.Open();
            SqlCommand command;
            SqlDataReader dataReader;
            string sql = "select * from WeekendCountryDays where WekendCountryID= @WeekendID";
            command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@WeekendID", WeekendID);
            dataReader = command.ExecuteReader();
            List<Weekend> weekendList = new List<Weekend>();
            while (dataReader.Read())
            {
                string weekend = dataReader.GetValue(0).ToString();

                Weekend weekends = new Weekend();
                weekends.weekendDays = weekend;
                weekendList.Add(weekends);
            }
            dataReader.Close();
            command.Dispose();
            con.Close();
            return weekendList;   // Returning weekend list to add in country list
        }
        public List<HolidayClass> GetHolidays(int HolidayID)
        {
            SqlConnection con = new SqlConnection(GetConnectionString(configuration));
            con.Open();
            SqlCommand command;
            SqlDataReader dataReader;
            string sql = "select * from dbo.SpecialDays where HolidayCountryID= @HolidayID";
            command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@HolidayID", HolidayID);
            dataReader = command.ExecuteReader();
            List<HolidayClass> HolidayList = new List<HolidayClass>();
            while (dataReader.Read())
            {
                string HolidayName = dataReader.GetValue(1).ToString();
                DateTime HolidayDate = Convert.ToDateTime(dataReader.GetValue(2));

                HolidayClass Holidays = new HolidayClass();
                Holidays.HolidayName = HolidayName;
                Holidays.HolidayDate = HolidayDate;
               
                HolidayList.Add(Holidays);
            }
            dataReader.Close();
            command.Dispose();
            con.Close();
            return HolidayList; // Returning Holiday list to add in country list
        }
    }
}
