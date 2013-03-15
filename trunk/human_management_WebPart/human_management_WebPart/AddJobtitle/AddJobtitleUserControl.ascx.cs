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
                        com.SetItemList("Name", "HumanResources.JobCategories", DropDownList1, "", false, "");
                        Label5.Text = "";
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
            Response.Redirect("JobTitles.aspx",true);
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
                    com.insertIntoTable("HumanResources.JobTitle","N'"+TextBox1.Text.Trim()
                        +"',N'"+TextBox2.Text.Trim()+"',N'"+TextBox3.Text+"',N'"+DropDownList1.SelectedValue+"'");
                    Label5.Text = "";
                    com.closeConnection();
                    Response.Redirect("JobTitles.aspx",true);
                }
                catch (Exception ex) {
                    Label5.Text = ex.Message;
                }
            }
        }
    }
}
