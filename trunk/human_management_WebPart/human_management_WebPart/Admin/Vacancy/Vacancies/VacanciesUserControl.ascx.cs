using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Vacancies
{
    public partial class VacanciesUserControl : UserControl
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
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "All");
                            _com.SetItemList(Message.VacancyNameColumn, Message.TableVacancy, ddlVacancy, "", true, "All");
                            txtHiringManager.Text = "";
                            ddlStatus.SelectedIndex = 0;
                            Session.Remove("Name");
                            _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.HiringManagerColumn
                                + "," + Message.StatusColumn + "", "", Message.TableVacancy, grdData);
                            _com.setGridViewStyle(grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                                grdData.HeaderRow.Cells[2].Text = "Job Title";
                                grdData.HeaderRow.Cells[3].Text = "Hiring Manager";
                                grdData.HeaderRow.Cells[4].Text = "Status";
                            }
                            else
                            {
                                lblError.Text = Message.NotExistData;
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string condition = " where ";
                if (ddlJobTitle.SelectedValue == "All") { }
                else
                {
                    condition = condition + Message.JobTitleColumn+"='" + ddlJobTitle.SelectedItem.Text + "' and ";
                }
                if (ddlVacancy.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.VacancyNameColumn+"='" + ddlVacancy.SelectedItem.Text + "' and ";
                }
                if (ddlStatus.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.StatusColumn+"='" + ddlStatus.SelectedValue + "' and ";
                }
                if (txtHiringManager.Text.Trim() == "") { }
                else
                {
                    condition = condition + Message.HiringManagerColumn+" like'%" + txtHiringManager.Text + "%' and ";
                }
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.HiringManagerColumn
                            + "," + Message.StatusColumn + "",condition, Message.TableVacancy, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                    grdData.HeaderRow.Cells[2].Text = "Job Title";
                    grdData.HeaderRow.Cells[3].Text = "Hiring Manager";
                    grdData.HeaderRow.Cells[4].Text = "Status";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                ddlJobTitle.SelectedIndex = 0;
                ddlVacancy.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;
                txtHiringManager.Text = "";
                _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.HiringManagerColumn
                            + "," + Message.StatusColumn + "", "", Message.TableVacancy, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                    grdData.HeaderRow.Cells[2].Text = "Job Title";
                    grdData.HeaderRow.Cells[3].Text = "Hiring Manager";
                    grdData.HeaderRow.Cells[4].Text = "Status";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.AddVacancyPage,true);
        }

        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            CheckBox cbSelectedHeader = (CheckBox)grdData.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdData.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                if (cbSelectedHeader.Checked == true)
                {
                    cbSelected.Checked = true;
                }
                else
                {
                    cbSelected.Checked = false;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.EditVacancyPage, true);
                    break;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        _com.updateTable(Message.TableJobCandidate, " " + Message.JobVacancyColumn + "=NULL where "
                            + Message.JobVacancyColumn + "=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';");
                        string sql = @"delete from "+Message.TableVacancy+" where "+Message.VacancyNameColumn+"=N'" 
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.HiringManagerColumn
                            + "," + Message.StatusColumn + "", "", Message.TableVacancy, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                    grdData.HeaderRow.Cells[2].Text = "Job Title";
                    grdData.HeaderRow.Cells[3].Text = "Hiring Manager";
                    grdData.HeaderRow.Cells[4].Text = "Status";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
