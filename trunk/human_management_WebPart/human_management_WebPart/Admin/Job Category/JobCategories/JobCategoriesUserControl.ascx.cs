using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.JobCategories
{
    public partial class JobCategoriesUserControl : UserControl
    {
        public Common com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin")
            {
                try{
                    if (!IsPostBack) {
                        com.bindData("Name", "", "HumanResources.JobCategories", grdData);
                        Panel1.Visible = false;
                        lblError.Text = "";
                        grdData.GridLines = GridLines.None;
                        grdData.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        grdData.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        grdData.HeaderStyle.Height = 25;
                        grdData.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    }
                }catch(Exception ex){
                    lblError.Text = ex.Message;
                }
            }
            else{
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Session["type"] = "Add";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            Panel1.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim() == "") {
                lblError.Text = "You must enter category name";
            }
            else
            {
                try
                {
                    if (Session["type"].ToString() == "Add")
                    {
                        com.insertIntoTable("HumanResources.JobCategories", "N'" + txtName.Text.Trim() + "'");
                    }
                    else { 
                        com.updateTable("HumanResources.JobCategories","Name=N'"+txtName.Text.Trim()+"' where Name=N'"+Session["Name"]+"'");
                    }
                    Panel1.Visible = false;
                    com.bindData("Name", "", "HumanResources.JobCategories", grdData);
                    lblError.Text = "";
                    txtName.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["type"] = "Edit";
                    Panel1.Visible = true;
                    txtName.Text = Session["Name"].ToString();
                    break;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from HumanResources.JobCategories where Name=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, com.cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                        lblError.Text = "";
                    }
                }
                com.bindData("Name", "", "HumanResources.JobCategories", grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        public void CheckUncheckAll(object sender, EventArgs e)
        {
            CheckBox cbSelectedHeader = (CheckBox)grdData.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdData.Rows)
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
    }
}
