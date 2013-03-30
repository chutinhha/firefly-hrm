using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;

namespace SP2010VisualWebPart.Login
{
    public partial class LoginUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("Account");
            Session.Remove("AcountName");
            Session.Remove("AccountID");
            Session.Remove("PersonName");
        }
        
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            if (txtUser.Text.Trim() == "")
            {
                lblError.Text = Message.UserName;
            }
            else {
                if (txtPassword.Text == "")
                {
                    lblError.Text = Message.Password;
                }
                else {
                    try
                    {
                        MD5 md5Hash = MD5.Create();
                        string hash = _com.GetMd5Hash(md5Hash, txtPassword.Text);
                        DataTable dt = _com.getData(Message.TableEmployee, "*", " where " + Message.UserNameColumn + "=N'" 
                            + txtUser.Text + "'");
                        if (dt.Rows.Count > 0)
                        {
                            DataTable dt1 = _com.getData(Message.TablePassword, "*", " where " + Message.BusinessEntityIDColumn
                                +"='" + dt.Rows[0][0].ToString() + "' and "+Message.PasswordColumn+"='" + hash + "'");
                            if (dt1.Rows.Count > 0)
                            {
                                DataTable dt2 = _com.getData(Message.TablePerson, "*", " where " + Message.BusinessEntityIDColumn
                                    +"='" + dt.Rows[0][0].ToString() + "'");
                                _com.closeConnection();
                                Session["AccountID"] = dt1.Rows[0][0].ToString();
                                Session["Account"] = dt2.Rows[0][1].ToString().Trim();
                                Session["PersonName"]= dt2.Rows[0][2].ToString().Trim();
                                Session["AccountName"] = txtUser.Text.Trim();
                                Response.Redirect(dt2.Rows[0][1].ToString().Trim() + ".aspx");
                            }
                            else
                            {
                                lblError.Text = Message.InvalidUserPass;
                            }
                        }
                        else
                        {
                            lblError.Text = Message.InvalidUserPass;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
            }
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
