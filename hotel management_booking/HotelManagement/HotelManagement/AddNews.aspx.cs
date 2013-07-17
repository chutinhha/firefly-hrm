using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagement
{
    public partial class AddNews : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try{
                Session["MenuID"] = "5";
                Page.Header.Title = "Create News";
                if (Session["UserLevel"] != null)
                {
                    if (Session["UserLevel"].ToString() == "1") { }
                    else
                    {
                        Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                        Response.Redirect("Home.aspx");
                    }
                }
                else {
                    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception)
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try{
                Class.News News = new Class.News();
                News.Date = DateTime.Today;
                News.NewsContent = Server.HtmlDecode(CKEditor1.Text).ToString();
                News.Poster = "1";
                News.Title = Server.HtmlDecode(txtTitle.Text);
                News.AddNews();
                Response.Redirect("News.aspx?ID="+com.getTopID(Message.NewsTable));
            }
            catch (Exception)
            {
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("News.aspx");
        }
    }
}