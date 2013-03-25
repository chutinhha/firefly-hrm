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
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
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
                                DataTable dt = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn
                                    + "=N'" + Session["Name"] + "' and " + Message.PunchInColumn + "='"
                                    + Session["In"] + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    DateTime PunchIn = DateTime.Parse(dt.Rows[0][1].ToString().Trim());
                                    DateTime PunchOut = DateTime.Parse(dt.Rows[0][3].ToString().Trim());
                                    txtPunchInDate.Text = PunchIn.Month + "-" + PunchIn.Day + "-" + PunchIn.Year;
                                    txtPunchInHour.Text = PunchIn.Hour + ":" + PunchIn.Minute;
                                    txtPunchInNote.Text = dt.Rows[0][2].ToString().Trim();
                                    txtPunchOut.Text = PunchOut.Hour + ":" + PunchOut.Minute;
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
                    else
                    {
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Session[Message.EmployeeName]=Session["Name"];
            Session.Remove("Name");
            Session.Remove("In");
            Session.Remove("Out");
            Response.Redirect(Message.AttendancePage,true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtPunchInDate.Text.Trim() == "" || txtPunchInHour.Text.Trim() == ""
                || txtPunchOut.Text.Trim() == "")
            {
                lblError.Text = Message.PunchAttendanceError;
            }
            else {
                try
                {
                    DateTime punchIn = DateTime.Parse(txtPunchInDate.Text.Trim() + " " + txtPunchInHour.Text.Trim());
                    DateTime punchOut = DateTime.Parse(txtPunchInDate.Text.Trim() + " " + txtPunchOut.Text.Trim());
                    if (DateTime.Compare(punchIn, punchOut) >= 0)
                    {
                        lblError.Text = Message.PunchOutAfterPunchIn;
                    }
                    else {
                        //Case 1: Punch In Time is between an other Punch In and Punch Out Time
                        DataTable dt = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                            +Session["Name"].ToString()+"' and "+Message.PunchInColumn+" <='"
                            +txtPunchInDate.Text.Trim() + " " + txtPunchInHour.Text.Trim()+"' and "+Message.PunchOutColumn
                            +" >='"+txtPunchInDate.Text.Trim() + " " + txtPunchInHour.Text.Trim()+"' and "+Message.PunchInColumn
                            +" <> '"+Session["In"].ToString() + "' and "+Message.PunchOutColumn+" <> '"
                            +Session["Out"].ToString()+"'");
                        //Case 1: Punch Out Time is between an other Punch In and Punch Out Time
                        DataTable dt1 = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                            + Session["Name"].ToString() + "' and "+Message.PunchInColumn+" <='" 
                            + txtPunchInDate.Text.Trim() + " "+ txtPunchOut.Text.Trim() + "' and "+Message.PunchOutColumn
                            +" >='" + txtPunchInDate.Text.Trim() + " "+ txtPunchOut.Text.Trim() 
                            + "' and "+Message.PunchInColumn+" <> '" + Session["In"].ToString()
                            + "' and "+Message.PunchOutColumn+" <> '" + Session["Out"].ToString() + "'");
                        /*Case 1: Punch In Time is earlier than an other Punch In Time but Punch Out Time
                         is later than that other Punch Out Time*/
                        DataTable dt2 = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                            + Session["Name"].ToString() + "' and "+Message.PunchInColumn+" >='" 
                            + txtPunchInDate.Text.Trim() + " "+ txtPunchInHour.Text.Trim() + "' and "
                            +Message.PunchOutColumn+" <='" + txtPunchInDate.Text.Trim() + " "
                            + txtPunchOut.Text.Trim() + "' and "+Message.PunchInColumn+" <> '" + Session["In"].ToString()
                            + "' and "+Message.PunchOutColumn+" <> '" + Session["Out"].ToString() + "'");
                        //Case 1
                        if (dt.Rows.Count != 0)
                        {
                            lblError.Text = Message.PunchIn + dt.Rows[0][1].ToString()
                                + Message.PunchOut + dt.Rows[0][3].ToString()
                                + Message.PunchInError + txtPunchInDate.Text.Trim() + " " 
                                + txtPunchInHour.Text.Trim();
                        }
                        else {
                            //Case 2
                            if (dt1.Rows.Count != 0)
                            {
                                lblError.Text = Message.PunchIn + dt1.Rows[0][1].ToString()
                                + Message.PunchOut + dt1.Rows[0][3].ToString()
                                + Message.PunchOutError + txtPunchInDate.Text.Trim() + " "
                                + txtPunchOut.Text.Trim();
                            }
                            else {
                                //Case 3
                                if (dt2.Rows.Count != 0)
                                {
                                    lblError.Text = Message.PunchIn + dt2.Rows[0][1].ToString()
                                        + Message.PunchOut + dt2.Rows[0][3].ToString()
                                        + Message.PunchInError + txtPunchInDate.Text.Trim() + " "
                                        + txtPunchInHour.Text.Trim() + Message.PunchOutError + txtPunchInDate.Text.Trim() + " "
                                        + txtPunchOut.Text.Trim();
                                }
                                else {
                                    try
                                    {
                                        DataTable getID = _com.getData(Message.TablePerson + " p join " + Message.TableEmployee + " e on p."
                                            + Message.BusinessEntityIDColumn + "=e." + Message.BusinessEntityIDColumn, "p." + Message.BusinessEntityIDColumn
                                            , " where p." + Message.NameColumn + "='" + Session["Name"].ToString() + "'");
                                        _com.updateTable(Message.TableAttendance, " "+Message.PunchInColumn+"='" 
                                            + txtPunchInDate.Text.Trim() + " "+ txtPunchInHour.Text.Trim() + "',"
                                            +Message.PunchInNoteColumn+"=N'" + txtPunchInNote.Text.Trim() + "',"
                                            + Message.PunchOutColumn+"='" + txtPunchInDate.Text.Trim() + " " 
                                            + txtPunchOut.Text.Trim() + "',"
                                            + Message.PunchOutNoteColumn+"=N'" + txtPunchOutNote.Text.Trim()
                                            + "',LastModified='" + DateTime.Now + "' where " + Message.BusinessEntityIDColumn + "=N'" + getID.Rows[0][0].ToString()
                                            +"' and "+Message.PunchInColumn+"='"+Session["In"].ToString()
                                            +"' and "+Message.PunchOutColumn+"='"+Session["Out"]+"'");
                                        _com.closeConnection();
                                        Session[Message.EmployeeName] = Session["Name"];
                                        Session.Remove("Name");
                                        Session.Remove("In");
                                        Session.Remove("Out");
                                        Response.Redirect(Message.AttendancePage, true);
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
                    lblError.Text = Message.PunchDateError;
                }
            }
        }
    }
}
