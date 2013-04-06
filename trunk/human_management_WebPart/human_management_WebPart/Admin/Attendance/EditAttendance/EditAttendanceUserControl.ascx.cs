using System;
using System.Data;
using System.Web.UI;

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
                                    + "=N'" + Session["Name"] + "' and p."+Message.EmailAddressColumn+"=N'"+Session["Email"].ToString()
                                    +"' and " + Message.PunchInColumn + "='"
                                    + Session["In"] + "'");
                                for (int i = 0; i < 25; i++)
                                {
                                    if (i < 10)
                                    {
                                        ddlHourIn.Items.Add("0" + i);
                                        ddlHourOut.Items.Add("0" + i);
                                    }
                                    else
                                    {
                                        ddlHourIn.Items.Add(i.ToString());
                                        ddlHourOut.Items.Add(i.ToString());
                                    }
                                }
                                for (int i = 0; i < 61; i++)
                                {
                                    if (i < 10)
                                    {
                                        ddlMinutesIn.Items.Add("0" + i);
                                        ddlMinutesOut.Items.Add("0" + i);
                                    }
                                    else
                                    {
                                        ddlMinutesIn.Items.Add(i.ToString());
                                        ddlMinutesOut.Items.Add(i.ToString());
                                    }
                                }
                                if (dt.Rows.Count > 0)
                                {
                                    DateTime PunchIn = DateTime.Parse(dt.Rows[0][1].ToString().Trim());
                                    DateTime PunchOut = DateTime.Parse(dt.Rows[0][3].ToString().Trim());
                                    txtPunchInDate.Text = PunchIn.Month + "-" + PunchIn.Day + "-" + PunchIn.Year;
                                    if (PunchIn.Hour >= 10)
                                    {
                                        ddlHourIn.SelectedValue = PunchIn.Hour.ToString();
                                    }
                                    else {
                                        ddlHourIn.SelectedValue = "0"+PunchIn.Hour.ToString();
                                    }
                                    if (PunchIn.Minute >= 10)
                                    {
                                        ddlMinutesIn.SelectedValue = PunchIn.Minute.ToString();
                                    }else{
                                        ddlMinutesIn.SelectedValue = "0" + PunchIn.Minute.ToString();
                                    }
                                    txtPunchInNote.Text = dt.Rows[0][2].ToString().Trim();
                                    if (PunchOut.Hour >= 10)
                                    {
                                        ddlHourOut.SelectedValue = PunchOut.Hour.ToString();
                                    }
                                    else {
                                        ddlHourOut.SelectedValue = "0" + PunchOut.Hour.ToString();
                                    }
                                    if (PunchOut.Minute >= 10)
                                    {
                                        ddlMinutesOut.SelectedValue = PunchOut.Minute.ToString();
                                    }
                                    else {
                                        ddlMinutesOut.SelectedValue = "0" + PunchOut.Minute.ToString();
                                    }
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
            Session.Remove("Email");
            Session.Remove("In");
            Session.Remove("Out");
            Response.Redirect(Message.AttendancePage,true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtPunchInDate.Text.Trim() == "" || ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue == ""
                || ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue == "")
            {
                lblError.Text = Message.PunchAttendanceError;
            }
            else {
                try
                {
                    DateTime punchIn = DateTime.Parse(txtPunchInDate.Text.Trim() + " " + ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue);
                    DateTime punchOut = DateTime.Parse(txtPunchInDate.Text.Trim() + " " + ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue);
                    if (DateTime.Compare(punchIn, punchOut) >= 0)
                    {
                        lblError.Text = Message.PunchOutAfterPunchIn;
                    }
                    else {
                        //Case 1: Punch In Time is between an other Punch In and Punch Out Time
                        DataTable dt = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                            +Session["Name"].ToString()+"' and p."+Message.EmailAddressColumn+"=N'"+Session["Email"].ToString()
                            +"' and "+Message.PunchInColumn+" <='"
                            +txtPunchInDate.Text.Trim() + " " + ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue+"' and "+Message.PunchOutColumn
                            +" >='"+txtPunchInDate.Text.Trim() + " " + ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue+"' and "+Message.PunchInColumn
                            +" <> '"+Session["In"].ToString() + "' and "+Message.PunchOutColumn+" <> '"
                            +Session["Out"].ToString()+"'");
                        //Case 1: Punch Out Time is between an other Punch In and Punch Out Time
                        DataTable dt1 = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                            + Session["Name"].ToString() + "' and p." + Message.EmailAddressColumn + "=N'" + Session["Email"].ToString()
                            + "' and " + Message.PunchInColumn + " <='" 
                            + txtPunchInDate.Text.Trim() + " "+ ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue + "' and "+Message.PunchOutColumn
                            +" >='" + txtPunchInDate.Text.Trim() + " "+ ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue 
                            + "' and "+Message.PunchInColumn+" <> '" + Session["In"].ToString()
                            + "' and "+Message.PunchOutColumn+" <> '" + Session["Out"].ToString() + "'");
                        /*Case 1: Punch In Time is earlier than an other Punch In Time but Punch Out Time
                         is later than that other Punch Out Time*/
                        DataTable dt2 = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                            + Session["Name"].ToString() + "' and p." + Message.EmailAddressColumn + "=N'" + Session["Email"].ToString()
                            + "' and " + Message.PunchInColumn + " >='" 
                            + txtPunchInDate.Text.Trim() + " "+ ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue + "' and "
                            +Message.PunchOutColumn+" <='" + txtPunchInDate.Text.Trim() + " "
                            + ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue + "' and "+Message.PunchInColumn+" <> '" + Session["In"].ToString()
                            + "' and "+Message.PunchOutColumn+" <> '" + Session["Out"].ToString() + "'");
                        //Case 1
                        if (dt.Rows.Count != 0)
                        {
                            lblError.Text = Message.PunchIn + dt.Rows[0][1].ToString()
                                + Message.PunchOut + dt.Rows[0][3].ToString()
                                + Message.PunchInError + txtPunchInDate.Text.Trim() + " " 
                                + ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue;
                        }
                        else {
                            //Case 2
                            if (dt1.Rows.Count != 0)
                            {
                                lblError.Text = Message.PunchIn + dt1.Rows[0][1].ToString()
                                + Message.PunchOut + dt1.Rows[0][3].ToString()
                                + Message.PunchOutError + txtPunchInDate.Text.Trim() + " "
                                + ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue;
                            }
                            else {
                                //Case 3
                                if (dt2.Rows.Count != 0)
                                {
                                    lblError.Text = Message.PunchIn + dt2.Rows[0][1].ToString()
                                        + Message.PunchOut + dt2.Rows[0][3].ToString()
                                        + Message.PunchInError + txtPunchInDate.Text.Trim() + " "
                                        + ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue + Message.PunchOutError + txtPunchInDate.Text.Trim() + " "
                                        + ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue;
                                }
                                else {
                                    try
                                    {
                                        DataTable getID = _com.getData(Message.TablePerson + " p join " + Message.TableEmployee + " e on p."
                                            + Message.BusinessEntityIDColumn + "=e." + Message.BusinessEntityIDColumn, "p." + Message.BusinessEntityIDColumn
                                            , " where p." + Message.NameColumn + "='" + Session["Name"].ToString() + "' and p." + Message.EmailAddressColumn 
                                            + "=N'" + Session["Email"].ToString()+ "'");
                                        _com.updateTable(Message.TableAttendance, " "+Message.PunchInColumn+"='" 
                                            + txtPunchInDate.Text.Trim() + " "+ ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue + "',"
                                            +Message.PunchInNoteColumn+"=N'" + txtPunchInNote.Text.Trim() + "',"
                                            + Message.PunchOutColumn+"='" + txtPunchInDate.Text.Trim() + " " 
                                            + ddlHourOut.SelectedValue+":"+ddlMinutesOut.SelectedValue + "',"
                                            + Message.PunchOutNoteColumn+"=N'" + txtPunchOutNote.Text.Trim()
                                            + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.BusinessEntityIDColumn + "=N'" + getID.Rows[0][0].ToString()
                                            +"' and "+Message.PunchInColumn+"='"+Session["In"].ToString()
                                            +"' and "+Message.PunchOutColumn+"='"+Session["Out"]+"'");
                                        _com.closeConnection();
                                        Session[Message.EmployeeName] = Session["Name"];
                                        Session.Remove("Name");
                                        Session.Remove("Email");
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
