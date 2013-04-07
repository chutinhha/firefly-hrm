using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.User.Performance.ReviewAttendance
{
    public partial class ReviewAttendanceUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        private string _condition = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            pnlDateTo.Visible = false;
                            lblDateTo.Visible = false;
                            lblDateFrom.Visible = false;
                            rdoViewDate.AutoPostBack = true;
                            rdoViewRange.AutoPostBack = true;
                            rdoViewAll.AutoPostBack = true;
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);

                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void btnDateFrom_Click(object sender, EventArgs e)
        {
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void btnDateTo_Click(object sender, EventArgs e)
        {
        }

        protected void rdoViewDate_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewDate.Checked == true)
            {
                pnlDateTo.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                pnlDateFrom.Visible = true;
                lblDateDescription.Visible = true;
            }
        }

        protected void rdoViewRange_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewRange.Checked == true)
            {
                pnlDateFrom.Visible = true;
                pnlDateTo.Visible = true;
                lblDateTo.Visible = true;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                lblDateDescription.Visible = true;
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnView_Click(object sender, EventArgs e)
        {
            Boolean check = false;
            try
            {
                if (rdoViewAll.Checked == true)
                {
                    //Case 1: View All Attendance of a Employee
                    lblError.Text = "";
                    _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a."
                        + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn
                        , " where p." + Message.BusinessEntityIDColumn + "='" + Session["AccountID"].ToString()
                        + "'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                            + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                    check = true;
                }
                else if (rdoViewDate.Checked == true)
                {
                    //Case 2: View Attendance of a date of a employee
                    if (Request.Form["txtDateFrom"].ToString().Trim() == "")
                    {
                        lblError.Text = Message.NotChooseDate;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    else
                    {
                        try
                        {
                            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
                            DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                            _condition = " and CAST(DAY(" + Message.PunchInColumn + ") as varchar(50))+'-'+CAST(MONTH("
                            + Message.PunchInColumn + ") as varchar(50))+'-'+CAST(YEAR(" + Message.PunchInColumn
                            + ") as varchar(50)) = '" + dt.Day + "-" + dt.Month + "-" + dt.Year + "'";
                            lblError.Text = "";
                            _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a."
                                + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." + Message.BusinessEntityIDColumn + "='" + Session["AccountID"]
                                + "'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                            + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                            check = true;
                        }
                        catch (FormatException)
                        {
                            lblError.Text = Message.InvalidDate;
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                    }
                }
                else
                {
                    //Case 3: View Attendance in a range of date of a employee
                    if (Request.Form["txtDateFrom"].ToString().Trim() == "" || Request.Form["txtDateTo"].ToString().Trim() == "")
                    {
                        lblError.Text = Message.NotChooseFromToDate;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    else
                    {
                        try
                        {
                            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
                            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
                            DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                            DateTime dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                            dt1 = dt1.AddDays(1.0);
                            if (dt.CompareTo(dt1) < 0)
                            {
                                _condition = " and " + Message.PunchInColumn + " > '" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'" + " and " + Message.PunchInColumn + " < '" + dt1.Month + "-"
                                    + dt1.Day + "-" + dt1.Year + "'";
                                lblError.Text = "";
                                _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a."
                                    + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." + Message.BusinessEntityIDColumn + "='"
                                    + Session["AccountID"] + "'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                            + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                                check = true;
                            }
                        }
                        catch (FormatException)
                        {
                            lblError.Text = Message.InvalidDate;
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
            //Show Data if Gridview have data and bindDataAttendance method success
            if (grdData.Rows.Count > 0 && check == true)
            {
                pnlData.Visible = true;
                grdData.HeaderRow.Cells[1].Text = "In Time";
                grdData.HeaderRow.Cells[2].Text = "Out Time";
                grdData.HeaderRow.Cells[3].Text = "Email";
            }
            else
            {
                lblError.Text = Message.NotExistData;
                pnlData.Visible = false;
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
        }
        protected void rdoViewAll_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewAll.Checked == true)
            {
                pnlDateTo.Visible = false;
                pnlDateFrom.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = false;
                lblDate.Visible = false;
                lblDateDescription.Visible = false;
            }
        }

        protected void txtEmployeeName_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
