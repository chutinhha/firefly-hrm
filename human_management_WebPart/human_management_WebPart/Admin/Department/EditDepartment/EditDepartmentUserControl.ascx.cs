using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Department.EditDepartment
{
    public partial class EditDepartmentUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    this.readOnly = "";
                    this.startDateID = "txtStartDate";
                    lblTitle.Text = "Edit Employee Department";
                    string BusinessID = Request.QueryString["BusinessID"];
                    string EmployeeName = Request.QueryString["EmployeeName"];
                    if (BusinessID == null) { }
                    else
                    {
                        Session["BusinessID"] = BusinessID;
                        Session["EmployeeName"] = EmployeeName;
                        Response.Redirect(Message.EditEmployeeDepartmentPage);
                    }
                    if (Session["EmployeeName"] == null) {
                        Response.Redirect(Message.EmployeeListPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                pnlPage.Enabled = true;
                                btnSave.Visible = true;
                                txtEmployeeName.Text = Session["EmployeeName"].ToString();
                                lblError.Text = "";
                                lblSuccess.Text = "";
                                _com.SetItemList(Message.NameColumn, Message.TableDepartment, ddlDepartment, "", false, "");
                                DataTable dt = _com.getData(Message.TableDepartment + " dep join " + Message.TableHistoryDepartment
                                    + " edh on dep." + Message.DepartmentIDColumn + "=edh." + Message.DepartmentIDColumn, " dep."
                                    + Message.NameColumn+",edh."+Message.StartDateColumn, " where edh."+Message.BusinessEntityIDColumn+"='"+Session["BusinessID"]
                                    +"' and (edh."+Message.EndDateColumn+" is NULL or edh."+Message.EndDateColumn+"='')");
                                if (dt.Rows.Count > 0) { 
                                    ddlDepartment.SelectedValue=dt.Rows[0][0].ToString();
                                    Session["DepartmentName"] = ddlDepartment.SelectedValue;
                                    this.startDate=dt.Rows[0][1].ToString();
                                }
                                _com.bindData(" dep." + Message.NameColumn + " as 'Department',edh." + Message.StartDateColumn + " as 'Start Date'"
                                    + ",edh." + Message.EndDateColumn + " as 'End Date'", " where " + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"]
                                    + "'", Message.TableHistoryDepartment + " edh join " + Message.TableDepartment + " dep on dep." + Message.DepartmentIDColumn
                                    + "=edh." + Message.DepartmentIDColumn, grdData);
                                _com.setGridViewStyle(grdData);
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\'") + "');", true);
                        }
                    }
                }
                else
                {
                    this.startDateID = "txtStartDateReadOnly";
                    this.readOnly = "readonly";
                    lblTitle.Text = "Employee Department";
                    try
                    {
                        if (!IsPostBack)
                        {
                            Session["BusinessID"] = Session["AccountID"];
                            DataTable getEmployeeName = _com.getData(Message.TablePerson, Message.NameColumn, " where "
                                + Message.BusinessEntityIDColumn + "='" + Session["AccountID"] + "'");
                            Session["EmployeeName"] = getEmployeeName.Rows[0][0].ToString();
                            pnlPage.Enabled = false;
                            btnSave.Visible = false;
                            txtEmployeeName.Text = Session["EmployeeName"].ToString();
                            lblError.Text = "";
                            lblSuccess.Text = "";
                            _com.SetItemList(Message.NameColumn, Message.TableDepartment, ddlDepartment, "", false, "");
                            DataTable dt = _com.getData(Message.TableDepartment + " dep join " + Message.TableHistoryDepartment
                                + " edh on dep." + Message.DepartmentIDColumn + "=edh." + Message.DepartmentIDColumn, " dep."
                                + Message.NameColumn + ",edh." + Message.StartDateColumn, " where edh." + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"]
                                + "' and (edh." + Message.EndDateColumn + " is NULL or edh." + Message.EndDateColumn + "='')");
                            if (dt.Rows.Count > 0)
                            {
                                ddlDepartment.SelectedValue = dt.Rows[0][0].ToString();
                                Session["DepartmentName"] = ddlDepartment.SelectedValue;
                                this.startDate = dt.Rows[0][1].ToString();
                            }
                            _com.bindData(" dep." + Message.NameColumn + " as 'Department',edh." + Message.StartDateColumn + " as 'Start Date'"
                                + ",edh." + Message.EndDateColumn + " as 'End Date'", " where " + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"]
                                + "'", Message.TableHistoryDepartment + " edh join " + Message.TableDepartment + " dep on dep." + Message.DepartmentIDColumn
                                + "=edh." + Message.DepartmentIDColumn, grdData);
                            _com.setGridViewStyle(grdData);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\'") + "');", true);
                    }
                }
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
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
        protected string confirmSave { get; set; }
        protected string startDate { get; set; }
        protected string readOnly { get; set; }
        protected string startDateID { get; set; }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtStartDate"].ToString().Trim();
            try {
                if (Request.Form["txtStartDate"].ToString().Trim() == "") {
                    lblError.Text = Message.NotChooseDate;
                }
                else
                {
                    lblSuccess.Text = "";
                    lblError.Text = "";
                    DataTable departmentID = _com.getData(Message.TableDepartment, Message.DepartmentIDColumn, " where " + Message.NameColumn
                        + "='" + ddlDepartment.SelectedValue + "'");
                    if (Session["DepartmentName"].ToString() == ddlDepartment.SelectedValue)
                    {
                        try
                        {
                            DateTime start = DateTime.Parse(Request.Form["txtStartDate"].ToString().Trim());
                            _com.updateTable(Message.TableHistoryDepartment, " " + Message.StartDateColumn + "='"
                                + Request.Form["txtStartDate"].ToString().Trim() + "' where " + Message.BusinessEntityIDColumn
                                + "='" + Session["BusinessID"] + "' and (" + Message.EndDateColumn + " is NULL or "
                                + Message.EndDateColumn + "='')");
                            _com.bindData(" dep." + Message.NameColumn + " as 'Department',edh." + Message.StartDateColumn + " as 'Start Date'"
                                        + ",edh." + Message.EndDateColumn + " as 'End Date'", " where " + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"]
                                        + "'", Message.TableHistoryDepartment + " edh join " + Message.TableDepartment + " dep on dep." + Message.DepartmentIDColumn
                                        + "=edh." + Message.DepartmentIDColumn, grdData);
                            lblError.Text = "";
                            lblSuccess.Text = Message.UpdateSuccess;
                        }
                        catch (FormatException)
                        {
                            lblError.Text = Message.InvalidDate;
                        }
                    }
                    else
                    {
                        DateTime start = DateTime.Parse(Request.Form["txtStartDate"].ToString().Trim());
                        DataTable dt = _com.getData(Message.TableHistoryDepartment,"*"," where "+Message.BusinessEntityIDColumn
                            +"='"+Session["BusinessID"]+"' and ("+Message.EndDateColumn+" is NULL or "+Message.EndDateColumn+"='')");
                        _com.updateTable(Message.TableHistoryDepartment, " " + Message.EndDateColumn + "='"
                            + Request.Form["txtStartDate"].ToString().Trim() + "' where " + Message.BusinessEntityIDColumn
                            + "='" + Session["BusinessID"] + "' and (" + Message.EndDateColumn + " is NULL or "
                            + Message.EndDateColumn + "='')");
                        _com.insertIntoTable(Message.TableHistoryDepartment, "", "'"+dt.Rows[0][0].ToString()+"','"+departmentID.Rows[0][0].ToString()
                            + "','" + dt.Rows[0][2].ToString() + "','" + Request.Form["txtStartDate"].ToString().Trim() + "',NULL,'" + DateTime.Now + "'", false); 
                        _com.bindData(" dep." + Message.NameColumn + " as 'Department',edh." + Message.StartDateColumn + " as 'Start Date'"
                                    + ",edh." + Message.EndDateColumn + " as 'End Date'", " where " + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"]
                                    + "'", Message.TableHistoryDepartment + " edh join " + Message.TableDepartment + " dep on dep." + Message.DepartmentIDColumn
                                    + "=edh." + Message.DepartmentIDColumn, grdData);
                        lblError.Text = "";
                        lblSuccess.Text = Message.UpdateSuccess;
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }
    }
}
