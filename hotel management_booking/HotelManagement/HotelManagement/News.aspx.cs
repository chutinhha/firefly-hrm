using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class News : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["MenuID"] = "5";
            Page.Header.Title = "News";
            string NewsID = Request.QueryString["ID"];
            if (Session["UserLevel"] != null)
            {
                if (Session["UserLevel"].ToString() == "1") { }
                else
                {
                    btnEdit.Visible = true;
                }
            }
            else
            {
                btnEdit.Visible = false;
            }
            if (NewsID == null) {
                string PageNumber = Request.QueryString["Page"];
                pnlEdit.Visible = false;
                pnlNew.Visible = false;
                pnlAllNews.Controls.Add(new LiteralControl("<br><div class=\"componentheading\">News"));
                Button btnCreate = new Button();
                btnCreate.ID = "btnCreate";
                btnCreate.Text = "+ Post New News";
                btnCreate.Click += this.btnCreate_Click;
                btnCreate.BackColor = System.Drawing.ColorTranslator.FromHtml("#034569");
                btnCreate.Attributes.Add("style", "float:right;color:white;border:none;height:25px;");
                pnlAllNews.Controls.Add(btnCreate);
                if (Session["UserLevel"] != null)
                {
                    if (Session["UserLevel"].ToString() == "1") { }
                    else
                    {
                        btnCreate.Visible = true;
                    }
                }
                else
                {
                    btnCreate.Visible = false;
                }
                pnlAllNews.Controls.Add(new LiteralControl("</div><hr><br>"));
                if (PageNumber == null)
                {
                    DataTable AllNews = com.getData(Message.NewsTable, "*", " order by " + Message.Date
                        + " desc");
                    if (AllNews.Rows.Count > 0)
                    {
                        int end;
                        if (AllNews.Rows.Count <= 5)
                        {
                            end = AllNews.Rows.Count;
                        }
                        else {
                            end = 5;
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("<table class=\"componentheading\">"));
                        for (int i = 0; i < end; i++)
                        {
                            if (AllNews.Rows[i][3].ToString().Contains(".jpg") ||
                                AllNews.Rows[i][3].ToString().Contains(".jpeg") ||
                                AllNews.Rows[i][3].ToString().Contains(".png") ||
                                AllNews.Rows[i][3].ToString().Contains(".bmp") ||
                                AllNews.Rows[i][3].ToString().Contains(".gif") ||
                                AllNews.Rows[i][3].ToString().Contains(".tif") ||
                                AllNews.Rows[i][3].ToString().Contains(".jpe") ||
                                AllNews.Rows[i][3].ToString().Contains(".dib"))
                            {
                                string imageLink = AllNews.Rows[i][3].ToString();
                                imageLink = imageLink.Substring(imageLink.IndexOf("src=") + 5, imageLink.Length - imageLink.IndexOf("src=") - 5);
                                imageLink = imageLink.Substring(0,
                                imageLink.IndexOf("\""));
                                pnlAllNews.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"News.aspx?ID="
                                    + AllNews.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"" + imageLink + "\"></a></td>"));
                            }
                            else
                            {
                                pnlAllNews.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"News.aspx?ID="
                                    + AllNews.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"/Images/noimage.jpg\"></a></td>"));
                            }
                            pnlAllNews.Controls.Add(new LiteralControl("<td style=\"padding-left:1%;vertical-align: top;\"><a style=\"color:#1D8A0D;font-size:14pt;\" href=\"News.aspx?ID="
                                    + AllNews.Rows[i][0].ToString() + "\">" + AllNews.Rows[i][1].ToString()
                                + "</a><br><span style=\"color:#474747;font-size:12px;font-weight:normal;\">" + AllNews.Rows[i][2].ToString() + "</span></td></tr><tr><td colspan=\"2\" style=\"height:30px;\"></td></tr>"));
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("</table>"));
                        int totalPage;
                        if (double.Parse(AllNews.Rows.Count.ToString()) / 5 > AllNews.Rows.Count / 5)
                        {
                            totalPage = AllNews.Rows.Count / 5 + 1;
                        }
                        else
                        {
                            totalPage = AllNews.Rows.Count / 5;
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("<div style=\"background:transparent url(/Images/phantrang.jpg) no-repeat right 0px;text-align:right;\">"));
                        for (int i = 0; i < totalPage; i++)
                        {
                            if (i < 9)
                            {
                                pnlAllNews.Controls.Add(new LiteralControl("<a href=\"News.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                            }
                            else
                            {
                                pnlAllNews.Controls.Add(new LiteralControl("...&nbsp;&nbsp;<a href=\"News.aspx?Page=" + totalPage + "\">Last page</a>&nbsp;&nbsp;"));
                                break;
                            }
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("</div><br>"));
                    }
                }
                else {
                    DataTable AllNews = com.getData(Message.NewsTable, "*", " order by " + Message.Date
                        + " desc");
                    if (AllNews.Rows.Count > 0)
                    {
                        int end;
                        if (AllNews.Rows.Count <= 5*int.Parse(PageNumber))
                        {
                            end = AllNews.Rows.Count;
                        }
                        else
                        {
                            end = 5 * int.Parse(PageNumber);
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("<table class=\"componentheading\">"));
                        for (int i = 5 * (int.Parse(PageNumber)-1); i < end; i++)
                        {
                            if (AllNews.Rows[i][3].ToString().Contains(".jpg") ||
                                AllNews.Rows[i][3].ToString().Contains(".jpeg") ||
                                AllNews.Rows[i][3].ToString().Contains(".png") ||
                                AllNews.Rows[i][3].ToString().Contains(".bmp") ||
                                AllNews.Rows[i][3].ToString().Contains(".gif") ||
                                AllNews.Rows[i][3].ToString().Contains(".tif") ||
                                AllNews.Rows[i][3].ToString().Contains(".jpe") ||
                                AllNews.Rows[i][3].ToString().Contains(".dib"))
                            {
                                string imageLink = AllNews.Rows[i][3].ToString();
                                imageLink = imageLink.Substring(imageLink.IndexOf("src=") + 5, imageLink.Length - imageLink.IndexOf("src=") - 5);
                                imageLink = imageLink.Substring(0,
                                imageLink.IndexOf("\""));
                                pnlAllNews.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"News.aspx?ID="
                                    + AllNews.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"" + imageLink + "\"></a></td>"));
                            }
                            else
                            {
                                pnlAllNews.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"News.aspx?ID="
                                    + AllNews.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"/Images/noimage.jpg\"></a></td>"));
                            }
                            pnlAllNews.Controls.Add(new LiteralControl("<td style=\"padding-left:1%;vertical-align: top;\"><a style=\"color:#1D8A0D;font-size:14pt;\" href=\"News.aspx?ID="
                                    + AllNews.Rows[i][0].ToString() + "\">" + AllNews.Rows[i][1].ToString()
                                + "</a><br><span style=\"color:#474747;font-size:12px;font-weight:normal;\">" + AllNews.Rows[i][2].ToString() + "</span></td></tr><tr><td colspan=\"2\" style=\"height:30px;\"></td></tr>"));
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("</table>"));
                        int totalPage;
                        if (double.Parse(AllNews.Rows.Count.ToString()) / 5 > AllNews.Rows.Count / 5)
                        {
                            totalPage = AllNews.Rows.Count / 5 + 1;
                        }
                        else
                        {
                            totalPage = AllNews.Rows.Count / 5;
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("<div style=\"background:transparent url(/Images/phantrang.jpg) no-repeat right 0px;text-align:right;\">"));
                        int start;
                        if (int.Parse(PageNumber) * 2 < 10)
                        {
                            start = 0;
                        }
                        else if (int.Parse(PageNumber) + 4 < totalPage)
                        {
                            start = int.Parse(PageNumber) - 4;
                        }
                        else {
                            start = totalPage - 9;
                        }
                        if (start < 0) {
                            start = 0;
                        }
                        if (start > 0) {
                            pnlAllNews.Controls.Add(new LiteralControl("<a href=\"News.aspx?Page=1\">First page</a>...&nbsp;&nbsp;"));
                        }
                        for (int i = start; i < totalPage; i++)
                        {
                            if (i <= 8 + start)
                            {
                                if (i == int.Parse(PageNumber) - 1) {
                                    pnlAllNews.Controls.Add(new LiteralControl("<a style=\"color:blue;font-weight: bold;\" href=\"News.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                }
                                else
                                {
                                    pnlAllNews.Controls.Add(new LiteralControl("<a href=\"News.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                }
                            }
                            else
                            {
                                pnlAllNews.Controls.Add(new LiteralControl("...&nbsp;&nbsp;<a href=\"News.aspx?Page=" + totalPage + "\">Last page</a>&nbsp;&nbsp;"));
                                break;
                            }
                        }
                        pnlAllNews.Controls.Add(new LiteralControl("</div><br>"));
                    }
                }
            }
            else {
                pnlNew.Visible = true;
                pnlAllNews.Visible = false;
                Class.News News = new Class.News(int.Parse(NewsID));
                if (News.NID == null) { }
                else {
                    NewsContent.Text = News.NewsContent;
                    NewsTitle.Text = News.Title;
                    Date.Text = News.Date.ToString();
                    DataTable NewsPoster = com.getData(Message.UserAccountTable, Message.FullName,
                        " where " + Message.UserID + "=" + News.Poster);
                    Poster.Text = NewsPoster.Rows[0][0].ToString();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = true;
            pnlNew.Visible = false;
            CKEditor1.Text = NewsContent.Text;
            txtTitle.Text = NewsTitle.Text;
        }
        protected void btnCreate_Click(object sender, EventArgs e) {
            Response.Redirect("AddNews.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlNew.Visible = true;
            pnlEdit.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string NewsID = Request.QueryString["ID"];
            if (NewsID == null) { }
            else
            {
                Class.News News = new Class.News(int.Parse(NewsID));
                if (News.NID == null) { }
                else
                {
                    News.Date = DateTime.Today;
                    News.NewsContent = CKEditor1.Text;
                    News.Title = txtTitle.Text;
                    News.UpdateNews();
                    Class.News ReloadNews = new Class.News(int.Parse(NewsID));
                    if (ReloadNews.NID == null) { }
                    else
                    {
                        NewsContent.Text = ReloadNews.NewsContent;
                        NewsTitle.Text = ReloadNews.Title;
                        Date.Text = ReloadNews.Date.ToString();
                        DataTable NewsPoster = com.getData(Message.UserAccountTable, Message.FullName,
                            " where " + Message.UserID + "=" + ReloadNews.Poster);
                        Poster.Text = NewsPoster.Rows[0][0].ToString();
                    }
                    pnlEdit.Visible = false;
                    pnlNew.Visible = true;
                }
            }
            
        }
    }
}