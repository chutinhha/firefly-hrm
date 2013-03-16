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
        private Common _com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin")
            {
                try
                {
                    if (!IsPostBack)
                    {
                        ddlCountry.DataSource = _com.getCountryList();
                        ddlCountry.DataBind();
                        _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", false, "");
                        _com.SetItemList(Message.VacancyNameColumn, Message.TableVacancy, ddlVacancy, "", false, "");
                        _com.SetItemList(Message.StatusColumn, Message.TableCandidateStatus, ddlStatus, "", false, "");
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
                Response.Write("<script language='JavaScript'> alert('"+Message.AcessDenied+"'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else {
                    Response.Redirect(Message.HomePage,true);
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
            _com.closeConnection();
            Response.Redirect(Message.CandidatePage, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtFullName.Text.Trim() == "")
            {
                lblError.Text = Message.CandidateNameError;
            }
            else
            {
                if (txtEmail.Text.Trim() == "")
                {
                    lblError.Text = Message.EmailError;
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
                            lblError.Text = Message.EmailContain;
                        }
                        else {
                            try{
                                if (txtApplyDate.Text.Trim() != "")
                                {
                                    DateTime dt = DateTime.Parse(txtApplyDate.Text);
                                }
                                try
                                {
                                    _com.insertIntoTable(Message.TableJobCandidate,"", "N'" + txtFullName.Text + "',"
                                        + "N'" + txtAddress.Text + "',N'" + txtCity.Text + "',"
                                        + "N'" + txtState.Text + "','" + txtZipCode.Text + "',"
                                        + "'" + ddlCountry.SelectedValue + "','" + txtHomePhone.Text
                                        + "','" + txtMobile.Text + "','" + txtWorkPhone.Text + "','" + txtEmail.Text + "',"
                                        + "'" + ddlVacancy.SelectedValue + "',N'" + txtKeyword.Text + "',"
                                        + "N'" + txtComment.Text + "','" + txtApplyDate.Text + "','" + ddlJobTitle.SelectedValue + "',"
                                        + "N'" + txtHiringManager.Text + "',"
                                        + "'" + ddlStatus.SelectedValue + "','" + ddlApplyMethod.SelectedValue + "','"+DateTime.Now+"'",false);
                                    _com.closeConnection();
                                    Response.Redirect(Message.CandidatePage, true);
                                }
                                catch (Exception ex)
                                {
                                    lblError.Text = ex.Message;
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.ApplyDateError;
                            }
                        }
                    }
                    catch (FormatException) {
                        lblError.Text = Message.PhoneError;
                    }
                }
            }
        }
    }
}
