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
                    lblError.Text = "";
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (txtOldPassword.Text.Trim() == "" || txtNewPassword.Text.Trim() == "" || txtConfirmPassword.Text.Trim() == "")
            {
                lblError.Text = "You must enter old, new and confirm password";
            }
            else {
                try
                {
                    DataTable dt = com.getData("HumanResources.Users", " where UserName=N'" + Session["AccountName"]
                        + "'");
                    if (txtOldPassword.Text.Trim() != dt.Rows[0][1].ToString())
                    {
                        lblError.Text = "Your old password is incorrect. Please try again";
                        txtOldPassword.Text = "";
                    }
                    else {
                        if (txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
                        {
                            lblError.Text = "Your new password and confirm password are not the same. Please try again";
                            txtNewPassword.Text = "";
                            txtConfirmPassword.Text = "";
                        }
                        else {
                            com.updateTable("HumanResources.Users", " Password=N'"+txtNewPassword.Text.Trim()+"'"
                                +" where UserName=N'"+Session["AccountName"].ToString()+"'");
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
