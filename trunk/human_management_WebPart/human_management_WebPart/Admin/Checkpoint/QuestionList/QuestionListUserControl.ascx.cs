using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Checkpoint.QuestionList
{
    public partial class QuestionListUserControl : UserControl
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
                    try
                    {
                        if (!IsPostBack)
                        {
                            ddlAnswerType.SelectedIndex = 0;
                            _com.bindData(Message.QuestionIDColumn+","+Message.QuestionTitleColumn+","+Message.AnserTypeColumn
                                +"","",Message.TableCheckpointQuestion,grdData);
                            _com.setGridViewStyle(grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[2].Text = "Question";
                                grdData.HeaderRow.Cells[3].Text = "Answer Type";
                            }
                            else
                            {
                                lblError.Text = Message.NotExistData;
								ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlAnswerType.SelectedValue == "All")
                {
                    _com.bindData(Message.QuestionIDColumn + "," + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn
                                + "", "", Message.TableCheckpointQuestion, grdData);
                }
                else if (ddlAnswerType.SelectedValue == "Yes/No")
                {
                    _com.bindData(Message.QuestionIDColumn + "," + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn
                                + "", " where "+Message.AnserTypeColumn+"='YesNo'", Message.TableCheckpointQuestion, grdData);
                }
                else if (ddlAnswerType.SelectedValue == "Note")
                {
                    _com.bindData(Message.QuestionIDColumn + "," + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn
                                + "", " where " + Message.AnserTypeColumn + "='Note'", Message.TableCheckpointQuestion, grdData);
                }
                else
                {
                    _com.bindData(Message.QuestionIDColumn + "," + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn
                                + "", " where " + Message.AnserTypeColumn + "='Level'", Message.TableCheckpointQuestion, grdData);
                }
                if (grdData.Rows.Count > 0)
                {
                    grdData.HeaderRow.Cells[2].Text = "Question";
                    grdData.HeaderRow.Cells[3].Text = "Answer Type";
                }
                else
                {
                    lblError.Text = Message.NotExistData;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.AddCheckpointQuestionPage,true);
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
                        string sql=@"delete from "+Message.TableEvaluatePoint+" where "+Message.QuestionIDColumn+"='"
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                        sql = @"delete from " + Message.TableCheckpointQuestion + " where " + Message.QuestionIDColumn + "='"
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                if (isCheck == true)
                {
                    _com.bindData(Message.QuestionIDColumn + "," + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn
                                    + "", "", Message.TableCheckpointQuestion, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        grdData.HeaderRow.Cells[2].Text = "Question";
                        grdData.HeaderRow.Cells[3].Text = "Answer Type";
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                    }
                    ddlAnswerType.SelectedIndex = 0;
                }
                else {
                    lblError.Text = Message.NotChooseItemDelete;
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditCheckpointQuestionPage+"/?QuestionID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["QuestionID"] = Server.HtmlDecode(gr.Cells[1].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.EditCheckpointQuestionPage, true);
                    break;
                }
            }
            lblError.Text = Message.NotChooseItemEdit;
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }
    }
}
