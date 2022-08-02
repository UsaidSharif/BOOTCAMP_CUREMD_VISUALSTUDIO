using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject_Inventory
{
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["user"] != "admin")
            {
                accountants.Attributes.Add("class", "nav-link disabled");
            }
            else if ((string)Session["user"] == "admin")
            {
                bill.Attributes.Add("class", "nav-link disabled");
            }
        }

        protected void Button_LogOut_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("LoginPage.aspx");
        }
    }
}