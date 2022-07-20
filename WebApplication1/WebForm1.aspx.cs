using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string TextBox_Number_X = Request.QueryString["TextBox_Number_X"].ToString();
            string TextBox_Number_Y = Request.QueryString["TextBox_Number_Y"].ToString();
            string DropDownList1 = Request.QueryString["DropDownList1"].ToString();
            string Result = Request.QueryString["Result"].ToString();

            NumberX.Text = TextBox_Number_X;
            NumberY.Text = TextBox_Number_Y;
            Operation.Text = DropDownList1;
            Equalsto.Text = "=";
            Resultt.Text = Result;



 
        }
    }
}