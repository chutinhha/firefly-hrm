using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditJobTitle
{
    public partial class EditJobTitleUserControl : UserControl
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
                            com.SetItemList("Name", "HumanResources.JobCategories", ddlJobCategory, "", false, "");
                            DataTable dt = com.getData("HumanResources.JobTitle", " where JobTitle=N'" + Session["Name"] + "'");
                            if (dt.Rows.Count > 0)
                            {
                                txtJobTitle.Text = dt.Rows[0][0].ToString().Trim();
                                txtJobDescription.Text = dt.Rows[0][1].ToString().Trim();
                                txtNote.Text = dt.Rows[0][2].ToString().Trim();
                                ddlJobCategory.SelectedValue = dt.Rows[0][3].ToString().Trim();
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Session.Remove("Name");
            Response.Redirect("JobTitles.aspx", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtJobTitle.Text.Trim() == "")
            {
                lblError.Text = "You must enter Job Title name";
            }
            else {
                try
                {
                    com.updateTable("HumanResources.JobTitle", "JobTitle=N'" + txtJobTitle.Text + "',"
                        + "JobDes=N'" + txtJobDescription.Text + "',Note=N'" + txtNote.Text + "',"
                        + "JobCategory=N'" + ddlJobCategory.SelectedValue + "' where JobTitle=N'"+Session["Name"]+"'");
                    Session.Remove("Name");
                    lblError.Text = "";
                    com.closeConnection();
                    Response.Redirect("JobTitles.aspx", true);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}
