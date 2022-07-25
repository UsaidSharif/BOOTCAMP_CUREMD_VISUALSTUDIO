using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace CarSelection
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        public static List<string> carList = new List<string>()
        { "Mehran", "Alto", "Picanto",
            "Aqua", "Toyota","Civic",
            "Renault","Ford","Honda","Mercedes",
            "Nissan","Porsche","Rolls Royce","Insight","Volkswagen" };
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<string> CarSuggestionList(string name)
        {
            var suggestedList = new List<string>();
            foreach (var car in carList)
            {


                if (car.ToLower().Contains(name.ToLower()) && name.Length>0)
                {
                    suggestedList.Add(car);

                }
            }
            return suggestedList;
        }
    }
}