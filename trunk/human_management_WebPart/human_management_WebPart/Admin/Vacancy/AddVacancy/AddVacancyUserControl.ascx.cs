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
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", ddlJobTitle, "", false, "");
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtVacancy.Text.Trim() == "")
            {
                lblError.Text = "You must enter vacancy name";
            }
            else {
                try
                {
                    if (txtNoOfPosition.Text.Trim() != "")
                    {
                        int no = int.Parse(txtNoOfPosition.Text.Trim());
                        try
                        {
                            string active;
                            if (chkActive.Checked == true)
                            {
                                active = "Active";
                            }
                            else
                            {
                                active = "Closed";
                            }
                            com.insertIntoTable("HumanResources.JobVacancy", "N'" + ddlJobTitle.SelectedValue + "',N'"
                                + txtVacancy.Text.Trim() + "',N'" + txtHiringManager.Text + "',N'" + txtNoOfPosition.Text + "',N'" + txtDescription.Text + "',"
                                + "N'" + active + "'");
                            com.closeConnection();
                            Response.Redirect("Vacancies.aspx", true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                catch (FormatException) {
                    lblError.Text = "Number of positions must be a number";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("Vacancies.aspx", true);
        }
    }
}
