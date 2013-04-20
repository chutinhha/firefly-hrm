using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Net;
using System.IO;

namespace SP2010VisualWebPart.EditJobTitle
{
    public partial class EditJobTitleUserControl : UserControl
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
                    string Name = Request.QueryString["Name"];
                    if (Name == null) { }
                    else
                    {
                        Session["Name"] = Name;
                        Response.Redirect(Message.EditJobTitlePage);
                    }
                    if (Session["Name"] == null)
                    {
                        Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                _com.SetItemList(Message.NameColumn, Message.TableJobCategory, ddlJobCategory, "", false, "");
                                DataTable dt = _com.getData(Message.TableJobTitle, "*", " where " + Message.JobTitleColumn 
                                    + "=N'" + Session["Name"] + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    txtJobTitle.Text = dt.Rows[0][1].ToString().Trim();
                                    this.document = "/_layouts/Documents/21_2_ob/" + dt.Rows[0][2].ToString().Trim();
                                    if (dt.Rows[0][2] == null || dt.Rows[0][2].ToString().Trim() == "") {
                                        imgDocument.Visible = false;
                                        fulJobDescription.Visible = true;
                                        btnChange.Visible = false;
                                    }
                                    txtNote.Text = dt.Rows[0][4].ToString().Trim();
                                    ddlJobCategory.SelectedValue = dt.Rows[0][3].ToString().Trim();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                        }
                    }
                }
                else
                {
                    Session.Remove("Name");
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected string document { get; set; }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Session.Remove("Name");
            Response.Redirect(Message.JobTitlePage, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtJobTitle.Text.Trim() == "")
            {
                lblError.Text = Message.JobTitleError;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else {
                try
                {
                    DataTable jobCandidate = _com.getData(Message.TableJobCandidate, Message.FullNameColumn + "," + Message.EmailColumn
                        , " where " + Message.JobTitleColumn + "=N'" + Session["Name"].ToString() + "';");
                    DataTable jobVacancy = _com.getData(Message.TableVacancy, Message.VacancyNameColumn
                        , " where " + Message.JobTitleColumn + "=N'" + Session["Name"].ToString() + "';");
                    _com.updateTable(Message.TableJobCandidate, " " + Message.JobTitleColumn + "=NULL where "
                        +Message.JobTitleColumn+"='" + Session["Name"].ToString() + "'");
                    _com.updateTable(Message.TableVacancy, " " + Message.JobTitleColumn + "=NULL where "+Message.JobTitleColumn
                        +"='" + Session["Name"].ToString() + "'");
                    string strDocURL = fulJobDescription.FileName;
                    if (strDocURL.Trim() != "")
                    {
                        string strURL = Server.MapPath("/_layouts/Documents/21_2_ob/") + strDocURL;
                        if (Directory.Exists(Server.MapPath("/_layouts/Documents/21_2_ob/")) == false)
                            Directory.CreateDirectory(Server.MapPath("/_layouts/Documents/21_2_ob/"));
                        if (File.Exists(strURL)) File.Delete(strURL);
                        fulJobDescription.SaveAs(strURL);
                        _com.updateTable(Message.TableJobTitle, Message.JobTitleColumn + "=N'" + txtJobTitle.Text + "',"
                        + Message.JobDescriptionColumn + "=N'" + strDocURL + "'," + Message.NoteColumn + "=N'"
                        + txtNote.Text + "'," + Message.JobCategoryColumn + "=N'" + ddlJobCategory.SelectedValue
                        + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "' where " + Message.JobTitleColumn + "=N'" + Session["Name"] + "'");
                    }
                    else {
                        _com.updateTable(Message.TableJobTitle, Message.JobTitleColumn + "=N'" + txtJobTitle.Text + "',"
                        + Message.JobDescriptionColumn + "=NULL," + Message.NoteColumn + "=N'"
                        + txtNote.Text + "'," + Message.JobCategoryColumn + "=N'" + ddlJobCategory.SelectedValue
                        + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "' where " + Message.JobTitleColumn + "=N'" + Session["Name"] + "'");
                    }
                    if (jobCandidate.Rows.Count > 0) {
                        for (int i = 0; i < jobCandidate.Rows.Count; i++)
                        {
                            _com.updateTable(Message.TableJobCandidate, " " + Message.JobTitleColumn + "=N'" + txtJobTitle.Text
                                + "' where " + Message.FullNameColumn + "='" + jobCandidate.Rows[i][0].ToString() + "' and "
                                + Message.EmailColumn + "=N'" + jobCandidate.Rows[i][1].ToString() + "';");
                        }
                    }
                    if (jobVacancy.Rows.Count > 0) {
                        for (int i = 0; i < jobVacancy.Rows.Count; i++) {
                            _com.updateTable(Message.TableVacancy, " " + Message.JobTitleColumn + "=N'" + txtJobTitle.Text
                                +"' where "+Message.VacancyNameColumn+"='" + jobVacancy.Rows[i][0].ToString() + "'");
                        }
                    }
                    Session.Remove("Name");
                    lblError.Text = "";
                    _com.closeConnection();
                    Response.Redirect(Message.JobTitlePage, true);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                }
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            imgDocument.Visible = false;
            fulJobDescription.Visible = true;
            btnChange.Visible = false;
        }
    }
}
