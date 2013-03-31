using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Collections.Generic;

namespace SP2010VisualWebPart.Admin.AssignDayOff.AssignLeave
{
    public partial class AssignLeaveUserControl : UserControl
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
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                txtDayOff.Text = Session["TaskName"].ToString();
                                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn;
                                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId";
                                string table = "(" + Message.TableJobTitle;
                                _com.bindData(column, condition, table, grdData);
                                _com.setGridViewStyle(grdData);
                                grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                                grdData.HeaderRow.Cells[2].Text = "Employee Name";
                                grdData.HeaderRow.Cells[3].Text = "Birthdate";
                                grdData.HeaderRow.Cells[4].Text = "Job Title";
                            }
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
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.Form["txtDateFrom"].ToString().Trim() == "" && Request.Form["txtDateTo"].ToString().Trim() == "")
                {
                    string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn;
                    string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId";
                    string table = "(" + Message.TableJobTitle;
                    _com.bindData(column, condition, table, grdData);
                    _com.setGridViewStyle(grdData);
                    grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                    grdData.HeaderRow.Cells[2].Text = "Employee Name";
                    grdData.HeaderRow.Cells[3].Text = "Birthdate";
                    grdData.HeaderRow.Cells[4].Text = "Job Title";
                }
                else
                {
                    DataTable myData = _com.getData("((((" + Message.TableTask,
                    "HumanResources.Employee.BusinessEntityId," + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn + "," + Message.StartDateColumn + "," + Message.EndDateColumn,
                    " INNER JOIN HumanResources.PersonProject ON HumanResources.Task.TaskId = HumanResources.PersonProject.TaskId ) INNER JOIN HumanResources.Employee ON HumanResources.PersonProject.BusinessEntityId = HumanResources.Employee.BusinessEntityId) INNER JOIN HumanResources.Person ON HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId) INNER JOIN HumanResources.JobTitle ON HumanResources.Employee.JobId = HumanResources.JobTitle.JobId) WHERE HumanResources.PersonProject.CurrentFlag = 1");
                    List<DataRow> rowsToDelete = new List<DataRow>();
                    foreach (DataRow myRow in myData.Select())
                    {
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "" && Request.Form["txtDateTo"].ToString().Trim() != "")
                        {
                            if (((DateTime)myRow[4] < Convert.ToDateTime(Request.Form["txtDateFrom"].ToString().Trim()) && (DateTime)myRow[5] > Convert.ToDateTime(Request.Form["txtDateFrom"].ToString().Trim()))
                                || ((DateTime)myRow[4] >= Convert.ToDateTime(Request.Form["txtDateFrom"].ToString().Trim()) && (DateTime)myRow[5] <= Convert.ToDateTime(Request.Form["txtDateTo"].ToString().Trim()))
                                || ((DateTime)myRow[4] < Convert.ToDateTime(Request.Form["txtDateTo"].ToString().Trim()) && (DateTime)myRow[5] > Convert.ToDateTime(Request.Form["txtDateTo"].ToString().Trim())))
                            {
                                foreach (DataRow myRowtmp in myData.Select())
                                {
                                    if ((int)myRowtmp[0] == (int)myRow[0])
                                    {
                                        rowsToDelete.Add(myRowtmp);
                                    }
                                }
                            }
                        }
                        else if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                        {
                            if ((DateTime)myRow[4] < Convert.ToDateTime(Request.Form["txtDateFrom"].ToString().Trim()) && (DateTime)myRow[5] > Convert.ToDateTime(Request.Form["txtDateFrom"].ToString().Trim()))
                            {
                                foreach (DataRow myRowtmp in myData.Select())
                                {
                                    if ((int)myRowtmp[0] == (int)myRow[0])
                                    {
                                        rowsToDelete.Add(myRowtmp);
                                    }
                                }
                            }
                        }
                        else if (Request.Form["txtDateTo"].ToString().Trim() != "")
                        {
                            if ((DateTime)myRow[4] < Convert.ToDateTime(Request.Form["txtDateTo"].ToString().Trim()) && (DateTime)myRow[5] > Convert.ToDateTime(Request.Form["txtDateTo"].ToString().Trim()))
                            {
                                foreach (DataRow myRowtmp in myData.Select())
                                {
                                    if ((int)myRowtmp[0] == (int)myRow[0])
                                    {
                                        rowsToDelete.Add(myRowtmp);
                                    }
                                }
                            }
                        }
                    }
                    foreach (DataRow myRow in rowsToDelete)
                    {
                        myRow.Delete();
                    }
                    myData.AcceptChanges();
                    DataTable dt = myData.DefaultView.ToTable("dt", true, Message.BusinessEntityIDColumn, Message.PersonNameColumn, Message.BirthDateColumn, Message.JobTitleColumn);
                    grdData.DataSource = dt;
                    grdData.DataBind();
                    _com.setGridViewStyle(grdData);
                    grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                    grdData.HeaderRow.Cells[2].Text = "Employee Name";
                    grdData.HeaderRow.Cells[3].Text = "Birthdate";
                    grdData.HeaderRow.Cells[4].Text = "Job Title";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                _com.bindData("HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn
                  , "INNER JOIN " + Message.TableEmployee + "ON  HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId", "(" + Message.TableJobTitle, grdData);
                Session.Remove("Name");
                Session.Remove("Email");
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

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myData = _com.getData(Message.TaskIdColumn, Message.TableProject, " INNER JOIN HumanResources.Task ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId WHERE ProjectName like '%Leave%' and TaskName like '%" + txtDayOff.Text.ToString() + "%'");
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        _com.insertIntoTable(Message.TablePersonProject, "", gr.Cells[1].Text + "," + myData.Rows[0][0].ToString() + ",NULL,1", false);
                    }
                }
                Response.Redirect(Message.DayOffPage);
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
