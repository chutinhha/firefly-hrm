using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.IO;

namespace SP2010VisualWebPart.AddJobtitle
{
    public partial class AddJobtitleUserControl : UserControl
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
                    try
                    {
                        if (!IsPostBack)
                        {
                            _com.SetItemList(Message.NameColumn, Message.TableJobCategory, ddlJobCategory, "", false, "");
                            lblError.Text = "";
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
        protected string confirmSave { get; set; }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect("JobTitles.aspx",true);
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
                    string strDocURL = fulJobDescription.FileName;
                    if (strDocURL.Trim() != "")
                    {
                        string strURL = Server.MapPath("/_layouts/Documents/21_2_ob/") + strDocURL;
                        if (Directory.Exists(Server.MapPath("/_layouts/Documents/21_2_ob/")) == false)
                            Directory.CreateDirectory(Server.MapPath("/_layouts/Documents/21_2_ob/"));
                        if (File.Exists(strURL)) File.Delete(strURL);
                        fulJobDescription.SaveAs(strURL);
                    }
                    DataTable dt = _com.getTopID(Message.TableJobTitle);
                    int JobID = int.Parse(dt.Rows[0][0].ToString()) + 1;
                    _com.insertIntoTable(Message.TableJobTitle," ("+Message.JobIDColumn+","+Message.JobTitleColumn
                        +","+Message.JobDescriptionColumn+","+Message.NoteColumn+","+Message.JobCategoryColumn
                        + "," + Message.LastModifiedColumn + ")", JobID + ",N'" + txtJobTitle.Text.Trim()
                        + "',N'" + strDocURL + "',N'" + txtNote.Text + "',N'" + ddlJobCategory.SelectedValue
                        +"','"+DateTime.Now+"'",true);
                    lblError.Text = "";
                    _com.closeConnection();
                    Response.Redirect(Message.JobTitlePage,true);
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                }
            }
        }
    }
}
