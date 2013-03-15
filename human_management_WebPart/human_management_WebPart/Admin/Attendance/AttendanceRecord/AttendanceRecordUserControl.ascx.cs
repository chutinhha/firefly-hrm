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


namespace SP2010VisualWebPart.AttendanceRecord
{
    public partial class AttendanceRecordUserControl : UserControl
    {
        public Common com = new Common();
        public string condition = "";
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
                        Session.Remove("date");
                        txtDateTo.Visible = false;
                        btnDateTo.Visible = false;
                        lblDateTo.Visible = false;
                        lblDateFrom.Visible = false;
                        rdoViewDate.AutoPostBack = true;
                        rdoViewRange.AutoPostBack = true;
                        rdoViewAll.AutoPostBack = true;
                        lblError.Text = "";
                        grdData.GridLines = GridLines.None;
                        grdData.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        grdData.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        grdData.HeaderStyle.Height = 25;
                        grdData.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    }
                    if (Session["EmployeeName"] != null)
                    {
                        txtEmployeeName.Text = Session["EmployeeName"].ToString();
                        rdoViewAll.Checked = true;
                        lblError.Text = "";
                        com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
                        pnlData.Visible = true;
                        Session.Remove("EmployeeName");
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
                }
            }
            else
            {
                Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    Response.Redirect("Home.aspx", true);
                }
            }
        }

        protected void btnDateFrom_Click(object sender, EventArgs e)
        {
            cldChooseDate.Visible = true;
            Session["date"] = "From";
        }

        protected void cldChooseDate_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["date"].ToString() == "From")
            {
                txtDateFrom.Text = cldChooseDate.SelectedDate.Month.ToString() + "-" + cldChooseDate.SelectedDate.Day + "-" + cldChooseDate.SelectedDate.Year;
            }
            else {
                txtDateTo.Text = cldChooseDate.SelectedDate.Month.ToString() + "-" + cldChooseDate.SelectedDate.Day + "-" + cldChooseDate.SelectedDate.Year;
            }
            cldChooseDate.Visible = false;
        }

        protected void btnDateTo_Click(object sender, EventArgs e)
        {
            cldChooseDate.Visible = true;
            Session["date"] = "To";
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

        public void CheckUncheckAll(object sender, EventArgs e)
        {
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
                lblError.Text="You must enter Employee Name";
            }
            else{
                try
                {
                    if(rdoViewAll.Checked==true){
                        lblError.Text = "";
                        com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
                        check = true;
                    }
                    else if (rdoViewDate.Checked == true)
                    {
                        if (txtDateFrom.Text.Trim() == "")
                        {
                            lblError.Text = "You must choose a date";
                        }
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(txtDateFrom.Text.Trim());
                                condition = " and CAST(DAY(PunchIn) as varchar(50))+'-'+CAST(MONTH(PunchIn) as varchar(50))+'-'+CAST(YEAR(PunchIn) as varchar(50)) = '"
                                    + dt.Day + "-" + dt.Month + "-" + dt.Year + "'";
                                lblError.Text = "";
                                com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
                                check = true;
                            }
                            catch (FormatException)
                            {
                                lblError.Text = "Invalid date. Try again";
                            }
                        }
                    }
                    else {
                        if (txtDateFrom.Text.Trim() == ""||txtDateTo.Text.Trim()=="")
                        {
                            lblError.Text = "You must choose From and To date";
                        }
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(txtDateFrom.Text.Trim());
                                DateTime dt1 = DateTime.Parse(txtDateTo.Text.Trim());
                                dt1 = dt1.AddDays(1.0);
                                if (dt.Year > dt1.Year)
                                {
                                    lblError.Text = "To Date must be after From date";
                                }
                                else if (dt.Year < dt1.Year) {
                                    condition = " and PunchIn > '" + dt.Month + "-" + dt.Day + "-" + dt.Year + "'"
                                                + " and PunchIn < '" + dt1.Month + "-" + dt1.Day + "-" + dt1.Year + "'";
                                    lblError.Text = "";
                                    com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
                                    check = true;
                                }
                                else
                                {
                                    if (dt.Month > dt.Month)
                                    {
                                        lblError.Text = "To Date must be after From date";
                                    }
                                    else if (dt.Month < dt1.Month) {
                                        condition = " and PunchIn > '" + dt.Month + "-" + dt.Day + "-" + dt.Year + "'"
                                                + " and PunchIn < '" + dt1.Month + "-" + dt1.Day + "-" + dt1.Year + "'";
                                        lblError.Text = "";
                                        com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
                                        check = true;
                                    }
                                    else
                                    {
                                        if (dt.Day >= dt1.Day)
                                        {
                                            lblError.Text = "To Date must be after From date";
                                        }
                                        else
                                        {
                                            condition = " and PunchIn > '" + dt.Month + "-" + dt.Day + "-" + dt.Year + "'"
                                                + " and PunchIn < '" + dt1.Month + "-" + dt1.Day + "-" + dt1.Year + "'";
                                            lblError.Text = "";
                                            com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
                                            check = true;
                                        }
                                    }
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = "Invalid date. Try again";
                            }
                        }
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
                }
            }
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
                        string sql = @"delete from HumanResources.Attendance where EmployeeName=N'" 
                            + Server.HtmlDecode(gr.Cells[1].Text) + "' and PunchIn='"+gr.Cells[2].Text
                            +"' and PunchOut='"+gr.Cells[4].Text+"';";
                        SqlCommand command = new SqlCommand(sql, com.cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
                com.bindDataAttendance("*", " where EmployeeName=N'" + txtEmployeeName.Text + "'" + condition, "HumanResources.Attendance", grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtEmployeeName.Text.Trim() == "") {
                lblError.Text = "You must enter employee name first";
            }
            else
            {
                Session["Name"] = Server.HtmlDecode(txtEmployeeName.Text.Trim());
                Response.Redirect("PunchAttendance.aspx", true);
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
                    com.closeConnection();
                    Response.Redirect("EditAttendance.aspx", true);
                }
            }
        }

        protected void txtEmployeeName_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
