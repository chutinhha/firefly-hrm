using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Admin.Timesheet_Summary.EmployeeReport
{
    public partial class EmployeeReportUserControl : UserControl
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
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            txtEmployee.Text = "";
                            CheckBox1.Checked = false;
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, "", true, "All");
                            ddlTask.Items.Clear();
                            ddlTask.Items.Add("All");
                            Session.Remove("EmployeeId");
                            Session.Remove("ProjectName");
                            Session.Remove("TaskName");
                            Session.Remove("Approved");
                            Session.Remove("DateFrom");
                            Session.Remove("DateFrom");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
            ddlProject.AutoPostBack = true;
            txtEmployee.AutoPostBack = true;
        }

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (ddlProject.SelectedValue == "All") 
            {
                ddlTask.Items.Clear();
                ddlTask.Items.Add("All");
            }
            else
            {
                try
                {
                    DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                    _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " WHERE ProjectId = " + (int)myData.Rows[0][0], true, "All");
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        protected void ddlTask_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            int check = 0;
            if (grdData.Rows.Count > 0)
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        Session["EmployeeId"] = Server.HtmlDecode(gr.Cells[1].Text.ToString());
                        Session["EmployeeName"] = Server.HtmlDecode(gr.Cells[2].Text.ToString());
                        check++;
                    }
                }
                if (check == 1)
                {
                    Session["ProjectName"] = Server.HtmlDecode(ddlProject.SelectedValue.ToString());
                    Session["TaskName"] = Server.HtmlDecode(ddlTask.SelectedValue.ToString());
                    Session["Approved"] = Server.HtmlDecode(CheckBox1.Checked.ToString());
                    Session["DateFrom"] = Server.HtmlDecode(Request.Form["txtDateFrom"].ToString().Trim());
                    Session["DateTo"] = Server.HtmlDecode(Request.Form["txtDateTo"].ToString().Trim());
                    _com.closeConnection();
                    Response.Redirect(Message.ViewEmployeeReportPage, true);
                }
                else if (check == 0) { lblError.Text = "Please select one employee first!"; }
                else if (check > 1) lblError.Text = "Please select only one employee!";
            }
            else lblError.Text = "Please select one employee first!";
        }

        protected void txtEmployee_TextChanged(object sender, EventArgs e)
        {
            txtEmployee.Attributes["value"] = txtEmployee.Text;
            lblError.Text = "";
            grdData.Visible = true;
            try
            {
                DataTable myData = _com.getData(Message.TablePerson, " * ", " WHERE Name like '%" + txtEmployee.Attributes["value"].ToString() + "%'");
                string column = "HumanResources.Employee.BusinessEntityId, " + Message.PersonNameColumn + "," + Message.EmailAddressColumn + "," + Message.JobTitleColumn + ",CAST(" + Message.CurrentFlagColumn + " AS NVARCHAR(5))";
                string condition = " INNER JOIN " + Message.TableEmployee + " ON HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityId = HumanResources.Employee.BusinessEntityId) WHERE HumanResources.Person.Name like '%" + txtEmployee.Text.ToString().Trim() + "%'";
                string table = "((" + Message.TableJobTitle;
                _com.bindData(column, condition, table, grdData);
                if (grdData.Rows.Count == 0) lblError.Text = "There is no consistent data!";
                _com.setGridViewStyle(grdData);
                grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                grdData.HeaderRow.Cells[2].Text = "Employee Name";
                grdData.HeaderRow.Cells[3].Text = "Email";
                grdData.HeaderRow.Cells[4].Text = "Job Title";
                grdData.HeaderRow.Cells[5].Text = "Status";
                foreach (GridViewRow myRow in grdData.Rows)
                {
                    if (myRow.Cells[5].Text.ToString() == "1") myRow.Cells[5].Text = "Active";
                    else myRow.Cells[5].Text = "Inactive";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "There is no consistent data!";
            }
        }

        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdData.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdData.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
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

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}
