using System;
using System.Web.UI;

namespace SP2010VisualWebPart.ChangePassword
{
    public partial class ChangePasswordUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null) {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (!IsPostBack)
                {
                    lblError.Text = "";
                    lblSuccess.Text = "";
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (txtOldPassword.Text.Trim() == "" || txtNewPassword.Text.Trim() == "" || txtConfirmPassword.Text.Trim() == "")
            {
                lblSuccess.Text = "";
                lblError.Text = Message.OldPassword;
            }
            else {
                try
                {
                    if (txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
                    {
                        lblSuccess.Text = "";
                        lblError.Text = Message.ConfirmPassword;
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else {
                        lblError.Text = _com.ChangePassword(txtOldPassword.Text,txtNewPassword.Text,Session["AccountName"].ToString());
                        if (lblError.Text == "")
                        {
                            lblSuccess.Text = Message.UpdateSuccess;
                        }
                    }
                }
                catch (Exception ex) {
                    lblSuccess.Text = "";
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}
