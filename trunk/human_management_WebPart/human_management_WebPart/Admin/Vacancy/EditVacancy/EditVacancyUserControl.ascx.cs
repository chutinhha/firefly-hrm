using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.EditVacancy
{
    public partial class EditVacancyUserControl : UserControl
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
                    if (Name == null) { }
                    else
                    {
                        Session["Name"] = Name;
                        Response.Redirect(Message.EditVacancyPage);
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
                                _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", false, "");
                                DataTable dt = _com.getData(Message.TableVacancy, "*", " where " + Message.VacancyNameColumn
                                    + "=N'" + Session["Name"] + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    ddlJobTitle.SelectedValue = dt.Rows[0][0].ToString().Trim();
                                    txtVacancy.Text = dt.Rows[0][1].ToString().Trim();
                                    txtNoOfPosition.Text = dt.Rows[0][2].ToString().Trim();
                                    txtDescription.Text = dt.Rows[0][3].ToString().Trim();
                                    if (dt.Rows[0][4].ToString().Trim() == "Active")
                                    {
                                        chkActive.Checked = true;
                                    }
                                    else
                                    {
                                        chkActive.Checked = false;
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
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtVacancy.Text.Trim() == "")
            {
                lblError.Text = Message.VacancyNameError;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else {
                try
                {
                    if (txtNoOfPosition.Text.Trim() != "")
                    {
                        int no = int.Parse(txtNoOfPosition.Text.Trim());
                        try
                        {
                            string active;
                            if (chkActive.Checked == true)
                            {
                                active = "Active";
                            }
                            else
                            {
                                active = "Closed";
                            }
                            DataTable jobCandidate = _com.getData(Message.TableJobCandidate, Message.FullNameColumn + ","
                                + Message.EmailColumn, " where " + Message.JobVacancyColumn + "=N'" + Session["Name"]+"';");
                            _com.updateTable(Message.TableJobCandidate, " " + Message.JobVacancyColumn + "=NULL where " + Message.JobVacancyColumn
                                + "=N'" + Session["Name"] + "';");
                            if (ddlJobTitle.SelectedValue != "NULL")
                            {
                                _com.updateTable(Message.TableVacancy, Message.VacancyNameColumn + "=N'" + txtVacancy.Text + "',"
                                    + Message.NumberOfPositionColumn
                                    + "='" + txtNoOfPosition.Text + "'," + Message.DescriptionColumn + "=N'" + txtDescription.Text
                                    + "'," + Message.JobTitleColumn + "=N'" + ddlJobTitle.SelectedValue + "'," + Message.StatusColumn
                                    + "='" + active + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.VacancyNameColumn + "=N'" + Session["Name"] + "'");
                            }
                            else
                            {
                                _com.updateTable(Message.TableVacancy, Message.VacancyNameColumn + "=N'" + txtVacancy.Text + "',"
                                    + Message.NumberOfPositionColumn
                                    + "='" + txtNoOfPosition.Text + "'," + Message.DescriptionColumn + "=N'" + txtDescription.Text
                                    + "'," + Message.JobTitleColumn + "=" + ddlJobTitle.SelectedValue + "," + Message.StatusColumn
                                    + "='" + active + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.VacancyNameColumn + "=N'" + Session["Name"] + "'");
                            }
                            if (jobCandidate.Rows.Count > 0) {
                                for (int i = 0; i < jobCandidate.Rows.Count; i++) {
                                    _com.updateTable(Message.TableJobCandidate, " " + Message.JobVacancyColumn + "=N'"
                                        + txtVacancy.Text + "' where " + Message.FullNameColumn + "=N'" + jobCandidate.Rows[i][0].ToString()
                                        + "' and " + Message.EmailColumn + "=N'" + jobCandidate.Rows[i][1].ToString() + "';");
                                }
                            }
                            Session.Remove("Name");
                            _com.closeConnection();
                            Response.Redirect(Message.VacancyPage, true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                        }
                    }else{
                        try
                        {
                            string active;
                            if (chkActive.Checked == true)
                            {
                                active = "Active";
                            }
                            else
                            {
                                active = "Closed";
                            }
                            DataTable jobCandidate = _com.getData(Message.TableJobCandidate, Message.FullNameColumn + ","
                                + Message.EmailColumn, " where " + Message.JobVacancyColumn + "=N'" + Session["Name"] + "';");
                            _com.updateTable(Message.TableJobCandidate, " " + Message.JobVacancyColumn + "=NULL where " + Message.JobVacancyColumn
                                + "=N'" + Session["Name"] + "';");
                            if (ddlJobTitle.SelectedValue != "NULL")
                            {
                                _com.updateTable(Message.TableVacancy, Message.VacancyNameColumn + "=N'" + txtVacancy.Text + "',"
                                    + Message.NumberOfPositionColumn
                                    + "='" + txtNoOfPosition.Text + "'," + Message.DescriptionColumn + "=N'" + txtDescription.Text
                                    + "'," + Message.JobTitleColumn + "=N'" + ddlJobTitle.SelectedValue + "'," + Message.StatusColumn
                                    + "='" + active + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.VacancyNameColumn + "=N'" + Session["Name"] + "'");
                            }
                            else {
                                _com.updateTable(Message.TableVacancy, Message.VacancyNameColumn + "=N'" + txtVacancy.Text + "',"
                                    + Message.NumberOfPositionColumn
                                    + "='" + txtNoOfPosition.Text + "'," + Message.DescriptionColumn + "=N'" + txtDescription.Text
                                    + "'," + Message.JobTitleColumn + "=" + ddlJobTitle.SelectedValue + "," + Message.StatusColumn
                                    + "='" + active + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.VacancyNameColumn + "=N'" + Session["Name"] + "'");
                            }
                            if (jobCandidate.Rows.Count > 0)
                            {
                                for (int i = 0; i < jobCandidate.Rows.Count; i++)
                                {
                                    _com.updateTable(Message.TableJobCandidate, " " + Message.JobVacancyColumn + "=N'"
                                        + txtVacancy.Text + "' where " + Message.FullNameColumn + "=N'" + jobCandidate.Rows[i][0].ToString()
                                        + "' and " + Message.EmailColumn + "=N'" + jobCandidate.Rows[i][1].ToString() + "';");
                                }
                            }
                            Session.Remove("Name");
                            _com.closeConnection();
                            Response.Redirect(Message.VacancyPage, true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                        }
                    }
                }
                catch (FormatException)
                {
                    lblError.Text = Message.NumberOfPosition;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Session.Remove("Name");
            Response.Redirect(Message.VacancyPage,true);
        }
    }
}
