using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class MenuBar
    {
        internal string MenuID;
        internal string Title;
        internal string Link;
        internal string MenuLevel;
        internal string ParentID;
        internal string ApprearNo;
        internal CommonFunction com = new CommonFunction();
        public MenuBar() { }
        public MenuBar(string ID) { 
            DataTable dt = com.getData(Message.MenuBar,"*"," where "+Message.MenuID+"="+ID);
            MenuID = ID;
            Title = dt.Rows[0][1].ToString();
            Link = dt.Rows[0][2].ToString();
            MenuLevel = dt.Rows[0][3].ToString();
            ParentID = dt.Rows[0][4].ToString();
            ApprearNo = dt.Rows[0][5].ToString();
        }
        public void UpdateMenu() {
            com.updateTable(Message.MenuBar, Message.Title + "=" + com.ToValue(Title) + ","
                + Message.Link + "=" + com.ToValue(Link) + "," + Message.MenuLevel + "="
                + com.ToValue(MenuLevel) + "," + Message.ParentID + "=" + com.ToValue(ParentID)
                + "," + Message.AppearNo + "=" + com.ToValue(ApprearNo) + " where " + Message.MenuID
                + "=" + MenuID);
        }
        public void AddMenu() {
            com.insertIntoTable(Message.MenuBar, "", com.ToValue(Title) + "," + com.ToValue(Link)
                + "," + com.ToValue(MenuLevel) + "," + com.ToValue(ParentID) + "," + com.ToValue(ApprearNo), false);
        }
        public void RemoveMenu() {
            com.deleteFromTable(Message.MenuBar, " where " + Message.MenuID + "=" + MenuID
                +" or "+Message.ParentID+"="+MenuID);
        }
        public string GetMenuID(string Level, string Titl) {
            DataTable dt = com.getData(Message.MenuBar, Message.MenuID, " where " + Message.MenuLevel
                + "=" + com.ToValue(Level) + " and " + Message.Title + "=" + com.ToValue(Titl));
            return dt.Rows[0][0].ToString();
        }
    }
}