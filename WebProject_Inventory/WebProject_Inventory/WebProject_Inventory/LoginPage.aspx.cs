using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject_Inventory
{
    public class Accounts
    {
        public string UserName { get; set; }
        public string Password { get; set; }

        public List<Accounts> AccountData = new List<Accounts>();

        //constuctor to add attributes
        public Accounts(string username, string password)
        {
            this.UserName = username;
           
            this.Password = password;
        }
        //Student list function to generate list
        public List<Accounts> AccountListGen()
        {
            Accounts Admin = new Accounts("admin", "admin");
            AccountData.Add(Admin);
            return AccountData;
        }
    }
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["page"] == null)
                {
                    Accounts admin = new Accounts("","");

                    Session["accounts"] = admin.AccountListGen();

                    Session["page"] = "start";

                   

                }
            }
        }

        protected void Button_Login_Click(object sender, EventArgs e)
        {
            List<Accounts> AccountsData = (List<Accounts>)Session["accounts"];

            for (int i = 0; i < AccountsData.Count; i++)
            {

                if (UserName.Text == AccountsData[i].UserName && Password.Text == AccountsData[i].Password)
                {
                    Session["user"] = AccountsData[i].UserName;
                    Response.Redirect("primaryPage.aspx");
                    break;
                }
                else
                {
                    if (Session["user"] == null)
                    {

                        Label_ErrorMessage.Text = "No record found for this ID";

                    }
                    else
                    {
                        Label_ErrorMessage.Text = "Enter the correct password or username";
                    }

                }


            }

            

        }
    }

}