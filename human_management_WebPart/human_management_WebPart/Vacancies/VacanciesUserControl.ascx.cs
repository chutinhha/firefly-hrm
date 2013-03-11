using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Vacancies
{
    public partial class VacanciesUserControl : UserControl
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
                        TextBox1.Text = "";
                        DropDownList3.SelectedIndex = 0;
                        com.bindData("VacancyName,JobTitle,HiringManager,Status", "", "HumanResources.JobVacancy", GridView1);
                    }
                }
                catch (Exception ex)
                {
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
                    condition = condition + "VacancyName='" + DropDownList2.SelectedItem.Text + "' and ";
                }
                if (DropDownList3.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + "Status='" + DropDownList3.SelectedValue + "' and ";
                }
                if (TextBox1.Text.Trim() == "") { }
                else
                {
                    condition = condition + "HiringManager like'%" + TextBox1.Text + "%' and ";
                }
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                com.bindData("VacancyName,JobTitle,HiringManager,Status", condition, "HumanResources.JobVacancy", GridView1);
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                TextBox1.Text = "";
                com.bindData("VacancyName,JobTitle,HiringManager,Status", "", "HumanResources.JobVacancy", GridView1);
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("AddVacancy.aspx",true);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    com.closeConnection();
                    Response.Redirect("EditVacancy.aspx", true);
                    break;
                }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from HumanResources.JobVacancy where VacancyName=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, com.cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
                com.bindData("VacancyName,JobTitle,HiringManager,Status", "", "HumanResources.JobVacancy",GridView1);
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }
    }
}
