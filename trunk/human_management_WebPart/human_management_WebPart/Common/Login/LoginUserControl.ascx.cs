using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using Microsoft.SharePoint;
using System.Security.Principal;
using Microsoft.SharePoint.WebControls;
using System.Text;
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
            string user = _com.getCurrentUser();
            DataTable dt = _com.getData(Message.TableEmployee + " e join " + Message.TablePerson + " p on e."
                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "e." + Message.BusinessEntityIDColumn
                + ",p." + Message.NameColumn, " where e." + Message.LoginIDColumn + "='" + user + "'");
            Session["AccountID"] = dt.Rows[0][0].ToString();
            Session["Account"] = _com.getRank(SPControl.GetContextWeb(this.Context));
            Session["PersonName"] = dt.Rows[0][1].ToString().Trim();
            Session["AccountName"] = user;
            Response.Redirect(Session["Account"].ToString() + ".aspx");
        }
    }
}
