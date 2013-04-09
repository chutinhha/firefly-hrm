using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.User.Timesheet.MyTimesheet
{
    public partial class MyTimesheetUserControl : UserControl
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
                    if (!IsPostBack)
                    {
                        Session.Remove("TimesheetId");
                        lblError.Text = "";
                    }
                    else
                    {
                        lblError.Text = "";
                        try
                        {
                            string column = "HumanResource.Timesheet.TimesheetId,TimesheetHumanResources.Timesheet.WorkDate," + Message.ProjectNameColumn + "," + Message.TaskNameColumn + ",HumanResources.Timesheet.Time";
                            string table = " ( " + Message.TableTimesheet + " INNER JOIN HumanResources.Task ON HumanResources.Timesheet.TaskId = HumanResources.Task.TaskId ) INNER JOIN HumanResources.Project ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId";
                            string condition = " where HumanResources.Timesheet.WorkDate >= CAST('" + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE) and HumanResources.Timesheet.WorkDate <= CAST('" + Request.Form["txtDateTo"].ToString().Trim() + "' AS DATE) and HumanResources.Timesheet.BusinessEntityId = " + Session["AccountID"].ToString();
                            _com.bindData(column, condition, table, grdData);
                            _com.setGridViewStyle(grdData);
                            grdData.HeaderRow.Cells[1].Text = "TimesheetId";
                            grdData.HeaderRow.Cells[2].Text = "WorkDate";
                            grdData.HeaderRow.Cells[3].Text = "ProjectName";
                            grdData.HeaderRow.Cells[4].Text = "TaskName";
                            grdData.HeaderRow.Cells[5].Text = "Time";
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
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
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                string column = "HumanResource.Timesheet.TimesheetId,TimesheetHumanResources.Timesheet.WorkDate," + Message.ProjectNameColumn + "," + Message.TaskNameColumn + ",HumanResources.Timesheet.Time";
                string table = " ( " + Message.TableTimesheet + " INNER JOIN HumanResources.Task ON HumanResources.Timesheet.TaskId = HumanResources.Task.TaskId ) INNER JOIN HumanResources.Project ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId";
                string condition = " where HumanResources.Timesheet.WorkDate >= CAST('" + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE) and HumanResources.Timesheet.WorkDate <= CAST('" + Request.Form["txtDateTo"].ToString().Trim() + "' AS DATE) and HumanResources.Timesheet.BusinessEntityId = " + Session["AccountID"].ToString();
                _com.bindData(column, condition, table, grdData);
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "TimesheetId";
                grdData.HeaderRow.Cells[2].Text = "WorkDate";
                grdData.HeaderRow.Cells[3].Text = "ProjectName";
                grdData.HeaderRow.Cells[4].Text = "TaskName";
                grdData.HeaderRow.Cells[5].Text = "Time";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session.Remove("TimesheetId");
            _com.closeConnection();
            Response.Redirect(Message.EditTimesheetPage);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["TimesheetId"] = Server.HtmlDecode(gr.Cells[1].Text.ToString());
                    _com.closeConnection();
                    Response.Redirect(Message.EditTimesheetPage);
                    break;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        _com.deleteTable(Message.TableTimesheet, " where TimesheetId = " + gr.Cells[1].Text.ToString());
                    }
                }
                string column = "HumanResource.Timesheet.TimesheetId,TimesheetHumanResources.Timesheet.WorkDate," + Message.ProjectNameColumn + "," + Message.TaskNameColumn + ",HumanResources.Timesheet.Time";
                string table = " ( " + Message.TableTimesheet + " INNER JOIN HumanResources.Task ON HumanResources.Timesheet.TaskId = HumanResources.Task.TaskId ) INNER JOIN HumanResources.Project ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId";
                string condition = " where HumanResources.Timesheet.WorkDate >= CAST('" + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE) and HumanResources.Timesheet.WorkDate <= CAST('" + Request.Form["txtDateTo"].ToString().Trim() + "' AS DATE) and HumanResources.Timesheet.BusinessEntityId = " + Session["AccountID"].ToString();
                _com.bindData(column, condition, table, grdData);
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "TimesheetId";
                grdData.HeaderRow.Cells[2].Text = "WorkDate";
                grdData.HeaderRow.Cells[3].Text = "ProjectName";
                grdData.HeaderRow.Cells[4].Text = "TaskName";
                grdData.HeaderRow.Cells[5].Text = "Time";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdData.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdData.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                if (cbSelectedHeader.Checked == true)
                {
                    cbSelected.Checked = true;
                }
                else
                {
                    cbSelected.Checked = false;
                }
            }
        }
    }
}
