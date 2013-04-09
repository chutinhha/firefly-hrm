using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Admin.Employee.searchEmployee
{
    public partial class searchEmployeeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();

        protected void binDatatoGridView()
        {
            string strColumn = "Name,CAST(CurrentFlag AS VARCHAR(1)),Rank,LoginID, JobTitle,CAST(HumanResources.Employee.BusinessEntityId AS VARCHAR(10))";
            string strTable = "HumanResources.Employee, HumanResources.Person, HumanResources.JobTitle";
            string strCondition = " where (HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId) AND (HumanResources.JobTitle.JobId = HumanResources.Employee.JobId)";

            // Check input
            // Check Name
            if (txtEmployeeName.Text != "") strCondition = strCondition + " AND (Name LIKE '%" + txtEmployeeName.Text + "%')";
            // Check Employee Status
            if (ddlCurrentFlag.SelectedIndex != 0)
                if (ddlCurrentFlag.SelectedIndex == 1) strCondition = strCondition + " AND (CurrentFlag = 1)";
                else if (ddlCurrentFlag.SelectedIndex == 2) strCondition = strCondition + " AND (CurrentFlag = 0)";
            // Check Rank
            if (ddlRank.SelectedIndex != 0)
                if (ddlRank.SelectedIndex == 1) strCondition = strCondition + " AND (Rank = 'Admin')";
                else if (ddlRank.SelectedIndex == 2) strCondition = strCondition + " AND (Rank = 'User')";
            // Check UserID
            if (txtLoginID.Text != "") strCondition = strCondition + " AND (LoginID LIKE '%" + txtLoginID.Text + "%')";
            // Check Job Title
            if (txtJobTitle.Text != "") strCondition = strCondition + " AND (JobTitle LIKE '%" + txtJobTitle.Text + "%')";

            _com.bindData(strColumn, strCondition, strTable, grdEmployee);
            if (grdEmployee.Rows.Count > 0)
            {
                for (int i = 0; i < grdEmployee.Rows.Count; i++)
                {
                    grdEmployee.Rows[i].Cells[5].Visible = false;
                    if (grdEmployee.Rows[i].Cells[1].Text.Equals("1")) grdEmployee.Rows[i].Cells[1].Text = "Active";
                    else grdEmployee.Rows[i].Cells[1].Text = "Inactive";
                }
                grdEmployee.HeaderRow.Cells[0].Text = "Employee Name";
                grdEmployee.HeaderRow.Cells[1].Text = "Employee Status";
                grdEmployee.HeaderRow.Cells[2].Text = "Rank";
                grdEmployee.HeaderRow.Cells[3].Text = "User Name";
                grdEmployee.HeaderRow.Cells[4].Text = "Job Title";
                grdEmployee.HeaderRow.Cells[5].Visible = false;
            }
            _com.setGridViewStyle(grdEmployee);
        }

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
                            binDatatoGridView();
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            binDatatoGridView();
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditEmployeePage + "/?BusinessEntityId=" + Server.HtmlDecode(e.Row.Cells[5].Text);
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
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmployeeName.Text = "";
            ddlRank.ClearSelection();
            ddlCurrentFlag.ClearSelection();
        }

        //protected void btnDelete_Click(object sender, EventArgs e)
        //{            
        //    string strContition = "BusinessEntityId = ";
        //    foreach (GridViewRow gr in grdEmployee.Rows)
        //    {                
        //        CheckBox cb = (CheckBox)gr.Cells[0].FindControl("chkItem");
        //        if (cb.Checked)
        //        {
        //            string strBusinessEntityID = gr.Cells[7].Text;
        //            strContition = strContition + strBusinessEntityID;
        //            _com.deleteIntoTable(Message.TableEmployee, strContition);
        //            _com.deleteIntoTable(Message.TablePerson, strContition);
        //        }
        //        binDatatoGridView();

        //    }
        //}
    }
}
