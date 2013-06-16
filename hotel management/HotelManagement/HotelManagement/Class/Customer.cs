using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HotelManagement.Class
{
    public class Customer
    {
        internal int CusID;
        internal string FirstName;
        internal string MiddleName;
        internal string LastName;
        internal bool Gender;
        internal string PhoneNumber;
        internal DateTime LastCheckIn;
        internal DateTime LastCheckOut;
        internal int LastStay;
        internal int LastRoom;
        internal DateTime CheckInDate;
        internal DateTime CheckOutDate;
        internal int Stay;
        internal int Discount;
        internal float Prepaid;
        internal float Remain;
        internal float Total;
        internal string Email;
        internal bool Status;
        CommonFunction com = new CommonFunction();
        public Customer() {
        }
        public Customer(int CustomerID)
        {
            DataTable NewCustomer = com.getData(Message.CustomerTable, "*", " where "
                + Message.CustomerID + "=" + CustomerID);
            if (NewCustomer.Rows.Count > 0) {
                CusID = int.Parse(NewCustomer.Rows[0][0].ToString());
                FirstName = NewCustomer.Rows[0][1].ToString();
                MiddleName = NewCustomer.Rows[0][2].ToString();
                LastName = NewCustomer.Rows[0][3].ToString();
                Gender = bool.Parse(NewCustomer.Rows[0][4].ToString());
                PhoneNumber = NewCustomer.Rows[0][5].ToString();
                LastCheckIn = DateTime.Parse(NewCustomer.Rows[0][6].ToString());
                LastCheckOut = DateTime.Parse(NewCustomer.Rows[0][7].ToString());
                LastStay = int.Parse(NewCustomer.Rows[0][8].ToString());
                LastRoom = int.Parse(NewCustomer.Rows[0][9].ToString());
                CheckInDate = DateTime.Parse(NewCustomer.Rows[0][10].ToString());
                CheckOutDate = DateTime.Parse(NewCustomer.Rows[0][11].ToString());
                Stay = int.Parse(NewCustomer.Rows[0][12].ToString());
                Discount = int.Parse(NewCustomer.Rows[0][13].ToString());
                Prepaid = float.Parse(NewCustomer.Rows[0][14].ToString());
                Remain = float.Parse(NewCustomer.Rows[0][15].ToString());
                Total = float.Parse(NewCustomer.Rows[0][16].ToString());
                Email = NewCustomer.Rows[0][17].ToString();
                Status = bool.Parse(NewCustomer.Rows[0][18].ToString());
            }
        }
        public void AddCustomer() {
            com.insertIntoTable(Message.CustomerTable, "", com.ToValue(FirstName) + "," 
                + com.ToValue(MiddleName)+"," + com.ToValue(LastName) + "," + com.ToValue(Gender) 
                + "," + com.ToValue(PhoneNumber) + "," + com.ToValue(LastCheckIn) + "," 
                + com.ToValue(LastCheckOut) + "," + com.ToValue(LastStay) + "," + com.ToValue(LastRoom) 
                + "," + com.ToValue(CheckInDate) + "," + com.ToValue(CheckOutDate) + "," + com.ToValue(Stay)
                +","+com.ToValue(Discount)+","+com.ToValue(Prepaid)+","+com.ToValue(Remain)+","
                + com.ToValue(Total) + "," + com.ToValue(Email) + "," + com.ToValue(Status), false);
        }
        public void UpdateCustomer() {
            com.updateTable(Message.CustomerTable, Message.FirstName+"="+com.ToValue(FirstName)+","
                +Message.MiddleName+"="+com.ToValue(MiddleName)+","+Message.LastName+"="
                +com.ToValue(LastName) +","+Message.Gender+"="+com.ToValue(Gender)+","+Message.PhoneNumber
                +"="+com.ToValue(PhoneNumber) +","+Message.LastCheckIn+"="+com.ToValue(LastCheckIn)+","
                +Message.LastCheckOut+"=" +com.ToValue(LastCheckOut)+","+Message.LastStay+"="
                +com.ToValue(LastStay)+","+Message.LastRoom +"="+com.ToValue(LastRoom)+","+Message.CheckIn
                +"="+com.ToValue(CheckInDate)+","+Message.CheckOut +"="+com.ToValue(CheckOutDate)+","
                +Message.Stay+"="+com.ToValue(Stay)+","+Message.Discount+"=" +com.ToValue(Discount)+","
                +Message.Prepaid+"="+com.ToValue(Prepaid)+","+Message.Remain+"="+com.ToValue(Remain)
                +","+Message.Total+"="+com.ToValue(Total)+","+Message.Email+"="+com.ToValue(Email)+","
                +Message.Status + "=" + com.ToValue(Status) + " where " + Message.CustomerID + "="
                + com.ToValue(CusID));
        }
        public void RemoveCustomer(){
            com.updateTable(Message.CustomerTable, Message.Status+"='False' where " + Message.CustomerID
                + "=" + CusID);
        }
    }
}