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
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string connetionString = null;
            SqlConnection cnn ;
            connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                string sql = @"SELECT distinct UserName, Password, Rank FROM HumanResources.Users WHERE UserName='"+TextBox1.Text.Trim()
                    +"' and Password='"+TextBox2.Text.Trim()+"'";
                SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
                // Tạo DataSet
                DataSet ds = new DataSet();
                // Lấp đầy kết quả vào DataSet
                da.Fill(ds, "products");
                // Tạo DataTable thu kết quả từ bảng
                DataTable dt = ds.Tables["products"];
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("http://tungda:1111/hr/SitePages/"+dt.Rows[0][2].ToString().Trim()+".aspx");
                }
                else {
                    Label2.Text = "Invalid username and password";
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
                Label2.Text="Can not open connection ! ";
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
