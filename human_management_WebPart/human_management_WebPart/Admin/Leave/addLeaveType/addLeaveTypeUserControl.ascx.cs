using System;
using System.Web.UI;using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Leave.addLeaveType
{
    public partial class addLeaveTypeUserControl : UserControl
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
                    try
                    {
                        if (!IsPostBack)
                        { }
                    }
                    catch (Exception ex) { }
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
            //Insert Database
            bool isIDENTITY_INSERT = false;

            //Insert Database to Project Table
            string strTableName = Message.TableTask;
            string strColumName = @"(ProjectId,TaskName,Note,LimitDate)";

            // ProjectId
            DataTable dtProjectId = _com.getData(Message.TableProject, "top 1 ProjectId", " where ProjectName like 'Leave%'");
            string strProjectID = dtProjectId.Rows[0][0].ToString();

            //Leave Name
            string strLeaveName = "N'" + txtLeaveName.Text + "'";
            //Leave Note
            string strNote = "N'" + txtNote.Text + "'";
            //LimitedDate            
            string strLimitedDate = "";
            if (txtLimitDay.Text != "") strLimitedDate = txtLimitDay.Text;
            else strLimitedDate = "0";

            //Condition
            string strCondition = strProjectID + " , " + strLeaveName + " , " + strNote + " , " + strLimitedDate;

            //Insert command
            _com.insertIntoTable(strTableName, strColumName, strCondition, isIDENTITY_INSERT);

            _com.closeConnection();
            Response.Redirect("LeaveTypeList.aspx", true);
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
