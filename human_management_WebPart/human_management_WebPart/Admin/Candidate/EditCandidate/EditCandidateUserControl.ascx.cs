﻿using System;
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
                    if (Session["Name"] == null)
                    {
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                ddlCountry.DataSource = _com.getCountryList();
                                ddlCountry.DataBind();
                                _com.SetItemList(Message.VacancyNameColumn, Message.TableVacancy, ddlVacancy, "", false, "");
                                _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", false, "");
                                _com.SetItemList(Message.StatusColumn, Message.TableCandidateStatus, ddlStatus, "", false, "");
                                DataTable dt = _com.getData(Message.TableJobCandidate, "*", " where " + Message.FullNameColumn
                                    + "=N'" + Session["Name"] + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
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
                                    this.inputValue = dt.Rows[0][13].ToString().Trim();
                                    txtComment.Text = dt.Rows[0][12].ToString().Trim();
                                    if (dt.Rows[0][19].ToString().Trim() != "")
                                    {
                                        DateTime interviewDate = DateTime.Parse(dt.Rows[0][19].ToString().Trim());
                                        this.interviewDate = interviewDate.Month + "-" + interviewDate.Day + "-" + interviewDate.Year;
                                        txtInterviewTime.Text = interviewDate.TimeOfDay.ToString();
                                    }
                                    else {
                                        this.interviewDate = "";
                                    }
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
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }
        protected string inputValue { get; set; }
        protected string interviewDate { get; set; }
        protected void btnApplyDate_Click(object sender, EventArgs e)
        {
        }

        protected void cldDate_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Session.Remove("Name");
            Session.Remove("Email");
            Response.Redirect(Message.CandidatePage,true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.inputValue = Request.Form["txtDate"].ToString().Trim();
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
                                if (Request.Form["txtDate"].ToString().Trim() != "")
                                {
                                    DateTime dt = DateTime.Parse(Request.Form["txtDate"].ToString().Trim());
                                }
                                if (Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                {
                                    DateTime dt1 = DateTime.Parse((Request.Form["txtInterviewDate"].ToString().Trim()+" "+txtInterviewTime.Text.Trim()).Trim());
                                }
                                try
                                {
                                    if (ddlStatus.SelectedValue != "Hired")
                                    {
                                        if (Request.Form["txtDate"].ToString().Trim() != "" && Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                        {
                                            _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                                + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                                + Message.StateColumn + "=N'" + txtState.Text + "'," + Message.ZipCodeColumn + "='" + txtZipCode.Text + "',"
                                                + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                                + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                                + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                                + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "'," + Message.KeywordColumn + "=N'" + txtKeyword.Text + "',"
                                                + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "'," + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "',"
                                                + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                                + Message.ApplyDateColumn + "='" + Request.Form["txtDate"].ToString().Trim() + "'," + Message.CommentColumn + "=N'" + txtComment.Text
                                                + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "='" + (Request.Form["txtInterviewDate"].ToString().Trim()
                                                + " " + txtInterviewTime.Text.Trim()).Trim()
                                                + "' where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                                + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                        }
                                        else if (Request.Form["txtDate"].ToString().Trim() == "" && Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                        {
                                            _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                                   + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                                   + Message.StateColumn + "=N'" + txtState.Text + "'," + Message.ZipCodeColumn + "='" + txtZipCode.Text + "',"
                                                   + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                                   + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                                   + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                                   + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "'," + Message.KeywordColumn + "=N'" + txtKeyword.Text + "',"
                                                   + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "'," + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "',"
                                                   + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                                   + Message.ApplyDateColumn + "=NULL," + Message.CommentColumn + "=N'" + txtComment.Text
                                                   + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "='" + (Request.Form["txtInterviewDate"].ToString().Trim()
                                                   + " " + txtInterviewTime.Text.Trim()).Trim()
                                                   + "' where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                                   + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                        }
                                        else if (Request.Form["txtDate"].ToString().Trim() != "" && Request.Form["txtInterviewDate"].ToString().Trim() == "")
                                        {
                                            _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                                + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                                + Message.StateColumn + "=N'" + txtState.Text + "'," + Message.ZipCodeColumn + "='" + txtZipCode.Text + "',"
                                                + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                                + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                                + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                                + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "'," + Message.KeywordColumn + "=N'" + txtKeyword.Text + "',"
                                                + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "'," + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "',"
                                                + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                                + Message.ApplyDateColumn + "='" + Request.Form["txtDate"].ToString().Trim() + "'," + Message.CommentColumn + "=N'" + txtComment.Text
                                                + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "=NULL where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                                + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                        }
                                        else
                                        {
                                            _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                                    + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                                    + Message.StateColumn + "=N'" + txtState.Text + "'," + Message.ZipCodeColumn + "='" + txtZipCode.Text + "',"
                                                    + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                                    + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                                    + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                                    + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "'," + Message.KeywordColumn + "=N'" + txtKeyword.Text + "',"
                                                    + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "'," + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "',"
                                                    + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                                    + Message.ApplyDateColumn + "=NULL," + Message.CommentColumn + "=N'" + txtComment.Text
                                                    + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "=NULL where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                                    + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                        }
                                    }
                                    else { 
                                        DataTable employeeTopID = _com.getTopID(Message.TableEmployee);
                                        DataTable jobID = _com.getData(Message.TableJobCandidate+" jca join "
                                            +Message.TableJobTitle+" jti on jca."+Message.JobTitleColumn+" = jti."
                                            +Message.JobTitleColumn," distinct "+Message.JobIDColumn," where jti."
                                            +Message.JobTitleColumn+"='"+ddlJobTitle.SelectedValue+"'");
                                        _com.insertIntoTable(Message.TableEmployee, " ("+Message.BusinessEntityIDColumn + ","
                                            + Message.LoginIDColumn + "," + Message.JobIDColumn + "," + Message.BirthDateColumn
                                            + "," + Message.MaritalStatusColumn + "," + Message.GenderColumn + "," + Message.HireDateColumn
                                            + "," + Message.SalariedFlagColumn + "," + Message.VacationHoursColumn + ","
                                            + Message.SickLeaveHoursColumn + "," + Message.CurrentFlagColumn + "," + Message.ModifiedDateColumn
                                            + "," + Message.ImageColumn+")", "'" + (int.Parse(employeeTopID.Rows[0][0].ToString())+1) + "',NULL,"
                                            + jobID.Rows[0][0].ToString() + ",NULL,NULL,NULL,'" + DateTime.Today + "',NULL,NULL,NULL,'True','"
                                            + DateTime.Now + "',NULL", true);
                                        _com.insertIntoTable(Message.TablePerson,""
                                            , "'" + (int.Parse(employeeTopID.Rows[0][0].ToString()) + 1) + "','User','" + txtFullName.Text.Trim()
                                            + "','" + txtEmail.Text.Trim() + "','" + txtHomePhone.Text.Trim() + "','" + txtMobile.Text.Trim()
                                            + "',NULL,'" + txtCity.Text.Trim() + "','" + ddlCountry.SelectedValue + "','" + txtAddress.Text.Trim()
                                            + "','" + DateTime.Now + "'", false);
                                        /*string sql = @"delete from " + Message.TableJobCandidate + " where " + Message.FullNameColumn + "=N'"
                                            + Session["Name"].ToString() + "' and " + Message.EmailColumn + "='" + Session["Email"].ToString() + "';";
                                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                                        command.ExecuteNonQuery();*/
                                    }
                                    Session.Remove("Name");
                                    Session.Remove("Email");
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
                    catch (FormatException)
                    {
                        lblError.Text = Message.PhoneError;
                    }
                }
            }
        }
    }
}
