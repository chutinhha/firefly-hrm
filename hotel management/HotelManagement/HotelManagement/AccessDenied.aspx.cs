using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagement
{
    public partial class AccessDenied : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLink.Text = "<br>Access to <a href='" + Session["CurrentPage"] + "'>"
                + Session["CurrentPage"] + "</a> has been denied.<br><br>You are seeing this page "
                    + "because of the page you are trying to access containt information that you do"
                    + " not have permission or may be you have missed some action that must be done "
                    + "to access this page.<br><br>If you want to go to homepage, click <a href='Home.aspx'>here</a>";
        }
    }
}