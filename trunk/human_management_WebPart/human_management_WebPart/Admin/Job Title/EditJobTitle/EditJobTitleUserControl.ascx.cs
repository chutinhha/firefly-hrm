using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditJobTitle
{
    public partial class EditJobTitleUserControl : UserControl
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
                    if (Session["Name"] == null)
                    {
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                _com.SetItemList(Message.NameColumn, Message.TableJobCategory, ddlJobCategory, "", false, "");
                                DataTable dt = _com.getData(Message.TableJobTitle, " where " + Message.JobTitleColumn + "=N'" + Session["Name"] + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    txtJobTitle.Text = dt.Rows[0][1].ToString().Trim();
                                    txtJobDescription.Text = dt.Rows[0][2].ToString().Trim();
                                    txtNote.Text = dt.Rows[0][4].ToString().Trim();
                                    ddlJobCategory.SelectedValue = dt.Rows[0][3].ToString().Trim();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                else
                {
                    Session.Remove("Name");
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

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
            }
            else {
                try
                {
                    _com.updateTable(Message.TableJobTitle, Message.JobTitleColumn+"=N'" + txtJobTitle.Text + "',"
                        + Message.JobDescriptionColumn+"=N'" + txtJobDescription.Text + "',"+Message.NoteColumn+"=N'" 
                        + txtNote.Text + "',"+ Message.JobCategoryColumn+"=N'" + ddlJobCategory.SelectedValue 
                        + "',LastModified='"+DateTime.Now+"' where "+Message.JobTitleColumn+"=N'"+Session["Name"]+"'");
                    Session.Remove("Name");
                    lblError.Text = "";
                    _com.closeConnection();
                    Response.Redirect(Message.JobTitlePage, true);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}
