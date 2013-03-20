using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;

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
                    MD5 md5Hash = MD5.Create();
                    string hashOldPassword = _com.GetMd5Hash(md5Hash, txtOldPassword.Text.Trim());
                    string hashNewPassword = _com.GetMd5Hash(md5Hash, txtConfirmPassword.Text.Trim());
                    DataTable dt = _com.getData(Message.TableEmployee+" a join "+Message.TablePassword+" b", " on a."
                        +Message.BusinessEntityIDColumn+"=b."+Message.BusinessEntityIDColumn+" and a."+Message.LoginIDColumn
                        +"='" + Session["AccountName"]+ "'");
                    if (hashOldPassword.ToUpper() != dt.Rows[0][13].ToString())
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
                            _com.updateTable(Message.TablePassword, " "+Message.PasswordColumn+"=N'"+hashNewPassword.ToUpper()+"'"
                                +" where "+Message.BusinessEntityIDColumn+"=N'"+dt.Rows[0][0].ToString()+"'");
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
