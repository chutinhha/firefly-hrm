using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.User.MyTask.MyTask
{
    public partial class MyTaskUserControl : UserControl
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
                if (Session["Account"].ToString() == "User")
                {
                    string Status = Request.QueryString["Status"];
                    if (Status == null) { }
                    else
                    {
                        Session["Status"] = Status;
                        Response.Redirect(Message.MyTaskPage);
                    }
                    string Type = Request.QueryString["Type"];
                    if (Type == null) { }
                    else
                    {
                        Session["Type"] = Type;
                        Response.Redirect(Message.MyTaskPage);
                    }
                    if (!IsPostBack)
                    {
                        try
                        {
                            if (Session["Status"] != null) {
                                ddlStatus.SelectedValue = Session["Status"].ToString();
                                Session.Remove("Status");
                            }
                            if (Session["Type"] != null)
                            {
                                ddlShow.SelectedValue = "Current Task";
                                Session.Remove("Type");
                            }
                            if (ddlShow.SelectedValue == "All")
                            {
                                if (ddlStatus.SelectedValue == "All")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and pro."+Message.ProjectNameColumn+"<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else if (ddlStatus.SelectedValue == "Assigned")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and pp." + Message.CurrentFlagColumn + "='1' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                                        , Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and pp." + Message.CurrentFlagColumn + "='2' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                                        , Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                            }
                            else if (ddlShow.SelectedValue == "Current Task")
                            {
                                if (ddlStatus.SelectedValue == "All")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                                        + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                                        , Message.TableTask
                                        + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else if (ddlStatus.SelectedValue == "Assigned")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                                        + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                                        + " and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask
                                        + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                                        + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                                        + " and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask
                                        + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                            }
                            else if (ddlShow.SelectedValue == "Finished Task")
                            {
                                if (ddlStatus.SelectedValue == "All")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else if (ddlStatus.SelectedValue == "Assigned")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                            }
                            else if (ddlShow.SelectedValue == "Future Task")
                            {
                                if (ddlStatus.SelectedValue == "All")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else if (ddlStatus.SelectedValue == "Assigned")
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                                else
                                {
                                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                        _com.setGridViewStyle(grdData);
                    }
                }
                else
                {
                    Response.Redirect(Message.AdminHomePage);
                }
            }
        }

        protected void ddlShow_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                if (ddlShow.SelectedValue == "All")
                {
                    if (ddlStatus.SelectedValue == "All")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else if (ddlStatus.SelectedValue == "Assigned")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and pp." + Message.CurrentFlagColumn + "='1' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                            , Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and pp." + Message.CurrentFlagColumn + "='2' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                            , Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                }
                else if (ddlShow.SelectedValue == "Current Task")
                {
                    if (ddlStatus.SelectedValue == "All")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                            + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                            , Message.TableTask
                            + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else if (ddlStatus.SelectedValue == "Assigned")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                            + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                            + " and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask
                            + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                            + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                            + " and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask
                            + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                }
                else if (ddlShow.SelectedValue == "Finished Task")
                {
                    if (ddlStatus.SelectedValue == "All")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                            + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else if (ddlStatus.SelectedValue == "Assigned")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                            + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                            + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                }
                else if (ddlShow.SelectedValue == "Future Task")
                {
                    if (ddlStatus.SelectedValue == "All")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                            + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else if (ddlStatus.SelectedValue == "Assigned")
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                            + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                    else
                    {
                        _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                            + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                            + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                            + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                            + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                            + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
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
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (i != 0)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height:20px;");
                    }
                    else
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;padding-left:5px;line-height:20px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
                if (e.Row.Cells[5].Text == "0") {
                    e.Row.Cells[5].Text = "Applied";
                }
                else if (e.Row.Cells[5].Text == "1")
                {
                    e.Row.Cells[5].Text = "Assigned";
                }
                else {
                    e.Row.Cells[5].Text = "Removed";
                }
            }
            else {
                e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlShow.SelectedValue == "All")
            {
                if (ddlStatus.SelectedValue == "All")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else if (ddlStatus.SelectedValue == "Assigned")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and pp." + Message.CurrentFlagColumn + "='1' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                        , Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and pp." + Message.CurrentFlagColumn + "='2' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                        , Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
            }
            else if (ddlShow.SelectedValue == "Current Task")
            {
                if (ddlStatus.SelectedValue == "All")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                        + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                        , Message.TableTask
                        + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else if (ddlStatus.SelectedValue == "Assigned")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                        + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                        + " and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask
                        + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + "<='" + DateTime.Today
                        + "' and tas." + Message.EndDateColumn + ">='" + DateTime.Today + "' and pro." + Message.ProjectNameColumn + "<>'Leave'"
                        + " and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask
                        + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
            }
            else if (ddlShow.SelectedValue == "Finished Task")
            {
                if (ddlStatus.SelectedValue == "All")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else if (ddlStatus.SelectedValue == "Assigned")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today
                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
            }
            else if (ddlShow.SelectedValue == "Future Task")
            {
                if (ddlStatus.SelectedValue == "All")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else if (ddlStatus.SelectedValue == "Assigned")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='1'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
                else
                {
                    _com.bindData("tas." + Message.TaskNameColumn + " as 'Task Name',pro." + Message.ProjectNameColumn
                        + " as 'Project Name',tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + " as 'Start Date',tas." + Message.EndDateColumn + " as 'End Date', CAST(pp."
                        + Message.CurrentFlagColumn + " as varchar(10)) as 'Status'", " where pp." + Message.BusinessEntityIDColumn + "='"
                        + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                        + "' and pro." + Message.ProjectNameColumn + "<>'Leave' and pp." + Message.CurrentFlagColumn + "='2'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                        + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TableProject
                        + " pro on pro." + Message.ProjectIDColumn + "=tas." + Message.ProjectIDColumn, grdData);
                }
            }
        }
    }
}
