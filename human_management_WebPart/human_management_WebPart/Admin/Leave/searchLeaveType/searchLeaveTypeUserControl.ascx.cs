using System;
using System.Web.UI;using System.Web;
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
            DataTable dtProjectId = _com.getData(Message.TableProject, "ProjectId", " where ProjectName='Leave'");
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
                grdLeaveType.HeaderRow.Cells[3].Text = "Limit Date";
                grdLeaveType.HeaderRow.Cells[4].Visible = false;
            }
            _com.setGridViewStyle(grdLeaveType);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
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
                            binDataLeaveTypeToGrd();
                        }
                    }
                    catch (Exception ex) { }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmDelete { get; set; }
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
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdLeaveType.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in grdLeaveType.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("chkItem");
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.AddLeaveTypePage, true);
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditLeaveTypePage + "/?TaskID=" + Server.HtmlDecode(e.Row.Cells[4].Text);
                e.Row.Style["cursor"] = "pointer";
                e.Row.Attributes.Add("onMouseOver", "this.style.cursor = 'hand';this.style.backgroundColor = '#CCCCCC';");
                if (e.Row.RowIndex % 2 != 0)
                {
                    e.Row.Attributes.Add("style", "background-color:white;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = 'white';");
                }
                else
                {
                    e.Row.Attributes.Add("style", "background-color:#EAEAEA;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = '#EAEAEA';");
                }
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
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
                    _com.deleteFromTable(strTableName, strCondition);
                }
            }
            binDataLeaveTypeToGrd();
            btnDelete.Visible = false;
        }

    }
}
