using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace DataTables_Assignment
{
    public class Staff
    {
        public string Name { get; set; }
        public int ID { get; set; }
        public string Role { get; set; }

        public List<Staff> StudentData = new List<Staff>();

        //constuctor to add attributes
        public Staff(string name, int id, string role)
        {
            this.Name = name;
            this.ID = id;
            this.Role = role;
        }
        //Student list function to generate list
        public List<Staff> StudentListGen()
        {

            //for loop to generate data
            Random rnd = new Random();
            for (int i = 1; i <= 1000; i++)
            {
                int random_number = rnd.Next(1, 100); //generate random number between 1 and 100
                int newNumber = int.Parse(i.ToString() + random_number.ToString());
                Staff studenti = new Staff("Student" + i, newNumber, "Role" + i);
                StudentData.Add(studenti);
            }


            return StudentData;
        }
    }
    
   
    public partial class WebForm1 : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        [WebMethod]
        public static string GetStaffInfo()
        {

            Staff list = new Staff("name",1,"role");
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(list.StudentListGen());


        }
    }
}



//return (List<Staff>) HttpContext.Current.Session["StaffList"];