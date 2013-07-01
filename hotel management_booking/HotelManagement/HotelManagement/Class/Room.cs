using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class Room
    {
        internal string RoomID;
        internal string BuildingID;
        internal string Floor;
        internal string CurrentCustomerID;
        internal string Status;
        internal string RoomNo;
        internal string IsWareHouse;
        internal CommonFunction com = new CommonFunction();
        public Room() { }
        public Room(string RID) { 
            DataTable NewRoom = com.getData(Message.RoomTable, "*", " where " + Message.RoomID
                + "=" + RID);
            if (NewRoom.Rows.Count > 0)
            {
                RoomID = NewRoom.Rows[0][0].ToString();
                BuildingID = NewRoom.Rows[0][1].ToString();
                Floor = NewRoom.Rows[0][2].ToString();
                CurrentCustomerID = NewRoom.Rows[0][3].ToString();
                Status = NewRoom.Rows[0][4].ToString();
                RoomNo = NewRoom.Rows[0][5].ToString();
                IsWareHouse = NewRoom.Rows[0][6].ToString(); 
            }
        }
        public void AddRoom()
        {
            com.insertIntoTable(Message.RoomTable, "", com.ToValue(BuildingID) + "," + com.ToValue(Floor)
                + ",NULL,0," + com.ToValue(RoomNo) + ","+ com.ToValue(IsWareHouse), false);
        }
        public void UpdateRoom()
        {
            com.updateTable(Message.RoomTable,
                Message.BuildingID + "=" + com.ToValue(BuildingID) + "," + Message.Floor
                + "=" + com.ToValue(Floor) + "," + Message.CurrentCustomer + "="
                + com.ToValue(CurrentCustomerID) + "," + Message.Status + "=" + com.ToValue(Status) + "," + Message.RoomNo
                + "=" + com.ToValue(RoomNo) + "," + Message.IsWarehouse + "=" + com.ToValue(IsWareHouse)
                + " where " + Message.RoomID + "=" + com.ToValue(RoomID));
        }
        public void RemoveRoom()
        {
            com.updateTable(Message.RoomTable, Message.Status + "='3' where " + Message.RoomID
                + "=" + RoomID);
        }
    }
}