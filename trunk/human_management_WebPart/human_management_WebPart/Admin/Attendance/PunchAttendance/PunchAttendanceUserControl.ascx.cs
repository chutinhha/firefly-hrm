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
        private Common _com = new Common();
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
                Response.Write("<script language='JavaScript'> alert('"+Message.AcessDenied+"'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    Response.Redirect(Message.HomePage, true);
                }
            }
        }

        protected void btnDate_Click(object sender, EventArgs e)
        {
            cldChooseDate.Visible = true;
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = cldChooseDate.SelectedDate.Month.ToString() + "-" + cldChooseDate.SelectedDate.Day 
                + "-" + cldChooseDate.SelectedDate.Year;
            cldChooseDate.Visible = false;
        }

        protected void btnInOut_Click(object sender, EventArgs e)
        {
            if (txtDate.Text.Trim() == "")
            {
                lblError.Text = Message.NotChooseDate;
            }
            else {
                if (txtTime.Text.Trim() == "")
                {
                    lblError.Text = Message.NotChooseTime;
                }
                else {
                    try
                    {
                        try
                        {
                            DateTime dt = DateTime.Parse(txtDate.Text.Trim() + " " + txtTime.Text.Trim());
                            if (Session["In"] == null)
                            {
                                //Only accept Punch In after last Punch Out in the same day
                                DataTable data = _com.getData(Message.TableAttendance, " where "+Message.EmployeeName+"=N'"
                                    + Session["Name"].ToString() + "' and CAST(DAY("+Message.PunchInColumn+") as varchar(50))+'-'"
                                    + "+CAST(MONTH("+Message.PunchInColumn+") as varchar(50))+'-'+CAST(YEAR("+Message.PunchInColumn
                                    +") as varchar(50)) = '"+ dt.Day + "-" + dt.Month + "-" + dt.Year + "' and "+Message.PunchOutColumn
                                    +" >'" + txtDate.Text.Trim() + " "+ txtTime.Text.Trim() + "' order by "+Message.PunchOutColumn+" desc");
                                if (data.Rows.Count > 0)
                                {
                                    lblError.Text = Message.LastPunchOut + data.Rows[0][3].ToString()
                                        + Message.PunchOutError;
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
                                    lblError.Text = Message.LastPunchIn + Session["In"].ToString();
                                }
                            }
                            else {
                                DateTime dt1 = DateTime.Parse(Session["In"].ToString());
                                //Punch Out Time must be later than Punch In Time
                                if (dt1.CompareTo(dt)>=0) {
                                    lblError.Text = Message.LastPunchIn + Session["In"].ToString() 
                                        + Message.PunchInAfterTime;
                                }
                                else {
                                    _com.insertIntoTable(Message.TableAttendance,"", "N'" + Session["Name"].ToString()
                                            + "','" + Session["In"].ToString() + "',N'" + Session["NoteIn"].ToString()
                                            + "','" + txtDate.Text.Trim() + " " + txtTime.Text.Trim() + "'"
                                            + ",N'" + txtNote.Text.Trim() + "','"+DateTime.Now+"'",false);
                                    _com.closeConnection();
                                    Session.Remove("In");
                                    Session.Remove("NoteIn");
                                    Session[Message.EmployeeName] = Session["Name"].ToString();
                                    Session.Remove("Name");
                                    Response.Redirect(Message.AttendancePage,false);
                                }
                            }
                        }
                        catch (FormatException) {
                            lblError.Text = Message.InvalidDateTime;
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
