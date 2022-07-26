using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StateManagement_Task3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //condiiton to greet the user
            if (Session["username"] == null && Session["password"] == null)
            {
                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                Label1.Text = "Greetings Mr. " + Session["username"].ToString() + "!";
            }

        }

        protected void Button_LogOut_Click(object sender, EventArgs e)
        {
            //redirecting to login page on pressing logout
            Session.Clear();
            Response.Redirect("WebForm1.aspx");
        }

    }
}