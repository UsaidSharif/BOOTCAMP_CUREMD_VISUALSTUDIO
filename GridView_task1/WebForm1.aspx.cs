using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView_task1
{
    public class Student
    {
        public string Name { get; set; }
        public int RollNumber { get; set; }
        public string Address { get; set; }
        //constuctor to add attributes
        public Student(string name, int rollnumber, string address)
        {
            this.Name = name;
            this.RollNumber = rollnumber;
            this.Address = address;
        }
        //Student list function to generate list
        public List<Student> StudentListGen()
        {
            List<Student> StudentData = new List<Student>();
            //for loop to generate data
            for (int i = 1; i <= 10; i++)
            {
                Student studenti = new Student("Student" + i, i, "Address" + i);
                StudentData.Add(studenti);
            }


            return StudentData;
        }

    }
    public partial class WebForm1 : System.Web.UI.Page
    {

        //onpageload send data to gridview
        protected void Page_Load(object sender, EventArgs e)

        {
            Student StudentGrid_Data = new Student("name",1,"address");//making object to access function
            StudentGrid_Data.StudentListGen();
            GridView1.DataSource = StudentGrid_Data.StudentListGen(); 
            GridView1.DataBind();
        }
    }
}