using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Admin.Checkpoint.AddNewQuestion
{
    public partial class AddNewQuestionUserControl : UserControl
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
                }
                else
                {
                    DataTable dt = _com.getData(Message.TableCheckpointQuestion, " order by "+Message.QuestionIDColumn+" desc");
                    int QuestionID=0;
                    if (dt.Rows.Count > 0)
                    {
                        QuestionID = int.Parse(dt.Rows[0][0].ToString()) + 1;
                    }
                    if (rdoYesNo.Checked == true)
                    {
                        _com.insertIntoTable(Message.TableCheckpointQuestion, "("+Message.QuestionIDColumn+","
                            +Message.QuestionTitleColumn+","+Message.AnserTypeColumn+")", QuestionID
                            + ",N'" + txtQuestion.Text.Trim() + "','YesNo'", true);
                        _com.closeConnection();
                        Response.Redirect(Message.ListCheckpointQuestionPage, true);
                    }
                    else if (rdoNote.Checked == true)
                    {
                        _com.insertIntoTable(Message.TableCheckpointQuestion, "(" + Message.QuestionIDColumn + ","
                            + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn + ")", QuestionID
                            + ",N'" + txtQuestion.Text.Trim() + "','Note'", true);
                        _com.closeConnection();
                        Response.Redirect(Message.ListCheckpointQuestionPage, true);
                    }
                    else
                    {
                        if (txtPerfect.Text.Trim() == "" || txtGreat.Text.Trim() == "" || txtNormal.Text.Trim() == ""
                            || txtBad.Text.Trim() == "" || txtVeryBad.Text.Trim() == "")
                        {
                            lblError.Text = Message.NotEnterAllLevel;
                        }
                        else
                        {
                            _com.insertIntoTable(Message.TableCheckpointQuestion, "(" + Message.QuestionIDColumn + ","
                            + Message.QuestionTitleColumn + "," + Message.AnserTypeColumn +","+Message.PerfectLevelColumn
                            + ","+Message.GreatLevelColumn+","+Message.NormalLevelColumn+","+Message.BadLevelColumn
                            +","+Message.VeryBadLevelColumn+")", QuestionID + ",N'" + txtQuestion.Text.Trim() 
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
