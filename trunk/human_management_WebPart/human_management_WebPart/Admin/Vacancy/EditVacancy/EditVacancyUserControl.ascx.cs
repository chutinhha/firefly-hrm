using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditVacancy
{
    public partial class EditVacancyUserControl : UserControl
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
                                _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", false, "");
                                DataTable dt = _com.getData(Message.TableVacancy, "*", " where " + Message.VacancyNameColumn
                                    + "=N'" + Session["Name"] + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    ddlJobTitle.SelectedValue = dt.Rows[0][0].ToString().Trim();
                                    txtVacancy.Text = dt.Rows[0][1].ToString().Trim();
                                    txtHiringManager.Text = dt.Rows[0][2].ToString().Trim();
                                    txtNoOfPosition.Text = dt.Rows[0][3].ToString().Trim();
                                    txtDescription.Text = dt.Rows[0][4].ToString().Trim();
                                    if (dt.Rows[0][5].ToString().Trim() == "Active")
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
                        }
                    }
                }
                else
                {
                    Session.Remove("Name");
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtVacancy.Text.Trim() == "")
            {
                lblError.Text = Message.VacancyNameError;
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
                                    + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "'," + Message.NumberOfPositionColumn
                                    + "='" + txtNoOfPosition.Text + "'," + Message.DescriptionColumn + "=N'" + txtDescription.Text
                                    + "'," + Message.JobTitleColumn + "=N'" + ddlJobTitle.SelectedValue + "'," + Message.StatusColumn
                                    + "='" + active + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.VacancyNameColumn + "=N'" + Session["Name"] + "'");
                            }
                            else
                            {
                                _com.updateTable(Message.TableVacancy, Message.VacancyNameColumn + "=N'" + txtVacancy.Text + "',"
                                    + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "'," + Message.NumberOfPositionColumn
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
                                    + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "'," + Message.NumberOfPositionColumn
                                    + "='" + txtNoOfPosition.Text + "'," + Message.DescriptionColumn + "=N'" + txtDescription.Text
                                    + "'," + Message.JobTitleColumn + "=N'" + ddlJobTitle.SelectedValue + "'," + Message.StatusColumn
                                    + "='" + active + "',"+Message.ModifiedDateColumn+"='" + DateTime.Now + "' where " + Message.VacancyNameColumn + "=N'" + Session["Name"] + "'");
                            }
                            else {
                                _com.updateTable(Message.TableVacancy, Message.VacancyNameColumn + "=N'" + txtVacancy.Text + "',"
                                    + Message.HiringManagerColumn + "=N'" + txtHiringManager.Text + "'," + Message.NumberOfPositionColumn
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
                        }
                    }
                }
                catch (FormatException)
                {
                    lblError.Text = Message.NumberOfPosition;
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
