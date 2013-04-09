using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.User.Timesheet.EditTimesheet
{
    public partial class EditTimesheetUserControl : UserControl
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
                        lblError.Text = "";
                        txtTime.Text = "";
                        try
                        {
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, "", false, "");
                            DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where ProjectName = " + ddlProject.SelectedValue.ToString());
                            _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " where ProjectId = " + myData.Rows[0][0].ToString(), false, "");
                            if (Session["TimesheetId"] != null)
                            {
                                lblTitle.Text = "Add Timesheet";
                            }
                            else
                            {
                                lblTitle.Text = "Edit Timesheet";
                                myData = _com.getData(" ( " + Message.TableTimesheet + " INNER JOIN HumanResources.Task ON HumanResources.Timesheet.TaskId = HumanResources.Task.TaskId ) INNER JOIN HumanResources.Project ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId", Message.ProjectNameColumn + "," + Message.TaskNameColumn + ",HumanResources.Timesheet.WorkDate,HumanResources.Timesheet.Time", " where HumanResources.Timesheet.TimesheetId = " + Session["TimesheetId"].ToString());
                                txtTime.Text = myData.Rows[0][3].ToString();
                                ddlProject.SelectedValue = myData.Rows[0][0].ToString();
                                ddlTask.SelectedValue = myData.Rows[0][1].ToString();
                                this.startDate = myData.Rows[0][2].ToString();
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                    else
                    {
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
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where ProjectName = " + ddlProject.SelectedValue.ToString());
            _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " where ProjectId = " + myData.Rows[0][0].ToString(), false, "");
        }

        protected void ddlTask_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtTime_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            DataTable myData = _com.getData(Message.TableProject + " INNER JOIN " + Message.TableTask + " ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId ", " HumanResources.Project.ProjectId,HumanResources.Task.TaskId ", " where HumanResources.Project.ProjectName = " + ddlProject.SelectedValue.ToString() + " and HumanResources.Task.TaskName = " + ddlTask.SelectedValue.ToString());
            try
            {
                if (Session["TimesheetId"] != null)
                {
                    _com.updateTable(Message.TableTimesheet, " TaskId = " + myData.Rows[0][1].ToString() + ", WorkDate = CAST('" + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE), Time = " + txtTime.ToString().Trim() + ",ModifiedDate = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATE) " + " where HumanResources.Timesheet.TimesheetId = " + Session["TimesheetId"].ToString());
                }
                else
                {
                    _com.insertIntoTable(Message.TableTimesheet, "", txtTime.ToString().Trim() + "," + Session["AccountID"] + "," + myData.Rows[0][1].ToString() + "," + "CAST('" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATE)" + ",null,0,CAST('" + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE),null",false);
                }
                Response.Redirect(Message.MyTimesheetPage);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
