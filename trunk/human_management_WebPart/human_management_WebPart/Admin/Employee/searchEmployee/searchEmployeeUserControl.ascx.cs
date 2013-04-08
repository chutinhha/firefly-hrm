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
            string strColumn = "Name,CAST(CurrentFlag AS VARCHAR(1)),Rank,City,Country,AddressStreet,CAST(HumanResources.Employee.BusinessEntityId AS VARCHAR(10))";
            string strTable = "HumanResources.Employee, HumanResources.Person";
            string strCondition = " where HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId";

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

            _com.bindData(strColumn, strCondition, strTable, grdEmployee);
            if (grdEmployee.Rows.Count > 0)
            {
                for (int i = 0; i < grdEmployee.Rows.Count; i++)
                {
                    grdEmployee.Rows[i].Cells[7].Visible = false;
                    if (grdEmployee.Rows[i].Cells[2].Text.Equals("1")) grdEmployee.Rows[i].Cells[2].Text = "Active";
                    else grdEmployee.Rows[i].Cells[2].Text = "Inactive";
                }
                grdEmployee.HeaderRow.Cells[1].Text = "Employee Name";
                grdEmployee.HeaderRow.Cells[2].Text = "Employee Status";
                grdEmployee.HeaderRow.Cells[3].Text = "Rank";
                grdEmployee.HeaderRow.Cells[4].Text = "City";
                grdEmployee.HeaderRow.Cells[5].Text = "Country";
                grdEmployee.HeaderRow.Cells[6].Text = "AddressStreet";
                grdEmployee.HeaderRow.Cells[7].Visible = false;
            }
            _com.setGridViewStyle(grdEmployee);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCountry.DataSource = _com.getCountryList();
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, "All");
                ddlCountry.SelectedValue = "All";
                binDatatoGridView();
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
                string Location = Message.EditEmployeePage+"/?LoginID=" + Server.HtmlDecode(e.Row.Cells[2].Text);
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
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmployeeName.Text = "";
            txtCity.Text = "";
            ddlCountry.SelectedValue = "All";
            txtAddressStreet.Text = "";
            ddlRank.ClearSelection();
            ddlCurrentFlag.ClearSelection();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.EditEmployeePage, true);
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
