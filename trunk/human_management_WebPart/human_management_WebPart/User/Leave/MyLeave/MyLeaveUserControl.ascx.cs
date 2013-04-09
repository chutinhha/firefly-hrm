using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.User.Leave.MyLeave
{
    public partial class MyLeaveUserControl : UserControl
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
                if (Session["Account"].ToString() == "User")
                {
                    pnlData.Visible = false;
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            pnlData.Visible = false;
        }

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where ProjectName = 'Leave' ");
            string column = Message.TaskNameColumn + " AS [Leave Type] ,HumanResources.PersonProject.StartDate,HumanResources.PersonProject.EndDate,CAST(" + Message.CurrentFlagColumn + " AS nvarchar(15)) AS Status" + "," + "HumanResources.PersonProject.Note";
            string condition = " INNER JOIN HumanResources.Task ON HumanResources.Task.TaskId = HumanResources.PersonProject.TaskId where HumanResources.PersonProject.BusinessEntityId = " + Session["AccountID"] + " and ProjectId = " + myData.Rows[0][0].ToString();
            string table = Message.TablePersonProject;
            if (Request.Form["txtDateFrom"].ToString().Trim() != "")
            {
                condition = condition + " and HumanResources.PersonProject.StartDate >= CAST(" + Request.Form["txtDateFrom"].ToString().Trim() + " AS DATE) ";  
            }
            if (Request.Form["txtDateTo"].ToString().Trim() != "")
            {
                condition = condition + " and HumanResources.PersonProject.EndDate <= CAST(" + Request.Form["txtDateTo"].ToString().Trim() + " AS DATE) ";
            }
            if (ddlDayOff.SelectedValue == "Approved")
            {
                condition = condition + " and CurrentFlag = 1";
            }
            if (ddlDayOff.SelectedValue == "Not Approved")
            {
                condition = condition + " and CurrentFlag = 0";
            }
            if (ddlDayOff.SelectedValue == "Reject")
            {
                condition = condition + " and CurrentFlag = 2";
            }
            _com.bindData(column, condition, table, grdData);
            if (grdData.Rows.Count > 0)
            {
                foreach (GridViewRow myRow in grdData.Rows)
                {
                    if (myRow.Cells[3].Text.ToString() == "0")
                    {
                        myRow.Cells[3].Text = "Not Approved";
                    }
                    else if (myRow.Cells[3].Text.ToString() == "1")
                    {
                        myRow.Cells[3].Text = "Approved";
                    }
                    else
                    {
                        myRow.Cells[3].Text = "Reject";
                    }
                }
                lblError.Text = "";
                pnlData.Visible = true;
            }
            else
            {
                lblError.Text = Message.NotExistData;
                pnlData.Visible = false;
            }
        }

        protected void ddlDayOff_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
