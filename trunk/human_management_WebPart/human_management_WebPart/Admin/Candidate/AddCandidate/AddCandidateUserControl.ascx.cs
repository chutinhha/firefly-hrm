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
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            this.applyDate = "";
                            this.interviewDate = "";
                            ddlCountry.DataSource = _com.getCountryList();
                            ddlCountry.DataBind();
                            ddlCountry.SelectedValue = "Vietnam";
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", false, "");
                            _com.SetItemList(Message.VacancyNameColumn, Message.TableVacancy, ddlVacancy, "", false, "");
                            _com.SetItemList(Message.StatusColumn, Message.TableCandidateStatus, ddlStatus, "", false, "");
                            lblError.Text = "";
                            for (int i = 0; i < 25; i++) {
                                if (i < 10)
                                {
                                    ddlHour.Items.Add("0" + i);
                                }
                                else {
                                    ddlHour.Items.Add(i.ToString());
                                }
                            }
                            for (int i = 0; i < 61; i++)
                            {
                                if (i < 10)
                                {
                                    ddlMinutes.Items.Add("0" + i);
                                }
                                else
                                {
                                    ddlMinutes.Items.Add(i.ToString());
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }
        protected string applyDate { get; set; }
        protected string interviewDate { get; set; }
        protected void btnApplyDate_Click(object sender, EventArgs e)
        {
        }

        protected void cldApplyDate_SelectionChanged(object sender, EventArgs e)
        {
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
            this.applyDate = Request.Form["txtApplyDate"].ToString().Trim();
            this.interviewDate = Request.Form["txtInterviewDate"].ToString().Trim();
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
                                if (Request.Form["txtApplyDate"].ToString().Trim() != "")
                                {
                                    DateTime dt = DateTime.Parse(Request.Form["txtApplyDate"].ToString().Trim());
                                }
                                if (Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                {
                                    DateTime dt1 = DateTime.Parse(Request.Form["txtInterviewDate"].ToString().Trim()
                                        +" "+ddlHour.SelectedValue+":"+ddlMinutes.SelectedValue);
                                }
                                try
                                {
                                    if (Request.Form["txtApplyDate"].ToString().Trim() != "" && Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                    {
                                        _com.insertIntoTable(Message.TableJobCandidate, "", "N'" + txtFullName.Text + "',"
                                            + "N'" + txtAddress.Text + "',N'" + txtCity.Text + "',"
                                            + "'" + ddlCountry.SelectedValue + "','" + txtHomePhone.Text
                                            + "','" + txtMobile.Text + "','" + txtWorkPhone.Text + "','" + txtEmail.Text + "',"
                                            + "'" + ddlVacancy.SelectedValue + "',"
                                            + "N'" + txtComment.Text + "','" + Request.Form["txtApplyDate"].ToString().Trim() + "','" + ddlJobTitle.SelectedValue + "',"
                                            + "'" + ddlStatus.SelectedValue + "','" + ddlApplyMethod.SelectedValue + "','" + DateTime.Now + "','"
                                            + Request.Form["txtInterviewDate"].ToString().Trim() + " " +ddlHour.SelectedValue+":"+ddlMinutes.SelectedValue+ "'", false);
                                    }
                                    else if (Request.Form["txtApplyDate"].ToString().Trim() == "" && Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                    {
                                        _com.insertIntoTable(Message.TableJobCandidate, "", "N'" + txtFullName.Text + "',"
                                            + "N'" + txtAddress.Text + "',N'" + txtCity.Text + "',"
                                            + "'" + ddlCountry.SelectedValue + "','" + txtHomePhone.Text
                                            + "','" + txtMobile.Text + "','" + txtWorkPhone.Text + "','" + txtEmail.Text + "',"
                                            + "'" + ddlVacancy.SelectedValue + "',"
                                            + "N'" + txtComment.Text + "',NULL,'" + ddlJobTitle.SelectedValue + "',"
                                            + "'" + ddlStatus.SelectedValue + "','" + ddlApplyMethod.SelectedValue + "','" + DateTime.Now + "','"
                                            + Request.Form["txtInterviewDate"].ToString().Trim() + " " + ddlHour.SelectedValue + ":" + ddlMinutes.SelectedValue + "'", false);
                                    }
                                    else if (Request.Form["txtApplyDate"].ToString().Trim() != "" && Request.Form["txtInterviewDate"].ToString().Trim() == "")
                                    {
                                        _com.insertIntoTable(Message.TableJobCandidate, "", "N'" + txtFullName.Text + "',"
                                            + "N'" + txtAddress.Text + "',N'" + txtCity.Text + "',"
                                            + "'" + ddlCountry.SelectedValue + "','" + txtHomePhone.Text
                                            + "','" + txtMobile.Text + "','" + txtWorkPhone.Text + "','" + txtEmail.Text + "',"
                                            + "'" + ddlVacancy.SelectedValue + "',"
                                            + "N'" + txtComment.Text + "','" + Request.Form["txtApplyDate"].ToString().Trim() + "','" + ddlJobTitle.SelectedValue + "',"
                                            + "'" + ddlStatus.SelectedValue + "','" + ddlApplyMethod.SelectedValue + "','" + DateTime.Now + "',NULL", false);
                                    }
                                    else {
                                        _com.insertIntoTable(Message.TableJobCandidate, "", "N'" + txtFullName.Text + "',"
                                            + "N'" + txtAddress.Text + "',N'" + txtCity.Text + "',"
                                            + "'" + ddlCountry.SelectedValue + "','" + txtHomePhone.Text
                                            + "','" + txtMobile.Text + "','" + txtWorkPhone.Text + "','" + txtEmail.Text + "',"
                                            + "'" + ddlVacancy.SelectedValue + "',"
                                            + "N'" + txtComment.Text + "',NULL,'" + ddlJobTitle.SelectedValue + "',"
                                            + "'" + ddlStatus.SelectedValue + "','" + ddlApplyMethod.SelectedValue + "','" + DateTime.Now + "',NULL", false);
                                    }
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
