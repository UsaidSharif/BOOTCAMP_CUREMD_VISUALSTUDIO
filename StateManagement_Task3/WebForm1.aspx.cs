using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StateManagement_Task3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            message.Text = "Welcome To CureMD BootCamp!";
            //this is a condition to redirect the user if he is already logged in
            if (Session["username"] != null && Session["password"] != null && Session["username"].ToString() == "polar" && Session["password"].ToString() == "vezli")
            {
                Response.Redirect("WebForm2.aspx");
            }

        }

        protected void Button_LogIn_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Session["username"] = TextBox_UserName.Text.Trim();
                Session["password"] = TextBox_Password.Text.Trim();
                //condition to check if password and user name matches with polar and vezli
                if (Session["username"].ToString() == "polar")
                {
                    if (Session["password"].ToString() == "vezli")
                    {
                        Response.Redirect("WebForm2.aspx");
                    }
                    else
                    {
                        message.Text = "Plese Enter Correct Password!";
                        TextBox_Password.Text = String.Empty;
                    }
                }
                else
                {
                    message.Text = "Plese Enter Correct UserName!";
                    TextBox_UserName.Text = String.Empty;
                }
            }
            

        }
    }
}