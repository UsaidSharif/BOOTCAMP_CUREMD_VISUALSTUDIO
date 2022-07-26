using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StateMangement_Task2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            //storing the value of text fields in viewstate and hidden fields
            ViewState["username"] = TextBox1.Text;
            ViewState["password"] = TextBox2.Text;
            HiddenField_UserName.Value = TextBox1.Text;
            HiddenField_Password.Value = TextBox2.Text;
            TextBox1.Text = TextBox2.Text = string.Empty;

        }

        protected void Button_ViewState_Click(object sender, EventArgs e)
        {
            //Data extracting from viewstate
            TextBox1.Text = ViewState["username"].ToString();
            TextBox2.Text = ViewState["password"].ToString();
        }

        protected void Button_HiddenFields_Click(object sender, EventArgs e)
        {
            //Data extracting from hidden fields
            TextBox1.Text = HiddenField_UserName.Value;
            TextBox2.Text = HiddenField_Password.Value;
        }
    }
}