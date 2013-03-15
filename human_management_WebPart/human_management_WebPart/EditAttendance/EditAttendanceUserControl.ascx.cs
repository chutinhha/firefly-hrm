using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditAttendance
{
    public partial class EditAttendanceUserControl : UserControl
    {
        public Common com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin")
            {
                if (Session["Name"] != null)
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            TextBox7.Text = Session["Name"].ToString();
                            DataTable dt = com.getData("HumanResources.Attendance", " where EmployeeName=N'" + Session["Name"] 
                                + "' and PunchIn='" + Session["In"] + "'");
                            if (dt.Rows.Count > 0)
                            {
                                DateTime PunchIn = DateTime.Parse(dt.Rows[0][1].ToString().Trim());
                                DateTime PunchOut = DateTime.Parse(dt.Rows[0][3].ToString().Trim());
                                TextBox1.Text = PunchIn.Month + "-" + PunchIn.Day + "-" + PunchIn.Year;
                                TextBox2.Text = PunchIn.Hour+":"+PunchIn.Minute;
                                TextBox3.Text = dt.Rows[0][2].ToString().Trim();
                                TextBox4.Text = PunchOut.Hour+":"+PunchOut.Minute;
                                TextBox6.Text = dt.Rows[0][4].ToString().Trim();
                            }
                            Label5.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        Label5.Text = ex.Message;
                    }
                }
                else {
                    Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
            }
            else
            {
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Session["EmployeeName"]=Session["Name"];
            Session.Remove("Name");
            Session.Remove("In");
            Session.Remove("Out");
            Response.Redirect("AttendanceRecord.aspx",true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == ""
                || TextBox4.Text.Trim() == "")
            {
                Label5.Text = "You must enter punch in and punch out time";
            }
            else {
                try
                {
                    DateTime punchIn = DateTime.Parse(TextBox1.Text.Trim() + " " + TextBox2.Text.Trim());
                    DateTime punchOut = DateTime.Parse(TextBox1.Text.Trim() + " " + TextBox4.Text.Trim());
                    if (DateTime.Compare(punchIn, punchOut) >= 0)
                    {
                        Label5.Text = "Punch Out time must be later than Punch In time";
                    }
                    else { 
                        DataTable dt = com.getData("HumanResources.Attendance"," where EmployeeName=N'"
                            +Session["Name"].ToString()+"' and PunchIn <='"+TextBox1.Text.Trim() + " " 
                            + TextBox2.Text.Trim()+"' and PunchOut >='"+TextBox1.Text.Trim() + " " 
                            + TextBox2.Text.Trim()+"' and PunchIn <> '"+Session["In"].ToString()
                            + "' and PunchOut <> '"+Session["Out"].ToString()+"'");
                        DataTable dt1 = com.getData("HumanResources.Attendance", " where EmployeeName=N'"
                            + Session["Name"].ToString() + "' and PunchIn <='" + TextBox1.Text.Trim() + " "
                            + TextBox4.Text.Trim() + "' and PunchOut >='" + TextBox1.Text.Trim() + " "
                            + TextBox4.Text.Trim() + "' and PunchIn <> '" + Session["In"].ToString()
                            + "' and PunchOut <> '" + Session["Out"].ToString() + "'");
                        DataTable dt2 = com.getData("HumanResources.Attendance", " where EmployeeName=N'"
                            + Session["Name"].ToString() + "' and PunchIn >='" + TextBox1.Text.Trim() + " "
                            + TextBox2.Text.Trim() + "' and PunchOut <='" + TextBox1.Text.Trim() + " "
                            + TextBox4.Text.Trim() + "' and PunchIn <> '" + Session["In"].ToString()
                            + "' and PunchOut <> '" + Session["Out"].ToString() + "'");
                        if (dt.Rows.Count != 0)
                        {
                            Label5.Text = "You have Punch In in " + dt.Rows[0][1].ToString()
                                +" and Punch Out in " + dt.Rows[0][3].ToString()
                                +",you can not Punch In in " + TextBox1.Text.Trim() + " " 
                                + TextBox2.Text.Trim();
                        }
                        else {
                            if (dt1.Rows.Count != 0)
                            {
                                Label5.Text = "You have Punch In in " + dt1.Rows[0][1].ToString()
                                + " and Punch Out in " + dt1.Rows[0][3].ToString()
                                + ",you can not Punch Out in " + TextBox1.Text.Trim() + " "
                                + TextBox4.Text.Trim();
                            }
                            else {
                                if (dt2.Rows.Count != 0)
                                {
                                    Label5.Text = "You have Punch In in " + dt2.Rows[0][1].ToString()
                                        + " and Punch Out in " + dt2.Rows[0][3].ToString()
                                        + ",you can not Punch In in " + TextBox1.Text.Trim() + " "
                                        + TextBox2.Text.Trim() + " and Punch Out in " + TextBox1.Text.Trim() + " "
                                        + TextBox4.Text.Trim();
                                }
                                else {
                                    try
                                    {
                                        com.updateTable("HumanResources.Attendance", " PunchIn='" + TextBox1.Text.Trim() + " "
                                            + TextBox2.Text.Trim() + "',PunchInNote=N'" + TextBox3.Text.Trim() + "',"
                                            + "PunchOut='" + TextBox1.Text.Trim() + " " + TextBox4.Text.Trim() + "',"
                                            + "PunchOutNote=N'" + TextBox6.Text.Trim() + "' where EmployeeName=N'"
                                            +Session["Name"].ToString()+"' and PunchIn='"+Session["In"].ToString()
                                            +"' and PunchOut='"+Session["Out"]+"'");
                                        com.closeConnection();
                                        Session["EmployeeName"] = Session["Name"];
                                        Session.Remove("Name");
                                        Session.Remove("In");
                                        Session.Remove("Out");
                                        Response.Redirect("AttendanceRecord.aspx", true);
                                    }
                                    catch (Exception ex) {
                                        Label5.Text = ex.Message;
                                    }
                                }
                            }
                        }
                    }
                }
                catch (FormatException) {
                    Label5.Text = "Invalid Punch In or Punch Out date";
                }
            }
        }
    }
}
