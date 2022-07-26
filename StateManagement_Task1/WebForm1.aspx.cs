using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StateManagement_Task1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //if page is opened 1st time then following if statement will execute
            if (!IsPostBack)
            {
                ViewState["count"] = 0;

                TextBox1.Text = ViewState["count"].ToString();
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //increasing the count of ViewState number by 1
            int defaultt = (int)ViewState["count"] + 1;
            TextBox1.Text = defaultt.ToString();
            //storing the increased value in viewstate
            ViewState["count"] = defaultt;

        }
    }
}