using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.EditCandidate
{
    public partial class EditCandidateUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    string Name = Request.QueryString["Name"];
                    string Email = Request.QueryString["Email"];
                    if (Name == null) { }
                    else {
                        Session["Name"] = Name;
                        Session["Email"] = Email;
                        Response.Redirect(Message.EditCandidatePage);
                    }
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
                                for (int i = 0; i < 25; i++)
                                {
                                    if (i < 10)
                                    {
                                        ddlHour.Items.Add("0" + i);
                                    }
                                    else
                                    {
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
                                if (dt.Rows.Count > 0)
                                {
                                    txtFullName.Text = dt.Rows[0][0].ToString().Trim();
                                    txtAddress.Text = dt.Rows[0][1].ToString().Trim();
                                    txtCity.Text = dt.Rows[0][2].ToString().Trim();
                                    ddlCountry.SelectedValue = dt.Rows[0][3].ToString().Trim();
                                    txtHomePhone.Text = dt.Rows[0][4].ToString().Trim();
                                    txtMobile.Text = dt.Rows[0][5].ToString().Trim();
                                    txtWorkPhone.Text = dt.Rows[0][6].ToString().Trim();
                                    txtEmail.Text = dt.Rows[0][7].ToString().Trim();
                                    ddlVacancy.SelectedValue = dt.Rows[0][8].ToString().Trim();
                                    ddlJobTitle.SelectedValue = dt.Rows[0][11].ToString().Trim();
                                    ddlStatus.SelectedValue = dt.Rows[0][12].ToString().Trim();
                                    ddlApplyMethod.SelectedValue = dt.Rows[0][14].ToString().Trim();
                                    this.inputValue = dt.Rows[0][10].ToString().Trim();
                                    txtComment.Text = dt.Rows[0][9].ToString().Trim();
                                    if (dt.Rows[0][15].ToString().Trim() != "")
                                    {
                                        DateTime interviewDate = DateTime.Parse(dt.Rows[0][15].ToString().Trim());
                                        this.interviewDate = interviewDate.Month + "-" + interviewDate.Day + "-" + interviewDate.Year;
                                        if (interviewDate.Hour >= 10)
                                        {
                                            ddlHour.SelectedValue = interviewDate.Hour.ToString();
                                        }
                                        else {
                                            ddlHour.SelectedValue = "0"+interviewDate.Hour.ToString();
                                        }
                                        if (interviewDate.Minute >= 10)
                                        {
                                            ddlMinutes.SelectedValue = interviewDate.Minute.ToString();
                                        }
                                        else {
                                            ddlMinutes.SelectedValue = "0" + interviewDate.Minute.ToString();
                                        }
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
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                        }
                    }
                }
                else
                {
                    Session.Remove("Name");
                    Session.Remove("Email");
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string inputValue { get; set; }
        protected string interviewDate { get; set; }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
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
            this.inputValue = Request.Form["txtApplyDate"].ToString().Trim();
            this.interviewDate = Request.Form["txtInterviewDate"].ToString().Trim();
            if (txtFullName.Text.Trim() == "")
            {
                lblError.Text = Message.CandidateNameError;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else
            {
                if (txtEmail.Text.Trim() == "")
                {
                    lblError.Text = Message.EmailError;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
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
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else {
                            try{
                                if (Request.Form["txtApplyDate"].ToString().Trim() != "")
                                {
                                    DateTime dt = DateTime.Parse(Request.Form["txtApplyDate"].ToString().Trim());
                                }
                                if (Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                {
                                    DateTime dt1 = DateTime.Parse(Request.Form["txtInterviewDate"].ToString().Trim() + " " + ddlHour.SelectedValue + ":" + ddlMinutes.SelectedValue);
                                }
                                try
                                {
                                    if (Request.Form["txtApplyDate"].ToString().Trim() != "" && Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                    {
                                        _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                            + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                            + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                            + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                            + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                            + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "',"
                                            + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "',"
                                            + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                            + Message.ApplyDateColumn + "='" + Request.Form["txtApplyDate"].ToString().Trim() + "'," + Message.CommentColumn + "=N'" + txtComment.Text
                                            + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "='" + Request.Form["txtInterviewDate"].ToString().Trim()
                                            + " " + ddlHour.SelectedValue + ":" + ddlMinutes.SelectedValue
                                            + "' where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                            + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                    }
                                    else if (Request.Form["txtApplyDate"].ToString().Trim() == "" && Request.Form["txtInterviewDate"].ToString().Trim() != "")
                                    {
                                        _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                               + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                               + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                               + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                               + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                               + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "',"
                                               + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "',"
                                               + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                               + Message.ApplyDateColumn + "=NULL," + Message.CommentColumn + "=N'" + txtComment.Text
                                               + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "='" + Request.Form["txtInterviewDate"].ToString().Trim()
                                               + " " + ddlHour.SelectedValue + ":" + ddlMinutes.SelectedValue
                                               + "' where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                               + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                    }
                                    else if (Request.Form["txtApplyDate"].ToString().Trim() != "" && Request.Form["txtInterviewDate"].ToString().Trim() == "")
                                    {
                                        _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                            + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                            + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                            + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                            + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                            + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "',"
                                            + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "',"
                                            + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                            + Message.ApplyDateColumn + "='" + Request.Form["txtApplyDate"].ToString().Trim() + "'," + Message.CommentColumn + "=N'" + txtComment.Text
                                            + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "=NULL where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                            + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                    }
                                    else
                                    {
                                        _com.updateTable(Message.TableJobCandidate, Message.FullNameColumn + "=N'" + txtFullName.Text + "',"
                                                + Message.StreetColumn + "=N'" + txtAddress.Text + "'," + Message.CityColumn + "=N'" + txtCity.Text + "',"
                                                + Message.CountryColumn + "='" + ddlCountry.SelectedValue + "'," + Message.HomePhoneColumn + "='" + txtHomePhone.Text
                                                + "'," + Message.MobileColumn + "='" + txtMobile.Text + "'," + Message.WorkPhoneColumn + "='" + txtWorkPhone.Text
                                                + "'," + Message.EmailColumn + "='" + txtEmail.Text + "',"
                                                + Message.JobVacancyColumn + "='" + ddlVacancy.SelectedValue + "',"
                                                + Message.JobTitleColumn + "='" + ddlJobTitle.SelectedValue + "',"
                                                + Message.StatusColumn + "='" + ddlStatus.SelectedValue + "'," + Message.MethodOfApplyColumn + "='" + ddlApplyMethod.SelectedValue + "',"
                                                + Message.ApplyDateColumn + "=NULL," + Message.CommentColumn + "=N'" + txtComment.Text
                                                + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "'," + Message.InterviewDateColumn + "=NULL where " + Message.FullNameColumn + "=N'" + Session["Name"]
                                                + "' and " + Message.EmailColumn + "='" + Session["Email"] + "'");
                                    }
                                    if (ddlStatus.SelectedValue != "Hired")
                                    {  
                                    }
                                    else { 
                                        /*
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
                                            + "','" + DateTime.Now + "'", false);*/
                                    }
                                    Session.Remove("Name");
                                    Session.Remove("Email");
                                    _com.closeConnection();
                                    Response.Redirect(Message.CandidatePage, true);
                                }
                                catch (Exception ex)
                                {
                                    lblError.Text = ex.Message;
									ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.ApplyDateError;
								ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                            }
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = Message.PhoneError;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                }
            }
        }
    }
}
