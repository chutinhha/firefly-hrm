using System;
using System.Data;
using System.Web;
using System.Web.UI;
using Microsoft.SharePoint.WebControls;
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
            if (dt.Rows.Count > 0)
            {
                Session["AccountID"] = dt.Rows[0][0].ToString();
                Session["Account"] = _com.getRank(SPControl.GetContextWeb(this.Context));
                Session["PersonName"] = dt.Rows[0][1].ToString().Trim();
                Session["AccountName"] = user;
                if (Session["Account"]!=null)
                {
                    if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("Home.aspx"))
                    {
                        Response.Redirect(Session["Account"].ToString() + ".aspx");
                    }
                }
                else {
                    Response.Redirect(Message.HomePage);
                }
            }
        }
    }
}
