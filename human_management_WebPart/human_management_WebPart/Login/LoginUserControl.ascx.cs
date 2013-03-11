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
        }
        public Common com = new Common();
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                Label2.Text = "You must enter user name";
            }
            else {
                if (TextBox2.Text == "")
                {
                    Label2.Text = "You must enter password";
                }
                else {
                    try
                    {
                        string sql = @"SELECT distinct UserName, Password, Rank FROM HumanResources.Users WHERE UserName='" + TextBox1.Text.Trim()
                            + "' and Password='" + TextBox2.Text.Trim() + "'";
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
                            Response.Redirect(dt.Rows[0][2].ToString().Trim() + ".aspx");
                        }
                        else
                        {
                            Label2.Text = "Invalid username and password";
                        }
                    }
                    catch (Exception ex)
                    {
                        Label2.Text = ex.Message;
                    }
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
