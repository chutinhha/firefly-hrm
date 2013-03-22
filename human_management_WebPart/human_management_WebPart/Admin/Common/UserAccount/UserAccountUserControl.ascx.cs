using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.UserAccount
{
    public partial class UserAccountUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountName"] != null)
            {
                lbtnUserName.Text = Message.Welcome + Session["AccountName"].ToString();
            }
        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("Account");
            Session.Remove("AccountName");
            Response.Redirect(Message.HomePage,true);
        }

        protected void lbtnUserName_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.PIMPage,true);
        }

        protected void lbtnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.ChangePasswordPage+Session["Account"].ToString()+".aspx",true);
        }
    }
}
