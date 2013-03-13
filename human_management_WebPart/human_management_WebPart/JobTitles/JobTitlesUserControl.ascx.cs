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
                        CheckBox1.AutoPostBack = true;
                        Session.Remove("Name");
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
                Response.Redirect(Session["Account"] + ".aspx", true);
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    cb.Checked = true;
                }
            }
            else
            {
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    cb.Checked = false;
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
