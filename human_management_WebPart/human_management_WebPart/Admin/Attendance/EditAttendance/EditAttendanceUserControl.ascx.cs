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
                            txtEmployeeName.Text = Session["Name"].ToString();
                            DataTable dt = com.getData("HumanResources.Attendance", " where EmployeeName=N'" + Session["Name"] 
                                + "' and PunchIn='" + Session["In"] + "'");
                            if (dt.Rows.Count > 0)
                            {
                                DateTime PunchIn = DateTime.Parse(dt.Rows[0][1].ToString().Trim());
                                DateTime PunchOut = DateTime.Parse(dt.Rows[0][3].ToString().Trim());
                                txtPunchInDate.Text = PunchIn.Month + "-" + PunchIn.Day + "-" + PunchIn.Year;
                                txtPunchInHour.Text = PunchIn.Hour+":"+PunchIn.Minute;
                                txtPunchInNote.Text = dt.Rows[0][2].ToString().Trim();
                                txtPunchOut.Text = PunchOut.Hour+":"+PunchOut.Minute;
                                txtPunchOutNote.Text = dt.Rows[0][4].ToString().Trim();
                            }
                            lblError.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Session["EmployeeName"]=Session["Name"];
            Session.Remove("Name");
            Session.Remove("In");
            Session.Remove("Out");
            Response.Redirect("AttendanceRecord.aspx",true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtPunchInDate.Text.Trim() == "" || txtPunchInHour.Text.Trim() == ""
                || txtPunchOut.Text.Trim() == "")
            {
                lblError.Text = "You must enter punch in and punch out time";
            }
            else {
                try
                {
                    DateTime punchIn = DateTime.Parse(txtPunchInDate.Text.Trim() + " " + txtPunchInHour.Text.Trim());
                    DateTime punchOut = DateTime.Parse(txtPunchInDate.Text.Trim() + " " + txtPunchOut.Text.Trim());
                    if (DateTime.Compare(punchIn, punchOut) >= 0)
                    {
                        lblError.Text = "Punch Out time must be later than Punch In time";
                    }
                    else { 
                        DataTable dt = com.getData("HumanResources.Attendance"," where EmployeeName=N'"
                            +Session["Name"].ToString()+"' and PunchIn <='"+txtPunchInDate.Text.Trim() + " " 
                            + txtPunchInHour.Text.Trim()+"' and PunchOut >='"+txtPunchInDate.Text.Trim() + " " 
                            + txtPunchInHour.Text.Trim()+"' and PunchIn <> '"+Session["In"].ToString()
                            + "' and PunchOut <> '"+Session["Out"].ToString()+"'");
                        DataTable dt1 = com.getData("HumanResources.Attendance", " where EmployeeName=N'"
                            + Session["Name"].ToString() + "' and PunchIn <='" + txtPunchInDate.Text.Trim() + " "
                            + txtPunchOut.Text.Trim() + "' and PunchOut >='" + txtPunchInDate.Text.Trim() + " "
                            + txtPunchOut.Text.Trim() + "' and PunchIn <> '" + Session["In"].ToString()
                            + "' and PunchOut <> '" + Session["Out"].ToString() + "'");
                        DataTable dt2 = com.getData("HumanResources.Attendance", " where EmployeeName=N'"
                            + Session["Name"].ToString() + "' and PunchIn >='" + txtPunchInDate.Text.Trim() + " "
                            + txtPunchInHour.Text.Trim() + "' and PunchOut <='" + txtPunchInDate.Text.Trim() + " "
                            + txtPunchOut.Text.Trim() + "' and PunchIn <> '" + Session["In"].ToString()
                            + "' and PunchOut <> '" + Session["Out"].ToString() + "'");
                        if (dt.Rows.Count != 0)
                        {
                            lblError.Text = "You have Punch In in " + dt.Rows[0][1].ToString()
                                +" and Punch Out in " + dt.Rows[0][3].ToString()
                                +",you can not Punch In in " + txtPunchInDate.Text.Trim() + " " 
                                + txtPunchInHour.Text.Trim();
                        }
                        else {
                            if (dt1.Rows.Count != 0)
                            {
                                lblError.Text = "You have Punch In in " + dt1.Rows[0][1].ToString()
                                + " and Punch Out in " + dt1.Rows[0][3].ToString()
                                + ",you can not Punch Out in " + txtPunchInDate.Text.Trim() + " "
                                + txtPunchOut.Text.Trim();
                            }
                            else {
                                if (dt2.Rows.Count != 0)
                                {
                                    lblError.Text = "You have Punch In in " + dt2.Rows[0][1].ToString()
                                        + " and Punch Out in " + dt2.Rows[0][3].ToString()
                                        + ",you can not Punch In in " + txtPunchInDate.Text.Trim() + " "
                                        + txtPunchInHour.Text.Trim() + " and Punch Out in " + txtPunchInDate.Text.Trim() + " "
                                        + txtPunchOut.Text.Trim();
                                }
                                else {
                                    try
                                    {
                                        com.updateTable("HumanResources.Attendance", " PunchIn='" + txtPunchInDate.Text.Trim() + " "
                                            + txtPunchInHour.Text.Trim() + "',PunchInNote=N'" + txtPunchInNote.Text.Trim() + "',"
                                            + "PunchOut='" + txtPunchInDate.Text.Trim() + " " + txtPunchOut.Text.Trim() + "',"
                                            + "PunchOutNote=N'" + txtPunchOutNote.Text.Trim() + "' where EmployeeName=N'"
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
                                        lblError.Text = ex.Message;
                                    }
                                }
                            }
                        }
                    }
                }
                catch (FormatException) {
                    lblError.Text = "Invalid Punch In or Punch Out date";
                }
            }
        }
    }
}
