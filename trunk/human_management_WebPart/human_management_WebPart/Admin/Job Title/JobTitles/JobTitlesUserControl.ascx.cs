using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.JobTitles
{
    public partial class JobTitlesUserControl : UserControl
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
                            _com.bindData(Message.JobTitleColumn + "," + Message.JobDescriptionColumn + "," + Message.JobCategoryColumn
                                + "", "", Message.TableJobTitle, grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[1].Text = "Job Title";
                                grdData.HeaderRow.Cells[2].Text = "Job Description";
                                grdData.HeaderRow.Cells[3].Text = "Job Category";
                            }
                            else
                            {
                                lblError.Text = Message.NotExistData;
                            }
                            lblError.Text = "";
                            Session.Remove("Name");
                            _com.setGridViewStyle(grdData);
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

        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        DataTable jobCandidate = _com.getData(Message.TableJobCandidate, Message.FullNameColumn + "," + Message.EmailColumn
                       , " where " + Message.JobTitleColumn + "=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';");
                        DataTable jobVacancy = _com.getData(Message.TableVacancy, Message.VacancyNameColumn
                            , " where " + Message.JobTitleColumn + "=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';");
                        _com.updateTable(Message.TableJobCandidate, " " + Message.JobTitleColumn + "=NULL where JobTitle='" + Server.HtmlDecode(gr.Cells[1].Text) + "'");
                        _com.updateTable(Message.TableVacancy, " " + Message.JobTitleColumn + "=NULL where JobTitle='" + Server.HtmlDecode(gr.Cells[1].Text) + "'");
                        DataTable employee = _com.getData(Message.TableJobTitle, Message.JobIDColumn, " where " + Message.JobTitleColumn
                            + "=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';");
                        if (employee.Rows.Count > 0) {
                            for (int i = 0; i < employee.Rows.Count; i++) {
                                _com.updateTable(Message.TableEmployee, " "+Message.JobIDColumn
                                    +"=NULL where "+Message.JobIDColumn+"='" + employee.Rows[i][0].ToString() + "';");
                            }
                        }
                        string sql = @"delete from "+Message.TableJobTitle+" where "+Message.JobTitleColumn+"=N'" 
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                        lblError.Text = "";
                    }
                }
                _com.bindData(Message.JobTitleColumn + "," + Message.JobDescriptionColumn + "," 
                    + Message.JobCategoryColumn, "", Message.TableJobTitle, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Job Title";
                    grdData.HeaderRow.Cells[2].Text = "Job Description";
                    grdData.HeaderRow.Cells[3].Text = "Job Category";
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
            Response.Redirect(Message.AddJobTitlePage,true);
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
                    Response.Redirect(Message.EditJobTitlePage,true);
                }
            }
        }
    }
}
