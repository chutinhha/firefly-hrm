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
                        txtEmployeeName.Text = Session["Name"].ToString();
                        lblDate.Visible = true;
                        txtDate.Enabled = true;
                        btnDate.Enabled = true;
                        Label1.Text = "Punch In";
                        btnInOut.Text = "In";
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
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

        protected void btnDate_Click(object sender, EventArgs e)
        {
            cldChooseDate.Visible = true;
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = cldChooseDate.SelectedDate.Month.ToString() + "-" + cldChooseDate.SelectedDate.Day + "-" + cldChooseDate.SelectedDate.Year;
            cldChooseDate.Visible = false;
        }

        protected void btnInOut_Click(object sender, EventArgs e)
        {
            if (txtDate.Text.Trim() == "")
            {
                lblError.Text = "You must enter date";
            }
            else {
                if (txtTime.Text.Trim() == "")
                {
                    lblError.Text = "You must enter time (hh:mm)";
                }
                else {
                    try
                    {
                        try
                        {
                            DateTime dt = DateTime.Parse(txtDate.Text.Trim() + " " + txtTime.Text.Trim());
                            if (Session["In"] == null)
                            {
                                DataTable data = com.getData("HumanResources.Attendance", " where EmployeeName=N'"
                                    + Session["Name"].ToString() + "' and CAST(DAY(PunchIn) as varchar(50))+'-'"
                                    + "+CAST(MONTH(PunchIn) as varchar(50))+'-'+CAST(YEAR(PunchIn) as varchar(50)) = '"
                                    + dt.Day + "-" + dt.Month + "-" + dt.Year + "' and PunchOut >'" + txtDate.Text.Trim() + " "
                                    + txtTime.Text.Trim() + "' order by PunchOut desc");
                                if (data.Rows.Count > 0)
                                {
                                    lblError.Text = "Your last punch out is " + data.Rows[0][3].ToString()
                                        + ", you must enter a time after this time";
                                }
                                else
                                {
                                    Session["In"] = txtDate.Text.Trim() + " " + txtTime.Text.Trim();
                                    Session["NoteIn"] = txtNote.Text.Trim();
                                    Label1.Text = "Punch Out";
                                    btnInOut.Text = "Out";
                                    txtTime.Text = "";
                                    txtNote.Text = "";
                                    cldChooseDate.Visible = false;
                                    txtDate.Enabled = false;
                                    btnDate.Enabled = false;
                                    lblError.Text = "Your last punch in is " + Session["In"].ToString();
                                }
                            }
                            else {
                                DateTime dt1 = DateTime.Parse(Session["In"].ToString());
                                if (dt1.Hour > dt.Hour) {
                                    lblError.Text = "Your last punch in is " + Session["In"].ToString() 
                                        + ", you must enter a time afer punch in time";
                                }
                                else if (dt1.Hour == dt.Hour)
                                {
                                    if (dt1.Minute >= dt.Minute)
                                    {
                                        lblError.Text = "Your last punch in is " + Session["In"].ToString()
                                        + ", you must enter a time afer punch in time";
                                    }
                                    else {
                                        com.insertIntoTable("HumanResources.Attendance","N'"+Session["Name"].ToString()
                                            +"','"+Session["In"].ToString()+"',N'" + Session["NoteIn"].ToString()
                                            + "','" + txtDate.Text.Trim() + " " + txtTime.Text.Trim()+"'"
                                            +",N'"+txtNote.Text.Trim()+"'");
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
                                            + "','" + txtDate.Text.Trim() + " " + txtTime.Text.Trim() + "'"
                                            + ",N'" + txtNote.Text.Trim() + "'");
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
                            lblError.Text = "Invalid date time. Try again";
                        }
                    }
                    catch (Exception ex) {
                        lblError.Text = ex.Message;
                    }
                }
            }
        }
    }
}
