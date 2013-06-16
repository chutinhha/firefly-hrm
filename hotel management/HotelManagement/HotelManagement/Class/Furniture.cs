using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class Furniture
    {
        internal string FurID;
        internal string CurrentRoom;
        internal string CurrentBuilding;
        internal string Description;
        internal string Price;
        internal string FurType;
        internal string Name;
        internal string Status;
        internal string MadeIn;
        internal string StartWarranty;
        internal string EndWarranty;
        internal string HandoverID;
        internal string CollectionID;
        internal string NumberInCollection;
        internal string Picture;
        internal string ApproveDelete;
        internal string TargetRoomID;
        internal string ApproveMove;
        internal string Reason;
        internal CommonFunction com = new CommonFunction();
        public Furniture() { }
        public Furniture(string FurnitureID)
        {
            DataTable NewFurniture = com.getData(Message.FurnitureTable, "*", " where " + Message.FurnitureID
                + "=" + FurnitureID);
            if (NewFurniture.Rows.Count > 0) {
                FurID = FurnitureID;
                CurrentBuilding = NewFurniture.Rows[0][1].ToString();
                Description = NewFurniture.Rows[0][2].ToString();
                Price = NewFurniture.Rows[0][3].ToString();
                FurType = NewFurniture.Rows[0][4].ToString();
                Name = NewFurniture.Rows[0][5].ToString();
                Status = NewFurniture.Rows[0][6].ToString();
                MadeIn = NewFurniture.Rows[0][7].ToString();
                StartWarranty = NewFurniture.Rows[0][8].ToString();
                EndWarranty = NewFurniture.Rows[0][9].ToString();
                HandoverID = NewFurniture.Rows[0][10].ToString();
                CollectionID = NewFurniture.Rows[0][11].ToString();
                NumberInCollection = NewFurniture.Rows[0][12].ToString();
                Picture = NewFurniture.Rows[0][13].ToString();
                CurrentRoom = NewFurniture.Rows[0][14].ToString();
                ApproveDelete = NewFurniture.Rows[0][15].ToString();
                TargetRoomID = NewFurniture.Rows[0][16].ToString();
                ApproveMove = NewFurniture.Rows[0][17].ToString();
                Reason = NewFurniture.Rows[0][18].ToString();
            }
        }
        public void AddFurniture() {
            com.insertIntoTable(Message.FurnitureTable, "", com.ToValue(CurrentBuilding) + ","
                +com.ToValue(Description)+"," +com.ToValue(Price)+","+com.ToValue(FurType)
                +","+com.ToValue(Name)+","+com.ToValue(Status)+","+com.ToValue(MadeIn)+","
                +com.ToValue(StartWarranty)+"," + com.ToValue(EndWarranty) + "," 
                + com.ToValue(HandoverID) + "," + com.ToValue(CollectionID) + ","
                + com.ToValue(NumberInCollection) + "," + com.ToValue(Picture) + "," + com.ToValue(CurrentRoom)+",'0',NULL,NULL,NULL", false);
        }
        public void UpdateFurniture() {
            com.updateTable(Message.FurnitureTable, Message.CurrentRoom + "=" + com.ToValue(CurrentRoom) 
                + "," + Message.Description + "=" + com.ToValue(Description) + "," + Message.Price + "=" 
                + com.ToValue(Price) + "," + Message.FurnitureType + "=" + com.ToValue(FurType) + "," 
                + Message.Name + "=" + com.ToValue(Name) +"," + Message.Status + "=" + com.ToValue(Status) 
                + "," + Message.MadeIn + "=" + com.ToValue(MadeIn) + "," + Message.StartWarranty + "=" 
                + com.ToValue(StartWarranty) + "," + Message.EndWarranty + "=" + com.ToValue(EndWarranty) 
                + "," + Message.HandoverID + "=" + com.ToValue(HandoverID) + "," + Message.CollectionID
                + "=" + com.ToValue(CollectionID) + "," + Message.NumberInCollection + "=" 
                + com.ToValue(NumberInCollection) + "," + Message.Picture + "="+com.ToValue(Picture)+","+Message.CurrentBuilding
                +"="+com.ToValue(CurrentBuilding)+" where " 
                + Message.FurnitureID + "=" + com.ToValue(FurID));
        }
        public void RemoveFurniture(int status) {
            com.updateTable(Message.Furniture, Message.Status + "='False'," + Message.ApproveDelete 
                + "='"+status+"' where " + Message.FurnitureID + "=" + FurID);
        }
        public void MoveFurniture(int TargetRoom, int ApproveMove, string handover,string reason)
        {
            if (ApproveMove!=1)
            {
                if (reason == "")
                {
                    com.updateTable(Message.Furniture, Message.TargetRoomID + "='" + TargetRoom + "'," + Message.ApproveMove + "=" + ApproveMove + " where "
                        + Message.FurnitureID + "=" + FurID);
                }
                else {
                    com.updateTable(Message.Furniture, Message.TargetRoomID + "='" + TargetRoom + "'," + Message.ApproveMove + "=" + ApproveMove + ","
                        +Message.Reason+"=N'"+reason+"' where "
                        + Message.FurnitureID + "=" + FurID);
                }
            }
            else if (ApproveMove == 1)
            {
                DataTable dt = com.getData(Message.RoomTable, Message.BuildingID, " where " + Message.RoomID
                    + "=" + TargetRoom);
                com.updateTable(Message.Furniture, Message.CurrentBuilding + "=" + dt.Rows[0][0].ToString()
                    + "," + Message.CurrentRoom + "=" + TargetRoom + "," 
                    + Message.ApproveMove + "=" + ApproveMove + " where " + Message.FurnitureID + "=" + FurID);
                if (reason != "")
                {
                    com.insertIntoTable(Message.FurnitureHistory, "", FurID + "," + CurrentBuilding + "," + CurrentRoom
                        + "," + com.ToValue(DateTime.Now) + "," + handover + "," + com.ToValue(reason), false);
                }
                else {
                    com.insertIntoTable(Message.FurnitureHistory, "", FurID + "," + CurrentBuilding + "," + CurrentRoom
                        + "," + com.ToValue(DateTime.Now) + "," + handover + "," + com.ToValue(Reason), false);
                }
            }
        }
        public string GetFurTypeID(string FyrType) {
            DataTable dt = com.getData(Message.FurnitureTypeTable, Message.FurnitureType, " where "
                + Message.Description + "=N'" + FyrType + "'");
            return dt.Rows[0][0].ToString();
        }
    }
}