using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Checkpoint.EditQuestion
{
    public partial class EditQuestionUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    string QuestionID = Request.QueryString["QuestionID"];
                    if (QuestionID == null) { }
                    else
                    {
                        Session["QuestionID"] = QuestionID;
                        Response.Redirect(Message.EditCheckpointQuestionPage);
                    }
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
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                        }
                    }
                    else {
                        Response.Redirect(Message.ListCheckpointQuestionPage);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
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
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else
            {
                try
                {
                    if (rdoYesNo.Checked == true)
                    {
                        _com.updateTable(Message.TableCheckpointQuestion, Message.QuestionTitleColumn + "=N'"
                            + txtQuestion.Text.Trim().Replace("'","''") + "'," + Message.AnserTypeColumn + "='" + "YesNo' where "
                            + Message.QuestionIDColumn + "='" + Session["QuestionID"].ToString().Trim() + "'");
                    }
                    else if (rdoNote.Checked == true)
                    {
                        _com.updateTable(Message.TableCheckpointQuestion, Message.QuestionTitleColumn + "=N'"
                            + txtQuestion.Text.Trim().Replace("'", "''") + "'," + Message.AnserTypeColumn + "='" + "Note' where "
                            + Message.QuestionIDColumn + "='" + Session["QuestionID"].ToString().Trim() + "'");
                    }
                    else {
                        if (txtPerfect.Text.Trim() == "" || txtGreat.Text.Trim() == "" || txtNormal.Text.Trim() == ""
                            || txtBad.Text.Trim() == "" || txtVeryBad.Text.Trim() == "")
                        {
                            lblError.Text = Message.NotEnterAllLevel;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            _com.updateTable(Message.TableCheckpointQuestion, Message.QuestionTitleColumn + "=N'"
                            + txtQuestion.Text.Trim().Replace("'", "''") + "'," + Message.AnserTypeColumn + "='" + "Level',PerfectLevel=N'"
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
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
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
