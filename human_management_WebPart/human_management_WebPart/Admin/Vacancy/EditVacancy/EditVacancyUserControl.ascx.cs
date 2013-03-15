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
                if (Session["Name"] == null)
                {
                    Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            com.SetItemList("JobTitle", "HumanResources.JobTitle", ddlJobTitle, "", false, "");
                            DataTable dt = com.getData("HumanResources.JobVacancy", " where VacancyName=N'" + Session["Name"] + "'");
                            if (dt.Rows.Count > 0)
                            {
                                ddlJobTitle.SelectedValue = dt.Rows[0][0].ToString().Trim();
                                txtVacancy.Text = dt.Rows[0][1].ToString().Trim();
                                txtHiringManager.Text = dt.Rows[0][2].ToString().Trim();
                                txtNoOfPosition.Text = dt.Rows[0][3].ToString().Trim();
                                txtDescription.Text = dt.Rows[0][4].ToString().Trim();
                                if (dt.Rows[0][5].ToString().Trim() == "Active")
                                {
                                    chkActive.Checked = true;
                                }
                                else
                                {
                                    chkActive.Checked = false;
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
            }
            else
            {
                Session.Remove("Name");
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
                            com.updateTable("HumanResources.JobVacancy", "VacancyName=N'" + txtVacancy.Text + "',"
                                + "HiringManager=N'" + txtHiringManager.Text + "',NoOfPos='" + txtNoOfPosition.Text + "',"
                                + "Description=N'" + txtDescription.Text + "',JobTitle=N'" + ddlJobTitle.SelectedValue + "',Status='"
                                + active + "' where VacancyName=N'" + Session["Name"] + "'");
                            Session.Remove("Name");
                            com.closeConnection();
                            Response.Redirect("Vacancies.aspx", true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                catch (FormatException)
                {
                    lblError.Text = "Number of positions must be a number";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Session.Remove("Name");
            Response.Redirect("Vacancies.aspx",true);
        }
    }
}
