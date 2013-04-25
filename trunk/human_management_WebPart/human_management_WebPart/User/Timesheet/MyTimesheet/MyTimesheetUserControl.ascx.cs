using System;
using System.Web;
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
            this.confirmDelete = Message.ConfirmDelete;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
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
                }
                else
                {
                    Response.Redirect(Message.AdminHomePage);
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            lblError.Text = "";
                try
                {
                    string column = " tim." + Message.TimesheetIDColumn + ",tim." + Message.WorkDateColumn + ",pro."
                        + Message.ProjectNameColumn + ",tas." + Message.TaskNameColumn + ",tim." + Message.TimesheetTimeColumn;
                    string table = Message.TableTimesheet + " tim join " + Message.TableTask + " tas on tim."
                        + Message.TaskIdColumn + "=tas." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn;
                    string condition = " where tim." + Message.BusinessEntityIDColumn + "='" + Session["AccountID"] + "'";
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "" && Request.Form["txtDateTo"].ToString().Trim() != "")
                    {
                        if (DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim()) > DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim()))
                            lblError.Text = Message.ToDateAfterFrom;
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                condition = condition + " and tim." + Message.WorkDateColumn + ">=CAST('" + dt.Date + "' AS DATE)";
                                if (Request.Form["txtDateTo"].ToString().Trim() != "")
                                {
                                    dt = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                                    condition = condition + " and tim." + Message.WorkDateColumn + "<=CAST('" + dt.Date + "' AS DATE)";
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.InvalidDate;
                            }
                        }
                    }
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "" && Request.Form["txtDateFrom"].ToString().Trim() == "")
                    {
                            try
                            {
                                DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                condition = condition + " and tim." + Message.WorkDateColumn + ">=CAST('" + dt.Date + "' AS DATE)";
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.InvalidDate;
                            }
                    }
                    if (Request.Form["txtDateFrom"].ToString().Trim() == "" && Request.Form["txtDateTo"].ToString().Trim() != "")
                    {
                        try
                        {
                            DateTime dt = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                            condition = condition + " and tim." + Message.WorkDateColumn + "<=CAST('" + dt.Date + "' AS DATE)";
                        }
                        catch (FormatException)
                        {
                            lblError.Text = Message.InvalidDate;
                        }
                    }
                    _com.bindData(column, condition, table, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        _com.setGridViewStyle(grdData);
                        grdData.HeaderRow.Cells[1].Text = "TimesheetId";
                        grdData.HeaderRow.Cells[2].Text = "Work Date";
                        grdData.HeaderRow.Cells[3].Text = "Project Name";
                        grdData.HeaderRow.Cells[4].Text = "Task Name";
                        grdData.HeaderRow.Cells[5].Text = "Time";
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditMyTimesheetPage+"/?TimesheetID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
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
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session.Remove("TimesheetId");
            _com.closeConnection();
            Response.Redirect(Message.EditMyTimesheetPage);
        }
        protected string confirmDelete { get; set; }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["TimesheetId"] = Server.HtmlDecode(gr.Cells[1].Text.ToString());
                    _com.closeConnection();
                    Response.Redirect(Message.EditMyTimesheetPage);
                    break;
                }
            }
            lblError.Text = Message.NotChooseItemEdit;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            lblError.Text = "";
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        _com.deleteFromTable(Message.TableTimesheet, " where "+Message.TimesheetIDColumn
                            +" = " + gr.Cells[1].Text.ToString());
                    }
                }
                if (isCheck == true)
                {
                    lblError.Text = "";
                    string column = " tim." + Message.TimesheetIDColumn + ",tim." + Message.WorkDateColumn + ",pro."
                        + Message.ProjectNameColumn + ",tas." + Message.TaskNameColumn + ",tim." + Message.TimesheetTimeColumn;
                    string table = Message.TableTimesheet + " tim join " + Message.TableTask + " tas on tim."
                        + Message.TaskIdColumn + "=tas." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn;
                    string condition = " where tim." + Message.BusinessEntityIDColumn + "='" + Session["AccountID"] + "'";
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                    {
                        try
                        {
                            DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                            condition = condition + " and tim." + Message.WorkDateColumn + ">=CAST('" + dt.Date + "' AS DATE)";
                            if (Request.Form["txtDateTo"].ToString().Trim() != "")
                            {
                                dt = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                                condition = condition + " and tim." + Message.WorkDateColumn + "<=CAST('" + dt.Date + "' AS DATE)";
                            }
                        }
                        catch (FormatException)
                        {
                            lblError.Text = Message.InvalidDate;
                        }
                    }
                    _com.bindData(column, condition, table, grdData);
                    _com.setGridViewStyle(grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        grdData.HeaderRow.Cells[1].Text = "TimesheetId";
                        grdData.HeaderRow.Cells[2].Text = "Work Date";
                        grdData.HeaderRow.Cells[3].Text = "Project Name";
                        grdData.HeaderRow.Cells[4].Text = "Task Name";
                        grdData.HeaderRow.Cells[5].Text = "Time";
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
    }
}
