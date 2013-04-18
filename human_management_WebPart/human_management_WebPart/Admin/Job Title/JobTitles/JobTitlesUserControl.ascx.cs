using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;using System.Web;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.JobTitles
{
    public partial class JobTitlesUserControl : UserControl
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
								//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                            }
                            lblError.Text = "";
                            Session.Remove("Name");
                            _com.setGridViewStyle(grdData);
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
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditJobTitlePage+"/?Name=" + Server.HtmlDecode(e.Row.Cells[1].Text);
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
                if (isCheck == true)
                {
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
            lblError.Text = Message.NotChooseItemEdit;
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }
    }
}
