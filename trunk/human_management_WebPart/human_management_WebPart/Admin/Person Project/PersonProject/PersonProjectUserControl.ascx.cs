using System;
using System.Web;
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
            this.confirmDelete = Message.ConfirmDelete;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
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
                                _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, 
                                    " where " + Message.ProjectNameColumn + " != 'Leave'", false, "");
                                DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE "
                                    +Message.ProjectNameColumn+" ='" + ddlProject.SelectedValue.ToString() + "'");
                                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, 
                                    " WHERE "+Message.ProjectIDColumn+" = " + (int)myData.Rows[0][0], false, "");
                                DataTable myData1 = _com.getData(Message.TableTask+" tas", " * ", " INNER JOIN "
                                    +Message.TableProject+" pro ON tas."+Message.ProjectIDColumn+" = "
                                    +"pro."+Message.ProjectIDColumn+" WHERE tas."+Message.TaskNameColumn
                                    +" = '" + ddlTask.SelectedValue.ToString() + "' and pro."+Message.ProjectNameColumn
                                    +" = '" + ddlProject.SelectedValue.ToString() + "'");
                                if (myData1.Rows.Count > 0)
                                {
                                    grdData.Visible = true;
                                    string column = "pp."+Message.PersonProjectIdColumn+",emp."+Message.BusinessEntityIDColumn
                                        +", " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn;
                                    string condition = " INNER JOIN " + Message.TableEmployee + " emp ON job."+Message.JobIDColumn
                                        +" = emp."+Message.JobIDColumn+") INNER JOIN "+Message.TablePerson
                                        +" per ON per."+Message.BusinessEntityIDColumn+" = emp."
                                        +Message.BusinessEntityIDColumn+") INNER JOIN "+Message.TablePersonProject
                                        +" pp ON pp."+Message.BusinessEntityIDColumn+" = emp."+Message.BusinessEntityIDColumn
                                        +") WHERE pp."+Message.TaskIdColumn+" = " + myData1.Rows[0][0].ToString() 
                                        + " and pp."+Message.CurrentFlagColumn+" = 1 and emp."+Message.CurrentFlagColumn+" = 1";
                                    string table = "(((" + Message.TableJobTitle+" job";
                                    _com.bindData(column, condition, table, grdData);
                                    if (grdData.Rows.Count == 0)
                                    {
                                        lblError.Text = Message.NotExistData;
                                    }
                                    else
                                    {
                                        _com.setGridViewStyle(grdData);
                                        grdData.HeaderRow.Cells[2].Text = "BusinessEntityId";
                                        grdData.HeaderRow.Cells[3].Text = "Employee Name";
                                        grdData.HeaderRow.Cells[4].Text = "Email";
                                        grdData.HeaderRow.Cells[5].Text = "Job Title";
                                    }
                                }
                                else {
                                    grdData.Visible = false;
                                }
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
                        _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, 
                            " where " + Message.ProjectNameColumn + " != 'Leave'", false, "");
                        ddlProject.SelectedValue = Session["ProjectName"].ToString();
                        DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE "
                            +Message.ProjectNameColumn+" = '" + ddlProject.SelectedValue.ToString() + "'");
                        _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " WHERE "
                            +Message.ProjectIDColumn+" = " + (int)myData.Rows[0][0], false, "");
                        ddlTask.SelectedValue = Session["TaskName"].ToString();
                        try
                        {
                            DataTable myDatatmp = _com.getData(Message.TableTask+" tas", " * ", " INNER JOIN "
                                +Message.TableProject+" pro ON tas."+Message.ProjectIDColumn+" = "
                                +"pro."+Message.ProjectIDColumn+" WHERE tas."+Message.TaskNameColumn
                                +" = '" + ddlTask.SelectedValue.ToString() + "' and pro."+Message.ProjectNameColumn
                                +" = '" + ddlProject.SelectedValue.ToString() + "'");
                            string column = "pp."+Message.PersonProjectIdColumn+", emp."+Message.BusinessEntityIDColumn
                                +", per." + Message.PersonNameColumn + ",per." + Message.EmailAddressColumn 
                                + ",job." + Message.JobTitleColumn;
                            string condition = " INNER JOIN " + Message.TableEmployee + " emp ON "
                                +"job."+Message.JobIDColumn+" = emp."+Message.JobIDColumn+") INNER JOIN "
                                +Message.TablePerson+" per ON per."+Message.BusinessEntityIDColumn+" = "
                                +"emp."+Message.BusinessEntityIDColumn+") INNER JOIN "+Message.TablePersonProject
                                +" pp ON pp."+Message.BusinessEntityIDColumn+" = emp."+Message.BusinessEntityIDColumn
                                +") WHERE pp."+Message.TaskIdColumn+" = " + myDatatmp.Rows[0][0].ToString() 
                                + " and pp."+Message.CurrentFlagColumn+" = 1 and emp."+Message.CurrentFlagColumn+" = 1";
                            string table = "(((" + Message.TableJobTitle+" job";
                            _com.bindData(column, condition, table, grdData);
                            _com.setGridViewStyle(grdData);
                            grdData.HeaderRow.Cells[2].Text = "BusinessEntityId";
                            grdData.HeaderRow.Cells[3].Text = "Employee Name";
                            grdData.HeaderRow.Cells[4].Text = "Email";
                            grdData.HeaderRow.Cells[5].Text = "Job Title";
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
                    Response.Redirect(Message.UserHomePage);
                }
            }
                ddlProject.AutoPostBack = true;
                ddlTask.AutoPostBack = true;
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
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE "
                    + Message.ProjectNameColumn + " ='" + ddlProject.SelectedValue.ToString() + "'");
                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask,
                    " WHERE " + Message.ProjectIDColumn + " = " + (int)myData.Rows[0][0], false, "");
                DataTable myData1 = _com.getData(Message.TableTask + " tas", " * ", " INNER JOIN "
                    + Message.TableProject + " pro ON tas." + Message.ProjectIDColumn + " = "
                    + "pro." + Message.ProjectIDColumn + " WHERE tas." + Message.TaskNameColumn
                    + " = '" + ddlTask.SelectedValue.ToString() + "' and pro." + Message.ProjectNameColumn
                    + " = '" + ddlProject.SelectedValue.ToString() + "'");
                if (myData1.Rows.Count > 0)
                {
                    grdData.Visible = true;
                    string column = "pp." + Message.PersonProjectIdColumn + ",emp." + Message.BusinessEntityIDColumn
                        + ", " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn;
                    string condition = " INNER JOIN " + Message.TableEmployee + " emp ON job." + Message.JobIDColumn
                        + " = emp." + Message.JobIDColumn + ") INNER JOIN " + Message.TablePerson
                        + " per ON per." + Message.BusinessEntityIDColumn + " = emp."
                        + Message.BusinessEntityIDColumn + ") INNER JOIN " + Message.TablePersonProject
                        + " pp ON pp." + Message.BusinessEntityIDColumn + " = emp." + Message.BusinessEntityIDColumn
                        + ") WHERE pp." + Message.TaskIdColumn + " = " + myData1.Rows[0][0].ToString()
                        + " and pp." + Message.CurrentFlagColumn + " = 1 and emp." + Message.CurrentFlagColumn + " = 1";
                    string table = "(((" + Message.TableJobTitle+" job";
                    _com.bindData(column, condition, table, grdData);
                    if (grdData.Rows.Count == 0)
                    {
                        lblError.Text = Message.NotExistData;
                    }
                    else
                    {
                        _com.setGridViewStyle(grdData);
                        grdData.HeaderRow.Cells[2].Text = "BusinessEntityId";
                        grdData.HeaderRow.Cells[3].Text = "Employee Name";
                        grdData.HeaderRow.Cells[4].Text = "Email";
                        grdData.HeaderRow.Cells[5].Text = "Job Title";
                    }
                }
                else
                {
                    grdData.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        protected string confirmDelete { get; set; }
        protected void ddlTask_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                grdData.Visible = true;
                DataTable myData = _com.getData(Message.TableTask + " tas", " * ", " INNER JOIN "
                    + Message.TableProject + " pro ON tas." + Message.ProjectIDColumn + " = "
                    + "pro." + Message.ProjectIDColumn + " WHERE tas." + Message.TaskNameColumn
                    + " = '" + ddlTask.SelectedValue.ToString() + "' and pro." + Message.ProjectNameColumn
                    + " = '" + ddlProject.SelectedValue.ToString() + "'");
                string column = "pp."+Message.PersonProjectIdColumn+",emp."+Message.BusinessEntityIDColumn
                    +", " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," 
                    + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " emp ON job."+Message.JobIDColumn
                    +" = emp."+Message.JobIDColumn+") INNER JOIN "+Message.TablePerson+" per ON "
                    +"per."+Message.BusinessEntityIDColumn+" = emp."+Message.BusinessEntityIDColumn
                    +") INNER JOIN "+Message.TablePersonProject+" pp ON pp."+Message.BusinessEntityIDColumn
                    +" = emp."+Message.BusinessEntityIDColumn+") WHERE pp."+Message.TaskIdColumn+" = " 
                    + myData.Rows[0][0].ToString() + " and pp."+Message.CurrentFlagColumn+" = 1 and "
                    +"emp."+Message.CurrentFlagColumn+" = 1";
                string table = "(((" + Message.TableJobTitle+" job";
                _com.bindData(column, condition, table, grdData);
                if (grdData.Rows.Count == 0)
                {
                    lblError.Text = Message.NotExistData;
                }
                else
                {
                    _com.setGridViewStyle(grdData);
                    grdData.HeaderRow.Cells[2].Text = "BusinessEntityId";
                    grdData.HeaderRow.Cells[3].Text = "Employee Name";
                    grdData.HeaderRow.Cells[4].Text = "Email";
                    grdData.HeaderRow.Cells[5].Text = "Job Title";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ddlTask.Items.Count == 1 && ddlTask.SelectedValue.ToString()=="NULL")
            {
                lblError.Text = Message.ProjectNotHaveTask;
            }
            else
            {
                Session["ProjectName"] = Server.HtmlDecode(ddlProject.SelectedValue.ToString());
                Session["TaskName"] = Server.HtmlDecode(ddlTask.SelectedValue.ToString());
                _com.closeConnection();
                Response.Redirect(Message.SearchEmployeePage, true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        _com.updateTable(Message.TablePersonProject, " " + Message.CurrentFlagColumn
                            + "='2' where " + Message.PersonProjectIdColumn + "='" + Server.HtmlDecode(gr.Cells[1].Text)
                            + "'");
                        lblError.Text = "";
                    }
                }
                if (isCheck == true)
                {
                    grdData.Visible = true;
                    DataTable myData = _com.getData(Message.TableTask + " tas", " * ", " INNER JOIN "
                    + Message.TableProject + " pro ON tas." + Message.ProjectIDColumn + " = "
                    + "pro." + Message.ProjectIDColumn + " WHERE tas." + Message.TaskNameColumn
                    + " = '" + ddlTask.SelectedValue.ToString() + "' and pro." + Message.ProjectNameColumn
                    + " = '" + ddlProject.SelectedValue.ToString() + "'");
                    string column = "pp." + Message.PersonProjectIdColumn + ",emp." + Message.BusinessEntityIDColumn
                        + ", " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + ","
                        + Message.JobTitleColumn;
                    string condition = " INNER JOIN " + Message.TableEmployee + " emp ON job." + Message.JobIDColumn
                        + " = emp." + Message.JobIDColumn + ") INNER JOIN " + Message.TablePerson + " per ON "
                        + "per." + Message.BusinessEntityIDColumn + " = emp." + Message.BusinessEntityIDColumn
                        + ") INNER JOIN " + Message.TablePersonProject + " pp ON pp." + Message.BusinessEntityIDColumn
                        + " = emp." + Message.BusinessEntityIDColumn + ") WHERE pp." + Message.TaskIdColumn + " = "
                        + myData.Rows[0][0].ToString() + " and pp." + Message.CurrentFlagColumn + " = 1 and "
                        + "emp." + Message.CurrentFlagColumn + " = 1";
                    string table = "(((" + Message.TableJobTitle+" job";
                    _com.bindData(column, condition, table, grdData);
                    if (grdData.Rows.Count == 0)
                    {
                        lblError.Text = Message.NotExistData;
                    }
                    else
                    {
                        _com.setGridViewStyle(grdData);
                        grdData.HeaderRow.Cells[2].Text = "BusinessEntityId";
                        grdData.HeaderRow.Cells[3].Text = "Employee Name";
                        grdData.HeaderRow.Cells[4].Text = "Email";
                        grdData.HeaderRow.Cells[5].Text = "Job Title";
                    }
                }
                else
                {
                    lblError.Text = Message.NotChooseItemDelete;
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\'") + "');", true);
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
    }
}
