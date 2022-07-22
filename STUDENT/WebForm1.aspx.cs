using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace STUDENT
{
    public class Student
    {

        public int IdNumber { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }

        public Student(string name, int id, int age)
        {
            this.IdNumber = id;
            this.Name = name;
            this.Age = age;
        }
    }
    public class StudentList
    {
        public static List<Student> StudentData = new List<Student>();
       
        public static void StudentListGen()
        {
            Student student1 = new Student("ali", 1, 21);
            StudentData.Add(student1);
            Student student2 = new Student("ahamd", 2, 22);
            StudentData.Add(student2);
            Student student3 = new Student("hassan", 3, 23);
            StudentData.Add(student3);
            Student student4 = new Student("hamza", 4, 24);
            StudentData.Add(student4);
            Student student5 = new Student("akif", 5, 25);
            StudentData.Add(student5);
            Student student6 = new Student("noman", 6, 26);
            StudentData.Add(student6);
            Student student7 = new Student("usama", 7, 27);
            StudentData.Add(student7);
            Student student8 = new Student("shazil", 8, 28);
            StudentData.Add(student8);
            Student student9 = new Student("usaid", 9, 29);
            StudentData.Add(student9);
            Student student10 = new Student("saad", 10, 30);
            StudentData.Add(student10);
            Student student11 = new Student("hamas", 11, 21);
            StudentData.Add(student11);
            Student student12 = new Student("qauum", 12, 22);
            StudentData.Add(student12);
            Student student13 = new Student("eric", 13, 23);
            StudentData.Add(student13);
            Student student14 = new Student("junaid", 14, 24);
            StudentData.Add(student14);
            Student student15 = new Student("arslan", 15, 25);
            StudentData.Add(student15);
            Student student16 = new Student("iqbal", 16, 26);
            StudentData.Add(student16);
            Student student17 = new Student("atif", 17, 27);
            StudentData.Add(student17);
            Student student18 = new Student("umair", 18, 28);
            StudentData.Add(student18);
            Student student19 = new Student("awais", 19, 29);
            StudentData.Add(student19);
            Student student20 = new Student("moiz", 20, 30);
            StudentData.Add(student20);

        }
    }
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentList.StudentListGen();
            DropDownList1.DataSource = StudentList.StudentData;
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "IdNumber";
            DropDownList1.DataBind();
        }
        [WebMethod]
        public static Student GetStudentInfo(string rollNo)
        {
            foreach (var student in StudentList.StudentData)
            {
                if (student.IdNumber == Convert.ToInt32(rollNo))
                {
                    return student;
                }
            }
            return new Student("arslan", 15, 25);
        }
    }
   
}