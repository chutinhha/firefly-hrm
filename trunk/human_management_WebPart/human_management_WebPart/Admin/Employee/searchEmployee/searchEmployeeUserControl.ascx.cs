using System;
using System.Web.UI;using System.Web;
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
            string strColumn = "p.Name, CAST(CurrentFlag AS VARCHAR(1)), Rank, LoginID, JobTitle, CAST(e.BusinessEntityId AS VARCHAR(10)), d.Name";
            string strTable = "((((HumanResources.Employee e LEFT JOIN HumanResources.Person p ON e.BusinessEntityId = p.BusinessEntityId) LEFT JOIN HumanResources.JobTitle j ON  e.JobId = j.JobId) LEFT JOIN HumanResources.EmployeeDepartmentHistory edh ON (e.BusinessEntityId = edh.BusinessEntityId AND ((edh.StartDate <= GETDATE() AND GETDATE() <= edh.EndDate) OR (edh.StartDate <= GETDATE() AND edh.EndDate = null)))) LEFT JOIN HumanResources.Department d ON edh.DepartmentID = D.DepartmentID)";
            string strCondition = " where (E.LoginID != '')";            
            // Check input
            // Check Name
            if (txtEmployeeName.Text != "") strCondition = strCondition + " AND (p.Name LIKE '%" + txtEmployeeName.Text + "%')";
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
            if (IsPostBack)
            // Check Job Title
            if (ddlJobTitle.SelectedIndex != 0) strCondition = strCondition + " AND (JobTitle = '" + ddlJobTitle.SelectedValue + "')";
            // Check Department
            if (ddlDepartment.SelectedIndex != 0) strCondition = strCondition + " AND (d.Name = '" + ddlDepartment.SelectedValue + "')";

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
                grdEmployee.HeaderRow.Cells[6].Text = "Department";
            }
            _com.setGridViewStyle(grdEmployee);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
                            //set data do dropdownlist
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "All");
                            _com.SetItemList(Message.NameColumn, Message.TableDepartment, ddlDepartment, "", true, "All");
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
                    if (i != 0)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    }
                    else
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;padding-left:5px;line-height: 20px;");
                    }
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else {
                e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");         
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
