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
                    grdEmployee.Rows[i].Cells[6].Visible = false;
                    if (grdEmployee.Rows[i].Cells[1].Text.Equals("1")) grdEmployee.Rows[i].Cells[1].Text = "Active";
                    else grdEmployee.Rows[i].Cells[1].Text = "Inactive";
                }
                grdEmployee.HeaderRow.Cells[0].Text = "Employee Name";
                grdEmployee.HeaderRow.Cells[1].Text = "Employee Status";
                grdEmployee.HeaderRow.Cells[2].Text = "Rank";
                grdEmployee.HeaderRow.Cells[3].Text = "City";
                grdEmployee.HeaderRow.Cells[4].Text = "Country";
                grdEmployee.HeaderRow.Cells[5].Text = "AddressStreet";
                grdEmployee.HeaderRow.Cells[6].Visible = false;
            }
            _com.setGridViewStyle(grdEmployee);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                binDatatoGridView();
            }
        }        

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            binDatatoGridView();            
        }

        //protected void chkAll_CheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox cbSelectedHeader = (CheckBox)grdEmployee.HeaderRow.FindControl("chkAll");
        //    foreach (GridViewRow row in grdEmployee.Rows)
        //    {
        //        CheckBox cbSelected = (CheckBox)row.FindControl("chkItem");
        //        if (cbSelectedHeader.Checked == true)
        //        {
        //            cbSelected.Checked = true;
        //        }
        //        else
        //        {
        //            cbSelected.Checked = false;
        //        }
        //    }
        //}

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmployeeName.Text = "";
            txtCity.Text = "";
            txtCountry.Text = "";
            txtAddressStreet.Text = "";
            ddlRank.ClearSelection();
            ddlCurrentFlag.ClearSelection();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect("addEmployee.aspx", true);
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
