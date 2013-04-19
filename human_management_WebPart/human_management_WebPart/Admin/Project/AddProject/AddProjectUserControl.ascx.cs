using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Project.AddProject
{
    public partial class AddProjectUserControl : UserControl
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
                if (Session["Account"].ToString() == "Admin")
                {
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
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
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else if (Request.Form["txtStartDate"].ToString().Trim() == ""
                    || Request.Form["txtEndDate"].ToString().Trim() == "")
                {
                    if (Request.Form["txtStartDate"].ToString().Trim() == ""
                    && Request.Form["txtEndDate"].ToString().Trim() == "")
                    {
                        DataTable dt = _com.getData(Message.TableProject, "*", " where " + Message.ProjectNameColumn
                                + "='" + txtProjectName.Text.Trim() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = Message.AlreadyExistProject;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TableProject, "", "'" + txtProjectName.Text + "','" + txtNote.Text
                                + "',NULL,NULL", false);
                            Response.Redirect(Message.ProjectListPage, true);
                        }
                    }
                    else {
                        lblError.Text = Message.ConfirmProject;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                }
                else
                {
                    DateTime start=DateTime.Now;
                    DateTime end=DateTime.Now;
                    try
                    {
                        start = DateTime.Parse(Request.Form["txtStartDate"].ToString().Trim());
                        end = DateTime.Parse(Request.Form["txtEndDate"].ToString().Trim());
                    }
                    catch (FormatException) {
                        lblError.Text = Message.InvalidDate;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    if (DateTime.Compare(start, end) > 0)
                    {
                        lblError.Text = Message.StartLargeThanEnd;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    else
                    {
                        DataTable dt = _com.getData(Message.TableProject, "*", " where " + Message.ProjectNameColumn
                            + "='" + txtProjectName.Text.Trim() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = Message.AlreadyExistProject;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TableProject, "", "'" + txtProjectName.Text + "','" 
                                + txtNote.Text+ "','" + Request.Form["txtStartDate"].ToString().Trim() + "','" 
                                + Request.Form["txtEndDate"].ToString().Trim()+ "'", false);
                            Response.Redirect(Message.ProjectListPage, true);
                        }
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }

    }
}
