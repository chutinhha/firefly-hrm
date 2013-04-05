using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Project.AddProject
{
    public partial class AddProjectUserControl : UserControl
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
            Response.Redirect(Message.ProjectListPage, true);
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtStartDate"].ToString().Trim();
            this.endDate = Request.Form["txtEndDate"].ToString().Trim();
            try
            {
                if (txtProjectName.Text.Trim() == "")
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
                    if (DateTime.Compare(start, end) > 0)
                    {
                        lblError.Text = Message.StartLargeThanEnd;
                    }
                    else
                    {
                        DataTable dt = _com.getData(Message.TableProject, "*", " where " + Message.ProjectNameColumn
                            + "='" + txtProjectName.Text.Trim() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = Message.AlreadyExistProject;
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TableProject, "", "'" + txtProjectName.Text + "','" + txtNote.Text
                                + "','" + Request.Form["txtStartDate"].ToString().Trim() + "','" + Request.Form["txtEndDate"].ToString().Trim()
                                + "'", false);
                            Response.Redirect(Message.ProjectListPage, true);
                        }
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }

    }
}
