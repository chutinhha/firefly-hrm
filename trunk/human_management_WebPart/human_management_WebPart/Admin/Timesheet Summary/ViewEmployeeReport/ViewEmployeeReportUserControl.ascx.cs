using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Admin.Timesheet_Summary.ViewEmployeeReport
{
    public partial class ViewEmployeeReportUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        bool checkEmpty = true;
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
                            lblEmployeeText.Text = Session["EmployeeName"].ToString();
                            string condition = " where ";
                            condition = condition + Message.PersonNameColumn + " like '%" + Session["EmployeeName"].ToString() + "%' and " + Message.BusinessEntityIDColumn + " = " + Session["EmployeeId"].ToString() + " and ";
                            if (Session["ProjectName"].ToString() == "All") { }
                            else
                                condition = condition + Message.ProjectNameColumn + " like '%" + Session["ProjectName"].ToString() + "%' and ";
                            if (Session["TaskName"].ToString() == "All") { }
                            else
                            {
                                condition = condition + Message.TaskNameColumn + " like '%" + Session["TaskName"].ToString() + "%' and ";
                            }
                            if (Session["Approved"].ToString() == "False") { }
                            else
                                condition = condition + " HumanResources.Timesheet.CurrentFlag = 1 and ";
                            if (Session["DateFrom"].ToString() == "") { }
                            else
                                condition = condition + Message.WorkDateColumn + " >= CAST(' " + Session["DateFrom"].ToString() + " ' AS DATE) and ";
                            if (Session["DateTo"].ToString() == "") { }
                            else
                                condition = condition + Message.WorkDateColumn + " <= CAST(' " + Session["DateTo"].ToString() + " 'AS DATE) and ";
                            if (condition == " where ")
                            {
                                condition = "";
                            }
                            else
                            {
                                condition = condition.Substring(0, condition.Length - 4);
                            }
                            DataTable myData = _com.getData(" (((( HumanResources.Employee INNER JOIN HumanResources.Person ON HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId)" + 
                                " INNER JOIN HumanResources.Timesheet ON HumanResources.Employee.BusinessEntityId = HumanResources.Timesheet.BusinessEntityId)" + 
                                " INNER JOIN HumanResources.Task ON HumanResources.Timesheet.TaskId = HumanResources.Task.TaskId)" + 
                                " INNER JOIN HumanResources.Project ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId)",
                                Message.ProjectNameColumn + "," + Message.TaskNameColumn + "," + " SUM(Time) AS [Time(Hours)]",condition+" GROUP BY " + Message.ProjectNameColumn + "," + Message.TaskNameColumn);
                            if (myData.Rows.Count > 0)
                            {
                                checkEmpty = false;
                                float total = 0;
                                foreach (DataRow myRow in myData.Select())
                                {
                                    float tmp = 0;
                                    if (float.TryParse(myRow[2].ToString(), out tmp))
                                    {
                                        total = total + tmp;
                                    }
                                }
                                DataRow addRow = myData.NewRow();
                                addRow[0] = "Total";
                                addRow[1] = "";
                                addRow[2] = total.ToString();
                                myData.Rows.Add(addRow);
                                grdData.DataSource = myData;
                                grdData.DataBind();
                                _com.setGridViewStyle(grdData);
                                grdData.HeaderRow.Cells[0].Text = "Project Name";
                                grdData.HeaderRow.Cells[1].Text = "Task Name";
                                grdData.HeaderRow.Cells[2].Text = "Time(Hours)";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        if (checkEmpty == true)
                        {
                            lblError.Text = "There is no consistent data!";
                        }
                        else
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
