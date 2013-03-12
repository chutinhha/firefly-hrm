﻿using System;
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
                        com.bindData("Name", "", "HumanResources.JobCategories", GridView1);
                        Panel1.Visible = false;
                        Label1.Text = "";
                        CheckBox1.AutoPostBack = true;
                    }
                }catch(Exception ex){
                    Label1.Text = ex.Message;
                }
            }
            else{
                Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                Response.Redirect(Session["Account"] + ".aspx", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Session["type"] = "Add";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            Panel1.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "") {
                Label1.Text = "You must enter category name";
            }
            else
            {
                try
                {
                    if (Session["type"].ToString() == "Add")
                    {
                        com.insertIntoTable("HumanResources.JobCategories", "N'" + TextBox1.Text.Trim() + "'");
                    }
                    else { 
                        com.updateTable("HumanResources.JobCategories","Name=N'"+TextBox1.Text.Trim()+"' where Name=N'"+Session["Name"]+"'");
                    }
                    Panel1.Visible = false;
                    com.bindData("Name", "", "HumanResources.JobCategories", GridView1);
                    CheckBox1.Checked = false;
                    Label1.Text = "";
                    TextBox1.Text = "";
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["type"] = "Edit";
                    Panel1.Visible = true;
                    TextBox1.Text = Session["Name"].ToString();
                    break;
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
                        string sql = @"delete from HumanResources.JobCategories where Name=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, com.cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                        Label1.Text = "";
                    }
                }
                com.bindData("Name", "", "HumanResources.JobCategories", GridView1);
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
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
            else {
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    cb.Checked = false;
                }
            }
        }
    }
}
