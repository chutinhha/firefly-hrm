using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.User.Performance.ReviewTimesheet
{
    public partial class ReviewTimesheetUserControl : UserControl
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
                if (Session["Account"].ToString() == "User")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                            _com.SetItemList(" pro."+Message.ProjectNameColumn, Message.TableProject+" pro"
                                +" join "+Message.TableTask+" tas on pro."+Message.ProjectIDColumn+" = tas."
                                + Message.ProjectIDColumn+" join "+Message.TablePersonProject+" pp on pp."
                                +Message.TaskIdColumn+"=tas."+Message.TaskIdColumn, ddlProjectName, "", true, "All");
                            ddlTaskName.Items.Clear();
                            ddlTaskName.Items.Add("All");
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
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnView_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            lblDetail.Text = "";
            string condition = " where per." + Message.NameColumn + "=N'" + Session["PersonName"].ToString()+"'";
            try
            {
                if (ddlProjectName.SelectedValue == "All")
                {
                }
                else
                {
                    condition = condition + " and pro." + Message.ProjectNameColumn + " = N'" + ddlProjectName.SelectedValue + "'";
                    if (ddlTaskName.SelectedValue == "All") { }
                    else
                    {
                        condition = condition + " and tas." + Message.TaskNameColumn + "=N'" + ddlTaskName.SelectedValue
                            + "'";
                    }
                }
                try
                {
                    DateTime dt;
                    DateTime dt1;
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                    {
                        dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                        condition = condition + " and tim." + Message.TimesheetDateColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                + dt.Year + "'";
                    }
                    if (Request.Form["txtDateTo"].ToString().Trim() != "")
                    {
                        dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                        dt1 = dt1.AddDays(1.0);
                        condition = condition + " and tim." + Message.TimesheetDateColumn + "<'" + dt1.Month + "-" + dt1.Day
                            + "-" + dt1.Year + "'";
                    }
                }
                catch (FormatException)
                {
                    lblError.Text = Message.InvalidDate;
                }
                if (chkApprove.Checked == false) { }
                else
                {
                    condition = " and tim." + Message.CurrentFlagColumn + "='True'";
                }
                condition = condition + " order by per." + Message.NameColumn + ",pro." + Message.ProjectNameColumn
                    + ",tas." + Message.TaskNameColumn;
                _com.bindDataTimesheetSummary("per." + Message.NameColumn + " as 'Employee Name',pro." + Message.ProjectNameColumn
                    + " as 'Project Name',tas." + Message.TaskNameColumn + " as 'Task Name',tim." + Message.TimesheetTimeColumn + " as 'Time(Hours)',CONVERT"
                    + "(varchar(10),tim." + Message.TimesheetDateColumn + ", 20) as Date,per." + Message.BusinessEntityIDColumn, condition, " "
                    + Message.TableProject + " pro join " + Message.TableTask + " tas on pro." + Message.ProjectIDColumn
                    + "=tas." + Message.ProjectIDColumn + " join " + Message.TableTimesheet + " tim on tim."
                    + Message.TaskIdColumn + " = tas." + Message.TaskIdColumn + " join " + Message.TablePerson
                    + " per on tim." + Message.BusinessEntityIDColumn + " = per." + Message.BusinessEntityIDColumn, grdData);
                if (grdData.Rows.Count > 0)
                {
                    lblError.Text = "";
                    pnlData.Visible = true;
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                    {
                        lblDetail.Text = "&nbsp;From " + Request.Form["txtDateFrom"].ToString().Trim();
                    }
                    if (Request.Form["txtDateTo"].ToString().Trim() != "")
                    {
                        if (lblDetail.Text != "")
                        {
                            lblDetail.Text = lblDetail.Text + "<br />&nbsp;To " + Request.Form["txtDateTo"].ToString().Trim();
                        }
                        else {
                            lblDetail.Text = "&nbsp;To " + Request.Form["txtDateTo"].ToString().Trim(); 
                        }
                    }
                    if (lblDetail.Text != "")
                    {
                        pnlDetail.Visible = true;
                    }
                    else {
                        pnlDetail.Visible = false;
                    }
                }
                else
                {
                    lblError.Text = Message.NotExistData;
                    pnlData.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            if (ddlProjectName.SelectedValue == "All")
            {
                ddlTaskName.Items.Clear();
                ddlTaskName.Items.Add("All");
            }
            else
            {
                DataTable ProjectID = _com.getData(Message.TableProject, Message.ProjectIDColumn
                    , " where " + Message.ProjectNameColumn + "=N'" + ddlProjectName.SelectedValue + "';");
                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTaskName, " where " + Message.ProjectIDColumn
                    + "='" + ProjectID.Rows[0][0].ToString() + "'", true, "All");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlProjectName.SelectedValue = "All";
            chkApprove.Checked = false;
            pnlData.Visible = false;
        }
    }
}
