using System;
using System.Web;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Common.AccessDenied
{
    public partial class AccessDeniedUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLink.Text = "<br>Access to <a href='" + Session["CurrentPage"] + "'>" 
                + Session["CurrentPage"] + "</a> has been denied.<br><br>You are seeing this page "
                    +"because of the page you are trying to access containt information that you do"
                    +" not have permission or may be you have missed some action that must be done "
                    +"to access this page.<br><br>If you want to go to homepage, click <a href='"
                    +Message.HomePage+"'>here</a>";
        }
    }
}
