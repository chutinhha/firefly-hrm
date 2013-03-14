using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Globalization;

public class Common
{
    public SqlConnection cnn;
    
    public Common() {
        string connetionString = null;
        connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
        cnn = new SqlConnection(connetionString);
        cnn.Open();
    }

    public void closeConnection() {
        cnn.Close();
    }

    public List<string> getCountryList()
    {
        List<string> cultureList = new List<string>();
        CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.AllCultures & ~CultureTypes.NeutralCultures);
        foreach (CultureInfo culture in cultures)
        {
            if (culture.LCID != 127)
            {
                RegionInfo region = new RegionInfo(culture.LCID);
                //RegionInfo region = new RegionInfo(culture.LCID);
                if (!(cultureList.Contains(region.EnglishName)))
                {
                    cultureList.Add(region.EnglishName);
                }
            }
        }
        cultureList.Sort(); //put the country list in alphabetic order.
        return cultureList;
    }

    public void insertIntoTable(string table, string condition) {
        string sql = @"insert into " + table + " values(" + condition + ");";
        SqlCommand command = new SqlCommand(sql, cnn);
        command.ExecuteNonQuery();
    }

    public void SetItemList(string column, string table, DropDownList ddl,string condition, Boolean addItem, string Item)
    {
        ddl.Items.Clear();
        string sql = @"SELECT distinct " + column + " FROM " + table + condition;
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        // Tạo DataSet
        DataSet ds = new DataSet();
        // Lấp đầy kết quả vào DataSet
        da.Fill(ds, "items");
        // Tạo DataTable thu kết quả từ bảng
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

    public void bindData(string column, string condition, string table, GridView GridView1)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        // Tạo DataSet
        DataSet ds = new DataSet();
        // Lấp đầy kết quả vào DataSet
        da.Fill(ds, "data");
        // Tạo DataTable thu kết quả từ bảng
        DataTable dt = ds.Tables["data"];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    public void bindDataAttendance(string column, string condition, string table, GridView GridView1)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        // Tạo DataSet
        DataSet ds = new DataSet();
        // Lấp đầy kết quả vào DataSet
        da.Fill(ds, "data");
        // Tạo DataTable thu kết quả từ bảng
        DataTable dt = ds.Tables["data"];
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
            dt.Rows[i][5] = diff.ToString();
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
                dt.Rows[i][6] = total.ToString();
            }
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    public DataTable getData(string table, string condition) {
        string sql = @"SELECT * from "+table + condition+";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        // Tạo DataSet
        DataSet ds = new DataSet();
        // Lấp đầy kết quả vào DataSet
        da.Fill(ds, "data");
        // Tạo DataTable thu kết quả từ bảng
        DataTable dt = ds.Tables["data"];
        return dt;
    }

    public void updateTable(string table, string condition) {
        string sql = @"update "+table+" set "+condition+";";
        SqlCommand command = new SqlCommand(sql, cnn);
        //command.Connection.Open();
        command.ExecuteNonQuery();
    }

    public string[] GetCompletionList(string prefixText, int count, string table, string column)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        //Compare String From Textbox(prefixText) AND String From 
        //Column in DataBase(CompanyName)
        //If String from DataBase is equal to String from TextBox(prefixText) 
        //then add it to return ItemList
        //-----I defined a parameter instead of passing value directly to 
        //prevent SQL injection--------//
        cmd.CommandText = "select * from "+table+" Where "+column+" like @myParameter";
        cmd.Parameters.AddWithValue("@myParameter", "%" + prefixText + "%");
        try
        {
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
        }
        catch
        {
        }
        finally
        {
        }
        dt = ds.Tables[0];

        //Then return List of string(txtItems) as result
        List<string> txtItems = new List<string>();
        String dbValues;

        foreach (DataRow row in dt.Rows)
        {
            //String From DataBase(dbValues)
            dbValues = row[column].ToString();
            dbValues = dbValues.ToLower();
            txtItems.Add(dbValues);
        }

        return txtItems.ToArray();
    }
}