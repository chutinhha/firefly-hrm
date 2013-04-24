using System;
using System.Web;
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
            try
            {
                string strColumn = "p." + Message.NameColumn + ", CAST(" + Message.CurrentFlagColumn
                    + " AS VARCHAR(1)), " + Message.RankColumn + ", " + Message.LoginIDColumn + ", " + Message.JobTitleColumn
                    + ", CAST(e." + Message.BusinessEntityIDColumn + " AS VARCHAR(10)), d." + Message.NameColumn;
                string strTable = "((((" + Message.TableEmployee + " e LEFT JOIN " + Message.TablePerson
                    + " p ON e." + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn
                    + ") LEFT JOIN " + Message.TableJobTitle + " j ON  e." + Message.JobIDColumn + " = j."
                    + Message.JobIDColumn + ") LEFT JOIN " + Message.TableHistoryDepartment + " edh ON (e."
                    + Message.BusinessEntityIDColumn + " = edh." + Message.BusinessEntityIDColumn
                    + " AND ((edh." + Message.StartDateColumn + " <= GETDATE() AND GETDATE() <= edh." + Message.EndDateColumn
                    + ") OR (edh." + Message.StartDateColumn + " <= GETDATE() AND edh." + Message.EndDateColumn
                    + " = null)))) LEFT JOIN " + Message.TableDepartment + " d ON edh." + Message.DepartmentIDColumn
                    + " = D." + Message.DepartmentIDColumn + ")";
                string strCondition = " where (E." + Message.LoginIDColumn + " != '')";
                // Check input
                // Check Name
                if (txtEmployeeName.Text != "")
                    if (txtEmployeeName.Text.ToLower() != "all")
                        strCondition = strCondition + " AND (p." + Message.NameColumn
                        + " LIKE '%" + txtEmployeeName.Text + "%')";

                // Check Employee Status
                if (ddlCurrentFlag.SelectedIndex != 0)
                    if (ddlCurrentFlag.SelectedIndex == 1) strCondition = strCondition + " AND (" + Message.CurrentFlagColumn + " = 1)";
                    else if (ddlCurrentFlag.SelectedIndex == 2) strCondition = strCondition + " AND (" + Message.CurrentFlagColumn + " = 0)";
                // Check Rank
                if (ddlRank.SelectedIndex != 0)
                    if (ddlRank.SelectedIndex == 1) strCondition = strCondition + " AND (" + Message.RankColumn + " = 'Admin')";
                    else if (ddlRank.SelectedIndex == 2) strCondition = strCondition + " AND (" + Message.RankColumn + " = 'User')";
                // Check UserID
                if (txtLoginID.Text != "")
                    if (txtLoginID.Text.ToLower() != "all")
                        strCondition = strCondition + " AND (" + Message.LoginIDColumn + " LIKE '%" + txtLoginID.Text + "%')";
                if (IsPostBack)
                    // Check Job Title
                    if (ddlJobTitle.SelectedIndex != 0) strCondition = strCondition + " AND (j." + Message.JobIDColumn
                        + " = " + ddlJobTitle.SelectedValue + ")";
                // Check Department
                if (ddlDepartment.SelectedIndex != 0) strCondition = strCondition + " AND (d." + Message.NameColumn
                    + " = '" + ddlDepartment.SelectedValue + "')";

                _com.bindData(strColumn, strCondition, strTable, grdEmployee);
                if (grdEmployee.Rows.Count > 0)
                {
                    lblError.Text = "";
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
                else
                    lblError.Text = "No results";
                _com.setGridViewStyle(grdEmployee);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Account"] == null)
            //{
            //    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
            //    Response.Redirect(Message.AccessDeniedPage);
            //}
            //else
            //{
            //    if (Session["Account"].ToString() == "Admin")
            //    {
            //        try
            //        {
            if (!IsPostBack)
            {
                //set data do dropdownlist
                //JobTitle
                _com.SetItemListWithID(Message.JobIDColumn, Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "All");
                //Department
                _com.SetItemList(Message.NameColumn, Message.TableDepartment, ddlDepartment, "", true, "All");
                binDatatoGridView();
            }
            //        }
            //        catch (Exception ex) {
            //            lblError.Text = ex.Message;
            //        }
            //    }
            //    else
            //    {
            //        Response.Redirect(Message.UserHomePage);
            //    }
            //}
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
            else
            {
                e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmployeeName.Text = "All";
            txtLoginID.Text = "All";
            ddlRank.ClearSelection();
            ddlCurrentFlag.ClearSelection();
            ddlJobTitle.ClearSelection();
            ddlDepartment.ClearSelection();
            binDatatoGridView();
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
