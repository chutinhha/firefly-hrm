using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditVacancy
{
    public partial class EditVacancyUserControl : UserControl
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
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList1, "", false, "");
                        DataTable dt = com.getData("HumanResources.JobVacancy", " where VacancyName=N'" + Session["Name"] + "'");
                        if (dt.Rows.Count > 0)
                        {
                            DropDownList1.SelectedValue = dt.Rows[0][0].ToString().Trim();
                            TextBox2.Text = dt.Rows[0][1].ToString().Trim();
                            TextBox3.Text = dt.Rows[0][2].ToString().Trim();
                            TextBox4.Text = dt.Rows[0][3].ToString().Trim();
                            TextBox5.Text = dt.Rows[0][4].ToString().Trim();
                            if (dt.Rows[0][5].ToString().Trim() == "Active")
                            {
                                CheckBox1.Checked = true;
                            }
                            else
                            {
                                CheckBox1.Checked = false;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label7.Text = ex.Message;
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
            if (TextBox2.Text.Trim() == "")
            {
                Label7.Text = "You must enter vacancy name";
            }
            else {
                try
                {
                    if (TextBox4.Text.Trim() != "")
                    {
                        int no = int.Parse(TextBox4.Text.Trim());
                        try
                        {
                            string active;
                            if (CheckBox1.Checked == true)
                            {
                                active = "Active";
                            }
                            else
                            {
                                active = "Closed";
                            }
                            com.updateTable("HumanResources.JobVacancy", "VacancyName=N'" + TextBox2.Text + "',"
                                + "HiringManager=N'" + TextBox3.Text + "',NoOfPos='" + TextBox4.Text + "',"
                                + "Description=N'" + TextBox5.Text + "',JobTitle=N'" + DropDownList1.SelectedValue + "',Status='"
                                + active + "' where VacancyName=N'" + Session["Name"] + "'");
                            Session.Remove("Name");
                            com.closeConnection();
                            Response.Redirect("Vacancies.aspx", true);
                        }
                        catch (Exception ex)
                        {
                            Label7.Text = ex.Message;
                        }
                    }
                }
                catch (FormatException)
                {
                    Label7.Text = "Number of positions must be a number";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("Vacancies.aspx",true);
        }
    }
}
