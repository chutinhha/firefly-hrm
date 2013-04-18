using System;
using System.Data;
using System.Web.UI;using System.Web;

namespace SP2010VisualWebPart.PunchAttendance
{
    public partial class PunchAttendanceUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin" && Session["Name"] != null)
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            this.readOnly = "";
                            this.inputID = "txtDate";
                            txtEmployeeName.Text = Session["Name"].ToString();
                            lblDate.Visible = true;
                            pnlDate.Enabled = true;
                            Label1.Text = "Punch In";
                            btnInOut.Text = "In";
                            for (int i = 0; i < 25; i++)
                            {
                                if (i < 10)
                                {
                                    ddlHourIn.Items.Add("0" + i);
                                }
                                else
                                {
                                    ddlHourIn.Items.Add(i.ToString());
                                }
                            }
                            for (int i = 0; i < 61; i++)
                            {
                                if (i < 10)
                                {
                                    ddlMinutesIn.Items.Add("0" + i);
                                }
                                else
                                {
                                    ddlMinutesIn.Items.Add(i.ToString());
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected string readOnly { get; set; }
        protected string inputValue { get; set; }
        protected string inputID { get; set; }
        protected void btnDate_Click(object sender, EventArgs e)
        {
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void btnInOut_Click(object sender, EventArgs e)
        {
            if (Request.Form["txtDate"].ToString().Trim() == "")
            {
                lblError.Text = Message.NotChooseDate;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else {
                if (ddlHourIn.SelectedValue+":"+ddlMinutesIn.SelectedValue == "")
                {
                    lblError.Text = Message.NotChooseTime;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else {
                    try
                    {
                        try
                        {
                            DateTime dt = DateTime.Parse(Request.Form["txtDate"].ToString().Trim() + " " + ddlHourIn.SelectedValue + ":" + ddlMinutesIn.SelectedValue);
                            if (Session["In"] == null)
                            {
                                //Only accept Punch In after last Punch Out in the same day
                                DataTable data = _com.getData(Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." + Message.PunchInNoteColumn
                            + ",a." + Message.PunchOutColumn + ",a." + Message.PunchOutNoteColumn + ",a." + Message.LastModifiedColumn, " where p." + Message.NameColumn + "=N'"
                                    + Session["Name"].ToString() + "' and "+Message.EmailAddressColumn+"='"+Session["Email"].ToString()
                                    +"' and CAST(DAY("+Message.PunchInColumn+") as varchar(50))+'-'"
                                    + "+CAST(MONTH("+Message.PunchInColumn+") as varchar(50))+'-'+CAST(YEAR("+Message.PunchInColumn
                                    +") as varchar(50)) = '"+ dt.Day + "-" + dt.Month + "-" + dt.Year + "' and "+Message.PunchOutColumn
                                    + " >'" + Request.Form["txtDate"].ToString().Trim() + " " + ddlHourIn.SelectedValue + ":" + ddlMinutesIn.SelectedValue + "' order by " + Message.PunchOutColumn + " desc");
                                if (data.Rows.Count > 0)
                                {
                                    lblError.Text = Message.LastPunchOut + data.Rows[0][3].ToString()
                                        + Message.PunchOutError;
									//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                                }
                                else
                                {
                                    Session["In"] = Request.Form["txtDate"].ToString().Trim() + " " + ddlHourIn.SelectedValue + ":" + ddlMinutesIn.SelectedValue;
                                    Session["NoteIn"] = txtNote.Text.Trim();
                                    Label1.Text = "Punch Out";
                                    btnInOut.Text = "Out";
                                    ddlHourIn.SelectedIndex = 0;
                                    ddlMinutesIn.SelectedIndex = 0;
                                    txtNote.Text = "";
                                    this.readOnly = "readonly";
                                    this.inputValue = Request.Form["txtDate"].ToString().Trim();
                                    this.inputID = "txtDateDisable";
                                    lblError.Text = Message.LastPunchIn + Session["In"].ToString();
									//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                                }
                            }
                            else {
                                DateTime dt1 = DateTime.Parse(Session["In"].ToString());
                                //Punch Out Time must be later than Punch In Time
                                if (dt1.CompareTo(dt)>=0) {
                                    lblError.Text = Message.LastPunchIn + Session["In"].ToString() 
                                        + Message.PunchInAfterTime;
									//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                                    this.inputValue = Request.Form["txtDate"].ToString().Trim();
                                    this.readOnly = "readonly";
                                    this.inputID = "txtDateDisable";
                                }
                                else {
                                    DataTable getID = _com.getData(Message.TablePerson + " p join " + Message.TableEmployee + " e on p."
                                            + Message.BusinessEntityIDColumn + "=e." + Message.BusinessEntityIDColumn, "p." + Message.BusinessEntityIDColumn
                                            , " where p." + Message.NameColumn + "='" + Session["Name"].ToString() + "' and p."+Message.EmailAddressColumn
                                            +"='"+Session["Email"].ToString()+"'");
                                    _com.insertIntoTable(Message.TableAttendance,"", "N'" + getID.Rows[0][0].ToString()
                                            + "','" + Session["In"].ToString() + "',N'" + Session["NoteIn"].ToString()
                                            + "','" + Request.Form["txtDate"].ToString().Trim() + " " + ddlHourIn.SelectedValue + ":" + ddlMinutesIn.SelectedValue + "'"
                                            + ",N'" + txtNote.Text.Trim() + "','"+DateTime.Now+"'",false);
                                    _com.closeConnection();
                                    Session.Remove("In");
                                    Session.Remove("NoteIn");
                                    Session[Message.EmployeeName] = Session["Name"].ToString();
                                    Session.Remove("Name");
                                    Session.Remove("Email");
                                    Response.Redirect(Message.AttendancePage,false);
                                }
                            }
                        }
                        catch (FormatException) {
                            lblError.Text = Message.InvalidDateTime;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                    }
                    catch (Exception ex) {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
            }
        }
    }
}
