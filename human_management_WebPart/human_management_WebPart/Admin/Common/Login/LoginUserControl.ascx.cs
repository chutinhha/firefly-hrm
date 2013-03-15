using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data;

namespace SP2010VisualWebPart.Login
{
    public partial class LoginUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("Account");
            Session.Remove("AcountName");
        }
        public Common com = new Common();
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            if (txtUser.Text.Trim() == "")
            {
                lblError.Text = "You must enter user name";
            }
            else {
                if (txtPassword.Text == "")
                {
                    lblError.Text = "You must enter password";
                }
                else {
                    try
                    {
                        string sql = @"SELECT distinct UserName, Password, Rank FROM HumanResources.Users WHERE UserName='" + txtUser.Text.Trim()
                            + "' and Password='" + txtPassword.Text.Trim() + "'";
                        SqlDataAdapter da = new SqlDataAdapter(sql, com.cnn);
                        // Tạo DataSet
                        DataSet ds = new DataSet();
                        // Lấp đầy kết quả vào DataSet
                        da.Fill(ds, "data");
                        // Tạo DataTable thu kết quả từ bảng
                        DataTable dt = ds.Tables["data"];
                        if (dt.Rows.Count > 0)
                        {
                            com.closeConnection();
                            Session["Account"] = dt.Rows[0][2].ToString().Trim();
                            Session["AccountName"] = txtUser.Text.Trim();
                            Response.Redirect(dt.Rows[0][2].ToString().Trim() + ".aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid username and password";
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
