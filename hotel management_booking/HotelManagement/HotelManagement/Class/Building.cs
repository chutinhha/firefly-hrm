using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class Building
    {
        internal string BID;
        internal string BuildingTypeID;
        internal string Address;
        internal string Price;
        internal string Garage;
        internal string Pool;
        internal string Garden;
        internal string BedRoom;
        internal string BathRoom;
        internal string Description;
        internal string Area;
        internal string Picture;
        internal string Status;
        internal string RentTime;
        internal string District;
        internal string Coordinate;
        internal string NumberFloor;
        internal CommonFunction com = new CommonFunction();
        public Building() { }
        public Building(string BuildingID) {
            DataTable NewBuilding = com.getData(Message.BuildingTable, "*", " where " + Message.BuildingID
                + "=" + BuildingID);
            if (NewBuilding.Rows.Count > 0)
            {
                BID = NewBuilding.Rows[0][0].ToString();
                BuildingTypeID = NewBuilding.Rows[0][1].ToString();
                Address = NewBuilding.Rows[0][2].ToString();
                Price = NewBuilding.Rows[0][3].ToString();
                Garage = NewBuilding.Rows[0][4].ToString();
                Pool = NewBuilding.Rows[0][5].ToString();
                Garden = NewBuilding.Rows[0][6].ToString();
                BedRoom = NewBuilding.Rows[0][7].ToString();
                BathRoom = NewBuilding.Rows[0][8].ToString();
                Description = NewBuilding.Rows[0][9].ToString();
                Area = NewBuilding.Rows[0][10].ToString();
                Picture = NewBuilding.Rows[0][11].ToString();
                Status = NewBuilding.Rows[0][12].ToString();
                RentTime = NewBuilding.Rows[0][13].ToString();
                District = NewBuilding.Rows[0][14].ToString();
                Coordinate = NewBuilding.Rows[0][15].ToString();
                NumberFloor = NewBuilding.Rows[0][16].ToString();
            }
        }
        public void AddBuilding() { 
            com.insertIntoTable(Message.BuildingTable,"",com.ToValue(BuildingTypeID)+","+com.ToValue(Address) 
                + "," + com.ToValue(Price) + "," + com.ToValue(Garage) + "," + com.ToValue(Pool) + "," 
                + com.ToValue(Garden) + "," + com.ToValue(BedRoom) +","+com.ToValue(BathRoom)+","
                +com.ToValue(Description)+","+com.ToValue(Area)+","+com.ToValue(Picture)+","
                +com.ToValue(Status) +","+com.ToValue(RentTime)+","+com.ToValue(District)+","+com.ToValue(Coordinate)
                + "," + com.ToValue(NumberFloor), false);
        }
        public void UpdateBuilding() {
            com.updateTable(Message.BuildingTable, 
                Message.BuildingTypeID + "=" + com.ToValue(BuildingTypeID) + "," + Message.Address 
                + "=" + com.ToValue(Address) + "," + Message.Price + "=" 
                + com.ToValue(Price) + "," + Message.Area + "=" + com.ToValue(Area) + "," + Message.Garage 
                + "=" + com.ToValue(Garage) + "," + Message.Pool + "=" + com.ToValue(Pool) + "," 
                + Message.Garden + "=" + com.ToValue(Garden) + "," + Message.BedRoom + "=" 
                + com.ToValue(BedRoom) + "," + Message.BathRoom + "=" + com.ToValue(BathRoom) + "," 
                + Message.Description + "=" + com.ToValue(Description) + "," + Message.Picture + "=" 
                + com.ToValue(Picture) + "," + Message.Status+"="+com.ToValue(Status)+","+Message.RentTime
                +"="+com.ToValue(RentTime)+ ","+Message.District+"="+com.ToValue(District)
                + "," + Message.Coordinates + "=" + com.ToValue(Coordinate)
                + "," + Message.NumberFloor + "=" + com.ToValue(NumberFloor)
                +" where " + Message.BuildingID + "=" + com.ToValue(BID));
        }
        public void RemoveBuilding() {
            com.updateTable(Message.BuildingTable, Message.Status+"='3' where " + Message.BuildingID
                + "=" + BID);
            DataTable dt = com.getData(Message.UserAccountTable,Message.RoomManage+","+Message.UserID," where "+Message.UserLevel+"=2 and "
                +Message.RoomManage+" is not NULL");
            for (int i = 0; i < dt.Rows.Count; i++) {
                if (dt.Rows[i][0].ToString().Contains("|" + BID + "|")) 
                { 
                    com.updateTable(Message.UserAccountTable,Message.RoomManage+"='"
                        +dt.Rows[i][0].ToString().Replace("|"+BID+"|","|")+"'");
                }else if (dt.Rows[i][0].ToString().Contains(BID + "|") && dt.Rows[i][0].ToString().IndexOf(BID + "|") == 0){
                    com.updateTable(Message.UserAccountTable, Message.RoomManage + "='"
                        + dt.Rows[i][0].ToString().Replace(BID + "|", "") + "'");
                }
            }
        }
        public string GetBuildingType() { 
            DataTable dt = com.getData(Message.BuildingTypeTable,Message.Description," where "
                +Message.BuildingTypeID+"="+BuildingTypeID);
            return dt.Rows[0][0].ToString();
        }
        public string isAvailable()
        {       
            if (Status == "0")
            {
                return "Yes";
            }
            else {
                return "No";
            }
        }
        public string haveGarage()
        {
            if (Garage=="True")
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
        public string havePool()
        {
            if (Pool=="True")
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
        public string haveGarden()
        {
            if (Garden=="True")
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
        public DataTable getFurniture() {
            DataTable dt = com.getData(Message.FurnitureTable, Message.Name + "," + Message.Description
                + "," + Message.MadeIn + "," + Message.NumberInCollection+","+Message.Picture, " where " 
                + Message.CurrentBuilding + "=" + BID);
            for (int i = 0; i < dt.Rows.Count; i++) {
                if (dt.Rows[i][1].ToString() == "") {
                    dt.Rows[i][1] = "No description";
                }    
            }
            return dt;
        }
    }
}