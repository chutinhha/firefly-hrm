using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.ChangePassword
{
    public partial class ChangePasswordUserControl : UserControl
    {
        private Common _com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null) {
                Response.Redirect(Message.HomePage,true);
            }
            else
            {
                if (!IsPostBack)
                {
                    lblError.Text = "";
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (txtOldPassword.Text.Trim() == "" || txtNewPassword.Text.Trim() == "" || txtConfirmPassword.Text.Trim() == "")
            {
                lblError.Text = Message.OldPassword;
            }
            else {
                try
                {
                    DataTable dt = _com.getData(Message.TableUser, " where "+Message.UserNameColumn+"=N'" + Session["AccountName"]
                        + "'");
                    if (txtOldPassword.Text.Trim() != dt.Rows[0][1].ToString())
                    {
                        lblError.Text = Message.OldPasswordError;
                        txtOldPassword.Text = "";
                    }
                    else {
                        if (txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
                        {
                            lblError.Text = Message.ConfirmPassword;
                            txtNewPassword.Text = "";
                            txtConfirmPassword.Text = "";
                        }
                        else {
                            _com.updateTable(Message.TableUser, " "+Message.PasswordColumn+"=N'"+txtNewPassword.Text.Trim()+"'"
                                +" where "+Message.UserNameColumn+"=N'"+Session["AccountName"].ToString()+"'");
                            Response.Redirect(Session["Account"] + ".aspx", true);
                        }
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}
