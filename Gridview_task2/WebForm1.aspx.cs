using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gridview_task2
{
    public class Staff
    {
        public string Name { get; set; }
        public int ID { get; set; }
        public string Role { get; set; }
       

        public List<Staff> StudentData = new List<Staff>();

        //constuctor to add attributes
        public Staff(string name, int id, string role)
        {
            this.Name = name;
            this.ID = id;
            this.Role = role;
        }
        //Student list function to generate list
        public List<Staff> StudentListGen()
        {

            //for loop to generate data
            Random rnd = new Random();
            for (int i = 1; i <= 1000; i++)
            {
                int random_number = rnd.Next(1, 100); //generate random number between 1 and 100
                int newNumber = int.Parse(i.ToString() + random_number.ToString());
                Staff studenti = new Staff("Student" + i, newNumber, "Role" + i);
                StudentData.Add(studenti);
            }


            return StudentData;
        }

        public Staff StudentListselect(int id)
        {

            foreach (var Studenti in StudentData)
            {
                if (Studenti.ID == Convert.ToInt32(id))
                {
                    return Studenti;
                }
            }

            return new Staff("arslan", 1, "Rolei");
        }

    }


    public partial class WebForm1 : System.Web.UI.Page
    {
        Staff StudentGrid_Data = new Staff("name", 1, "role");

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                Session["StaffList"]=StudentGrid_Data.StudentListGen();
                GridView1.DataSource = Session["StaffList"];
                GridView1.DataBind();
            }

            


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)  //generating object on detail view
        {
            if (GridView1.SelectedDataKey != null)
            {
                DetailsView1.Visible = true;
                
                List<Staff> listEmployee = new List<Staff>();
                listEmployee.Add(StudentGrid_Data.StudentListselect((int)GridView1.SelectedDataKey.Value));
                DetailsView1.DataSource = listEmployee;
                DetailsView1.DataBind();
            }
            else
            {
                DetailsView1.Visible = false;
            }
        }

        protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            DetailsView1.ChangeMode(e.NewMode);
            DetailsView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = Session["StaffList"];
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = Session["StaffList"];
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = Session["StaffList"];
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            List<Staff> list = (List<Staff>)Session["StaffList"];
            TextBox newName = GridView1.Rows[e.RowIndex].FindControl("TextBox_Name") as TextBox;
            Label newID = GridView1.Rows[e.RowIndex].FindControl("ID") as Label;
            TextBox newRole = GridView1.Rows[e.RowIndex].FindControl("TextBox_Role") as TextBox;
            




            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].ID == Convert.ToInt32(newID.Text))
                {
                    list[i].Name = newName.Text.ToString();
                    list[i].Role = newRole.Text.ToString();
                    break;
                }
            }
            Session["StaffList"] = list;
            GridView1.EditIndex = -1;
            GridView1.DataSource = Session["StaffList"];
            GridView1.DataBind();


        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string query = TextSearch.Text.ToString();
            List<Staff> list = (List<Staff>)Session["StaffList"];
            List<Staff> newlist = new List<Staff>();
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].Name.ToLower().Contains(query.ToLower()) || list[i].Role.ToLower().Contains(query.ToLower()))
                {
                    newlist.Add(list[i]);
                }
            }

            GridView1.DataSource = newlist;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<Staff> list = (List<Staff>)Session["StaffList"];
            List<Staff> newList = new List<Staff>();
            Label dlt = GridView1.Rows[e.RowIndex].FindControl("ID") as Label;

            int ID = Convert.ToInt32(dlt.Text);

            for (int i = 0; i < list.Count; i++)
            {
                if (ID == list[i].ID)
                {

                    list.RemoveAt(i);
                    Session["StaffList"] = list;
                }
            }
           
            GridView1.EditIndex = -1;
            GridView1.DataSource = Session["StaffList"];
            GridView1.DataBind();
        }
    }
}