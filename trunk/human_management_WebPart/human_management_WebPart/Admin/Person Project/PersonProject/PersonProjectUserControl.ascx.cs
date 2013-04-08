using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Admin.Person_Project.PersonProject
{
    public partial class PersonProjectUserControl : UserControl
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
                    if (Session["ProjectName"] == null || Session["TaskName"] == null)
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                lblError.Text = "";
                                _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, " where " + Message.ProjectNameColumn + " != 'Leave'", true, " ");
                                Session.Remove("ProjectName");
                                Session.Remove("TaskName");
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                    else if (Session["ProjectName"] != null && Session["TaskName"] != null)
                    {
                        lblError.Text = "";
                        _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, " where " + Message.ProjectNameColumn + " != 'Leave'", true, " ");
                        ddlProject.SelectedValue = Session["ProjectName"].ToString();
                        DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                        _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " WHERE ProjectId = " + (int)myData.Rows[0][0], true, " ");
                        ddlTask.SelectedValue = Session["TaskName"].ToString();
                        try
                        {
                            DataTable myDatatmp = _com.getData(Message.TableTask, " * ", " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName like '%" + ddlTask.SelectedValue.ToString() + "%' and ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                            string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn;
                            string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.PersonProject ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.PersonProject.TaskId = " + myDatatmp.Rows[0][0].ToString() + " and HumanResources.PersonProject.CurrentFlag = 1 and HumanResources.Employee.CurrentFlag = 1";
                            string table = "(((" + Message.TableJobTitle;
                            _com.bindData(column, condition, table, grdData);
                            _com.setGridViewStyle(grdData);
                            grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                            grdData.HeaderRow.Cells[2].Text = "Employee Name";
                            grdData.HeaderRow.Cells[3].Text = "Email";
                            grdData.HeaderRow.Cells[4].Text = "Job Title";
                            Session.Remove("ProjectName");
                            Session.Remove("TaskName");
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                else
                {
                    Session.Remove("ProjectName");
                    Session.Remove("TaskName");
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
                ddlProject.AutoPostBack = true;
                ddlTask.AutoPostBack = true;
        }

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " WHERE ProjectId = " + (int)myData.Rows[0][0], true, " ");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ddlTask_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                DataTable myData = _com.getData(Message.TableTask, " * ", " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName like '%" + ddlTask.SelectedValue.ToString() + "%' and ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.PersonProject ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.PersonProject.TaskId = " + myData.Rows[0][0].ToString() + " and HumanResources.PersonProject.CurrentFlag = 1 and HumanResources.Employee.CurrentFlag = 1";
                string table = "(((" + Message.TableJobTitle;
                _com.bindData(column, condition, table, grdData);
                if (grdData.Rows.Count == 0) lblError.Text = "There is no consistent data!";
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                grdData.HeaderRow.Cells[2].Text = "Employee Name";
                grdData.HeaderRow.Cells[3].Text = "Email";
                grdData.HeaderRow.Cells[4].Text = "Job Title";
            }
            catch (Exception ex)
            {
                lblError.Text = "There is no consistent data!";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["ProjectName"] = Server.HtmlDecode(ddlProject.SelectedValue.ToString());
            Session["TaskName"] = Server.HtmlDecode(ddlTask.SelectedValue.ToString());
            _com.closeConnection();
            Response.Redirect(Message.SearchEmployeePage, true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myData = _com.getData(Message.TableTask, " * ", " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName like '%" + ddlTask.SelectedValue.ToString() + "%' and ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        _com.updateTable(Message.TablePersonProject, Message.CurrentFlagColumn + " = 0, ModifiedDate = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME) WHERE " + Message.BusinessEntityIDColumn + " = " + gr.Cells[1].Text.ToString().Trim() + " and TaskId = " + myData.Rows[0][0].ToString());
                    }
                }
                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.PersonProject ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.PersonProject.TaskId = " + myData.Rows[0][0] + " and HumanResources.PersonProject.CurrentFlag = 1 and HumanResources.Employee.CurrentFlag = 1";
                string table = "(((" + Message.TableJobTitle;
                _com.bindData(column, condition, table, grdData);
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                grdData.HeaderRow.Cells[2].Text = "Employee Name";
                grdData.HeaderRow.Cells[3].Text = "Email";
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
