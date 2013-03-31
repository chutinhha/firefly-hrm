using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Employee.searchEmployee
{
    public partial class searchEmployeeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                string strColumn = "Name,CurrentFlag,Rank,City,Country,AddressStreet";
                string strTable = "HumanResources.Employee, HumanResources.Person";
                string strCondition = " where HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId";                 
                _com.bindData(strColumn,strCondition,strTable,grdEmployee);                
                if (grdEmployee.Rows.Count > 0)
                {                                                            
                    for (int i = 1; i < grdEmployee.Rows.Count; i++)
                    {
                        
                        if (grdEmployee.Rows[i].Cells[2].ToString().Equals("1")) grdEmployee.Rows[i].Cells[2].Text = "Active";
                        else grdEmployee.Rows[i].Cells[2].Text = "Inactive";                        
                    }
                    grdEmployee.HeaderRow.Cells[1].Text = "Employee Name";
                    grdEmployee.HeaderRow.Cells[2].Text = "Employee Status";
                    grdEmployee.HeaderRow.Cells[3].Text = "Rank";
                    grdEmployee.HeaderRow.Cells[3].Text = "City";
                    grdEmployee.HeaderRow.Cells[3].Text = "Country";
                    grdEmployee.HeaderRow.Cells[3].Text = "AddressStreet";
                    grdEmployee.DataBind();
                }
                _com.setGridViewStyle(grdEmployee);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string strTableName = "";
            string strColumn = "";
            string strCondition = "";
            string strItem = "";
            bool isAddItem;

        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbSelectedHeader = (CheckBox)grdEmployee.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in grdEmployee.Rows)
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

    }
}
