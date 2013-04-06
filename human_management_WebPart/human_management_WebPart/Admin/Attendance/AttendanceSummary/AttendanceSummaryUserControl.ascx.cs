using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Attendance.AttendanceSummary
{
    public partial class AttendanceSummaryUserControl : UserControl
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
                    try
                    {
                        if (!IsPostBack)
                        {
                            this.fromDate = "";
                            this.toDate = "";
                            txtEmployeeName.Text = "All";
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "",true, "All");
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
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
        }
        protected string fromDate { get; set; }
        protected string toDate { get; set; }
        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmployeeName.Text.Trim() == "")
                {
                    lblError.Text = Message.EmployeeNameError;
                }
                else {
                    string condition = "";
                    if (txtEmployeeName.Text.Trim() == "All") { }
                    else {
                        condition = " where p."+Message.NameColumn+" like '%"+txtEmployeeName.Text.Trim()+"%'";
                    }
                    if (ddlJobTitle.SelectedValue == "All") { }
                    else {
                        if (condition == "")
                        {
                            condition = " where j." + Message.JobTitleColumn + " = N'" + ddlJobTitle.SelectedValue + "'";
                        }
                        else
                        {
                            condition = condition + " and j." + Message.JobTitleColumn + " = N'" + ddlJobTitle.SelectedValue + "'";
                        }
                    }
                    try
                    {
                        DateTime dt;
                        DateTime dt1;
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                        {
                            dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                            if (condition == "")
                            {
                                condition = " where a." + Message.PunchInColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'";
                            }
                            else
                            {
                                condition = condition + " and a." + Message.PunchInColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'";
                            }
                            this.fromDate = Request.Form["txtDateFrom"].ToString().Trim();
                        }
                        if (Request.Form["txtDateTo"].ToString().Trim() != "")
                        {
                            dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                            dt1 = dt1.AddDays(1.0);
                            if (condition == "")
                            {
                                condition = " where a." + Message.PunchOutColumn + "<='" + dt1.Month + "-" + dt1.Day
                                    + "-" + dt1.Year + "'";
                            }
                            else
                            {
                                condition = condition + " and a." + Message.PunchOutColumn + "<='" + dt1.Month + "-" + dt1.Day
                                    + "-" + dt1.Year + "'";
                            }
                            this.toDate = Request.Form["txtDateTo"].ToString().Trim();
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = Message.InvalidDate;
                    }
                    condition = condition + " order by p." + Message.NameColumn;
                    _com.bindDataAttendanceSummary("p." + Message.NameColumn + ",a." + Message.PunchInColumn
                        + ",a." + Message.PunchOutColumn+",p."+Message.BusinessEntityIDColumn+",p."+Message.EmailAddressColumn, condition, Message.TableAttendance + " a join "
                        + Message.TablePerson + " p on a." + Message.BusinessEntityIDColumn + " = p."
                        + Message.BusinessEntityIDColumn + " join " + Message.TableEmployee + " e on a."
                        + Message.BusinessEntityIDColumn + " = e." + Message.BusinessEntityIDColumn + " join "
                        + Message.TableJobTitle + " j on j." + Message.JobIDColumn + "=e." + Message.JobIDColumn, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        lblError.Text = "";
                        pnlData.Visible = true;
                        lblDate.Text = "&nbsp;Search Employee: " + txtEmployeeName.Text.Trim();
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "") {
                            lblDate.Text = lblDate.Text + "<br />&nbsp;From " + Request.Form["txtDateFrom"].ToString().Trim();
                        }
                        if (Request.Form["txtDateTo"].ToString().Trim() != "") {
                            lblDate.Text = lblDate.Text + "<br />&nbsp;To " + Request.Form["txtDateTo"].ToString().Trim();
                        }
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
                        pnlData.Visible = false;
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }
    }
}
