using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.AddJobtitle
{
    public partial class AddJobtitleUserControl : UserControl
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
                        com.SetItemList("Name", "HumanResources.JobCategories", ddlJobCategory, "", false, "");
                        lblError.Text = "";
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("JobTitles.aspx",true);
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
                    com.insertIntoTable("HumanResources.JobTitle","N'"+txtJobTitle.Text.Trim()
                        +"',N'"+txtJobDescription.Text.Trim()+"',N'"+txtNote.Text+"',N'"+ddlJobCategory.SelectedValue+"'");
                    lblError.Text = "";
                    com.closeConnection();
                    Response.Redirect("JobTitles.aspx",true);
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}
