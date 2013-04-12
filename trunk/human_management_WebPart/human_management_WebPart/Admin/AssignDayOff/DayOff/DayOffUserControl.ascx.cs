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
                    try
                    {
                        if (!IsPostBack)
                        {
                            DataTable myData = _com.getData(Message.TableProject, " * " , " WHERE ProjectName = 'Leave'");
                            _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlDayOff, " WHERE " + Message.ProjectIDColumn + " = " + myData.Rows[0][0].ToString(), true, "All");
                            lblError.Text = "";
                            ddlShow.SelectedValue = "All";
                        }
                        string[] col = new string[1];
                        col[0] = "Status";
                        DataTable dt = new DataTable();
                        string column = " pp." + Message.PersonProjectIdColumn + ",per." + Message.NameColumn + ",tas." + Message.TaskNameColumn
                            + ",pp." + Message.StartDateColumn + ",pp." + Message.EndDateColumn + ",pp." + Message.NoteColumn;
                        string condition = " where emp." + Message.CurrentFlagColumn + "='1'";
                        string table = Message.TableEmployee + " emp join " + Message.TablePerson
                            + " per on emp." + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePersonProject + " pp on pp." + Message.BusinessEntityIDColumn
                            + "=emp." + Message.BusinessEntityIDColumn + " join " + Message.TableTask + " tas on tas."
                            + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn;
                        if (ddlDayOff.SelectedValue == "All")
                        {
                            if (ddlShow.SelectedValue == "All")
                            {
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1");
                            }
                            else if (ddlShow.SelectedValue == "Approved")
                            {
                                condition = condition + " and pp." + Message.CurrentFlagColumn + " = 1";
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 1 and emp."
                                    + Message.CurrentFlagColumn + " = 1");
                            }
                            else if (ddlShow.SelectedValue == "Not Approved")
                            {
                                condition = condition + " and pp." + Message.CurrentFlagColumn + " = 0";
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 0 and emp."
                                    + Message.CurrentFlagColumn + " = 1");
                            }
                            else if (ddlShow.SelectedValue == "Reject")
                            {
                                condition = condition + " and pp." + Message.CurrentFlagColumn + " = 2";
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 2 and emp."
                                    + Message.CurrentFlagColumn + " = 1");
                            }
                        }
                        else
                        {
                            DataTable myDatatmp = _com.getData(Message.TableTask, " * ", " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName = '" + ddlDayOff.SelectedValue.ToString() + "' and ProjectName = 'Leave'");
                            if (ddlShow.SelectedValue == "All")
                            {
                                condition = condition + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                                    + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString());
                            }
                            else if (ddlShow.SelectedValue == "Approved")
                            {
                                condition = condition + " and pp." + Message.CurrentFlagColumn + " = 1" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                                    + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 1");
                            }
                            else if (ddlShow.SelectedValue == "Not Approved")
                            {
                                condition = condition + " and pp." + Message.CurrentFlagColumn + " = 0" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                                    + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 0");
                            }
                            else if (ddlShow.SelectedValue == "Reject")
                            {
                                condition = condition + " and pp." + Message.CurrentFlagColumn + " = 2" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                                _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                                dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                                    + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                                    + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                                    + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                                    + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                                    + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 2");
                            }
                        }
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            DropDownList ddlApprove = new DropDownList();
                            ddlApprove.ID = "ddlApprove" + i;
                            ddlApprove.Items.Add("Approve");
                            ddlApprove.Items.Add("Not Approve");
                            ddlApprove.Items.Add("Reject");
                            if (dt.Rows[i][0].ToString() == "1")
                            {
                                ddlApprove.SelectedValue = "Approve";
                            }
                            else if (dt.Rows[i][0].ToString() == "0")
                            {
                                ddlApprove.SelectedValue = "Not Approve";
                            }
                            else if (dt.Rows[i][0].ToString() == "2")
                            {
                                ddlApprove.SelectedValue = "Reject";
                            }
                            grdData.Rows[i].Cells[6].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                            grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
                            grdData.Rows[i].Cells[6].Controls.Add(new LiteralControl("</div>"));
                        }
                        _com.setGridViewStyle(grdData);
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Session.Remove("TaskName");
                    Response.Redirect(Message.UserHomePage);
                }
            }
                    ddlDayOff.AutoPostBack = true;
        }

        protected void ddlDayOff_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable myData = _com.getData(Message.TableTask, "LimitDate", " where TaskName = '" + ddlDayOff.SelectedValue.ToString() + "'");
            if (myData.Rows[0][0].ToString() != "")
            {
                btnAssign.Visible = true;
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Session["TaskName"] = Server.HtmlDecode(ddlDayOff.SelectedValue.ToString());
            _com.closeConnection();
            Response.Redirect(Message.AssignLeavePage, true);
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
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
                    if (i != 1)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    }
                    else {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;padding-left:5px;line-height: 20px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string[] col = new string[1];
                col[0] = "Status";
                DataTable dt = new DataTable();
                string column = " pp."+Message.PersonProjectIdColumn+",per."+Message.NameColumn+",tas."+Message.TaskNameColumn
                    +",pp."+Message.StartDateColumn+",pp."+Message.EndDateColumn+",pp."+Message.NoteColumn;
                string condition = " where emp."+Message.CurrentFlagColumn+"='1'";
                string table = Message.TableEmployee+" emp join "+Message.TablePerson
                    +" per on emp."+Message.BusinessEntityIDColumn+"=per."+Message.BusinessEntityIDColumn
                    +" join "+Message.TablePersonProject+" pp on pp."+Message.BusinessEntityIDColumn
                    +"=emp."+Message.BusinessEntityIDColumn+" join "+Message.TableTask+" tas on tas."
                    +Message.TaskIdColumn+"=pp."+Message.TaskIdColumn;
                if (ddlDayOff.SelectedValue == "All")
                {
                    if (ddlShow.SelectedValue == "All")
                    {
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject+" pp join "+Message.TableEmployee
                            +" emp on pp."+Message.BusinessEntityIDColumn+"=emp."+Message.BusinessEntityIDColumn
                            +" join "+Message.TablePerson+" per on emp."+Message.BusinessEntityIDColumn
                            +"=per."+Message.BusinessEntityIDColumn +" join "+Message.TableTask
                            +" tas on tas."+Message.TaskIdColumn+"=pp."+Message.TaskIdColumn, " pp."
                            +Message.CurrentFlagColumn, " where emp."+Message.CurrentFlagColumn+" = 1");
                    }
                    else if (ddlShow.SelectedValue == "Approved")
                    {
                        condition = condition + " and pp."+Message.CurrentFlagColumn+" = 1";
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where pp."+Message.CurrentFlagColumn+" = 1 and emp."
                            +Message.CurrentFlagColumn+" = 1");
                    }
                    else if (ddlShow.SelectedValue == "Not Approved")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 0";
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 0 and emp."
                            + Message.CurrentFlagColumn + " = 1");
                    }
                    else if (ddlShow.SelectedValue == "Reject")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 2";
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 2 and emp."
                            + Message.CurrentFlagColumn + " = 1");
                    }
                }
                else
                {
                    DataTable myDatatmp = _com.getData(Message.TableTask, " * ", " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName = '" + ddlDayOff.SelectedValue.ToString() + "' and ProjectName = 'Leave'");
                    if (ddlShow.SelectedValue == "All")
                    {
                        condition = condition + " and pp."+Message.TaskIdColumn+" = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp."+Message.CurrentFlagColumn+" = 1 and pp."
                            +Message.TaskIdColumn+" = " + myDatatmp.Rows[0][0].ToString());
                    }
                    else if (ddlShow.SelectedValue == "Approved")
                    {
                        condition = condition + " and pp."+Message.CurrentFlagColumn+" = 1" + " and pp."+Message.TaskIdColumn+" = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp."+Message.CurrentFlagColumn+" = 1 and pp."
                            +Message.TaskIdColumn+" = " + myDatatmp.Rows[0][0].ToString() + " and pp."+Message.CurrentFlagColumn+" = 1");
                    }
                    else if (ddlShow.SelectedValue == "Not Approved")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 0" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                            + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 0");
                    }
                    else if (ddlShow.SelectedValue == "Reject")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 2" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                            + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 2");
                    }
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Approve");
                    ddlApprove.Items.Add("Not Approve");
                    ddlApprove.Items.Add("Reject");
                    if (dt.Rows[i][0].ToString() == "1")
                    {
                        ddlApprove.SelectedValue = "Approve";
                    }
                    else if (dt.Rows[i][0].ToString() == "0")
                    {
                        ddlApprove.SelectedValue = "Not Approve";
                    }
                    else if (dt.Rows[i][0].ToString() == "2")
                    {
                        ddlApprove.SelectedValue = "Reject";
                    }
                    grdData.Rows[i].Cells[6].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                    grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
                    grdData.Rows[i].Cells[6].Controls.Add(new LiteralControl("</div>"));
                }
                _com.setGridViewStyle(grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ddlShow_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            try
            {
                foreach (GridViewRow row in grdData.Rows)
                {
                    DropDownList ddlApprove = (DropDownList)row.FindControl("ddlApprove" + row.RowIndex);
                    if (ddlApprove.SelectedValue == "Approve")
                    {
                        DataTable myData = _com.getData(Message.TablePersonProject+" pp INNER JOIN "+Message.TableEmployee+" emp "
                            +"ON pp."+Message.BusinessEntityIDColumn+" = emp."+Message.BusinessEntityIDColumn
                            ," emp."+Message.BusinessEntityIDColumn+",emp."+Message.VacationHoursColumn+","
                            +"emp."+Message.SickLeaveHoursColumn," where pp."+Message.PersonProjectIdColumn
                            +" = " + row.Cells[0].Text.ToString());
                        if (row.Cells[2].Text == "Vacation")
                        {
                            TimeSpan time = Convert.ToDateTime(row.Cells[4].Text.ToString()) - Convert.ToDateTime(row.Cells[3].Text.ToString());
                            int tmp = Convert.ToInt16(myData.Rows[0][1].ToString()) - time.Days;
                            _com.updateTable(Message.TableEmployee, " " + "HumanResources.Employee.VacationDate = " + tmp + " where " + Message.BusinessEntityIDColumn + " = " + myData.Rows[0][0].ToString());
                        }
                        if (row.Cells[2].Text == "Sick")
                        {
                            TimeSpan time = Convert.ToDateTime(row.Cells[4].Text.ToString()) - Convert.ToDateTime(row.Cells[3].Text.ToString());
                            int tmp = Convert.ToInt16(myData.Rows[0][2].ToString()) - time.Days;
                            _com.updateTable(Message.TableEmployee, " " + "HumanResources.Employee.SickLeaveDate = " + tmp + " where " + Message.BusinessEntityIDColumn + " = " + myData.Rows[0][0].ToString());
                        }
                        _com.updateTable(Message.TablePersonProject, " " + Message.CurrentFlagColumn + " = 1, ModifiedDate = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME) "
                            + "where " + Message.PersonProjectIdColumn + "='" + row.Cells[0].Text + "'");
                    }
                    else if (ddlApprove.SelectedValue == "Not Approve")
                    {
                        _com.updateTable(Message.TablePersonProject, " " + Message.CurrentFlagColumn + " = 0, ModifiedDate = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME) "
                            + "where " + Message.PersonProjectIdColumn + "='" + row.Cells[0].Text + "'");
                    }
                    else
                    {
                        _com.updateTable(Message.TablePersonProject, " " + Message.CurrentFlagColumn + " = 2, ModifiedDate = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME) "
                            + "where " + Message.PersonProjectIdColumn + "='" + row.Cells[0].Text + "'");
                    }
                }
                string[] col = new string[1];
                col[0] = "Status";
                DataTable dt = new DataTable();
                string column = " pp." + Message.PersonProjectIdColumn + ",per." + Message.NameColumn + ",tas." + Message.TaskNameColumn
                    + ",pp." + Message.StartDateColumn + ",pp." + Message.EndDateColumn + ",pp." + Message.NoteColumn;
                string condition = " where emp." + Message.CurrentFlagColumn + "='1'";
                string table = Message.TableEmployee + " emp join " + Message.TablePerson
                    + " per on emp." + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn
                    + " join " + Message.TablePersonProject + " pp on pp." + Message.BusinessEntityIDColumn
                    + "=emp." + Message.BusinessEntityIDColumn + " join " + Message.TableTask + " tas on tas."
                    + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn;
                if (ddlDayOff.SelectedValue == "All")
                {
                    if (ddlShow.SelectedValue == "All")
                    {
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1");
                    }
                    else if (ddlShow.SelectedValue == "Approved")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 1";
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 1 and emp."
                            + Message.CurrentFlagColumn + " = 1");
                    }
                    else if (ddlShow.SelectedValue == "Not Approved")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 0";
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 0 and emp."
                            + Message.CurrentFlagColumn + " = 1");
                    }
                    else if (ddlShow.SelectedValue == "Reject")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 2";
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where pp." + Message.CurrentFlagColumn + " = 2 and emp."
                            + Message.CurrentFlagColumn + " = 1");
                    }
                }
                else
                {
                    DataTable myDatatmp = _com.getData(Message.TableTask, " * ", " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId WHERE TaskName = '" + ddlDayOff.SelectedValue.ToString() + "' and ProjectName = 'Leave'");
                    if (ddlShow.SelectedValue == "All")
                    {
                        condition = condition + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                            + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString());
                    }
                    else if (ddlShow.SelectedValue == "Approved")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 1" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                            + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 1");
                    }
                    else if (ddlShow.SelectedValue == "Not Approved")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 0" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                            + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 0");
                    }
                    else if (ddlShow.SelectedValue == "Reject")
                    {
                        condition = condition + " and pp." + Message.CurrentFlagColumn + " = 2" + " and pp." + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString();
                        _com.bindDataBlankColumn(column, condition, table, grdData, 1, col);
                        dt = _com.getData(Message.TablePersonProject + " pp join " + Message.TableEmployee
                            + " emp on pp." + Message.BusinessEntityIDColumn + "=emp." + Message.BusinessEntityIDColumn
                            + " join " + Message.TablePerson + " per on emp." + Message.BusinessEntityIDColumn
                            + "=per." + Message.BusinessEntityIDColumn + " join " + Message.TableTask
                            + " tas on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, " pp."
                            + Message.CurrentFlagColumn, " where emp." + Message.CurrentFlagColumn + " = 1 and pp."
                            + Message.TaskIdColumn + " = " + myDatatmp.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 2");
                    }
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Approve");
                    ddlApprove.Items.Add("Not Approve");
                    ddlApprove.Items.Add("Reject");
                    if (dt.Rows[i][0].ToString() == "1")
                    {
                        ddlApprove.SelectedValue = "Approve";
                    }
                    else if (dt.Rows[i][0].ToString() == "0")
                    {
                        ddlApprove.SelectedValue = "Not Approve";
                    }
                    else if (dt.Rows[i][0].ToString() == "2")
                    {
                        ddlApprove.SelectedValue = "Reject";
                    }
                    grdData.Rows[i].Cells[6].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                    grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
                    grdData.Rows[i].Cells[6].Controls.Add(new LiteralControl("</div>"));
                }
                lblSuccess.Text = Message.UpdateSuccess;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
