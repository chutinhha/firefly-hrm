using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Project.EditProject
{
    public partial class EditProjectUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Account"] == null)
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
                else
                {
                    if (Session["Account"].ToString() == "Admin")
                    {
                        if (Session["ProjectID"] == null)
                        {
                            Response.Redirect(Message.AccessDeniedPage);
                        }
                        else {
                            if (!IsPostBack)
                            {
                                DataTable dt = _com.getData(Message.TableProject, "*", " where " + Message.ProjectIDColumn
                                    + "='" + Session["ProjectID"].ToString() + "'");
                                txtProjectName.Text = dt.Rows[0][1].ToString();
                                txtNote.Text = dt.Rows[0][2].ToString();
                                this.startDate = dt.Rows[0][3].ToString();
                                this.endDate = dt.Rows[0][4].ToString();
                            }
                        }
                    }
                    else
                    {
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.ProjectListPage, true);
        }

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
                            + "='" + txtProjectName.Text.Trim() + "' and " + Message.ProjectIDColumn + "<>'"
                            + Session["ProjectID"].ToString() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = Message.AlreadyExistProject;
                        }
                        else
                        {
                            _com.updateTable(Message.TableProject, " " + Message.ProjectNameColumn + "=N'"
                                + txtProjectName.Text + "'," + Message.NoteColumn + "=N'" + txtNote.Text + "',"
                                + Message.StartDateColumn + "='" + Request.Form["txtStartDate"].ToString().Trim()
                                + "'," + Message.EndDateColumn + "='" + Request.Form["txtEndDate"].ToString().Trim()
                                + "' where " + Message.ProjectIDColumn + "='" + Session["ProjectID"].ToString() + "'");
                            Session.Remove("ProjectID");
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
