using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class Home : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["MenuID"] = "1";
            Page.Header.Title = "Home";
            //Set hot property
            DataTable HotProperty = com.getData(Message.BuildingTable, " top 10 " + Message.BuildingID + ","
                + Message.RentTime+","+Message.Picture, " where "+Message.Status+"<>3 order by "
                + Message.RentTime + " desc");
            HotRoom.Controls.Add(new LiteralControl("<div style=\"visibility: visible; overflow: hidden;"
                +" position: relative; z-index: 2;left: 0px; width: 576px;\" class=\"anyClass0\">"
                +"<ul style=\"margin: 0px; padding: 0px; position: relative; list-style-type: none;"
                +"z-index: 1; width: 2112px; left: -576px;\" class=\"scrollArticleBoxUl\">"));
            for (int i = 0; i < HotProperty.Rows.Count; i++) {
                string[] Picture = HotProperty.Rows[i][2].ToString().Split('|');
                HotRoom.Controls.Add(new LiteralControl("<li style=\"overflow: hidden; float: left;"
                    +" width: 160px; height: 91px;\"><div class=\"banneritem\"><a href=\"House.aspx?ID="+HotProperty.Rows[i][0].ToString()+"\">"));
                HotRoom.Controls.Add(new LiteralControl("<img src=\"Images/" + Picture[0]
                    +"\" alt=\"Banner\""+" height=\"91\" width=\"160\"></a>"));
                HotRoom.Controls.Add(new LiteralControl("</div></li>"));
            }
            HotRoom.Controls.Add(new LiteralControl("</ul></div>"));

            //Set News
            DataTable News = com.getData(Message.NewsTable, " top 5 " + Message.NewsID + "," + Message.Title
                + "," + Message.Date, " order by " + Message.Date+" desc");
            if (News.Rows.Count > 0) {
                pnlNews.Controls.Add(new LiteralControl("<div class=\"articlebox\">"));
                for (int i = 0; i < News.Rows.Count; i++) {
                    pnlNews.Controls.Add(new LiteralControl("<div class=\"articlebox_item articlebox_item_0\""
                    +" style=\"width: 99%;\"><div class=\"articlebox_datetime\">"
                    +DateTime.Parse(News.Rows[i][2].ToString()).ToShortDateString()+":"
                    +"</div><div class=\"articlebox_introtext\"><a href=\"News.aspx?ID="+News.Rows[i][0].ToString()
                    +"\">"+News.Rows[i][1].ToString()+""
                    +"</a></div></div><div style=\"clear: left;\" class=\"articlebox_row\"></div>"));
                }
                pnlNews.Controls.Add(new LiteralControl("<div class=\"articlebox_category\">"
                    +"<a href=\"News.aspx\">Read more</a></div></div>"));
            }
        }
    }
}