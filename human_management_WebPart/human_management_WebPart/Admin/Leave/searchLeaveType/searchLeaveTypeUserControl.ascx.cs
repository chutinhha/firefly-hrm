﻿using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Leave.searchLeaveType
{
    public partial class searchLeaveTypeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();

        private void binDataLeaveTypeToGrd()
        {
            // ProjectId
            DataTable dtProjectId = _com.getData(Message.TableProject, "top 1 ProjectId", " where ProjectName like 'Leave%'");
            string strProjectID = dtProjectId.Rows[0][0].ToString();

            string strColumn = "TaskName, Note,LimitDate,TaskId";
            string strTable = "HumanResources.Task";
            string strCondition = " where ProjectId = " + strProjectID;
            _com.bindData(strColumn, strCondition, strTable, grdLeaveType);
            if (grdLeaveType.Rows.Count > 0)
            {
                for (int i = 0; i < grdLeaveType.Rows.Count; i++)
                {
                    grdLeaveType.Rows[i].Cells[4].Visible = false;
                    if (grdLeaveType.Rows[i].Cells[3].Text == "0") grdLeaveType.Rows[i].Cells[3].Text = "Unlimited";                    
                }
                grdLeaveType.HeaderRow.Cells[1].Text = "Project Type";
                grdLeaveType.HeaderRow.Cells[2].Text = "Note";
                grdLeaveType.HeaderRow.Cells[2].Text = "Limit Date";
                grdLeaveType.HeaderRow.Cells[4].Visible = false;
            }
            _com.setGridViewStyle(grdLeaveType);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                binDataLeaveTypeToGrd();
            }
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            bool isCheckState = false;
            CheckBox cbSelectedHeader = (CheckBox)grdLeaveType.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in grdLeaveType.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("chkItem");
                if (cbSelectedHeader.Checked == true)
                {
                    cbSelected.Checked = true;
                    isCheckState = true;
                }
                else
                {
                    cbSelected.Checked = false;
                }
            }
            if (isCheckState == true)
                btnDelete.Visible = true;
            else
                btnDelete.Visible = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect("addLeaveType.aspx", true);
        }

        protected void chkItem_CheckedChanged(object sender, EventArgs e)
        {
            bool isCheckState = false;
            foreach (GridViewRow row in grdLeaveType.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("chkItem");
                if (cbSelected.Checked == true)
                {
                    isCheckState = true;
                    break;
                }
            }
            if (isCheckState == true)
                btnDelete.Visible = true;
            else
                btnDelete.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string strTableName = Message.TableTask;
            string strCondition = "";
            foreach (GridViewRow row in grdLeaveType.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("chkItem");
                if (cbSelected.Checked == true)
                {
                    strCondition = "TaskId = " + row.Cells[4].Text;
                    _com.deleteIntoTable(strTableName, strCondition);
                }
            }
            binDataLeaveTypeToGrd();
            btnDelete.Visible = false;
        }
    }
}