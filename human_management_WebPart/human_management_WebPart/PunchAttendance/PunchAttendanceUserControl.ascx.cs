using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Collections.ObjectModel;

namespace SP2010VisualWebPart.PunchAttendance
{
    public partial class PunchAttendanceUserControl : UserControl
    {
        public Common com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin" && Session["Name"]!=null)
            {
                try
                {
                    if (!IsPostBack)
                    {
                        TextBox1.Text = Session["Name"].ToString();
                        Label3.Visible = true;
                        TextBox2.Enabled = true;
                        Button1.Enabled = true;
                        Label1.Text = "Punch In";
                        Button2.Text = "In";
                    }
                }
                catch (Exception ex) {
                    Label8.Text = ex.Message;
                }
            }
            else {
                Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    Response.Redirect("Home.aspx", true);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox2.Text = Calendar1.SelectedDate.Month.ToString() + "-" + Calendar1.SelectedDate.Day + "-" + Calendar1.SelectedDate.Year;
            Calendar1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Trim() == "")
            {
                Label8.Text = "You must enter date";
            }
            else {
                if (TextBox3.Text.Trim() == "")
                {
                    Label8.Text = "You must enter time (hh:mm)";
                }
                else {
                    try
                    {
                        try
                        {
                            DateTime dt = DateTime.Parse(TextBox2.Text.Trim() + " " + TextBox3.Text.Trim());
                            if (Session["In"] == null)
                            {
                                DataTable data = com.getData("HumanResources.Attendance", " where EmployeeName=N'"
                                    + Session["Name"].ToString() + "' and CAST(DAY(PunchIn) as varchar(50))+'-'"
                                    + "+CAST(MONTH(PunchIn) as varchar(50))+'-'+CAST(YEAR(PunchIn) as varchar(50)) = '"
                                    + dt.Day + "-" + dt.Month + "-" + dt.Year + "' and PunchOut >'" + TextBox2.Text.Trim() + " "
                                    + TextBox3.Text.Trim() + "' order by PunchOut desc");
                                if (data.Rows.Count > 0)
                                {
                                    Label8.Text = "Your last punch out is " + data.Rows[0][3].ToString()
                                        + ", you must enter a time after this time";
                                }
                                else
                                {
                                    Session["In"] = TextBox2.Text.Trim() + " " + TextBox3.Text.Trim();
                                    Session["NoteIn"] = TextBox4.Text.Trim();
                                    Label1.Text = "Punch Out";
                                    Button2.Text = "Out";
                                    TextBox3.Text = "";
                                    TextBox4.Text = "";
                                    Calendar1.Visible = false;
                                    TextBox2.Enabled = false;
                                    Button1.Enabled = false;
                                    Label8.Text = "Your last punch in is " + Session["In"].ToString();
                                }
                            }
                            else {
                                DateTime dt1 = DateTime.Parse(Session["In"].ToString());
                                if (dt1.Hour > dt.Hour) {
                                    Label8.Text = "Your last punch in is " + Session["In"].ToString() 
                                        + ", you must enter a time afer punch in time";
                                }
                                else if (dt1.Hour == dt.Hour)
                                {
                                    if (dt1.Minute >= dt.Minute)
                                    {
                                        Label8.Text = "Your last punch in is " + Session["In"].ToString()
                                        + ", you must enter a time afer punch in time";
                                    }
                                    else {
                                        com.insertIntoTable("HumanResources.Attendance","N'"+Session["Name"].ToString()
                                            +"','"+Session["In"].ToString()+"',N'" + Session["NoteIn"].ToString()
                                            + "','" + TextBox2.Text.Trim() + " " + TextBox3.Text.Trim()+"'"
                                            +",N'"+TextBox4.Text.Trim()+"'");
                                        com.closeConnection();
                                        Session.Remove("In");
                                        Session.Remove("NoteIn");
                                        Session["EmployeeName"] = Session["Name"].ToString();
                                        Session.Remove("Name");
                                        Response.Redirect("AttendanceRecord.aspx",true);
                                    }
                                }
                                else {
                                    com.insertIntoTable("HumanResources.Attendance", "N'" + Session["Name"].ToString()
                                            + "','" + Session["In"].ToString() + "',N'" + Session["NoteIn"].ToString()
                                            + "','" + TextBox2.Text.Trim() + " " + TextBox3.Text.Trim() + "'"
                                            + ",N'" + TextBox4.Text.Trim() + "'");
                                    com.closeConnection();
                                    Session.Remove("In");
                                    Session.Remove("NoteIn");
                                    Session["EmployeeName"] = Session["Name"].ToString();
                                    Session.Remove("Name");
                                    Response.Redirect("AttendanceRecord.aspx",false);
                                }
                            }
                        }
                        catch (FormatException) {
                            Label8.Text = "Invalid date time. Try again";
                        }
                    }
                    catch (Exception ex) {
                        Label8.Text = ex.Message;
                    }
                }
            }
        }
    }
}
