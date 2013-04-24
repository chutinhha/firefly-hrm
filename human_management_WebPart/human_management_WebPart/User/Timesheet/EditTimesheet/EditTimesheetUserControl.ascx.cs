using System;
using System.Web;
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
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    string TimesheetId = Request.QueryString["TimesheetId"];
                    if (TimesheetId == null) { }
                    else
                    {
                        Session["TimesheetId"] = TimesheetId;
                        Response.Redirect(Message.EditMyTimesheetPage);
                    }
                    if (!IsPostBack)
                    {
                        lblError.Text = "";
                        txtTime.Text = "";
                        try
                        {
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, "", false, "");
                            DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn
                                , " where "+Message.ProjectNameColumn+" = '" + ddlProject.SelectedValue.ToString()+"'");
                            _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask
                                , " where "+Message.ProjectIDColumn+" = " + myData.Rows[0][0].ToString(), false, "");
                            if (Session["TimesheetId"] == null)
                            {
                                lblTitle.Text = "New Timesheet";
                            }
                            else
                            {
                                lblTitle.Text = "Edit Timesheet";
                                myData = _com.getData(" ( " + Message.TableTimesheet + " tim INNER JOIN "
                                    +Message.TableTask+" tas ON tim."+Message.TaskIdColumn+" = "
                                    +"tas."+Message.TaskIdColumn+" ) INNER JOIN "+Message.TableProject+" pro ON "
                                    +"pro."+Message.ProjectIDColumn+" = tas."+Message.ProjectIDColumn
                                    , Message.ProjectNameColumn + "," + Message.TaskNameColumn 
                                    + ",tim."+Message.WorkDateColumn+",tim."+Message.TimesheetTimeColumn+","
                                    + "pro."+Message.ProjectIDColumn, " where tim."+Message.TimesheetIDColumn+" = " 
                                    + Session["TimesheetId"].ToString());
                                txtTime.Text = myData.Rows[0][3].ToString();
                                ddlProject.SelectedValue = myData.Rows[0][0].ToString();
                                _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask
                                , " where "+Message.ProjectIDColumn+" = " + myData.Rows[0][4].ToString(), false, "");
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
                    Response.Redirect(Message.AdminHomePage);
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn
                , " where "+Message.ProjectNameColumn+" = '" + ddlProject.SelectedValue.ToString() + "'");
            _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask
                , " where "+Message.ProjectIDColumn+" = " + myData.Rows[0][0].ToString(), false, "");
        }
        protected string confirmSave { get; set; }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            lblError.Text = "";
            DataTable myData = _com.getData(Message.TableProject + " pro INNER JOIN " + Message.TableTask 
                + " tas ON pro."+Message.ProjectIDColumn+" = tas."+Message.ProjectIDColumn+" ", 
                " pro."+Message.ProjectIDColumn+",tas."+Message.TaskIdColumn+" ", " where "
                +"pro."+Message.ProjectNameColumn+" = '" + ddlProject.SelectedValue.ToString() 
                + "' and tas."+Message.TaskNameColumn+" = '" + ddlTask.SelectedValue.ToString()+"'");
            try
            {
                if (txtTime.Text.Trim() == "") {
                    lblError.Text = Message.NotEnterTime;
                }  
                else
                {
                    try
                    {
                        float Time = float.Parse(txtTime.Text.Trim());
                        if (Time >= 24 || Time <= 0)
                        {
                            lblError.Text = Message.InvalidTime;
                        }
                        else
                        {
                            if (Request.Form["txtDateFrom"].ToString().Trim() == "")
                            {
                                lblError.Text = Message.NotEnterWorkDate;
                            }
                            else
                            {
                                try
                                {
                                    DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                    if (Session["TimesheetId"] != null)
                                    {
                                        _com.updateTable(Message.TableTimesheet, " "+Message.TaskIdColumn+" = '" 
                                            + myData.Rows[0][1].ToString() + "', "+Message.WorkDateColumn
                                            +" = CAST('" + Request.Form["txtDateFrom"].ToString().Trim() 
                                            + "' AS DATE), "+Message.TimesheetTimeColumn+" = '" + txtTime.Text.ToString().Trim() 
                                            + "',"+Message.ModifiedDateColumn+" = CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") 
                                            + "' AS DATE) " + " where "+Message.TimesheetIDColumn+" = '" 
                                            + Session["TimesheetId"].ToString() + "'");
                                    }
                                    else
                                    {
                                        _com.insertIntoTable(Message.TableTimesheet, "", "'" + txtTime.Text.ToString().Trim() 
                                            + "','" + Session["AccountID"] + "','" + myData.Rows[0][1].ToString() + "'," 
                                            + "CAST('" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATE)" 
                                            + ",null,'0',CAST('" + Request.Form["txtDateFrom"].ToString().Trim() 
                                            + "' AS DATE),null", false);
                                    }
                                    Response.Redirect(Message.MyTimesheetPage);
                                }
                                catch (FormatException)
                                {
                                    lblError.Text = Message.InvalidDate;
                                }
                            }
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = Message.InvalidTime;
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.MyTimesheetPage);
        }
    }
}
