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
}