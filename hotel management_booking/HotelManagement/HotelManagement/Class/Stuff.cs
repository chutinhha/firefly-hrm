using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class Stuff
    {
        internal int StuffID;
        internal string StuffContent;
        internal CommonFunction com = new CommonFunction();
        public Stuff() { }
        public Stuff(int ID) {
            DataTable dt = com.getData(Message.Stuff, "*", " where " + Message.StuffID + "=" + ID);
            if (dt.Rows.Count > 0) {
                StuffID = ID;
                StuffContent = dt.Rows[0][1].ToString();
            }
        }
        public void AddStuff() {
            com.insertIntoTable(Message.Stuff, "", com.ToValue(StuffContent).ToString(), false);
        }
        public void UpdateStuff() {
            com.updateTable(Message.Stuff, Message.StuffContent + "=" + com.ToValue(StuffContent)
                + " where " + Message.StuffID + "=" + StuffID);
        }
        public void RemoveStuff() {
            com.deleteFromTable(Message.Stuff, " where " + Message.StuffID + "=" + StuffID);
        }
    }
}