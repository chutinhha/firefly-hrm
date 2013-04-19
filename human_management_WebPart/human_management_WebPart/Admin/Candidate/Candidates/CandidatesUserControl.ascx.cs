using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Candidates
{
    public partial class CandidatesUserControl : UserControl
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
                            this.fromDate = "";
                            this.toDate = "";
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "All");
                            _com.SetItemList(Message.VacancyNameColumn, Message.TableVacancy, ddlVacancy, "", true, "All");
                            _com.SetItemList(Message.StatusColumn, Message.TableCandidateStatus, ddlStatus, "", true, "All");
                            _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.EmailColumn 
                                + "," + Message.ApplyDateColumn + "," + Message.StatusColumn + "", "", Message.TableJobCandidate, grdData);
                            Session.Remove("Name");
                            Session.Remove("Email");
                            _com.setGridViewStyle(grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[1].Text = "Job Vacancy";
                                grdData.HeaderRow.Cells[2].Text = "Candidate Name";
                                grdData.HeaderRow.Cells[4].Text = "Apply Date";
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
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = "EditCandidate.aspx/?Name=" + Server.HtmlDecode(e.Row.Cells[2].Text)
               + "&Email=" + Server.HtmlDecode(e.Row.Cells[3].Text);
                e.Row.Style["cursor"] = "pointer";
                e.Row.Attributes.Add("onMouseOver", "this.style.cursor = 'hand';this.style.backgroundColor = '#CCCCCC';");
                if (e.Row.RowIndex % 2 != 0)
                {
                    e.Row.Attributes.Add("style", "background-color:white;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = 'white';");
                }
                else {
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
            this.fromDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.toDate = Request.Form["txtDateTo"].ToString().Trim();
        }

        protected string fromDate { get; set; }
        protected string toDate { get; set; }
        protected string confirmDelete { get; set; }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                this.fromDate = "";
                this.toDate = "";
                ddlJobTitle.SelectedIndex = 0;
                ddlVacancy.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;
                ddlApplyMethod.SelectedIndex = 0;
                txtCandidateName.Text = "";
                _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.EmailColumn + "," 
                    + Message.ApplyDateColumn + "," + Message.StatusColumn + "", "", Message.TableJobCandidate, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Job Vacancy";
                    grdData.HeaderRow.Cells[2].Text = "Candidate Name";
                    grdData.HeaderRow.Cells[4].Text = "Apply Date";
                    lblError.Text = "";
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                this.fromDate = Request.Form["txtDateFrom"].ToString().Trim();
                this.toDate = Request.Form["txtDateTo"].ToString().Trim();
                string condition = " where ";
                if (ddlJobTitle.SelectedValue == "All") { }
                else
                {
                    condition = condition + Message.JobTitleColumn+"='" + ddlJobTitle.SelectedItem.Text + "' and ";
                }
                if (ddlVacancy.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.JobVacancyColumn+"='" + ddlVacancy.SelectedItem.Text + "' and ";
                }
                if (ddlStatus.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.StatusColumn+"='" + ddlStatus.SelectedItem.Text + "' and ";
                }
                if (ddlApplyMethod.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.MethodOfApplyColumn+"='" + ddlApplyMethod.SelectedItem.Text + "' and ";
                }
                if (txtCandidateName.Text.Trim() == "") { }
                else
                {
                    condition = condition + Message.FullNameColumn+" like'%" + txtCandidateName.Text + "%' and ";
                }
                if (Request.Form["txtDateFrom"].ToString().Trim() == "") { }
                else
                {
                    condition = condition + Message.ApplyDateColumn + " >= '" + Request.Form["txtDateFrom"].ToString().Trim() + "' and ";
                }
                if (Request.Form["txtDateTo"].ToString().Trim() == "") { }
                else
                {
                    condition = condition + Message.ApplyDateColumn + " <= '" + Request.Form["txtDateTo"].ToString().Trim() + "' and ";
                }
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn +"," + Message.EmailColumn + "," 
                    + Message.ApplyDateColumn + "," + Message.StatusColumn + "",condition, Message.TableJobCandidate, grdData);
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[1].Text = "Job Vacancy";
                    grdData.HeaderRow.Cells[2].Text = "Candidate Name";
                    grdData.HeaderRow.Cells[4].Text = "Apply Date";
                    lblError.Text = "";
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try{
                bool isCheck = false;
                this.fromDate = Request.Form["txtDateFrom"].ToString().Trim();
                this.toDate = Request.Form["txtDateTo"].ToString().Trim();
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        string sql = @"delete from "+Message.TableJobCandidate+" where "+Message.FullNameColumn+"=N'"
                            + Server.HtmlDecode(gr.Cells[2].Text) + "' and " + Message.EmailColumn + "=N'" + Server.HtmlDecode(gr.Cells[3].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                if (isCheck == true)
                {
                    _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.EmailColumn
                        + "," + Message.ApplyDateColumn + "," + Message.StatusColumn + "", "", Message.TableJobCandidate, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        grdData.HeaderRow.Cells[1].Text = "Job Vacancy";
                        grdData.HeaderRow.Cells[2].Text = "Candidate Name";
                        grdData.HeaderRow.Cells[4].Text = "Apply Date";
                        lblError.Text = "";
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                    }
                }else{
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("chkItem");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[2].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[3].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.EditCandidatePage,true);
                }
            }
            lblError.Text = Message.NotChooseItemEdit;
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.AddCandidatePage,true);
        }
    }
}
