using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class News
    {
        internal string NID;
        internal string Title;
        internal DateTime Date;
        internal string NewsContent;
        internal string Poster;
        CommonFunction com = new CommonFunction();
        public News() { }
        public News(int NewsID) {
            DataTable News = com.getData(Message.NewsTable, "*", " where " + Message.NewsID + "=" + NewsID);
            if (News.Rows.Count > 0) {
                NID = NewsID.ToString();
                Title = News.Rows[0][1].ToString();
                Date = DateTime.Parse(News.Rows[0][2].ToString());
                NewsContent = News.Rows[0][3].ToString();
                Poster = News.Rows[0][4].ToString();
            }
        }
        public void AddNews() {
            com.insertIntoTable(Message.NewsTable, "", com.ToValue(Title)+","+com.ToValue(Date)+","
                + com.ToValue(NewsContent) + "," + com.ToValue(Poster), false);
        }
        public void UpdateNews() {
            com.updateTable(Message.NewsTable, Message.Title + "=" + com.ToValue(Title) + "," + Message.Date 
                + "=" + com.ToValue(Date) + "," + Message.NewsContent + "=" + com.ToValue(NewsContent) 
                + "," + Message.Poster + "=" + com.ToValue(Poster) +" where "+Message.NewsID+"="
                + com.ToValue(NID));
        }
        public void RemoveNews() {
            com.deleteFromTable(Message.NewsTable, " where " + Message.NewsID + "=" + NID);
        }
    }
}