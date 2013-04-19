using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Checkpoint.AddNewQuestion
{
    public partial class AddNewQuestionUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
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
                            txtQuestion.Text = "";
                            lblError.Text = "";
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
            else { 
                pnlChooseLevel.Visible=false;
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
            try
            {
                if (txtQuestion.Text.Trim() == "")
                {
                    lblError.Text = Message.NotEnterQuestion;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else
                {
                    DataTable dt = _com.getData(Message.TableCheckpointQuestion, "*", " order by " 
                        + Message.QuestionIDColumn + " desc");
                    int QuestionID=0;
                    if (dt.Rows.Count > 0)
                    {
                        QuestionID = int.Parse(dt.Rows[0][0].ToString()) + 1;
                    }
                    if (rdoYesNo.Checked == true)
                    {
                        _com.insertIntoTable(Message.TableCheckpointQuestion, "("+Message.QuestionIDColumn+","
                            +Message.QuestionTitleColumn+","+Message.AnserTypeColumn+")", QuestionID
                            + ",N'" + txtQuestion.Text.Trim().Replace("'", "''") + "','YesNo'", true);
                        _com.closeConnection();
                        Response.Redirect(Message.ListCheckpointQuestionPage, true);
                    }
                    else if (rdoNote.Checked == true)
                    {
                        _com.insertIntoTable(Message.TableCheckpointQuestion, "(" + Message.QuestionIDColumn + ","
                            + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn + ")", QuestionID
                            + ",N'" + txtQuestion.Text.Trim().Replace("'", "''") + "','Note'", true);
                        _com.closeConnection();
                        Response.Redirect(Message.ListCheckpointQuestionPage, true);
                    }
                    else
                    {
                        if (txtPerfect.Text.Trim() == "" || txtGreat.Text.Trim() == "" || txtNormal.Text.Trim() == ""
                            || txtBad.Text.Trim() == "" || txtVeryBad.Text.Trim() == "")
                        {
                            lblError.Text = Message.NotEnterAllLevel;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TableCheckpointQuestion, "(" + Message.QuestionIDColumn + ","
                            + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn +","+Message.PerfectLevelColumn
                            + ","+Message.GreatLevelColumn+","+Message.NormalLevelColumn+","+Message.BadLevelColumn
                            +","+Message.VeryBadLevelColumn+")", QuestionID + ",N'" + txtQuestion.Text.Trim().Replace("'","''") 
                            + "','Level',N'" + txtPerfect.Text.Trim() + "',N'" + txtGreat.Text.Trim() + "',N'" 
                            + txtNormal.Text.Trim() + "',N'" + txtBad.Text.Trim() + "',N'" + txtVeryBad.Text.Trim() + "'", true);
                            _com.closeConnection();
                            Response.Redirect(Message.ListCheckpointQuestionPage, true);
                        }
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }

        protected void rdoYesNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoYesNo.Checked == true) {
                pnlChooseLevel.Visible = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.ListCheckpointQuestionPage,true);
        }
    }
}
