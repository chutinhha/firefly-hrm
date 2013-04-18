using System;
using System.Data.SqlClient;
using System.Web.UI;using System.Web;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Vacancies
{
    public partial class VacanciesUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
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
                            ddlStatus.SelectedIndex = 0;
                            Session.Remove("Name");
                            _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.StatusColumn 
                                + "", "", Message.TableVacancy, grdData);
                            _com.setGridViewStyle(grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                                grdData.HeaderRow.Cells[2].Text = "Job Title";
                                grdData.HeaderRow.Cells[3].Text = "Status";
                            }
                            else
                            {
                                lblError.Text = Message.NotExistData;
								//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmDelete { get; set; }
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
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.StatusColumn 
                    + "",condition, Message.TableVacancy, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                    grdData.HeaderRow.Cells[2].Text = "Job Title";
                    grdData.HeaderRow.Cells[3].Text = "Status";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditVacancyPage+"/?Name=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                e.Row.Style["cursor"] = "pointer";
                e.Row.Attributes.Add("onMouseOver", "this.style.cursor = 'hand';this.style.backgroundColor = '#CCCCCC';");
                if (e.Row.RowIndex % 2 != 0)
                {
                    e.Row.Attributes.Add("style", "background-color:white;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = 'white';");
                }
                else
                {
                    e.Row.Attributes.Add("style", "background-color:#EAEAEA;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = '#EAEAEA';");
                }
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                ddlJobTitle.SelectedIndex = 0;
                ddlVacancy.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;
                _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.StatusColumn 
                    + "", "", Message.TableVacancy, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                    grdData.HeaderRow.Cells[2].Text = "Job Title";
                    grdData.HeaderRow.Cells[3].Text = "Status";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
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
            lblError.Text = Message.NotChooseItemEdit;
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        _com.updateTable(Message.TableJobCandidate, " " + Message.JobVacancyColumn + "=NULL where "
                            + Message.JobVacancyColumn + "=N'" + Server.HtmlDecode(gr.Cells[1].Text) + "';");
                        string sql = @"delete from "+Message.TableVacancy+" where "+Message.VacancyNameColumn+"=N'" 
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                if (isCheck == true)
                {
                    _com.bindData(Message.VacancyNameColumn + "," + Message.JobTitleColumn + "," + Message.StatusColumn
                        + "", "", Message.TableVacancy, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        grdData.HeaderRow.Cells[1].Text = "Vacancy Name";
                        grdData.HeaderRow.Cells[2].Text = "Job Title";
                        grdData.HeaderRow.Cells[3].Text = "Status";
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                    }
                }
                else {
                    lblError.Text = Message.NotChooseItemDelete;
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
