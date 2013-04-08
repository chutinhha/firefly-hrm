using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.NotifyEmployee
{
    public partial class NotifyEmployeeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] != null)
            {
                this.inputValue = "";
                int count = 0;
                DateTime now = DateTime.Now;
                DateTime end = now.AddDays(7);
                DateTime start = now.AddDays(-7);
                //Check department change
                /*DataTable department = _com.getData("HumanResources.EmployeeDepartmentHistory edh join HumanResources.Shift s"
                    + " on s.ShiftID = edh.ShiftID join HumanResources.Department d on d.DepartmentID = edh.DepartmentID"
                    , "edh.StartDate,edh.EndDate,edh.ModifiedDate,d.Name", " where edh.BusinessEntityID='" 
                    + Session["AccountID"].ToString() + "' and edh.StartDate >= '"+start.Year.ToString()+"-"+start.Month.ToString()+"-"+start.Day.ToString()
                    + "' and edh.StartDate <= '" + end.Year.ToString() + "-" + end.Month.ToString() + "-" + end.Day.ToString()
                    + "' and edh.ModifiedDate >= '" + start.Year.ToString() + "-" + start.Month.ToString() + "-" + start.Day.ToString()
                    + "' and edh.ModifiedDate <= '" + end.Year.ToString() + "-" + end.Month.ToString() + "-" + end.Day.ToString() + "'");
                if (department.Rows.Count > 0) {
                    count = count + department.Rows.Count;
                    for (int i = 0; i < department.Rows.Count; i++) {
                        this.inputValue = this.inputValue + "Assign to Department: "+department.Rows[i][3].ToString()
                            + "<br />From " + department.Rows[i][0].ToString() + "<br />To " + department.Rows[i][1].ToString()+";";
                    }
                }*/
                //Check evaluate point
                DataTable evaluatePoint = _com.getData(Message.TableEvaluatePoint, "distinct " + Message.TotalPointColumn
                    + "," + Message.AveragePointColumn + "," + Message.QuarterColumn, " where " + Message.BusinessEntityIDColumn + "='"
                    + Session["AccountID"] + "' and " + Message.ModifiedDateColumn + " <='" + end.Year.ToString() + "-" + end.Month.ToString() + "-" + end.Day.ToString() + "'");
                if (evaluatePoint.Rows.Count > 0)
                {
                    count = count + evaluatePoint.Rows.Count;
                    for (int i = 0; i < evaluatePoint.Rows.Count; i++)
                    {
                        this.inputValue = this.inputValue + "<a href='" + Message.SupervisorJudgmentPage + "'>Checkpoint quarter "
                            + evaluatePoint.Rows[i][2].ToString()
                            + "<br />Receive " + evaluatePoint.Rows[i][0].ToString()
                            + " point<br />Average: " + evaluatePoint.Rows[i][1].ToString() + "</a>;";
                    }
                }
                //Check assign project
                DataTable assignProject = _com.getData(Message.TablePersonProject + " pp join " + Message.TableTask + " t on t."
                    + Message.TaskIdColumn + " = pp." + Message.TaskIdColumn + " join " + Message.TableProject + " p on t."
                    + Message.ProjectIDColumn + "=p." + Message.ProjectIDColumn, "p." + Message.ProjectNameColumn + ",t."
                    + Message.TaskNameColumn + ",t." + Message.PersonProjectStartDateColumn + ",t." + Message.PersonProjectEndDateColumn
                    , " where " + Message.BusinessEntityIDColumn + "='" + Session["AccountID"].ToString() + "' and "
                    + "((pp." + Message.ModifiedDateColumn + " <='" + end.Year.ToString() + "-"
                    + end.Month.ToString() + "-" + end.Day.ToString() + "') or (t." + Message.PersonProjectEndDateColumn + ">='"
                    + start.Year.ToString() + "-" + start.Month.ToString() + "-" + start.Day.ToString() + "'"
                    + " and t." + Message.PersonProjectEndDateColumn + "<='" + end.Year.ToString() + "-" + end.Month.ToString()
                    + "-" + end.Day.ToString() + "')) and pp." + Message.CurrentFlagColumn + "<>'2'");
                if (assignProject.Rows.Count > 0)
                {
                    count = count + assignProject.Rows.Count;
                    for (int i = 0; i < assignProject.Rows.Count; i++)
                    {
                        this.inputValue = this.inputValue + "Assign to Project: " + assignProject.Rows[i][0].ToString()
                            + "<br />Task: " + assignProject.Rows[i][1].ToString() + "<br />Deadline: " + assignProject.Rows[i][3].ToString() + ";";
                    }
                }
            }
            else {
                Response.Redirect(Message.AccessDeniedPage,true);
            }

        }
        protected string inputValue { get; set; }
    }
}
