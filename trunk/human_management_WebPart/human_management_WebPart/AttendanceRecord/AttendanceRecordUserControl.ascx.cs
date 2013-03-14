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
                        Calendar1.Visible = false;
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        Session.Remove("date");
                        TextBox3.Visible = false;
                        Button2.Visible = false;
                        Label4.Visible = false;
                        Label3.Visible = false;
                        RadioButton1.AutoPostBack = true;
                        RadioButton2.AutoPostBack = true;
                        RadioButton3.AutoPostBack = true;
                        Label5.Text = "";
                        GridView1.GridLines = GridLines.None;
                        GridView1.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        GridView1.HeaderStyle.Height = 25;
                        GridView1.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    }
                    if (Session["EmployeeName"] != null)
                    {
                        TextBox1.Text = Session["EmployeeName"].ToString();
                        RadioButton3.Checked = true;
                        Label5.Text = "";
                        com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
                        Panel1.Visible = true;
                        Session.Remove("EmployeeName");
                    }
                }
                catch (Exception ex) {
                    Label5.Text = ex.Message;
                }
            }
            else
            {
                Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                Response.Redirect(Session["Account"] + ".aspx", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            Session["date"] = "From";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["date"].ToString() == "From")
            {
                TextBox2.Text = Calendar1.SelectedDate.Month.ToString() + "-" + Calendar1.SelectedDate.Day + "-" + Calendar1.SelectedDate.Year;
            }
            else {
                TextBox3.Text = Calendar1.SelectedDate.Month.ToString() + "-" + Calendar1.SelectedDate.Day + "-" + Calendar1.SelectedDate.Year;
            }
            Calendar1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            Session["date"] = "To";
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton1.Checked == true)
            {
                TextBox3.Visible = false;
                Button2.Visible = false;
                Label4.Visible = false;
                Label3.Visible = true;
                TextBox3.Text = "";
                TextBox2.Text = "";
                Label2.Visible = true;
                TextBox2.Visible = true;
                Button1.Visible = true;
                Label6.Visible = true;
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton2.Checked == true)
            {
                TextBox3.Visible = true;
                TextBox2.Visible = true;
                Button2.Visible = true;
                Button1.Visible = true;
                Label4.Visible = true;
                Label3.Visible = true;
                Label2.Visible = true;
                TextBox3.Text = "";
                TextBox2.Text = "";
                Label6.Visible = true;
            }
        }

        public void CheckUncheckAll(object sender, EventArgs e)
        {
            CheckBox cbSelectedHeader = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in GridView1.Rows)
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Boolean check = false;
            if(TextBox1.Text.Trim()==""){
                Label5.Text="You must enter Employee Name";
            }
            else{
                try
                {
                    if(RadioButton3.Checked==true){
                        Label5.Text = "";
                        com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
                        check = true;
                    }
                    else if (RadioButton1.Checked == true)
                    {
                        if (TextBox2.Text.Trim() == "")
                        {
                            Label5.Text = "You must choose a date";
                        }
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(TextBox2.Text.Trim());
                                condition = " and CAST(DAY(PunchIn) as varchar(50))+'-'+CAST(MONTH(PunchIn) as varchar(50))+'-'+CAST(YEAR(PunchIn) as varchar(50)) = '"
                                    + dt.Day + "-" + dt.Month + "-" + dt.Year + "'";
                                Label5.Text = "";
                                com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
                                check = true;
                            }
                            catch (FormatException)
                            {
                                Label5.Text = "Invalid date. Try again";
                            }
                        }
                    }
                    else {
                        if (TextBox2.Text.Trim() == ""||TextBox3.Text.Trim()=="")
                        {
                            Label5.Text = "You must choose From and To date";
                        }
                        else
                        {
                            try
                            {
                                DateTime dt = DateTime.Parse(TextBox2.Text.Trim());
                                DateTime dt1 = DateTime.Parse(TextBox3.Text.Trim());
                                dt1 = dt1.AddDays(1.0);
                                if (dt.Year > dt1.Year)
                                {
                                    Label5.Text = "To Date must be after From date";
                                }
                                else if (dt.Year < dt1.Year) {
                                    condition = " and PunchIn > '" + dt.Month + "-" + dt.Day + "-" + dt.Year + "'"
                                                + " and PunchIn < '" + dt1.Month + "-" + dt1.Day + "-" + dt1.Year + "'";
                                    Label5.Text = "";
                                    com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
                                    check = true;
                                }
                                else
                                {
                                    if (dt.Month > dt.Month)
                                    {
                                        Label5.Text = "To Date must be after From date";
                                    }
                                    else if (dt.Month < dt1.Month) {
                                        condition = " and PunchIn > '" + dt.Month + "-" + dt.Day + "-" + dt.Year + "'"
                                                + " and PunchIn < '" + dt1.Month + "-" + dt1.Day + "-" + dt1.Year + "'";
                                        Label5.Text = "";
                                        com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
                                        check = true;
                                    }
                                    else
                                    {
                                        if (dt.Day >= dt1.Day)
                                        {
                                            Label5.Text = "To Date must be after From date";
                                        }
                                        else
                                        {
                                            condition = " and PunchIn > '" + dt.Month + "-" + dt.Day + "-" + dt.Year + "'"
                                                + " and PunchIn < '" + dt1.Month + "-" + dt1.Day + "-" + dt1.Year + "'";
                                            Label5.Text = "";
                                            com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
                                            check = true;
                                        }
                                    }
                                }
                            }
                            catch (FormatException)
                            {
                                Label5.Text = "Invalid date. Try again";
                            }
                        }
                    }
                }
                catch (Exception ex) {
                    Label5.Text = ex.Message;
                }
            }
            if (GridView1.Rows.Count > 0 && check==true)
            {
                Panel1.Visible = true;
            }
            else {
                Panel1.Visible = false;
            }
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton3.Checked == true)
            {
                TextBox3.Visible = false;
                TextBox2.Visible = false;
                Button1.Visible = false;
                Button2.Visible = false;
                Label4.Visible = false;
                Label3.Visible = false;
                Label2.Visible = false;
                TextBox3.Text = "";
                TextBox2.Text = "";
                Label6.Visible = false;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in GridView1.Rows)
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
                com.bindDataAttendance("*", " where EmployeeName=N'" + TextBox1.Text + "'" + condition, "HumanResources.Attendance", GridView1);
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "") {
                Label5.Text = "You must enter employee name first";
            }
            else
            {
                Session["Name"] = Server.HtmlDecode(TextBox1.Text.Trim());
                Response.Redirect("PunchAttendance.aspx", true);
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView1.Rows)
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

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
