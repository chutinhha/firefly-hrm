using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.JobTitles
{
    public partial class JobTitlesUserControl : UserControl
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
                        com.bindData("JobTitle,JobDes,JobCategory", "", "HumanResources.JobTitle", GridView1);
                        Label1.Text = "";
                        Session.Remove("Name");
                        GridView1.GridLines = GridLines.None;
                        GridView1.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        GridView1.HeaderStyle.Height = 25;
                        GridView1.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
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

        public void CheckUncheckAll(object sender, EventArgs e)
        {
            CheckBox cbSelectedHeader = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in GridView1.Rows)
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from HumanResources.JobTitle where JobTitle=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, com.cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                        Label1.Text = "";
                    }
                }
                com.bindData("JobTitle,JobDes", "", "HumanResources.JobTitle", GridView1);
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("AddJobTitle.aspx",true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    com.closeConnection();
                    Response.Redirect("EditJobTitle.aspx",true);
                }
            }
        }
    }
}
