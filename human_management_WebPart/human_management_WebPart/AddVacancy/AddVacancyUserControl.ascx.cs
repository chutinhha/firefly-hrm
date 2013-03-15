using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;


namespace SP2010VisualWebPart.AddVacancy
{
    public partial class AddVacancyUserControl : UserControl
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
                            com.insertIntoTable("HumanResources.JobVacancy", "N'" + DropDownList1.SelectedValue + "',N'"
                                + TextBox2.Text.Trim() + "',N'" + TextBox3.Text + "',N'" + TextBox4.Text + "',N'" + TextBox5.Text + "',"
                                + "N'" + active + "'");
                            com.closeConnection();
                            Response.Redirect("Vacancies.aspx", true);
                        }
                        catch (Exception ex)
                        {
                            Label7.Text = ex.Message;
                        }
                    }
                }
                catch (FormatException) {
                    Label7.Text = "Number of positions must be a number";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("Vacancies.aspx", true);
        }
    }
}
