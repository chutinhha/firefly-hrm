using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Project.TaskList
{
    public partial class TaskListUserControl : UserControl
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
                        if (!IsPostBack) {
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProjectName, 
                                " where "+Message.ProjectNameColumn+"<>'Leave'", true, "Upcoming deadline");
                            if (Session["ProjectName"] != null) {
                                ddlProjectName.SelectedValue = Session["ProjectName"].ToString();
                                Session.Remove("ProjectName");
                            }
                            if (ddlProjectName.SelectedValue == "Upcoming deadline")
                            {
                                _com.bindData(Message.TaskIdColumn + "," + Message.TaskNameColumn + "," + Message.NoteColumn
                                    + "," + Message.StartDateColumn + "," + Message.EndDateColumn, " where " + Message.EndDateColumn
                                    + ">='" + DateTime.Today + "' and " + Message.EndDateColumn + "<='" + DateTime.Today.AddDays(7)
                                    + "'", Message.TableTask, grdData);
                            }
                            else
                            {
                                DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                    + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                                _com.bindData(Message.TaskIdColumn + "," + Message.TaskNameColumn + "," + Message.NoteColumn
                                    + "," + Message.StartDateColumn + "," + Message.EndDateColumn, " where " + Message.ProjectIDColumn
                                    + "='" + dt.Rows[0][0].ToString() + "'", Message.TableTask, grdData);
                            }
                            _com.setGridViewStyle(grdData);
                            ddlProjectName.AutoPostBack = true;
                            Session.Remove("ProjectID");
                            Session.Remove("TaskID");
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[2].Text = "Task Name";
                                grdData.HeaderRow.Cells[4].Text = "Start Date";
                                grdData.HeaderRow.Cells[5].Text = "End Date";
                            }
                        }
                    }
                    catch (Exception ex) {
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

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try{
                if (ddlProjectName.SelectedValue == "Upcoming deadline") {
                    _com.bindData(Message.TaskIdColumn + "," + Message.TaskNameColumn + "," + Message.NoteColumn 
                        + "," + Message.StartDateColumn+ "," + Message.EndDateColumn, " where " + Message.EndDateColumn 
                        + ">='" + DateTime.Today + "' and " + Message.EndDateColumn+ "<='" + DateTime.Today.AddDays(7) 
                        + "'", Message.TableTask, grdData);
                }
                else
                {
                    DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                        + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                    _com.bindData(Message.TaskIdColumn + "," + Message.TaskNameColumn + "," + Message.NoteColumn
                        + "," + Message.StartDateColumn + "," + Message.EndDateColumn, " where " + Message.ProjectIDColumn
                        + "='" + dt.Rows[0][0].ToString() + "'", Message.TableTask, grdData);
                }
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[2].Text = "Task Name";
                    grdData.HeaderRow.Cells[4].Text = "Start Date";
                    grdData.HeaderRow.Cells[5].Text = "End Date";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedValue == "Upcoming deadline") {
                lblError.Text = Message.UpcomingDeadline;
            }
            else{
                DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                    + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                Session["ProjectID"]=dt.Rows[0][0].ToString();
                Session["ProjectName"] = ddlProjectName.SelectedValue;
                Response.Redirect(Message.AddTaskPage, true);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["TaskID"] = Server.HtmlDecode(gr.Cells[1].Text);
                    DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                    Session["ProjectID"] = dt.Rows[0][0].ToString();
                    Session["ProjectName"] = ddlProjectName.SelectedValue;
                    _com.closeConnection();
                    Response.Redirect(Message.EditTaskPage, true);
                }
            }
            lblError.Text = Message.NotChooseItemEdit;
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditTaskPage+"/?TaskID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
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
    }
}
