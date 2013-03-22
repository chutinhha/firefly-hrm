using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Admin.Checkpoint.EditQuestion
{
    public partial class EditQuestionUserControl : UserControl
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
                    if (Session["QuestionID"] != null)
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                DataTable dt = _com.getData(Message.TableCheckpointQuestion,"*", " where " + Message.QuestionIDColumn
                                    + "='" + Session["QuestionID"].ToString().Trim() + "'");
                                if (dt.Rows.Count > 0)
                                {
                                    txtQuestion.Text = dt.Rows[0][1].ToString().Trim();
                                    if (dt.Rows[0][2].ToString().Trim() == "YesNo") {
                                        rdoYesNo.Checked = true;
                                    }
                                    else if (dt.Rows[0][2].ToString().Trim() == "Note")
                                    {
                                        rdoNote.Checked = true;
                                    }
                                    else {
                                        rdoLevel.Checked = true;
                                        pnlChooseLevel.Visible = true;
                                        txtPerfect.Text = dt.Rows[0][3].ToString().Trim();
                                        txtGreat.Text = dt.Rows[0][4].ToString().Trim();
                                        txtNormal.Text = dt.Rows[0][5].ToString().Trim();
                                        txtBad.Text = dt.Rows[0][6].ToString().Trim();
                                        txtVeryBad.Text = dt.Rows[0][7].ToString().Trim();
                                    }
                                }
                                rdoLevel.AutoPostBack = true;
                                rdoNote.AutoPostBack = true;
                                rdoYesNo.AutoPostBack = true;
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                    else {
                        Response.Redirect(Message.ListCheckpointQuestionPage);
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void rdoLevel_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoLevel.Checked == true)
            {
                pnlChooseLevel.Visible = true;
            }
            else
            {
                pnlChooseLevel.Visible = false;
            }
        }

        protected void rdoNote_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoNote.Checked == true)
            {
                pnlChooseLevel.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text.Trim() == "")
            {
                lblError.Text = Message.NotEnterQuestion;
            }
            else
            {
                try
                {
                    if (rdoYesNo.Checked == true)
                    {
                        _com.updateTable(Message.TableCheckpointQuestion, Message.QuestionTitleColumn + "=N'"
                            + txtQuestion.Text.Trim() + "'," + Message.AnserTypeColumn + "='" + "YesNo' where "
                            + Message.QuestionIDColumn + "='" + Session["QuestionID"].ToString().Trim() + "'");
                    }
                    else if (rdoNote.Checked == true)
                    {
                        _com.updateTable(Message.TableCheckpointQuestion, Message.QuestionTitleColumn + "=N'"
                            + txtQuestion.Text.Trim() + "'," + Message.AnserTypeColumn + "='" + "Note' where "
                            + Message.QuestionIDColumn + "='" + Session["QuestionID"].ToString().Trim() + "'");
                    }
                    else {
                        if (txtPerfect.Text.Trim() == "" || txtGreat.Text.Trim() == "" || txtNormal.Text.Trim() == ""
                            || txtBad.Text.Trim() == "" || txtVeryBad.Text.Trim() == "")
                        {
                            lblError.Text = Message.NotEnterAllLevel;
                        }
                        else
                        {
                            _com.updateTable(Message.TableCheckpointQuestion, Message.QuestionTitleColumn + "=N'"
                            + txtQuestion.Text.Trim() + "'," + Message.AnserTypeColumn + "='" + "Level',PerfectLevel=N'"
                            +txtPerfect.Text.Trim()+ "',GreatLevel=N'"+txtGreat.Text.Trim()+"',NormalLevel=N'"
                            +txtNormal.Text.Trim()+"',BadLevel=N'"+txtBad.Text.Trim()+"',VeryBad=N'"+txtVeryBad.Text.Trim()+ "' where "
                            + Message.QuestionIDColumn + "='" + Session["QuestionID"].ToString().Trim() + "'");
                        }
                    }
                    Session.Remove("QuestionID");
                    _com.closeConnection();
                    Response.Redirect(Message.ListCheckpointQuestionPage,true);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.ListCheckpointQuestionPage,true);
        }

        protected void rdoYesNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoYesNo.Checked == true)
            {
                pnlChooseLevel.Visible = false;
            }
        }
    }
}
