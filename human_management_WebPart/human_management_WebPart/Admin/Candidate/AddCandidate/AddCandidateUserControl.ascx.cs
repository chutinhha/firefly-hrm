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
                        ddlCountry.DataSource = com.getCountryList();
                        ddlCountry.DataBind();
                        com.SetItemList("JobTitle", "HumanResources.JobTitle", ddlJobTitle, "", false, "");
                        com.SetItemList("VacancyName", "HumanResources.JobVacancy", ddlVacancy, "", false, "");
                        com.SetItemList("Status", "HumanResources.CandidateStatus", ddlStatus, "", false, "");
                        cldApplyDate.Visible = false;
                        lblError.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
            else {
                Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else {
                    Response.Redirect("Home.aspx",true);
                }
            }
        }

        protected void btnApplyDate_Click(object sender, EventArgs e)
        {
            cldApplyDate.Visible = true;
        }

        protected void cldApplyDate_SelectionChanged(object sender, EventArgs e)
        {
            txtApplyDate.Text = cldApplyDate.SelectedDate.Date.ToString();
            cldApplyDate.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Response.Redirect("Candidates.aspx", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtFullName.Text.Trim() == "")
            {
                lblError.Text = "You must enter candidate name!";
            }
            else
            {
                if (txtEmail.Text.Trim() == "")
                {
                    lblError.Text = "You must enter email!";
                }
                else {
                    try
                    {
                        double checkPhone;
                        if (txtHomePhone.Text.Trim() != "")
                        {
                            checkPhone = double.Parse(txtHomePhone.Text);
                        }
                        if (txtMobile.Text.Trim() != "")
                        {
                            checkPhone = double.Parse(txtMobile.Text);
                        }
                        if (txtWorkPhone.Text.Trim() != "")
                        {
                            checkPhone = double.Parse(txtWorkPhone.Text);
                        }
                        if (!txtEmail.Text.Contains("@"))
                        {
                            lblError.Text = "Email must contain @";
                        }
                        else {
                            try{
                                if (txtApplyDate.Text.Trim() != "")
                                {
                                    DateTime dt = DateTime.Parse(txtApplyDate.Text);
                                }
                                try
                                {
                                    com.insertIntoTable("HumanResources.JobCandidate", "N'" + txtFullName.Text + "',"
                                        + "N'" + txtAddress.Text + "',N'" + txtCity.Text + "',"
                                        + "N'" + txtState.Text + "','" + txtZipCode.Text + "',"
                                        + "'" + ddlCountry.SelectedValue + "','" + txtHomePhone.Text
                                        + "','" + txtMobile.Text + "','" + txtWorkPhone.Text + "','" + txtEmail.Text + "',"
                                        + "'" + ddlVacancy.SelectedValue + "',N'" + txtKeyword.Text + "',"
                                        + "N'" + txtComment.Text + "','" + txtApplyDate.Text + "','" + ddlJobTitle.SelectedValue + "',"
                                        + "N'" + txtHiringManager.Text + "',"
                                        + "'" + ddlStatus.SelectedValue + "','" + ddlApplyMethod.SelectedValue + "'");
                                    com.closeConnection();
                                    Response.Redirect("Candidates.aspx", true);
                                }
                                catch (Exception ex)
                                {
                                    lblError.Text = ex.Message;
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = "Apply Date must be DateTime type";
                            }
                        }
                    }
                    catch (FormatException) {
                        lblError.Text = "Home phone, Work phone and Mobile phone must be number";
                    }
                }
            }
        }
    }
}
