using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Calculate_Click(object sender, EventArgs e)
        {
            Double x = Convert.ToDouble(TextBox_Number_X.Text);
            Double y = Convert.ToDouble(TextBox_Number_Y.Text);
            Double result=0;
            string selectedValue =  DropDownList1.SelectedValue;

            if(selectedValue == "Addition")
            {

                result = x + y;
                // Result.Text = result.ToString();
                
            }
            else if(selectedValue == "Subtraction")
            {
                result = x - y;
                //Result.Text = result.ToString();
                
            }
            else if (selectedValue == "Division")
            {
                result = x / y;
                // Result.Text = result.ToString();
                ;
            }
            else if (selectedValue == "Multiplication")
            {
                result = x * y;
               // Result.Text = result.ToString();
               
            }

           

            Response.Redirect("WebForm1.aspx?TextBox_Number_X=" + TextBox_Number_X.Text + "&TextBox_Number_Y=" + TextBox_Number_Y.Text + "&DropDownList1=" + selectedValue + "&Result=" + result);
        }

    }
}