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
                if (Session["Name"] == null) {
                    Response.Write("<script language='JavaScript'> alert('Access Denied'); </script>");
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            ddlCountry.DataSource = com.getCountryList();
                            ddlCountry.DataBind();
                            com.SetItemList("VacancyName", "HumanResources.JobVacancy", ddlVacancy, "", false, "");
                            com.SetItemList("JobTitle", "HumanResources.JobTitle", ddlJobTitle, "", false, "");
                            com.SetItemList("Status", "HumanResources.CandidateStatus", ddlStatus, "", false, "");
                            cldDate.Visible = false;
                            DataTable dt = com.getData("HumanResources.JobCandidate", " where FullName=N'" + Session["Name"] + "' and Email='" + Session["Email"] + "'");
                            if (dt.Rows.Count > 0)
                            {
                                txtFullName.Text = dt.Rows[0][0].ToString().Trim();
                                txtAddress.Text = dt.Rows[0][1].ToString().Trim();
                                txtCity.Text = dt.Rows[0][2].ToString().Trim();
                                txtState.Text = dt.Rows[0][3].ToString().Trim();
                                txtZipCode.Text = dt.Rows[0][4].ToString().Trim();
                                ddlCountry.SelectedValue = dt.Rows[0][5].ToString().Trim();
                                txtHomePhone.Text = dt.Rows[0][6].ToString().Trim();
                                txtMobile.Text = dt.Rows[0][7].ToString().Trim();
                                txtWorkPhone.Text = dt.Rows[0][8].ToString().Trim();
                                txtEmail.Text = dt.Rows[0][9].ToString().Trim();
                                ddlVacancy.SelectedValue = dt.Rows[0][10].ToString().Trim();
                                txtKeyword.Text = dt.Rows[0][11].ToString().Trim();
                                ddlJobTitle.SelectedValue = dt.Rows[0][14].ToString().Trim();
                                txtHiringManager.Text = dt.Rows[0][15].ToString().Trim();
                                ddlStatus.SelectedValue = dt.Rows[0][16].ToString().Trim();
                                ddlApplyMethod.SelectedValue = dt.Rows[0][17].ToString().Trim();
                                txtApplyDate.Text = dt.Rows[0][13].ToString().Trim();
                                txtComment.Text = dt.Rows[0][12].ToString().Trim();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
            }
            else
            {
                Session.Remove("Name");
                Session.Remove("Email");
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

        protected void btnApplyDate_Click(object sender, EventArgs e)
        {
            cldDate.Visible = true;
        }

        protected void cldDate_SelectionChanged(object sender, EventArgs e)
        {
            txtApplyDate.Text = cldDate.SelectedDate.Date.ToString();
            cldDate.Visible = false;
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            com.closeConnection();
            Session.Remove("Name");
            Session.Remove("Email");
            Response.Redirect("Candidates.aspx",true);
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
                                    com.updateTable("HumanResources.JobCandidate", "FullName=N'" + txtFullName.Text + "',"
                                        + "AddressStreet=N'" + txtAddress.Text + "',City=N'" + txtCity.Text + "',"
                                        + "State=N'" + txtState.Text + "',ZipCode='" + txtZipCode.Text + "',"
                                        + "Country='" + ddlCountry.SelectedValue + "',HomePhone=" + txtHomePhone.Text
                                        + ",Mobile=" + txtMobile.Text + ",WorkPhone=" + txtWorkPhone.Text + ",Email='" + txtEmail.Text + "',"
                                        + "JobVacancy='" + ddlVacancy.SelectedValue + "',Keywords=N'" + txtKeyword.Text + "',"
                                        + "JobTitle='" + ddlJobTitle.SelectedValue + "',HiringManager=N'" + txtHiringManager.Text + "',"
                                        + "Status='" + ddlStatus.SelectedValue + "',MethodOfApply='" + ddlApplyMethod.SelectedValue + "',"
                                        + "ApplyDate='" + txtApplyDate.Text + "',Comment=N'" + txtComment.Text + "' where FullName=N'" + Session["Name"]
                                        + "' and Email='" + Session["Email"] + "'");
                                    Session.Remove("Name");
                                    Session.Remove("Email");
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
                    catch (FormatException)
                    {
                        lblError.Text = "Home phone, Work phone and Mobile phone must be number";
                    }
                }
            }
        }
    }
}
