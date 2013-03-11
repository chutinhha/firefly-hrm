using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.AddCandidate
{
    public partial class AddCandidateUserControl : UserControl
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
                        DropDownList1.DataSource = com.getCountryList();
                        DropDownList1.DataBind();
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList3, "", false, "");
                        com.SetItemList("VacancyName", "HumanResources.JobVacancy", DropDownList2, "", false, "");
                        com.SetItemList("Status", "HumanResources.CandidateStatus", DropDownList4, "", false, "");
                        Calendar1.Visible = false;
                        Label19.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    Label19.Text = ex.Message;
                }
            }
            else {
                Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                Response.Redirect(Session["Account"] + ".aspx", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox12.Text = Calendar1.SelectedDate.Date.ToString();
            Calendar1.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("Candidates.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                Label19.Text = "You must enter candidate name!";
            }
            else
            {
                if (TextBox9.Text.Trim() == "")
                {
                    Label19.Text = "You must enter email!";
                }
                else {
                    try
                    {
                        double checkPhone;
                        if (TextBox6.Text.Trim() != "")
                        {
                            checkPhone = double.Parse(TextBox6.Text);
                        }
                        if (TextBox7.Text.Trim() != "")
                        {
                            checkPhone = double.Parse(TextBox7.Text);
                        }
                        if (TextBox8.Text.Trim() != "")
                        {
                            checkPhone = double.Parse(TextBox8.Text);
                        }
                        if (!TextBox9.Text.Contains("@"))
                        {
                            Label19.Text = "Email must contain @";
                        }
                        else {
                            try{
                                if (TextBox12.Text.Trim() != "")
                                {
                                    DateTime dt = DateTime.Parse(TextBox12.Text);
                                }
                                try
                                {
                                    com.insertIntoTable("HumanResources.JobCandidate", "N'" + TextBox1.Text + "',"
                                        + "N'" + TextBox2.Text + "',N'" + TextBox3.Text + "',"
                                        + "N'" + TextBox4.Text + "','" + TextBox5.Text + "',"
                                        + "'" + DropDownList1.SelectedValue + "','" + TextBox6.Text
                                        + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "',"
                                        + "'" + DropDownList2.SelectedValue + "',N'" + TextBox10.Text + "',"
                                        + "N'" + TextBox13.Text + "','" + TextBox12.Text + "','" + DropDownList3.SelectedValue + "',"
                                        + "N'" + TextBox11.Text + "',"
                                        + "'" + DropDownList4.SelectedValue + "','" + DropDownList5.SelectedValue + "'");
                                    com.closeConnection();
                                    Response.Redirect("Candidates.aspx", true);
                                }
                                catch (Exception ex)
                                {
                                    Label19.Text = ex.Message;
                                }
                            }
                            catch (FormatException)
                            {
                                Label19.Text = "Apply Date must be DateTime type";
                            }
                        }
                    }
                    catch (FormatException) {
                        Label19.Text = "Home phone, Work phone and Mobile phone must be number";
                    }
                }
            }
        }
    }
}
