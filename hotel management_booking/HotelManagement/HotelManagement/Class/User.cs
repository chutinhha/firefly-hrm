using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class User
    {
        internal int UID;
        internal int UserLevel;
        internal string UserName;
        internal string Password;
        internal string FullName;
        internal string PhoneNumber;
        internal string Address;
        internal string Email;
        internal string RoomManage;
        internal bool Status;
        internal CommonFunction com = new CommonFunction();
        public User() { }
        public User(int UserID) {
            DataTable NewUser = com.getData(Message.UserAccountTable, "*", " where " + Message.UserID
                + "=" + UserID);
            if (NewUser.Rows.Count > 0) {
                UID = UserID;
                UserLevel = int.Parse(NewUser.Rows[0][1].ToString());
                UserName = NewUser.Rows[0][2].ToString();
                Password = NewUser.Rows[0][3].ToString();
                FullName = NewUser.Rows[0][4].ToString();
                PhoneNumber = NewUser.Rows[0][5].ToString();
                Address = NewUser.Rows[0][6].ToString();
                Email = NewUser.Rows[0][7].ToString();
                RoomManage = NewUser.Rows[0][8].ToString();
                Status = bool.Parse(NewUser.Rows[0][9].ToString());
            }
        }
        public User(string UName) {
            DataTable NewUser = com.getData(Message.UserAccountTable, "*", " where " + Message.UserName
                + "=" + com.ToValue(UName));
            if (NewUser.Rows.Count > 0)
            {
                UID = int.Parse(NewUser.Rows[0][0].ToString());
                UserLevel = int.Parse(NewUser.Rows[0][1].ToString());
                UserName = NewUser.Rows[0][2].ToString();
                Password = NewUser.Rows[0][3].ToString();
                FullName = NewUser.Rows[0][4].ToString();
                PhoneNumber = NewUser.Rows[0][5].ToString();
                Address = NewUser.Rows[0][6].ToString();
                Email = NewUser.Rows[0][7].ToString();
                RoomManage = NewUser.Rows[0][8].ToString();
                Status = bool.Parse(NewUser.Rows[0][9].ToString());
            }
        }
        public void AddUser() {
            com.insertIntoTable(Message.UserAccountTable, "", com.ToValue(UserLevel)+","
                +com.ToValue(UserName)+"," + com.ToValue(com.CalculateMD5Hash(Password)) + "," + com.ToValue(FullName) + "," 
                + com.ToValue(PhoneNumber) + "," + com.ToValue(Address) + "," + com.ToValue(Email) + "," 
                + com.ToValue(RoomManage) +","+com.ToValue(Status), false);
        }
        public void UpdateUser() {
            com.updateTable(Message.UserAccountTable, Message.UserLevel + "=" + com.ToValue(UserLevel) 
                + "," + Message.UserName + "=" + com.ToValue(UserName) + "," + Message.Password + "=" 
                + com.ToValue(com.CalculateMD5Hash(Password)) + "," + Message.FullName + "=" + com.ToValue(FullName)
                + "," + Message.PhoneNumber + "=" + com.ToValue(PhoneNumber) + "," + Message.Address 
                + "=" + com.ToValue(Address) + "," + Message.Email + "=" + com.ToValue(Email) + "," 
                + Message.RoomManage + "=" + com.ToValue(RoomManage) + "," + Message.Status + "="
                + com.ToValue(Status) + " where " + Message.UserID + "=" + com.ToValue(UID));
        }
        public void RemoveUser() {
            com.updateTable(Message.UserAccountTable, Message.Status + "='False' where "
                + Message.UserID + "=" + UID);
        }
    }
}