using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.Admin.Common.AccessDenied
{
    public partial class AccessDeniedUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer != null)
            {
                hlkBack.Visible = true;
                hlkBack.NavigateUrl = Request.UrlReferrer.ToString();
            }
            else {
                hlkBack.Visible = false;
            }
        }
    }
}
