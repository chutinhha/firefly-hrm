using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Project.AddTask
{
    public partial class AddTaskUserControl : UserControl
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
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.TaskListPage, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTaskName.Text.Trim() == "")
                {
                    lblError.Text = Message.NotEnterProjectName;
                }
                else if (Request.Form["txtStartDate"].ToString().Trim() == ""
                    || Request.Form["txtEndDate"].ToString().Trim() == "")
                {
                    lblError.Text = Message.NotEnterStartEndDate;
                }
                else
                {
                    DateTime start = DateTime.Parse(Request.Form["txtStartDate"].ToString().Trim());
                    DateTime end = DateTime.Parse(Request.Form["txtEndDate"].ToString().Trim());
                    if (DateTime.Compare(start, end) > 0) {
                        lblError.Text = Message.StartLargeThanEnd;
                    }
                    else
                    {
                        DataTable dt = _com.getData(Message.TableTask, "*", " where " + Message.TaskNameColumn
                            + "='" + txtTaskName.Text.Trim() + "' and " + Message.ProjectIDColumn + "='" + Session["ProjectID"].ToString() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = Message.AlreadyExistTask;
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TableTask, "", "'" + Session["ProjectID"].ToString() + "','" + txtTaskName.Text + "','" + txtNote.Text
                                + "','" + Request.Form["txtStartDate"].ToString().Trim() + "','" + Request.Form["txtEndDate"].ToString().Trim()
                                + "'", false);
                            Session.Remove("ProjectID");
                            Response.Redirect(Message.TaskListPage, true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
