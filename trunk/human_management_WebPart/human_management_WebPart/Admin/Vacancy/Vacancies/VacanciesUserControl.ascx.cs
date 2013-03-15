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
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", ddlJobTitle, "", true, "All");
                        com.SetItemList("VacancyName", "HumanResources.JobVacancy", ddlVacancy, "", true, "All");
                        txtHiringManager.Text = "";
                        ddlStatus.SelectedIndex = 0;
                        Session.Remove("Name");
                        com.bindData("VacancyName,JobTitle,HiringManager,Status", "", "HumanResources.JobVacancy", grdData);
                        grdData.GridLines = GridLines.None;
                        grdData.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        grdData.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        grdData.HeaderStyle.Height = 25;
                        grdData.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    }
                }
                catch (Exception ex)
                {
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string condition = " where ";
                if (ddlJobTitle.SelectedValue == "All") { }
                else
                {
                    condition = condition + "JobTitle='" + ddlJobTitle.SelectedItem.Text + "' and ";
                }
                if (ddlVacancy.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + "VacancyName='" + ddlVacancy.SelectedItem.Text + "' and ";
                }
                if (ddlStatus.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + "Status='" + ddlStatus.SelectedValue + "' and ";
                }
                if (txtHiringManager.Text.Trim() == "") { }
                else
                {
                    condition = condition + "HiringManager like'%" + txtHiringManager.Text + "%' and ";
                }
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                com.bindData("VacancyName,JobTitle,HiringManager,Status", condition, "HumanResources.JobVacancy", grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                ddlJobTitle.SelectedIndex = 0;
                ddlVacancy.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;
                txtHiringManager.Text = "";
                com.bindData("VacancyName,JobTitle,HiringManager,Status", "", "HumanResources.JobVacancy", grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("AddVacancy.aspx",true);
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
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
                com.bindData("VacancyName,JobTitle,HiringManager,Status", "", "HumanResources.JobVacancy",grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
