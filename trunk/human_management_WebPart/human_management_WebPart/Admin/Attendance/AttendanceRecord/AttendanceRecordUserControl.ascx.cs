using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web;
using System.Text;


namespace SP2010VisualWebPart.AttendanceRecord
{
    public partial class AttendanceRecordUserControl : UserControl
    {
        private Common _com = new Common();
        private string _condition = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin")
            {
                try
                {
                    if (!IsPostBack)
                    {
                        cldChooseDate.Visible = false;
                        txtEmployeeName.Text = "";
                        txtDateFrom.Text = "";
                        txtDateTo.Text = "";
                        Session.Remove("Date");
                        txtDateTo.Visible = false;
                        btnDateTo.Visible = false;
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
                        _com.bindDataAttendance("*", " where "+Message.EmployeeName+"=N'" + txtEmployeeName.Text 
                            + "'" + _condition, Message.TableAttendance, grdData);
                        pnlData.Visible = true;
                        Session.Remove(Message.EmployeeName);
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
                }
            }
            else
            {
                Response.Write("<script language='JavaScript'> alert('"+Message.AcessDenied+"'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    Response.Redirect(Message.HomePage, true);
                }
            }
        }

        protected void btnDateFrom_Click(object sender, EventArgs e)
        {
            cldChooseDate.Visible = true;
            Session["Date"] = "From";
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["Date"].ToString() == "From")
            {
                txtDateFrom.Text = cldChooseDate.SelectedDate.Month.ToString() + "-" 
                    + cldChooseDate.SelectedDate.Day + "-" + cldChooseDate.SelectedDate.Year;
            }
            else {
                txtDateTo.Text = cldChooseDate.SelectedDate.Month.ToString() + "-" 
                    + cldChooseDate.SelectedDate.Day + "-" + cldChooseDate.SelectedDate.Year;
            }
            cldChooseDate.Visible = false;
        }

        protected void btnDateTo_Click(object sender, EventArgs e)
        {
            cldChooseDate.Visible = true;
            Session["Date"] = "To";
        }

        protected void rdoViewDate_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewDate.Checked == true)
            {
                txtDateTo.Visible = false;
                btnDateTo.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = true;
                txtDateTo.Text = "";
                txtDateFrom.Text = "";
                lblDate.Visible = true;
                txtDateFrom.Visible = true;
                btnDateFrom.Visible = true;
                lblDateDescription.Visible = true;
            }
        }

        protected void rdoViewRange_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewRange.Checked == true)
            {
                txtDateTo.Visible = true;
                txtDateFrom.Visible = true;
                btnDateTo.Visible = true;
                btnDateFrom.Visible = true;
                lblDateTo.Visible = true;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                txtDateTo.Text = "";
                txtDateFrom.Text = "";
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
            if(txtEmployeeName.Text.Trim()==""){
                lblError.Text=Message.EmployeeNameError;
            }
            else{
                try
                {
                    if(rdoViewAll.Checked==true){
                        //Case 1: View All Attendance of a Employee
                        lblError.Text = "";
                        _com.bindDataAttendance("*", " where "+Message.EmployeeName+"=N'" + txtEmployeeName.Text 
                            + "'" + _condition, Message.TableAttendance, grdData);
                        check = true;
                    }
                    else if (rdoViewDate.Checked == true)
                    {
                        //Case 2: View Attendance of a date of a employee
                        if (txtDateFrom.Text.Trim() == "")
                        {
                            lblError.Text = Message.NotChooseDate;
                        }
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(txtDateFrom.Text.Trim());
                                _condition = " and CAST(DAY("+Message.PunchInColumn+") as varchar(50))+'-'+CAST(MONTH("
                                + Message.PunchInColumn+") as varchar(50))+'-'+CAST(YEAR("+Message.PunchInColumn
                                +") as varchar(50)) = '"+ dt.Day + "-" + dt.Month + "-" + dt.Year + "'";
                                lblError.Text = "";
                                _com.bindDataAttendance("*", " where "+Message.EmployeeName+"=N'" + txtEmployeeName.Text 
                                    + "'" + _condition, Message.TableAttendance, grdData);
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
                        if (txtDateFrom.Text.Trim() == ""||txtDateTo.Text.Trim()=="")
                        {
                            lblError.Text = Message.NotChooseFromToDate;
                        }
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(txtDateFrom.Text.Trim());
                                DateTime dt1 = DateTime.Parse(txtDateTo.Text.Trim());
                                dt1 = dt1.AddDays(1.0);
                                if(dt.CompareTo(dt1)<0){
                                    _condition = " and "+Message.PunchInColumn+" > '" + dt.Month + "-" + dt.Day + "-" 
                                        + dt.Year + "'" + " and "+Message.PunchInColumn+" < '" + dt1.Month + "-" 
                                        + dt1.Day + "-" + dt1.Year + "'";
                                    lblError.Text = "";
                                    _com.bindDataAttendance("*", " where "+Message.EmployeeName+"=N'" 
                                        + txtEmployeeName.Text + "'" + _condition, Message.TableAttendance, grdData);
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
            }
            else {
                pnlData.Visible = false;
            }
        }

        protected void rdoViewAll_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewAll.Checked == true)
            {
                txtDateTo.Visible = false;
                txtDateFrom.Visible = false;
                btnDateFrom.Visible = false;
                btnDateTo.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = false;
                lblDate.Visible = false;
                txtDateTo.Text = "";
                txtDateFrom.Text = "";
                lblDateDescription.Visible = false;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from "+Message.TableAttendance+" where "+Message.EmployeeName+"=N'" 
                            + Server.HtmlDecode(gr.Cells[1].Text) + "' and "+Message.PunchInColumn+"='"+gr.Cells[2].Text
                            +"' and "+Message.PunchOutColumn+"='"+gr.Cells[4].Text+"';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        
                        /*String csname1 = "PopupScript";

                        if (!Page.IsClientScriptBlockRegistered(csname1))
                        {
                            String cstext1 = "<script type=\"text/javascript\">" +
                                "alert('Hello World');</" + "script>";
                            Page.RegisterStartupScript(csname1, cstext1);
                        }*/
                        command.ExecuteNonQuery();
                    }
                }
                _com.bindDataAttendance("*", " where "+Message.EmployeeName+"=N'" + txtEmployeeName.Text 
                    + "'" + _condition, Message.TableAttendance, grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtEmployeeName.Text.Trim() == "") {
                lblError.Text = Message.EmployeeNameError;
            }
            else
            {
                Session["Name"] = Server.HtmlDecode(txtEmployeeName.Text.Trim());
                Response.Redirect(Message.PunchAttendancePage, true);
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
                    Session["In"] = gr.Cells[2].Text;
                    Session["Out"] = gr.Cells[4].Text;
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
