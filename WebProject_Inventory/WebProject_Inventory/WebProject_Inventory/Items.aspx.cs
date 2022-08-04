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
    public class Item_Class
    {
        public int ID { get; set; }
        public string ItemName { get; set; }

        public int CostPrice { get; set; }
       
        public int SalePrice { get; set; }

        public List<Item_Class> Item_list = new List<Item_Class>();
        public Item_Class(int id,string name, int costprice, int saleprice)
        {
            this.ID = id;
            this.ItemName = name;
            this.CostPrice = costprice;
            this.SalePrice = saleprice;

        }

        public List<Item_Class> getItems()
        {
            for (int i = 1; i <= 20; i++)
            {
                Item_Class c1 = new Item_Class(i,"Item" + i, i+20 , 40+ i);


                Item_list.Add(c1);
            }



            return Item_list;
        }
    }
    public partial class Items : System.Web.UI.Page
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

            Item_Class customerSession = new Item_Class(1,"",1 , 1);
            Session["Item"] = customerSession.getItems();
        }

        protected void Button_LogOut_Click1(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("LoginPage.aspx");
        }
        [WebMethod]
        public static string GetCustomers()
        {
            List<Item_Class> list = (List<Item_Class>)HttpContext.Current.Session["Item"];
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(list);
        }

        [WebMethod]
        public static string AddCustomer(string id,string ItemName, string CostPrice, string SalePrice)
        {
            List<Item_Class> list = (List<Item_Class>)HttpContext.Current.Session["Item"];
            int ID = Convert.ToInt32(id);
            int COSTPRICE = Convert.ToInt32(CostPrice);
            int SALEPRICE = Convert.ToInt32(SalePrice);
            
            Item_Class newCustomer = new Item_Class(ID, ItemName ,COSTPRICE, SALEPRICE);
            list.Add(newCustomer);
            JavaScriptSerializer js2 = new JavaScriptSerializer();
            HttpContext.Current.Session["Item"] = list;
            return js2.Serialize(list);
        }
        [WebMethod]
        public static string ClearCustomer(string id)
        {
            List<Item_Class> list = (List<Item_Class>)HttpContext.Current.Session["Item"];
            int ID = Convert.ToInt32(id);


            for (int i = 0; i < list.Count; i++)
            {
                if (ID == list[i].ID)
                {
                    list.Remove(list[i]);
                }
            }

            JavaScriptSerializer js3 = new JavaScriptSerializer();
            HttpContext.Current.Session["Item"] = list;
            return js3.Serialize(list);
        }
        [WebMethod]
        public static string EditCustomers(string id, string CostPrice, string SalePrice)
        {
            List<Item_Class> list = (List<Item_Class>)HttpContext.Current.Session["Item"];
            int ID = Convert.ToInt32(id);
            int COSTPRICE = Convert.ToInt32(CostPrice);
            int SALEPRICE = Convert.ToInt32(SalePrice);

            for (int i = 0; i < list.Count; i++)
            {
                if (ID == list[i].ID)
                {
                    if (CostPrice != null)
                    {
                        list[i].CostPrice = COSTPRICE;
                    }
                    if (SalePrice != null)
                    {
                        list[i].SalePrice = SALEPRICE;
                    }
                }
            }
            JavaScriptSerializer js1 = new JavaScriptSerializer();
            HttpContext.Current.Session["Item"] = list;
            return js1.Serialize(list);
        }


    }
}