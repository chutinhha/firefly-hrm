using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Admin.AssignDayOff.DayOff
{
    public partial class DayOffUserControl : UserControl
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
                    if (Session["TaskName"] == null)
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                DataTable myData = _com.getData(Message.TableProject, " * " , " WHERE ProjectName like '%Leave%'");
                                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlDayOff, " WHERE " + Message.ProjectIDColumn + " = " + myData.Rows[0][0].ToString(), false, "");
                                Session.Remove("TaskName");
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                    else
                    {
                        DataTable myData = _com.getData(Message.TableProject, " * " ," WHERE ProjectName like '%Leave%'");
                        _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlDayOff, " WHERE " + Message.ProjectIDColumn + " = " + myData.Rows[0][0].ToString(), true, "");
                        ddlDayOff.SelectedValue = Session["TaskName"].ToString();
                        try
                        {
                            DataTable myDatatmp = _com.getData(Message.TableTask, " * " , " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName like '%" + ddlDayOff.SelectedValue.ToString() + "%' and ProjectName like '%Leave%'");
                            string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn;
                            string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.PersonProject ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.PersonProject.TaskId = " + myDatatmp.Rows[0][0].ToString() + " and HumanResources.PersonProject.CurrentFlag = 1";
                            string table = "(((" + Message.TableJobTitle;
                            _com.bindData(column, condition, table, grdData);
                            _com.setGridViewStyle(grdData);
                            grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                            grdData.HeaderRow.Cells[2].Text = "Employee Name";
                            grdData.HeaderRow.Cells[3].Text = "Birthdate";
                            grdData.HeaderRow.Cells[4].Text = "Job Title";
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                else
                {
                    Session.Remove("TaskName");
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
            ddlDayOff.AutoPostBack = true;
        }

        protected void ddlDayOff_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable myData = _com.getData(Message.TableTask, " * " ," INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName like '%" + ddlDayOff.SelectedValue.ToString() + "%' and ProjectName like '%Leave%'");
                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.PersonProject ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.PersonProject.TaskId = " + myData.Rows[0][0].ToString() + " and HumanResources.PersonProject.CurrentFlag = 1";
                string table = "(((" + Message.TableJobTitle;
                _com.bindData(column, condition, table, grdData);
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                grdData.HeaderRow.Cells[2].Text = "Employee Name";
                grdData.HeaderRow.Cells[3].Text = "Birthdate";
                grdData.HeaderRow.Cells[4].Text = "Job Title";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["TaskName"] = Server.HtmlDecode(ddlDayOff.SelectedValue.ToString());
            _com.closeConnection();
            Response.Redirect(Message.AssignLeavePage, true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myData = _com.getData(Message.TableTask, " * " ," INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName like '%" + ddlDayOff.SelectedValue.ToString() + "%' and ProjectName like '%Leave%'");
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        _com.updateTable(Message.TablePersonProject, Message.CurrentFlagColumn + " = 0 WHERE " + Message.BusinessEntityIDColumn + " = " + gr.Cells[1].ToString().Trim() + " and TaskId = " + myData.Rows[0][0].ToString());
                    }
                }
                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.PersonProject ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.PersonProject.TaskId = " + myData.Rows[0][0] + " and HumanResources.PersonProject.CurrentFlag = 1";
                string table = "(((" + Message.TableJobTitle;
                _com.bindData(column, condition, table, grdData);
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                grdData.HeaderRow.Cells[2].Text = "Employee Name";
                grdData.HeaderRow.Cells[3].Text = "Birthdate";
                grdData.HeaderRow.Cells[4].Text = "Job Title";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
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

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
