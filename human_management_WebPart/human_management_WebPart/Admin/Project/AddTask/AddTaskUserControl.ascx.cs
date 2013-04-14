using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Project.AddTask
{
    public partial class AddTaskUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected string confirmSave { get; set; }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.TaskListPage, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.startDate = Request.Form["txtStartDate"].ToString().Trim();
                this.endDate = Request.Form["txtEndDate"].ToString().Trim();
                if (txtTaskName.Text.Trim() == "")
                {
                    lblError.Text = Message.NotEnterProjectName;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else if (Request.Form["txtStartDate"].ToString().Trim() == ""
                    || Request.Form["txtEndDate"].ToString().Trim() == "")
                {
                    lblError.Text = Message.NotEnterStartEndDate;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else
                {
                    bool checkFormat = true;
                    DateTime start = DateTime.Now;
                    DateTime end = DateTime.Now;
                    try
                    {
                        start = DateTime.Parse(Request.Form["txtStartDate"].ToString().Trim());
                        end = DateTime.Parse(Request.Form["txtEndDate"].ToString().Trim());
                    }
                    catch (FormatException) {
                        lblError.Text = Message.InvalidDate;
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                        checkFormat = false;
                    }
                    if (checkFormat == true)
                    {
                        try
                        {
                            if (txtLimitDate.Text.Trim() != "")
                            {
                                int LimitDate = int.Parse(txtLimitDate.Text.Trim());
                            }
                        }
                        catch (FormatException)
                        {
                            lblError.Text = Message.LitmitDateError;
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                            checkFormat = false;
                        }
                        if (checkFormat == true)
                        {
                            if (DateTime.Compare(start, end) > 0)
                            {
                                lblError.Text = Message.StartLargeThanEnd;
                                ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                            }
                            else
                            {
                                DataTable dt = _com.getData(Message.TableTask, "*", " where " + Message.TaskNameColumn
                                    + "='" + txtTaskName.Text.Trim() + "' and " + Message.ProjectIDColumn + "='" + Session["ProjectID"].ToString() + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    lblError.Text = Message.AlreadyExistTask;
                                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                                }
                                else
                                {
                                    _com.insertIntoTable(Message.TableTask, "", "'" + Session["ProjectID"].ToString() + "','" + txtTaskName.Text + "','" + txtNote.Text
                                        + "','" + Request.Form["txtStartDate"].ToString().Trim() + "','" + Request.Form["txtEndDate"].ToString().Trim()
                                        + "','" + txtLimitDate.Text.Trim() + "'", false);
                                    Response.Redirect(Message.TaskListPage, true);
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
