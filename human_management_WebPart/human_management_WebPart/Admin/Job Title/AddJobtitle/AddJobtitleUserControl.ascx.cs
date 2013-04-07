using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.AddJobtitle
{
    public partial class AddJobtitleUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
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
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
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
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else {
                try
                {
                    DataTable dt = _com.getTopID(Message.TableJobTitle);
                    int JobID = int.Parse(dt.Rows[0][0].ToString()) + 1;
                    _com.insertIntoTable(Message.TableJobTitle," ("+Message.JobIDColumn+","+Message.JobTitleColumn
                        +","+Message.JobDescriptionColumn+","+Message.NoteColumn+","+Message.JobCategoryColumn
                        + "," + Message.LastModifiedColumn + ")", JobID + ",N'" + txtJobTitle.Text.Trim()
                        +"',N'"+txtJobDescription.Text.Trim()+"',N'"+txtNote.Text+"',N'"+ddlJobCategory.SelectedValue+"','"+DateTime.Now+"'",true);
                    lblError.Text = "";
                    _com.closeConnection();
                    Response.Redirect(Message.JobTitlePage,true);
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                }
            }
        }
    }
}
