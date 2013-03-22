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

public class CommonFunction
{
    internal SqlConnection cnn;

    internal CommonFunction()
    {
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

    internal int getQuarter() {
        DateTime dt = DateTime.Now;
        int quarter;
        if (dt.Month <= 3)
        {
            quarter = 1;
        }
        else if (dt.Month <= 6)
        {
            quarter = 2;
        }
        else if (dt.Month <= 9)
        {
            quarter = 3;
        }
        else
        {
            quarter = 4;
        }
        return quarter;
    }
    internal void generateControl(Panel pnlGenerate, string isEdit, string BusinessID, int quarter) {
        DataTable question = this.getData(Message.TableCheckpointQuestion, "");
        if (question.Rows.Count > 0)
        {
            int countRdoYesNo = 1;
            int countRdoLevel = 1;
            int countTxtNote = 1;
            for (int i = 0; i < question.Rows.Count; i++)
            {
                Label lblQuestion = new Label();
                lblQuestion.ID = "lblQuestion" + (i + 1).ToString();
                lblQuestion.Width = 150;
                pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                pnlGenerate.Controls.Add(new LiteralControl("<div class=\"borderTop\">"));
                pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                pnlGenerate.Controls.Add(lblQuestion);
                pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                lblQuestion.Text = (i + 1).ToString() + ". " + question.Rows[i][1].ToString();
                if (question.Rows[i][2].ToString() == "YesNo")
                {
                    RadioButton rdoYes = new RadioButton();
                    rdoYes.ID = "rdoYes" + countRdoYesNo;
                    rdoYes.Text = "Yes";
                    RadioButton rdoNo = new RadioButton();
                    rdoNo.ID = "rdoNo" + countRdoYesNo;
                    rdoNo.Text = "No";
                    rdoYes.GroupName = "rdoYesNo" + countRdoYesNo;
                    rdoNo.GroupName = "rdoYesNo" + countRdoYesNo;
                    if (isEdit == "true")
                    {
                        DataTable evaluatePoint = this.getData(Message.TableEvaluatePoint, " where "+Message.BusinessEntityIDColumn+"='"
                            + BusinessID + "' and "+Message.QuarterColumn+"='" + quarter + "' and "+Message.QuestionIDColumn+"='" 
                            + question.Rows[i][0].ToString()+"'");
                        if (evaluatePoint.Rows[0][3].ToString() == "10")
                        {
                            rdoYes.Checked = true;
                        }
                        else {
                            rdoNo.Checked = true;
                        }
                    }
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoYes);
                    pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoNo);
                    pnlGenerate.Controls.Add(new LiteralControl("</div>"));
                    countRdoYesNo++;
                }
                else if (question.Rows[i][2].ToString() == "Note")
                {
                    TextBox txtNote = new TextBox();
                    txtNote.ID = "txtNote" + countTxtNote;
                    txtNote.TextMode = TextBoxMode.MultiLine;
                    txtNote.Width = new Unit("98%");
                    txtNote.Height = 100;
                    DropDownList ddlNotePoint = new DropDownList();
                    ddlNotePoint.ID = "ddlNotePoint" + countTxtNote;
                    ddlNotePoint.Width = 200;
                    for (int k = 0; k < 11; k++)
                    {
                        ddlNotePoint.Items.Add(k.ToString());
                    }
                    Label lblNotePoint = new Label();
                    lblNotePoint.ID = "lblNotePoint" + countTxtNote;
                    lblNotePoint.Text = "Points for this question";
                    lblNotePoint.Width = 150;
                    DataTable evaluatePoint = this.getData(Message.TableEvaluatePoint, " where "+Message.BusinessEntityIDColumn+"='"
                            + BusinessID + "' and "+Message.QuarterColumn+"='" + quarter + "' and "+Message.QuestionIDColumn+"='"
                            + question.Rows[i][0].ToString() + "'");
                    if (isEdit == "true")
                    {
                        txtNote.Text = evaluatePoint.Rows[0][4].ToString();
                        ddlNotePoint.SelectedValue = evaluatePoint.Rows[0][3].ToString();
                    }

                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(txtNote);
                    pnlGenerate.Controls.Add(new LiteralControl("<br>"));
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(lblNotePoint);
                    pnlGenerate.Controls.Add(ddlNotePoint);
                    if (isEdit == "true")
                    {
                        ddlNotePoint.SelectedValue = evaluatePoint.Rows[0][3].ToString();
                    }
                    pnlGenerate.Controls.Add(new LiteralControl("</div>"));
                    countTxtNote++;
                }
                else
                {
                    RadioButton rdoPerfect = new RadioButton();
                    rdoPerfect.ID = "rdoPerfect" + countRdoLevel;
                    rdoPerfect.Text = question.Rows[i][3].ToString();
                    RadioButton rdoGreat = new RadioButton();
                    rdoGreat.ID = "rdoGreat" + countRdoLevel;
                    rdoGreat.Text = question.Rows[i][4].ToString();
                    RadioButton rdoNormal = new RadioButton();
                    rdoNormal.ID = "rdoNormal" + countRdoLevel;
                    rdoNormal.Text = question.Rows[i][5].ToString();
                    RadioButton rdoBad = new RadioButton();
                    rdoBad.ID = "rdoBad" + countRdoLevel;
                    rdoBad.Text = question.Rows[i][6].ToString();
                    RadioButton rdoVeryBad = new RadioButton();
                    rdoVeryBad.ID = "rdoVeryBad" + countRdoLevel;
                    rdoVeryBad.Text = question.Rows[i][7].ToString();
                    rdoPerfect.GroupName = "rdoLevel" + countRdoLevel;
                    rdoGreat.GroupName = "rdoLevel" + countRdoLevel;
                    rdoNormal.GroupName = "rdoLevel" + countRdoLevel;
                    rdoBad.GroupName = "rdoLevel" + countRdoLevel;
                    rdoVeryBad.GroupName = "rdoLevel" + countRdoLevel;

                    if (isEdit == "true")
                    {
                        DataTable evaluatePoint = this.getData(Message.TableEvaluatePoint, " where "+Message.BusinessEntityIDColumn+"='"
                            + BusinessID + "' and "+Message.QuarterColumn+"='" + quarter + "' and "+Message.QuestionIDColumn+"='"
                            + question.Rows[i][0].ToString() + "'");
                        if (evaluatePoint.Rows[0][3].ToString() == "10") {
                            rdoPerfect.Checked = true;
                        }
                        else if (evaluatePoint.Rows[0][3].ToString() == "8")
                        {
                            rdoGreat.Checked = true;
                        }
                        else if (evaluatePoint.Rows[0][3].ToString() == "6")
                        {
                            rdoNormal.Checked = true;
                        }
                        else if (evaluatePoint.Rows[0][3].ToString() == "4")
                        {
                            rdoBad.Checked = true;
                        }
                        else if (evaluatePoint.Rows[0][3].ToString() == "2")
                        {
                            rdoVeryBad.Checked = true;
                        }
                    }

                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoPerfect);
                    pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoGreat);
                    pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoNormal);
                    pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoBad);
                    pnlGenerate.Controls.Add(new LiteralControl("<br/>"));
                    pnlGenerate.Controls.Add(new LiteralControl("<span style=\"padding-left:5px;\"></span>"));
                    pnlGenerate.Controls.Add(rdoVeryBad);
                    pnlGenerate.Controls.Add(new LiteralControl("</div>"));
                    countRdoLevel++;
                }
            }
        }
    }
}