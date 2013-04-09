using System;
using System.Data;
using System.IO;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.CSV.ImportEmployees
{
    public partial class ImportEmployeesUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            Panel4.Visible = false;
                            _com.setItemListCSV(ddlBirthDate, false);
                            _com.setItemListCSV(ddlCurrentFlag, false);
                            _com.setItemListCSV(ddlGender, false);
                            _com.setItemListCSV(ddlHireDate, true);
                            _com.setItemListCSV(ddlJobID, true);
                            _com.setItemListCSV(ddlLoginID, false);
                            _com.setItemListCSV(ddlMaritalStatus, true);
                            _com.setItemListCSV(ddlSalaryFlag, true);
                            _com.setItemListCSV(ddlSickLeaveHours, true);
                            _com.setItemListCSV(ddlVacationHours, true);
                            _com.setItemListCSV(ddlModifyDate, false);
                            string currentDirectory = Path.GetTempPath();
                            if (!File.Exists(currentDirectory + "//MapColumn.txt"))
                            {
                                StreamWriter sw = new StreamWriter(currentDirectory + "//MapColumn.txt");
                                sw.WriteLine("LoginID=1");
                                sw.WriteLine("JobID=2");
                                sw.WriteLine("BirthDate=3");
                                sw.WriteLine("MaritalStatus=4");
                                sw.WriteLine("Gender=5");
                                sw.WriteLine("HireDate=6");
                                sw.WriteLine("SalaryFlag=7");
                                sw.WriteLine("VacationHour=8");
                                sw.WriteLine("SickLeaveHour=9");
                                sw.WriteLine("CurrentFlag=10");
                                sw.WriteLine("ModifiedDate=11");
                                sw.WriteLine("StartRow=1");
                                sw.WriteLine("StartColumn=1");
                                sw.Close();
                                ddlLoginID.SelectedValue = "1";
                                ddlJobID.SelectedValue = "2";
                                ddlBirthDate.SelectedValue = "3";
                                ddlMaritalStatus.SelectedValue = "4";
                                ddlGender.SelectedValue = "5";
                                ddlHireDate.SelectedValue = "6";
                                ddlSalaryFlag.SelectedValue = "7";
                                ddlVacationHours.SelectedValue = "8";
                                ddlSickLeaveHours.SelectedValue = "9";
                                ddlCurrentFlag.SelectedValue = "10";
                                ddlModifyDate.SelectedValue = "11";
                                txtStartRow.Text = "1";
                                txtStartColumn.Text = "1";
                            }
                            else
                            {
                                StreamReader sr = new StreamReader(currentDirectory + "//MapColumn.txt");
                                string line;
                                string[] content = new string[100];
                                int count = 0;
                                while ((line = sr.ReadLine()) != null)
                                {
                                    content[count] = line.Trim();
                                    count++;
                                }
                                sr.Close();
                                for (int i = 0; i < count; i++)
                                {
                                    if (content[i].Contains("LoginID="))
                                    {
                                        ddlLoginID.SelectedValue = content[i].Replace("LoginID=", "").Trim();
                                    }
                                    if (content[i].Contains("JobID="))
                                    {
                                        ddlJobID.SelectedValue = content[i].Replace("JobID=", "").Trim();
                                    }
                                    if (content[i].Contains("BirthDate="))
                                    {
                                        ddlBirthDate.SelectedValue = content[i].Replace("BirthDate=", "").Trim();
                                    }
                                    if (content[i].Contains("MaritalStatus="))
                                    {
                                        ddlMaritalStatus.SelectedValue = content[i].Replace("MaritalStatus=", "").Trim();
                                    }
                                    if (content[i].Contains("Gender="))
                                    {
                                        ddlGender.SelectedValue = content[i].Replace("Gender=", "").Trim();
                                    }
                                    if (content[i].Contains("HireDate="))
                                    {
                                        ddlHireDate.SelectedValue = content[i].Replace("HireDate=", "").Trim();
                                    }
                                    if (content[i].Contains("SalaryFlag="))
                                    {
                                        ddlSalaryFlag.SelectedValue = content[i].Replace("SalaryFlag=", "").Trim();
                                    }
                                    if (content[i].Contains("VacationHour="))
                                    {
                                        ddlVacationHours.SelectedValue = content[i].Replace("VacationHour=", "").Trim();
                                    }
                                    if (content[i].Contains("SickLeaveHour="))
                                    {
                                        ddlSickLeaveHours.SelectedValue = content[i].Replace("SickLeaveHour=", "").Trim();
                                    }
                                    if (content[i].Contains("CurrentFlag="))
                                    {
                                        ddlCurrentFlag.SelectedValue = content[i].Replace("CurrentFlag=", "").Trim();
                                    }
                                    if (content[i].Contains("ModifiedDate="))
                                    {
                                        ddlModifyDate.SelectedValue = content[i].Replace("ModifiedDate=", "").Trim();
                                    }
                                    if (content[i].Contains("StartRow="))
                                    {
                                        txtStartRow.Text = content[i].Replace("StartRow=", "").Trim();
                                    }
                                    if (content[i].Contains("StartColumn="))
                                    {
                                        txtStartColumn.Text = content[i].Replace("StartColumn=", "").Trim();
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    if (Extension == ".xlsx")
                    {
                        string FilePath = "";
                        string FolderPath = "D:\\";
                        FilePath = FolderPath + FileName;
                        FileUpload1.SaveAs(FilePath);
                        _com.GetExcelSheets(FilePath, Extension, "Yes", ddlSheets, lblFileName, Panel1, Panel2);
                        Panel4.Visible = true;
                    }
                    else if (Extension == ".xls") {
                        lblError.Text = Message.Excel2007Type;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        lblSuccess.Text = "";
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                    }
                    else
                    {
                        lblError.Text = Message.InvalidExcel;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        lblSuccess.Text = "";
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                lblSuccess.Text = "";
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string FolderPath = "D:\\";
            string FilePath = FolderPath + lblFileName.Text;
            if (ddlSheets.SelectedValue == "")
            {
                lblError.Text = Message.NotSelectSheet;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else
            {
                DataTable dt = _com.getDataFromExcel(String.Format(Message.Excel07ConString, FilePath) + "HDR=Yes'", ddlSheets.SelectedValue);
                if (txtStartRow.Text.Trim() == "" || txtStartColumn.Text.Trim() == "")
                {
                    lblError.Text = Message.StartRowColumnError;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else
                {
                    try
                    {
                        int startRow = int.Parse(txtStartRow.Text.Trim()) - 1;
                        int startColumn = int.Parse(txtStartColumn.Text.Trim()) - 1;
                        try
                        {
                            DataTable loginID = _com.getData(Message.TableEmployee, "*", "");
                            int numberOfRowAffected = 0;
                            for (int i = startRow; i < dt.Rows.Count; i++)
                            {
                                bool checkUpdate = false;
                                for (int j = 0; j < loginID.Rows.Count; j++)
                                {
                                    if (dt.Rows[i][startColumn + int.Parse(ddlLoginID.SelectedValue) - 1].ToString() == loginID.Rows[j][1].ToString())
                                    {
                                        string sql;
                                        if (ddlJobID.SelectedValue == "0")
                                        {
                                            sql = " " + Message.JobIDColumn + "='',";
                                        }
                                        else {
                                            sql = " " + Message.JobIDColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlJobID.SelectedValue) - 1].ToString()
                                            + "',";
                                        }
                                        sql = sql + Message.BirthDateColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlBirthDate.SelectedValue) - 1].ToString()
                                            + "',";
                                        if (ddlMaritalStatus.SelectedValue == "0")
                                        {
                                            sql = sql + Message.MaritalStatusColumn + "='',";
                                        }
                                        else {
                                            sql = sql + Message.MaritalStatusColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlMaritalStatus.SelectedValue) - 1].ToString()
                                            + "',";
                                        }
                                        sql = sql + Message.GenderColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlGender.SelectedValue) - 1].ToString()
                                            + "',";
                                        if (ddlHireDate.SelectedValue == "0")
                                        {
                                            sql = sql + Message.HireDateColumn + "='',";
                                        }
                                        else {
                                            sql = sql + Message.HireDateColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlHireDate.SelectedValue) - 1].ToString()
                                            + "',";
                                        }
                                        if (ddlSalaryFlag.SelectedValue == "0")
                                        {
                                            sql = sql + Message.SalariedFlagColumn + "='',";
                                        }
                                        else {
                                            sql = sql + Message.SalariedFlagColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlSalaryFlag.SelectedValue) - 1].ToString()
                                            + "',";
                                        }
                                        if (ddlVacationHours.SelectedValue == "0")
                                        {
                                            sql = sql + Message.VacationHoursColumn + "='',";
                                        }
                                        else {
                                            sql = sql + Message.VacationHoursColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlVacationHours.SelectedValue) - 1].ToString()
                                            + "',";
                                        }
                                        if (ddlSickLeaveHours.SelectedValue == "0")
                                        {
                                            sql = sql + Message.SickLeaveHoursColumn + "='',";
                                        }
                                        else {
                                            sql = sql + Message.SickLeaveHoursColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlSickLeaveHours.SelectedValue) - 1].ToString()
                                            + "',";
                                        }
                                        sql = sql + Message.CurrentFlagColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlCurrentFlag.SelectedValue) - 1].ToString()
                                            + "'," + Message.ModifiedDateColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlModifyDate.SelectedValue) - 1].ToString()
                                            + "' where " + Message.LoginIDColumn + "='" + loginID.Rows[j][1].ToString() + "'";
                                        /*_com.updateTable(Message.TableEmployee, " " + Message.JobIDColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlJobID.SelectedValue) - 1].ToString()
                                            + "'," + Message.BirthDateColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlBirthDate.SelectedValue) - 1].ToString()
                                            + "'," + Message.MaritalStatusColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlMaritalStatus.SelectedValue) - 1].ToString()
                                            + "'," + Message.GenderColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlGender.SelectedValue) - 1].ToString()
                                            + "'," + Message.HireDateColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlHireDate.SelectedValue) - 1].ToString()
                                            + "'," + Message.SalariedFlagColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlSalaryFlag.SelectedValue) - 1].ToString()
                                            + "'," + Message.VacationHoursColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlVacationHours.SelectedValue) - 1].ToString()
                                            + "'," + Message.SickLeaveHoursColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlSickLeaveHours.SelectedValue) - 1].ToString()
                                            + "'," + Message.CurrentFlagColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlCurrentFlag.SelectedValue) - 1].ToString()
                                            + "'," + Message.ModifiedDateColumn + "='" + dt.Rows[i][startColumn + int.Parse(ddlModifyDate.SelectedValue) - 1].ToString()
                                            + "' where " + Message.LoginIDColumn + "='" + loginID.Rows[j][1].ToString() + "'");*/
                                        _com.updateTable(Message.TableEmployee, sql);
                                        numberOfRowAffected++;
                                        checkUpdate = true;
                                        break;
                                    }
                                }
                                if (checkUpdate == true) { }
                                else
                                {
                                    DataTable businessEntityID = _com.getData(Message.TableEmployee, "*", " order by " + Message.BusinessEntityIDColumn + " desc");
                                    int ID = int.Parse(businessEntityID.Rows[0][0].ToString()) + 1;
                                    _com.insertIntoTable(Message.TableEmployee, "(" + Message.LoginIDColumn + "," + Message.JobIDColumn + "," + Message.BirthDateColumn
                                        + "," + Message.MaritalStatusColumn + "," + Message.GenderColumn + ""
                                        + "," + Message.HireDateColumn + "," + Message.SalariedFlagColumn + "," + Message.VacationHoursColumn
                                        + "," + Message.SickLeaveHoursColumn + "," + Message.CurrentFlagColumn + "," + Message.ModifiedDateColumn
                                        + "," + Message.BusinessEntityIDColumn + ")", "'"
                                    + dt.Rows[i][startColumn + int.Parse(ddlLoginID.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlJobID.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlBirthDate.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlMaritalStatus.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlGender.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlHireDate.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlSalaryFlag.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlVacationHours.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlSickLeaveHours.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlCurrentFlag.SelectedValue) - 1].ToString() + "','"
                                    + dt.Rows[i][startColumn + int.Parse(ddlModifyDate.SelectedValue) - 1].ToString() + "','" + ID + "'", true);
                                    numberOfRowAffected++;
                                }
                            }
                            lblError.Text = "";
                            lblSuccess.Text = Message.AffectedRow + numberOfRowAffected;
                            string currentDirectory = Path.GetTempPath();
                            StreamWriter sw = new StreamWriter(currentDirectory + "//MapColumn.txt");
                            sw.WriteLine("LoginID=" + ddlLoginID.SelectedValue);
                            sw.WriteLine("JobID=" + ddlJobID.SelectedValue);
                            sw.WriteLine("BirthDate=" + ddlBirthDate.SelectedValue);
                            sw.WriteLine("MaritalStatus=" + ddlMaritalStatus.SelectedValue);
                            sw.WriteLine("Gender=" + ddlGender.SelectedValue);
                            sw.WriteLine("HireDate=" + ddlHireDate.SelectedValue);
                            sw.WriteLine("SalaryFlag=" + ddlSalaryFlag.SelectedValue);
                            sw.WriteLine("VacationHour=" + ddlVacationHours.SelectedValue);
                            sw.WriteLine("SickLeaveHour=" + ddlSickLeaveHours.SelectedValue);
                            sw.WriteLine("CurrentFlag=" + ddlCurrentFlag.SelectedValue);
                            sw.WriteLine("ModifiedDate=" + ddlModifyDate.SelectedValue);
                            sw.WriteLine("StartRow=" + txtStartRow.Text.Trim());
                            sw.WriteLine("StartColumn=" + txtStartColumn.Text.Trim());
                            sw.Close();
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = Message.InvalidStartRowColumn;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Panel4.Visible = false;
            Response.Redirect(Message.EmployeeListPage,true);
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if (btnShow.Text == "Show custom info")
            {
                btnShow.Text = "Hide custom info";
                Panel3.Visible = true;
            }
            else {
                btnShow.Text = "Show custom info";
                Panel3.Visible = false;
            }
        }
    }
}
