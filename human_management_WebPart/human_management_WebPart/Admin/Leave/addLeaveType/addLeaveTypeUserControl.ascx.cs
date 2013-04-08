using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.Admin.Leave.addLeaveType
{
    public partial class addLeaveTypeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();

        protected void Page_Load(object sender, EventArgs e)
        {
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtLeaveName.Text == "")
            {
                lblUserGuide.Text = "* Require Failed";
                return;
            }
            lblUserGuide.Text = "";

            //Insert Database
            bool isIDENTITY_INSERT = false;

            //Insert Database to Project Table
            string strTableName = Message.TableProject;
            string strColumName = @"(ProjectName,Note,EndDate)";

            //Leave Name
            string strLeaveName = "N'" + "Leave_" + txtLeaveName.Text + "'";            
            //Leave Note
            string strNote = "N'" + txtNote.Text + "'";
            //LimitedDate            
            string strLimitedDate = "'" + txtLimitDay + "'";
            //Condition
            string strCondition = strLeaveName + " , " + strNote + " , " + strLimitedDate;            

            //Insert command
            _com.insertIntoTable(strTableName, strColumName, strCondition, isIDENTITY_INSERT);

            _com.closeConnection();
            Response.Redirect("searchLeaveType.aspx", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect("searchLeaveType.aspx", true);
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
                pnlLimitedYes.Visible = false;
            else
                pnlLimitedYes.Visible = true;
        }
    }
}
