using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace WebProject_Inventory
{
    public class Customer_Class
    {

        public int ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }

       public List<Customer_Class> Customer_list = new List<Customer_Class>();
        public Customer_Class(int id, string name, string address)
        {
            this.ID = id;
            this.Name = name;
            this.Address = address;

        }

        public List<Customer_Class> getCustomers()
        {
            for (int i = 1; i <= 20; i++)
            {
                Customer_Class c1 = new Customer_Class(i, "Customer" + i, "Address" + i);


                Customer_list.Add(c1);
            }

           
           
            return Customer_list;
        }
    }
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if ((string)Session["user"] != "admin")
            {
                accountants.Attributes.Add("class", "nav-link disabled");
            }
            else if ((string)Session["user"] == "admin")
            {
                bill.Attributes.Add("class", "nav-link disabled");
            }

            Customer_Class customerSession = new Customer_Class(0, "", "");
            Session["Customer"] = customerSession.getCustomers();
        }

        protected void Button_LogOut_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("LoginPage.aspx");
        }
       
        [WebMethod]
        public static string GetCustomers()
        {
            List<Customer_Class> list = (List<Customer_Class>)HttpContext.Current.Session["Customer"];
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(list);
        }

        [WebMethod]
        public static string AddCustomer(string id, string name, string address)
        {
            List<Customer_Class> list = (List<Customer_Class>)HttpContext.Current.Session["Customer"];
            int ID = Convert.ToInt32(id);


            Customer_Class newCustomer = new Customer_Class(ID, name, address);
            list.Add(newCustomer);
            JavaScriptSerializer js2 = new JavaScriptSerializer();
            HttpContext.Current.Session["Customer"] = list;
            return js2.Serialize(list);
        }
        [WebMethod]
        public static string ClearCustomer(string id)
        {
            List<Customer_Class> list = (List<Customer_Class>)HttpContext.Current.Session["Customer"];
            int ID = Convert.ToInt32(id);


            for (int i = 0; i < list.Count; i++)
            {
                if (ID == list[i].ID)
                {
                    list.Remove(list[i]);
                }
            }

            JavaScriptSerializer js3 = new JavaScriptSerializer();
            HttpContext.Current.Session["Customer"] = list;
            return js3.Serialize(list);
        }
        [WebMethod]
        public static string EditCustomers(string id, string name, string address)
        {
            List<Customer_Class> list = (List<Customer_Class>)HttpContext.Current.Session["Customer"];
            int ID = Convert.ToInt32(id);

            for (int i = 0; i < list.Count; i++)
            {
                if (ID == list[i].ID)
                {
                    if (name != "")
                    {
                        list[i].Name = name;
                    }
                    if (address != "")
                    {
                        list[i].Address = address;
                    }
                }
            }
            JavaScriptSerializer js1 = new JavaScriptSerializer();
            HttpContext.Current.Session["Customer"] = list;
            return js1.Serialize(list);
        }
    }
}