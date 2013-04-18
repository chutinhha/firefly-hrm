using System;
using System.Web;
using System.Web.UI;using System.Web;

namespace SP2010VisualWebPart.ChangePassword
{
    public partial class ChangePasswordUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmChangePassword = Message.ConfirmChangePassword;
            if (Session["Account"] == null) {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    if (HttpContext.Current.Request.Url.AbsoluteUri.Contains(Message.AdminHomePage)) { }
                    else
                    {
                        Response.Redirect(Message.AdminHomePage, true);
                    }
                }
                else {
                    if (HttpContext.Current.Request.Url.AbsoluteUri.Contains(Message.UserHomePage)) { }
                    else
                    {
                        Response.Redirect(Message.UserHomePage);
                    }
                }
                if (!IsPostBack)
                {
                    lblError.Text = "";
                    lblSuccess.Text = "";
                }
            }
        }
        protected string confirmChangePassword { get; set; }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (txtOldPassword.Text.Trim() == "" || txtNewPassword.Text.Trim() == "" || txtConfirmPassword.Text.Trim() == "")
            {
                lblSuccess.Text = "";
                lblError.Text = Message.OldPassword;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else {
                try
                {
                    if (txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
                    {
                        lblSuccess.Text = "";
                        lblError.Text = Message.ConfirmPassword;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else {
                        lblError.Text = _com.ChangePassword(txtOldPassword.Text,txtNewPassword.Text,Session["AccountName"].ToString());
                        if (lblError.Text == "")
                        {
                            lblSuccess.Text = Message.UpdateSuccess;
                        }else{
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
						}
                    }
                }
                catch (Exception ex) {
                    lblSuccess.Text = "";
                    lblError.Text = ex.Message;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                }
            }
        }
    }
}
