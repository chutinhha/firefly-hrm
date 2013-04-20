using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.TimeSheet.TimesheetSummary
{
    public partial class TimesheetSummaryUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
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
                            txtEmployeeName.Text = "All";
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                            _com.SetItemList(Message.ProjectNameColumn,Message.TableProject, ddlProjectName, "", true, "All");
                            ddlTaskName.Items.Clear();
                            ddlTaskName.Items.Add("All");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnView_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            string condition = "";
            try
            {
                if (txtEmployeeName.Text.Trim() == "")
                {
                    lblError.Text = Message.EmployeeNameError;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else {
                    if (txtEmployeeName.Text.Trim() == "All") { }
                    else {
                        condition = " where per."+Message.NameColumn+" like '%"+txtEmployeeName.Text.Trim()+"%'";
                    }
                    if (ddlProjectName.SelectedValue == "All") { 
                    }
                    else {
                        if (condition == "")
                        {
                            condition = " where pro." + Message.ProjectNameColumn + " = N'" + ddlProjectName.SelectedValue + "'";
                        }
                        else
                        {
                            condition = condition + " and pro." + Message.ProjectNameColumn + " = N'" + ddlProjectName.SelectedValue + "'";
                        }
                        if(ddlTaskName.SelectedValue=="All"){}
                        else{
                            condition = condition + " and tas."+Message.TaskNameColumn+"=N'"+ddlTaskName.SelectedValue
                                +"'";
                        }
                    }
                    try
                    {
                        DateTime dt;
                        DateTime dt1;
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                        {
                            dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                            if (condition == "")
                            {
                                condition = " where tim." + Message.TimesheetDateColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'";
                            }
                            else
                            {
                                condition = condition + " and tim." + Message.TimesheetDateColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'";
                            }
                        }
                        if (Request.Form["txtDateTo"].ToString().Trim() != "")
                        {
                            dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                            dt1 = dt1.AddDays(1.0);
                            if (condition == "")
                            {
                                condition = " where tim." + Message.TimesheetDateColumn + "<'" + dt1.Month + "-" + dt1.Day
                                    + "-" + dt1.Year + "'";
                            }
                            else
                            {
                                condition = condition + " and tim." + Message.TimesheetDateColumn + "<'" + dt1.Month + "-" + dt1.Day
                                    + "-" + dt1.Year + "'";
                            }
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = Message.InvalidDate;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    if (chkApprove.Checked == false) { }
                    else {
                        if (condition == "")
                        {
                            condition = " where tim." + Message.CurrentFlagColumn + "='True'";
                        }
                        else {
                            condition = " and tim." + Message.CurrentFlagColumn + "='True'";
                        }
                    }
                    condition = condition + " and emp." + Message.CurrentFlagColumn + "='True'" 
                        + " order by per." + Message.NameColumn + ",pro." + Message.ProjectNameColumn
                        +",tas."+Message.TaskNameColumn;
                    _com.bindDataTimesheetSummary("per."+Message.NameColumn+" as 'Employee Name',pro."+Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.TaskNameColumn + " as 'Task Name',tim." + Message.TimesheetTimeColumn + " as 'Time(Hours)',CONVERT"
                        + "(varchar(10),tim."+Message.TimesheetDateColumn+", 20) as Date,per."+Message.BusinessEntityIDColumn, condition, " "
                        +Message.TableProject+" pro join "+Message.TableTask+" tas on pro."+Message.ProjectIDColumn
                        +"=tas."+Message.ProjectIDColumn+" join "+Message.TableTimesheet+" tim on tim."
                        +Message.TaskIdColumn+" = tas."+Message.TaskIdColumn+" join "+Message.TablePerson
                        +" per on tim."+Message.BusinessEntityIDColumn+" = per."+Message.BusinessEntityIDColumn
                        + " join " + Message.TableEmployee + " emp on emp."
                        + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        lblError.Text = "";
                        pnlData.Visible = true;
                        lblDetail.Text = "&nbsp;Search Employee: " + txtEmployeeName.Text.Trim();
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "") {
                            lblDetail.Text = lblDetail.Text + "<br />&nbsp;From " + Request.Form["txtDateFrom"].ToString().Trim();
                        }
                        if (Request.Form["txtDateTo"].ToString().Trim() != "") {
                            lblDetail.Text = lblDetail.Text + "<br />&nbsp;To " + Request.Form["txtDateTo"].ToString().Trim();
                        }
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        pnlData.Visible = false;
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
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

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            if (ddlProjectName.SelectedValue == "All")
            {
                ddlTaskName.Items.Clear();
                ddlTaskName.Items.Add("All");
            }
            else {
                DataTable ProjectID = _com.getData(Message.TableProject, Message.ProjectIDColumn
                    , " where " + Message.ProjectNameColumn + "=N'" + ddlProjectName.SelectedValue + "';");
                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTaskName, " where " + Message.ProjectIDColumn
                    + "='" + ProjectID.Rows[0][0].ToString() + "'", true, "All");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmployeeName.Text = "All";
            ddlProjectName.SelectedValue = "All";
            chkApprove.Checked = false;
            pnlData.Visible = false;
        }
    }
}
