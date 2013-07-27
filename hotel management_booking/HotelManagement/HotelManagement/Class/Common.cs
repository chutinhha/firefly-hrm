﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Xml.Linq;

public class CommonFunction
{
    internal SqlConnection cnn;

    internal CommonFunction()
    {
        cnn = new SqlConnection(Message.ConnectionString);
        cnn.Open();
    }

    //Close db connection
    internal void closeConnection()
    {
        cnn.Close();
    }

    internal void deleteFromTable(string table, string condition)
    {
        string sql;
        sql = @"DELETE from " + table + condition + " ;";
        SqlCommand command = new SqlCommand(sql, cnn);
        command.ExecuteNonQuery();
    }

    //Insert new row to table
    internal void insertIntoTable(string table, string column, string condition, bool IDENTITY_INSERT)
    {
        string sql;
        if (IDENTITY_INSERT == true)
        {
            sql = @"SET IDENTITY_INSERT " + table + " ON insert into " + table + column + " values(" + condition + ");"
                + "SET IDENTITY_INSERT " + table + " OFF";
        }
        else
        {
            sql = @"insert into " + table + " " + column + " values(" + condition + ");";
        }
        SqlCommand command = new SqlCommand(sql, cnn);
        command.ExecuteNonQuery();
    }

    internal DataTable getData(string table, string column, string condition)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        return dt;
    }

    //get largest ID of a identity column in a table
    internal int getTopID(string table)
    {
        string sql = @"select IDENT_CURRENT('" + table + "')";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        return int.Parse(dt.Rows[0][0].ToString());
    }

    //Update a table
    internal void updateTable(string table, string condition)
    {
        string sql = @"update " + table + " set " + condition + ";";
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
        if (addItem == true)
        {
            ddl.Items.Add(Item);
        }
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListItem newItem = new ListItem(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString());
                ddl.Items.Add(newItem);
            }
        }
        else
        {
            if (addItem == false)
            {
                ddl.Items.Add("NULL");
            }
        }
    }

    //Return string to update or insert to db
    internal object ToValue(object str) {
        if (str == null)
        {
            str = "NULL";
        }
        else {
            if (str.GetType() == typeof(DateTime) || str.GetType() == typeof(bool))
            {
                str = "'" + str + "'";
            }
            else if (str.GetType() == typeof(string)) {
                if (str.ToString().Trim() != "")
                {
                    str = "N'" + str + "'";
                }
                else {
                    str = "NULL";
                }
            }
        }
        return str;
    }

    //Generate MD5
    internal string CalculateMD5Hash(string input)
    {
        // step 1, calculate MD5 hash from input
        MD5 md5 = System.Security.Cryptography.MD5.Create();
        byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
        byte[] hash = md5.ComputeHash(inputBytes);

        // step 2, convert byte array to hex string
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString();
    }
    //Bind data to a gridview
    internal string bindData(string column, string condition, string table, GridView GridView1)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        GridView1.DataSource = dt;
        GridView1.DataBind();
        return sql;
    }
    //Get country list to bind to DropDownList
    internal List<string> getCountryList()
    {
        List<string> cultureList = new List<string>();
        CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.SpecificCultures);
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
    public void SendMail(string targetEmail, string subject, string body)
    {
        MailMessage msg = new MailMessage();
        msg.From = new MailAddress(Message.ourEmail);
        msg.To.Add(targetEmail);
        msg.Body = body;
        msg.IsBodyHtml = true;
        msg.Subject = subject;
        SmtpClient smt = new SmtpClient("smtp.gmail.com");
        smt.Port = 587;
        smt.Credentials = new NetworkCredential(Message.ourEmail, Message.ourEmailPass);
        smt.EnableSsl = true;
        smt.Send(msg);
    }
    //Bind data to a gridview with a blank column
    internal string bindDataBlankColumn(string column, string condition, string table, GridView GridView1, int noOfBlankColumn, string[] ColumnTitle)
    {
        string sql = @"SELECT " + column + " from " + table + condition + ";";
        SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "data");
        DataTable dt = ds.Tables["data"];
        for (int i = 0; i < noOfBlankColumn; i++)
        {
            DataColumn dcol1 = new DataColumn(ColumnTitle[i], typeof(string));
            dt.Columns.Add(dcol1);
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        return sql;
    }
    internal void ExportToExcel(string sql, string fileName, string server, int fromIndex)
    {
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "spExportData";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandTimeout = 0;
            SqlParameter parm = new SqlParameter("@sql", SqlDbType.VarChar);
            parm.Value = sql;
            SqlParameter parm1 = new SqlParameter("@fullFileName", SqlDbType.VarChar);
            parm1.Value = fileName;
            SqlParameter parm2 = new SqlParameter("@CurrentServer", SqlDbType.VarChar);
            parm2.Value = server;
            SqlParameter parm3 = new SqlParameter("@dbName", SqlDbType.VarChar);
            parm3.Value = "DavidDucHotel";
            SqlParameter parm4 = new SqlParameter("@fromIndex", SqlDbType.Int);
            parm4.Value = fromIndex;
            cmd.Parameters.Add(parm);
            cmd.Parameters.Add(parm1);
            cmd.Parameters.Add(parm2);
            cmd.Parameters.Add(parm3);
            cmd.Parameters.Add(parm4);
            cmd.ExecuteNonQuery();
        }
    }
}