using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Angular_PenaltyCalculator.DataLayer;
using Angular_PenaltyCalculator.Models;
using FinalWeb.BusinessLayer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;


namespace Angular_PenaltyCalculator.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class penaltyController : ControllerBase
    {
        public readonly IConfiguration  configuration;
        public readonly ISQLDataHelper sQLData;
        public readonly IPenaltyCalculator penalty;
        public penaltyController(IConfiguration configuration,ISQLDataHelper sQLData,IPenaltyCalculator penaltyCalculator)
        {
            this.configuration = configuration;
            this.sQLData = sQLData;
            this.penalty = penaltyCalculator;
        }


        // GET: api/penalty

        [Route("GetCountry")]
        [HttpGet]

        public List<CountryHolidays> Get()
        {
            
            List<CountryHolidays> countryList = sQLData.GetCountries();
            return countryList;
        }



        [Route("GetPenalty")]
        [HttpPost]
        public outputReceived Get([FromBody] inputTaken input)
        {
            outputReceived output = this.penalty.ShowPenalty(input);
            return output;
        }


     
    }
}
