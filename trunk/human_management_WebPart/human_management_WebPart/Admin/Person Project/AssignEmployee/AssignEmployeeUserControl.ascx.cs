﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Person_Project.AssignEmployee
{
    public partial class AssignEmployeeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmAssign = Message.ConfirmAssign;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    if (Session["ProjectName"] == null || Session["TaskName"] == null)
                    {
                        Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                txtProject.Text = Session["ProjectName"].ToString();
                                txtTask.Text = Session["TaskName"].ToString();
                                txtEmployee.Text = "";
                                lblError.Text = "";
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
                    Session.Remove("ProjectName");
                    Session.Remove("TaskName");
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //string Location = "EditCandidate.aspx/?Name=" + Server.HtmlDecode(e.Row.Cells[2].Text)
                //+ "&Email=" + Server.HtmlDecode(e.Row.Cells[3].Text);
                e.Row.Style["cursor"] = "pointer";
                e.Row.Attributes.Add("onMouseOver", "this.style.cursor = 'hand';this.style.backgroundColor = '#CCCCCC';");
                if (e.Row.RowIndex % 2 != 0)
                {
                    e.Row.Attributes.Add("style", "background-color:white;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = 'white';");
                }
                else
                {
                    e.Row.Attributes.Add("style", "background-color:#EAEAEA;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = '#EAEAEA';");
                }
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId WHERE HumanResources.Employee.CurrentFlag = 1";
                string table = "(" + Message.TableJobTitle;
                if (txtEmployee.Text != "")
                {
                    condition = condition + " and " + Message.PersonNameColumn + " LIKE  '%" + txtEmployee.Text.ToString().Trim() + "%'";
                }
                _com.bindData(column, condition, table, grdData);
                if (grdData.Rows.Count == 0) lblError.Text = "There is no consistent data!";
                else
                {
                    _com.setGridViewStyle(grdData);
                    grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                    grdData.HeaderRow.Cells[2].Text = "Employee Name";
                    grdData.HeaderRow.Cells[3].Text = "Email";
                    grdData.HeaderRow.Cells[4].Text = "Job Title";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        protected string confirmAssign { get; set; }
        protected void btnAssign_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            bool checkRedirect = false;
            try
            {
                bool isCheck = false;
                DataTable myData = _com.getData(Message.TableProject, Message.TaskIdColumn, " INNER JOIN HumanResources.Task ON HumanResources.Project.ProjectId = HumanResources.Task.ProjectId WHERE ProjectName like '%" + txtProject.Text.ToString() + "%' and TaskName like '%" + txtTask.Text.ToString() + "%'");
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        DataTable myDatatmp = _com.getData(Message.TablePersonProject, Message.CurrentFlagColumn, " where HumanResources.PersonProject.BusinessEntityId = " + gr.Cells[1].Text + " and HumanResources.PersonProject.TaskId = " + myData.Rows[0][0].ToString());
                        if (myDatatmp.Rows.Count > 0)
                        {
                            if (myDatatmp.Rows[0][0].ToString() == "1")
                            {
                                lblError.Text = lblError.Text+gr.Cells[2].Text+" has been assigned in this project !<br><span style=\"padding-left:5px;\"></span>";
                            }
                            else if (myDatatmp.Rows[0][0].ToString() == "0")
                            {
                                _com.updateTable(Message.TablePersonProject, " CurrentFlag = 1, ModifiedDate = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME) where HumanResources.PersonProject.BusinessEntityId = " + gr.Cells[1].Text + " and HumanResources.PersonProject.TaskId = " + myData.Rows[0][0].ToString());
                                checkRedirect = true;
                            }
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TablePersonProject, "", gr.Cells[1].Text + "," + myData.Rows[0][0].ToString() + ",NULL,1,CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME),NULL,NULL ", false);
                            checkRedirect = true;
                        }
                    }
                }
                if (isCheck == true)
                {
                    if (checkRedirect == true)
                    {
                        Response.Redirect(Message.PersonProjectPage);
                    }
                }
                else {
                    lblError.Text = Message.NotChooseItemDelete;
                }
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