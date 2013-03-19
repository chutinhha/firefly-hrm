using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.OleDb;
using System.IO;
namespace SP2010VisualWebPart.Admin.CSV.ImportEmployee
{
    public partial class ImportEmployeeUserControl : UserControl
    {
        private Common _com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        { 
            
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            if (Path.GetExtension(fulCSV.FileName) == "csv" || Path.GetExtension(fulCSV.FileName) == "xls"
                || Path.GetExtension(fulCSV.FileName) == "xlsx")
            {
                //OledbConnection and 
                // connectionstring to connect to the Excel Sheet
                OleDbConnection oconn = new OleDbConnection
                (@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                Server.MapPath(fulCSV.FileName) + ";Extended Properties=Excel 8.0");
                try
                {
                    //After connecting to the Excel sheet here we are selecting the data 
                    //using select statement from the Excel sheet
                    OleDbCommand ocmd = new OleDbCommand("select * from [Sheet1$]", oconn);
                    oconn.Open();  //Here [Sheet1$] is the name of the sheet 
                    //in the Excel file where the data is present
                    OleDbDataReader odr = ocmd.ExecuteReader();
                    string loginID = "";
                    string jobID = "";
                    string birthDate = "";
                    string maritalStatus = "";
                    string gender = "";
                    string hireDate = "";
                    string salaryFlag = "";
                    string vacationHours = "";
                    string sickLeaveHours = "";
                    string currentFlag = "";
                    string modifiedDate = "";
                    while (odr.Read())
                    {
                        loginID = _com.valid(odr, 0);//Here we are calling the valid method
                        jobID = _com.valid(odr, 1);
                        birthDate = _com.valid(odr, 2);
                        maritalStatus = _com.valid(odr, 3);
                        gender = _com.valid(odr, 4);
                        hireDate = _com.valid(odr, 5);
                        salaryFlag = _com.valid(odr, 6);
                        vacationHours = _com.valid(odr, 7);
                        sickLeaveHours = _com.valid(odr, 8);
                        currentFlag = _com.valid(odr, 9);
                        modifiedDate = _com.valid(odr, 10);
                        //Here using this method we are inserting the data into the database
                        _com.insertdataintosql(loginID, jobID, birthDate, maritalStatus, gender, hireDate,salaryFlag,vacationHours,sickLeaveHours,currentFlag,modifiedDate);
                    }
                    oconn.Close();
                }
                catch (DataException ee)
                {
                    lblError.Text = ee.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {
                    lblError.Text = "Data Inserted Sucessfully";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
            }
            else {
                lblError.Text = "You must select an excel type file";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
