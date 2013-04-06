using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SP2010VisualWebPart.AttendanceRecord
{
    public partial class AttendanceRecordUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        private string _condition = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null) {
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
                            txtEmployeeName.Text = "";
                            pnlDateTo.Visible = false;
                            lblDateTo.Visible = false;
                            lblDateFrom.Visible = false;
                            rdoViewDate.AutoPostBack = true;
                            rdoViewRange.AutoPostBack = true;
                            rdoViewAll.AutoPostBack = true;
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                            
                        }
                        if (Session[Message.EmployeeName] != null)
                        {
                            //In case return from Add or Edit Attendance Record
                            txtEmployeeName.Text = Session[Message.EmployeeName].ToString();
                            rdoViewAll.Checked = true;
                            lblError.Text = "";
                            _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." 
                                + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." + Message.NameColumn + "=N'" + txtEmployeeName.Text
                                + "'" + _condition, Message.TableAttendance+" a join "+Message.TablePerson+" p on a."
                                + Message.BusinessEntityIDColumn+"=p."+Message.BusinessEntityIDColumn, grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[1].Text = "Employee Name";
                                grdData.HeaderRow.Cells[2].Text = "In Time";
                                grdData.HeaderRow.Cells[3].Text = "Out Time";
                                grdData.HeaderRow.Cells[4].Text = "Email";
                            }
                            pnlData.Visible = true;
                            Session.Remove(Message.EmployeeName);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }
        //For text in input textbox
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnDateFrom_Click(object sender, EventArgs e)
        {
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void btnDateTo_Click(object sender, EventArgs e)
        {
        }

        protected void rdoViewDate_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewDate.Checked == true)
            {
                pnlDateTo.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                pnlDateFrom.Visible = true;
                lblDateDescription.Visible = true;
            }
        }

        protected void rdoViewRange_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewRange.Checked == true)
            {
                pnlDateFrom.Visible = true;
                pnlDateTo.Visible = true;
                lblDateTo.Visible = true;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                lblDateDescription.Visible = true;
            }
        }

        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdData.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdData.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                if (cbSelectedHeader.Checked == true)
                {
                    cbSelected.Checked = true;
                }
                else
                {
                    cbSelected.Checked = false;
                }
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Boolean check = false;
            lblError.Text = "";
            if(txtEmployeeName.Text.Trim()==""){
                lblError.Text=Message.EmployeeNameError;
            }
            else{
                try
                {
                    if(rdoViewAll.Checked==true){
                        //Case 1: View All Attendance of a Employee
                        lblError.Text = "";
                        _com.bindDataAttendance("p."+Message.NameColumn+",a."+Message.PunchInColumn+",a."
                            +Message.PunchOutColumn+",p."+Message.EmailAddressColumn
                            , " where p." + Message.NameColumn + " like N'%" + txtEmployeeName.Text
                            + "%'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                        check = true;
                    }
                    else if (rdoViewDate.Checked == true)
                    {
                        //Case 2: View Attendance of a date of a employee
                        if (Request.Form["txtDateFrom"].ToString().Trim() == "")
                        {
                            lblError.Text = Message.NotChooseDate;
                        }
                        else
                        {
                            try
                            {
                                this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
                                DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                _condition = " and CAST(DAY("+Message.PunchInColumn+") as varchar(50))+'-'+CAST(MONTH("
                                + Message.PunchInColumn+") as varchar(50))+'-'+CAST(YEAR("+Message.PunchInColumn
                                +") as varchar(50)) = '"+ dt.Day + "-" + dt.Month + "-" + dt.Year + "'";
                                lblError.Text = "";
                                _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." 
                                    + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." + Message.NameColumn + " like N'%" + txtEmployeeName.Text
                                    + "%'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                                check = true;
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.InvalidDate;
                            }
                        }
                    }
                    else {
                        //Case 3: View Attendance in a range of date of a employee
                        if (Request.Form["txtDateFrom"].ToString().Trim() == "" || Request.Form["txtDateTo"].ToString().Trim() == "")
                        {
                            lblError.Text = Message.NotChooseFromToDate;
                        }
                        else
                        {
                            try
                            {
                                this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
                                this.endDate = Request.Form["txtDateTo"].ToString().Trim();
                                DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                DateTime dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                                dt1 = dt1.AddDays(1.0);
                                if(dt.CompareTo(dt1)<0){
                                    _condition = " and "+Message.PunchInColumn+" > '" + dt.Month + "-" + dt.Day + "-" 
                                        + dt.Year + "'" + " and "+Message.PunchInColumn+" < '" + dt1.Month + "-" 
                                        + dt1.Day + "-" + dt1.Year + "'";
                                    lblError.Text = "";
                                    _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." 
                                        + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." + Message.NameColumn + " like N'%"
                                        + txtEmployeeName.Text + "%'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                                    check = true;
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.InvalidDate;
                            }
                        }
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
                }
            }
            //Show Data if Gridview have data and bindDataAttendance method success
            if (grdData.Rows.Count > 0 && check==true)
            {
                pnlData.Visible = true;
                grdData.HeaderRow.Cells[1].Text = "Employee Name";
                grdData.HeaderRow.Cells[2].Text = "In Time";
                grdData.HeaderRow.Cells[3].Text = "Out Time";
                grdData.HeaderRow.Cells[4].Text = "Email";
            }
            else {
                if (lblError.Text == "")
                {
                    lblError.Text = Message.NotExistData;
                }
                pnlData.Visible = false;
            }
            if (check == true) {
                DataTable employee = _com.getData(Message.TablePerson, Message.NameColumn, " where "
                    + Message.NameColumn + "=N'" + txtEmployeeName.Text + "'");
                if (employee.Rows.Count > 0)
                {
                    pnlData.Visible = true;
                }
            }
        }

        protected void rdoViewAll_CheckedChanged(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            if (rdoViewAll.Checked == true)
            {
                pnlDateTo.Visible = false;
                pnlDateFrom.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = false;
                lblDate.Visible = false;
                lblDateDescription.Visible = false;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        DataTable getID = _com.getData(Message.TablePerson + " p join " + Message.TableEmployee + " e on p."
                                            + Message.BusinessEntityIDColumn + "=e." + Message.BusinessEntityIDColumn, "p." + Message.BusinessEntityIDColumn
                                            , " where p." + Message.NameColumn + "='" + Server.HtmlDecode(gr.Cells[1].Text) + "'"
                                            + " and p." + Message.EmailAddressColumn + "=N'" + Server.HtmlDecode(gr.Cells[4].Text)+"'");
                        string sql = @"delete from "+Message.TableAttendance+" where "+Message.BusinessEntityIDColumn+"=N'" 
                            + getID.Rows[0][0].ToString() + "' and "+Message.PunchInColumn+"='"+gr.Cells[2].Text
                            +"' and "+Message.PunchOutColumn+"='"+gr.Cells[3].Text+"';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." 
                    + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." + Message.NameColumn + " like N'%" + txtEmployeeName.Text
                    + "%'" + _condition, Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Employee Name";
                    grdData.HeaderRow.Cells[2].Text = "In Time";
                    grdData.HeaderRow.Cells[3].Text = "Out Time";
                    grdData.HeaderRow.Cells[4].Text = "Email";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
                    pnlData.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.PunchAttendancePage, true);
                }
            }           
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    Session["In"] = gr.Cells[2].Text;
                    Session["Out"] = gr.Cells[3].Text;
                    _com.closeConnection();
                    Response.Redirect(Message.EditAttendancePage, true);
                }
            }
        }

        protected void txtEmployeeName_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
