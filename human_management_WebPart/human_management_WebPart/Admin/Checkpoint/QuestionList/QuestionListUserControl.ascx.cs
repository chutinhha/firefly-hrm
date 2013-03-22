using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Admin.Checkpoint.QuestionList
{
    public partial class QuestionListUserControl : UserControl
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
                            ddlAnswerType.SelectedIndex = 0;
                            _com.bindData(Message.QuestionIDColumn+","+Message.QuestionTitleColumn+","+Message.AnserTypeColumn
                                +"","",Message.TableCheckpointQuestion,grdData);
                            _com.setGridViewStyle(grdData);
                            grdData.HeaderRow.Cells[2].Text = "Question";
                            grdData.HeaderRow.Cells[3].Text = "Answer Type";
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
                grdData.HeaderRow.Cells[2].Text = "Question";
                grdData.HeaderRow.Cells[3].Text = "Answer Type";
                
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
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
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from " + Message.TableCheckpointQuestion + " where " + Message.QuestionIDColumn + "='"
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                _com.bindData(Message.QuestionIDColumn + "," + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn
                                + "", "", Message.TableCheckpointQuestion, grdData);
                grdData.HeaderRow.Cells[2].Text = "Question";
                grdData.HeaderRow.Cells[3].Text = "Answer Type";
                ddlAnswerType.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
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
        }
    }
}
