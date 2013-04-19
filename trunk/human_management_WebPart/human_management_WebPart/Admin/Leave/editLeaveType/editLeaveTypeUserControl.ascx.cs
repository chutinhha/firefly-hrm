using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Leave.editLeaveType
{
    public partial class editLeaveTypeUserControl : UserControl
    {
        private string strTaskID = "";
        private CommonFunction _com = new CommonFunction();
        
        protected void loadData()
        {
            string strTableName = Message.TableTask;
            string strColum = " TaskName,Note, LimitDate ";
            string strCondition = " WHERE TaskId = " + strTaskID;
            DataTable dt = _com.getData(strTableName, strColum, strCondition);
            txtLeaveName.Text = dt.Rows[0][0].ToString();
            txtNote.Text = dt.Rows[0][1].ToString();
            if (dt.Rows[0][2].ToString() == "0")
            {
                rdbLimitedNo.Checked = true;
                txtLimitDay.Text = "";
                pnlLimitedYes.Visible = false;
            }
            else
            {
                rdbLimitedYes.Checked = true;
                rdbLimitedNo.Checked = false;
                txtLimitDay.Text = dt.Rows[0][2].ToString();
                pnlLimitedYes.Visible = true;
            }
        }

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
                    try
                    {
                        if (!IsPostBack)
                        {
                            // Get ID
                            strTaskID = Request.QueryString["TaskID"];
                            if (strTaskID == null) { }
                            else
                            {
                                //Delete link ID
                                Session["TaskID"] = strTaskID;
                                Response.Redirect(Message.EditLeaveTypePage);
                            }
                            strTaskID = Session["TaskID"].ToString();
                            loadData();
                        }
                    }
                    catch (Exception ex) {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtLeaveName.Text == "")
                {
                    lblUserGuide.Text = "* Require Failed";
                    return;
                }
                lblUserGuide.Text = "";
                if (rdbLimitedYes.Checked == true)
                {
                    if (txtLimitDay.Text == "")
                    {
                        lblUserGuide.Text = "* Require Failed";
                        return;
                    }
                }

                //Insert Database to Project Table
                string strTableName = Message.TableTask;

                //Leave Name;
                string strLeaveName = "TaskName = N'" + txtLeaveName.Text + "'";
                //Leave Note
                string strNote = "Note = N'" + txtNote.Text + "'";
                //LimitedDate            
                string strLimitedDate = "";
                if (txtLimitDay.Text != "") strLimitedDate = "LimitDate = " + txtLimitDay.Text;
                else strLimitedDate = "LimitDate = 0";

                //Condition
                strTaskID = Session["TaskID"].ToString();
                string strCondition = strLeaveName + " , " + strNote + " , " + strLimitedDate + " where TaskId = " + strTaskID;
                _com.updateTable(strTableName, strCondition);



                _com.closeConnection();
                Response.Redirect("LeaveTypeList.aspx", true);
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect("LeaveTypeList.aspx", true);
        }

        protected void rdbLimitedYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rdbLimitedYes.Checked == true)
                pnlLimitedYes.Visible = true;
            else
                pnlLimitedYes.Visible = false;
        }

        protected void rdbLimitedNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rdbLimitedNo.Checked == true)
            {
                pnlLimitedYes.Visible = false;
                txtLimitDay.Text = "";
            }
            else
                pnlLimitedYes.Visible = true;
        }
    }
}
