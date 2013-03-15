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
        public Common com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null) {
                Response.Redirect("Home.aspx",true);
            }
            else
            {
                if (!IsPostBack)
                {
                    Label4.Text = "";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "")
            {
                Label4.Text = "You must enter old, new and confirm password";
            }
            else {
                try
                {
                    DataTable dt = com.getData("HumanResources.Users", " where UserName=N'" + Session["AccountName"]
                        + "'");
                    if (TextBox1.Text.Trim() != dt.Rows[0][1].ToString())
                    {
                        Label4.Text = "Your old password is incorrect. Please try again";
                        TextBox1.Text = "";
                    }
                    else {
                        if (TextBox2.Text.Trim() != TextBox3.Text.Trim())
                        {
                            Label4.Text = "Your new password and confirm password are not the same. Please try again";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                        }
                        else {
                            com.updateTable("HumanResources.Users", " Password=N'"+TextBox2.Text.Trim()+"'"
                                +" where UserName=N'"+Session["AccountName"].ToString()+"'");
                            Response.Redirect(Session["Account"] + ".aspx", true);
                        }
                    }
                }
                catch (Exception ex) {
                    Label4.Text = ex.Message;
                }
            }
        }
    }
}
