using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;
using System.Data.OleDb;
using System.IO;

public class Common
{
    internal SqlConnection cnn;
    
    internal Common() {
        string connetionString = null;
        connetionString = Message.ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
    }

    internal void closeConnection() {
        cnn.Close();
    }

    //Get country list to bind to DropDownList
    internal List<string> getCountryList()
    {
        List<string> cultureList = new List<string>();
        CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.AllCultures & ~CultureTypes.NeutralCultures);
        foreach (CultureInfo culture in cultures)
        {
            if (culture.LCID != 127)
            {
                RegionInfo region = new RegionInfo(culture.LCID);
                if (!(cultureList.Contains(region.EnglishName)))
                {
                    cultureList.Add(region.EnglishName);
                }
            }
        }
        cultureList.Sort();
        return cultureList;
    }

    //Insert new row to table
    internal void insertIntoTable(string table,string column, string condition, bool IDENTITY_INSERT)
    {
        string sql;
        if (IDENTITY_INSERT == true) {
            sql = @"SET IDENTITY_INSERT "+table+" ON insert into " + table +column+ " values(" + condition + ");";
        }else{
            sql = @"insert into " + table + " values(" + condition + ");";
        }
        SqlCommand command = new SqlCommand(sql, cnn);
        command.ExecuteNonQuery();
    }

    //Set a DropDownList Item List
    internal void SetItemList(string column, string table, DropDownList ddl, string condition, Boolean addItem, string Item)
    {
        ddl.Items.Clear();
        string sql = @"SELECT distinct " + column + " FROM " + table + condition;
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "items");
        DataTable dt = ds.Tables["items"];
        if (dt.Rows.Count > 0)
        {
            if (addItem == true)
            {
                ddl.Items.Add(Item);
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddl.Items.Add(dt.Rows[i][0].ToString());
            }
        }
    }

    //Bind data to a gridview
    internal void bindData(string column, string condition, string table, GridView GridView1)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    //Bind data to gridview of Attendance screen
    internal void bindDataAttendance(string column, string condition, string table, GridView GridView1)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        //Add and calculate Duration and Total column
        dt.Columns.Add("Duration(Hours)");
        dt.Columns.Add("Total");
        int rowTotal = 0;
        for (int i = 0; i < dt.Rows.Count;i++ )
        {
            TimeSpan total;
            DateTime punchIn = DateTime.Parse(dt.Rows[i][3].ToString());
            DateTime punchOut = DateTime.Parse(dt.Rows[i][1].ToString());
            TimeSpan diff = punchIn.Subtract(punchOut);
            total = diff;
            dt.Rows[i][6] = diff.ToString();
            if (rowTotal <= i) {
                rowTotal = i;
            }
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                if (dt.Rows[i][0].ToString().Equals(dt.Rows[j][0])&&i!=j) {
                    DateTime punchIn1 = DateTime.Parse(dt.Rows[j][3].ToString());
                    DateTime punchOut1 = DateTime.Parse(dt.Rows[j][1].ToString());
                    if (punchIn.Day == punchIn1.Day && punchIn.Month == punchIn1.Month && punchIn.Year == punchIn1.Year)
                    {
                        TimeSpan diff1 = punchIn1.Subtract(punchOut1);
                        total = total + diff1;
                        rowTotal = j;
                    }
                }
                if (rowTotal <= i)
                {
                    rowTotal = i;
                }
            }
            if (rowTotal == i)
            {
                dt.Rows[i][7] = total.ToString();
            }
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    //Get data to a DataTable
    internal DataTable getData(string table, string condition)
    {
        string sql = @"SELECT * from "+table + condition+";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        return dt;
    }

    //Update a table
    internal void updateTable(string table, string condition)
    {
        string sql = @"update "+table+" set "+condition+";";
        SqlCommand command = new SqlCommand(sql, cnn);
        command.ExecuteNonQuery();
    }

    //Set gridview style
    internal void setGridViewStyle(GridView grdData) {
        grdData.GridLines = GridLines.None;
        grdData.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
        grdData.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
        grdData.HeaderStyle.Height = 25;
        grdData.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
    }

    internal string GetMd5Hash(MD5 md5Hash, string input)
    {
        // Convert the input string to a byte array and compute the hash. 
        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes 
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data  
        // and format each one as a hexadecimal string. 
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string. 
        return sBuilder.ToString();
    }

    // Verify a hash against a string. 
    internal bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
    {
        // Hash the input. 
        string hashOfInput = GetMd5Hash(md5Hash, input);

        // Create a StringComparer an compare the hashes.
        StringComparer comparer = StringComparer.OrdinalIgnoreCase;

        if (0 == comparer.Compare(hashOfInput, hash))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    internal void GetExcelSheets(string FilePath, string Extension, string isHDR, DropDownList ddlSheets, 
        Label lblFileName, Panel Panel1, Panel Panel2)
    {

        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = Message.Excel03ConString + "'";
                break;
            case ".xlsx": //Excel 07
                conStr = Message.Excel07ConString+"'";
                break;
            case ".csv": //Excel 07
                conStr = Message.Excel07ConString + "'";
                break;
        }

        //Get the Sheets in Excel WorkBoo
        conStr = String.Format(conStr, FilePath, isHDR);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        cmdExcel.Connection = connExcel;
        connExcel.Open();
        //Bind the Sheets to DropDownList
        ddlSheets.Items.Clear();
        ddlSheets.Items.Add(new ListItem("--Select Sheet--",""));
        ddlSheets.DataSource = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        ddlSheets.DataTextField = "TABLE_NAME";
        ddlSheets.DataValueField = "TABLE_NAME";
        ddlSheets.DataBind();
        connExcel.Close();
        lblFileName.Text = Path.GetFileName(FilePath);
        Panel2.Visible = true;
    }

    internal DataTable getDataFromExcel(string _conStr, string sheet) {
        OleDbConnection con = new OleDbConnection(_conStr);
        OleDbDataAdapter da = new OleDbDataAdapter("select * from ["+sheet+"]", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    internal void setItemListCSV(DropDownList ddl, bool zeroValue) {
        ddl.Items.Clear();
        for (int i = 0; i < 51; i++) {
            if (i == 0)
            {
                if (zeroValue == true)
                {
                    ddl.Items.Add(i.ToString());
                }
            }
            else {
                ddl.Items.Add(i.ToString());
            }
        }
    }
}