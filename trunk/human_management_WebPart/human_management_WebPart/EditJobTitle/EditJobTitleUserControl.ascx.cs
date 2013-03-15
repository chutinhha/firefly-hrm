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
                            com.SetItemList("Name", "HumanResources.JobCategories", DropDownList1, "", false, "");
                            DataTable dt = com.getData("HumanResources.JobTitle", " where JobTitle=N'" + Session["Name"] + "'");
                            if (dt.Rows.Count > 0)
                            {
                                TextBox1.Text = dt.Rows[0][0].ToString().Trim();
                                TextBox2.Text = dt.Rows[0][1].ToString().Trim();
                                TextBox3.Text = dt.Rows[0][2].ToString().Trim();
                                DropDownList1.SelectedValue = dt.Rows[0][3].ToString().Trim();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Label5.Text = ex.Message;
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Session.Remove("Name");
            Response.Redirect("JobTitles.aspx", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                Label5.Text = "You must enter Job Title name";
            }
            else {
                try
                {
                    com.updateTable("HumanResources.JobTitle", "JobTitle=N'" + TextBox1.Text + "',"
                        + "JobDes=N'" + TextBox2.Text + "',Note=N'" + TextBox3.Text + "',"
                        + "JobCategory=N'" + DropDownList1.SelectedValue + "' where JobTitle=N'"+Session["Name"]+"'");
                    Session.Remove("Name");
                    Label5.Text = "";
                    com.closeConnection();
                    Response.Redirect("JobTitles.aspx", true);
                }
                catch (Exception ex)
                {
                    Label5.Text = ex.Message;
                }
            }
        }
    }
}
