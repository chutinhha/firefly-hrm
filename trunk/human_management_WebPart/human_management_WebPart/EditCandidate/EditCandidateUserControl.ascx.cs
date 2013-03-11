using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditCandidate
{
    public partial class EditCandidateUserControl : UserControl
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
                        com.SetItemList("VacancyName", "HumanResources.JobVacancy", DropDownList2, "", false, "");
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList3, "", false, "");
                        com.SetItemList("Status", "HumanResources.CandidateStatus", DropDownList4, "", false, "");
                        Calendar1.Visible = false;
                        DataTable dt = com.getData("HumanResources.JobCandidate", " where FullName=N'" + Session["Name"] + "' and Email='" + Session["Email"] + "'");
                        if (dt.Rows.Count > 0)
                        {
                            TextBox1.Text = dt.Rows[0][0].ToString().Trim();
                            TextBox2.Text = dt.Rows[0][1].ToString().Trim();
                            TextBox3.Text = dt.Rows[0][2].ToString().Trim();
                            TextBox4.Text = dt.Rows[0][3].ToString().Trim();
                            TextBox5.Text = dt.Rows[0][4].ToString().Trim();
                            DropDownList1.SelectedValue = dt.Rows[0][5].ToString().Trim();
                            TextBox6.Text = dt.Rows[0][6].ToString().Trim();
                            TextBox7.Text = dt.Rows[0][7].ToString().Trim();
                            TextBox8.Text = dt.Rows[0][8].ToString().Trim();
                            TextBox9.Text = dt.Rows[0][9].ToString().Trim();
                            DropDownList2.SelectedValue = dt.Rows[0][10].ToString().Trim();
                            TextBox10.Text = dt.Rows[0][11].ToString().Trim();
                            DropDownList3.SelectedValue = dt.Rows[0][14].ToString().Trim();
                            TextBox11.Text = dt.Rows[0][15].ToString().Trim();
                            DropDownList4.SelectedValue = dt.Rows[0][16].ToString().Trim();
                            DropDownList5.SelectedValue = dt.Rows[0][17].ToString().Trim();
                            TextBox12.Text = dt.Rows[0][13].ToString().Trim();
                            TextBox13.Text = dt.Rows[0][12].ToString().Trim();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label19.Text = ex.Message;
                }
            }
            else
            {
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
            Response.Redirect("Candidates.aspx",true);
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
                                    com.updateTable("HumanResources.JobCandidate", "FullName=N'" + TextBox1.Text + "',"
                                        + "AddressStreet=N'" + TextBox2.Text + "',City=N'" + TextBox3.Text + "',"
                                        + "State=N'" + TextBox4.Text + "',ZipCode='" + TextBox5.Text + "',"
                                        + "Country='" + DropDownList1.SelectedValue + "',HomePhone=" + TextBox6.Text
                                        + ",Mobile=" + TextBox7.Text + ",WorkPhone=" + TextBox8.Text + ",Email='" + TextBox9.Text + "',"
                                        + "JobVacancy='" + DropDownList2.SelectedValue + "',Keywords=N'" + TextBox10.Text + "',"
                                        + "JobTitle='" + DropDownList3.SelectedValue + "',HiringManager=N'" + TextBox11.Text + "',"
                                        + "Status='" + DropDownList4.SelectedValue + "',MethodOfApply='" + DropDownList5.SelectedValue + "',"
                                        + "ApplyDate='" + TextBox12.Text + "',Comment=N'" + TextBox13.Text + "' where FullName=N'" + Session["Name"]
                                        + "' and Email='" + Session["Email"] + "'");
                                    Session.Remove("Name");
                                    Session.Remove("Email");
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
                    catch (FormatException)
                    {
                        Label19.Text = "Home phone, Work phone and Mobile phone must be number";
                    }
                }
            }
        }
    }
}
