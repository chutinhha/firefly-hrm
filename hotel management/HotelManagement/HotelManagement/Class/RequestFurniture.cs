using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class RequestFurniture
    {
        internal string RequestID;
        internal string RoomID;
        internal string Comment;
        internal string RequestUser;
        internal string Status;
        internal CommonFunction com = new CommonFunction();
        public RequestFurniture() { }
        public RequestFurniture(string ID) {
            DataTable dt = com.getData(Message.RequestFurniture, "*", " where " + Message.RequestID
                + "=" + ID);
            RequestID = ID;
            RoomID = dt.Rows[0][1].ToString();
            Comment = dt.Rows[0][2].ToString();
            RequestUser = dt.Rows[0][3].ToString();
            Status = dt.Rows[0][4].ToString();
        }
        public void AddRequest() {
            com.insertIntoTable(Message.RequestFurniture,"", com.ToValue(RoomID) + "," + com.ToValue(Comment)
                + "," + com.ToValue(RequestUser) + "," + com.ToValue(Status),false);
        }
        public void UpdateRequest() {
            com.updateTable(Message.RequestFurniture, Message.RoomID + "=" + com.ToValue(RoomID) + ","
                + Message.Comment + "=" + com.ToValue(Comment) + "," + Message.RequestUser + "="
                + com.ToValue(RequestUser) + "," + Message.Status + "=" + com.ToValue(Status) + " where "
                + Message.RequestID + "=" + RequestID);
        }
        public void RemoveRequest() {
            com.updateTable(Message.RequestFurniture, Message.Status + "=2 where " + Message.RequestID
                + "=" + RequestID);
        }
    }
}