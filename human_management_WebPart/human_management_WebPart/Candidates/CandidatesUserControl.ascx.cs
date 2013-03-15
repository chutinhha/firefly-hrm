using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Candidates
{
    public partial class CandidatesUserControl : UserControl
    {
        public Common com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin")
            {
                try
                {
                    if (!IsPostBack)
                    {
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList1, "", true, "All");
                        com.SetItemList("VacancyName", "HumanResources.JobVacancy", DropDownList2, "", true, "All");
                        com.SetItemList("Status", "HumanResources.Candidatestatus", DropDownList3, "", true, "All");
                        com.bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", "", "HumanResources.JobCandidate", GridView1);
                        Calendar1.Visible = false;
                        Calendar2.Visible = false;
                        Session.Remove("Name");
                        Session.Remove("Email");
                        GridView1.GridLines = GridLines.None;
                        GridView1.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        GridView1.HeaderStyle.Height = 25;
                        GridView1.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    }
                }
                catch (Exception ex)
                {
                    Label11.Text = ex.Message;
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
        {
            TextBox4.Text = Calendar1.SelectedDate.Date.ToString();
            Calendar1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                com.bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", "", "HumanResources.JobCandidate", GridView1);
            }
            catch (Exception ex)
            {
                Label11.Text = ex.Message;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox5.Text = Calendar2.SelectedDate.Date.ToString();
            Calendar2.Visible = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string condition = " where ";
                if (DropDownList1.SelectedValue == "All") { }
                else
                {
                    condition = condition + "JobTitle='" + DropDownList1.SelectedItem.Text + "' and ";
                }
                if (DropDownList2.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + "JobVacancy='" + DropDownList2.SelectedItem.Text + "' and ";
                }
                if (DropDownList3.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + "Status='" + DropDownList3.SelectedItem.Text + "' and ";
                }
                if (DropDownList4.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + "MethodOfApply='" + DropDownList4.SelectedItem.Text + "' and ";
                }
                if (TextBox1.Text.Trim() == "") { }
                else
                {
                    condition = condition + "HiringManager like'%" + TextBox1.Text + "%' and ";
                }
                if (TextBox2.Text.Trim() == "") { }
                else
                {
                    condition = condition + "FullName like'%" + TextBox2.Text + "%' and ";
                }
                if (TextBox3.Text.Trim() == "") { }
                else
                {
                    condition = condition + "Keywords like'%" + TextBox3.Text + "%' and ";
                }
                if (TextBox4.Text.Trim() == "") { }
                else
                {
                    condition = condition + "ApplyDate > '" + TextBox4.Text + "' and ";
                }
                if (TextBox5.Text.Trim() == "") { }
                else
                {
                    condition = condition + "ApplyDate < '" + TextBox5.Text + "' and ";
                }
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                com.bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", condition, "HumanResources.JobCandidate", GridView1);
            }
            catch (Exception ex)
            {
                Label11.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            try{
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from HumanResources.JobCandidate where FullName=N'" + Server.HtmlDecode(gr.Cells[2].Text)+"' and Email='"+gr.Cells[4].Text+"';";
                        SqlCommand command = new SqlCommand(sql, com.cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
                com.bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", "", "HumanResources.JobCandidate",GridView1);
            }
            catch (Exception ex)
            {
                Label11.Text = ex.Message;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[2].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    com.closeConnection();
                    Response.Redirect("EditCandidate.aspx",true);
                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("AddCandidate.aspx",true);
        }
    }
}
