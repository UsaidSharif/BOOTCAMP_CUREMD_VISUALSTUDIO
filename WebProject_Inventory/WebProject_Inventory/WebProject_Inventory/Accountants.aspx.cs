using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject_Inventory
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["user"] != "admin")
            {
                Response.Redirect("MainPage.aspx");
            }
        }

        protected void Button_Add_Click(object sender, EventArgs e)
        {
            string userName = UserName.Text;
            string pass = Password.Text;
            Accounts account = new Accounts(userName, pass);
            List<Accounts> list = (List<Accounts>)Session["accounts"];
            list.Add(account);
            Session["accounts"] = list;
            Label_Status.Text = " Accountant Added ! ";
        }

        protected void Button_Delete_Click(object sender, EventArgs e)
        {

        }

        protected void Button_LogOut_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("LoginPage.aspx");
        }
    }
}