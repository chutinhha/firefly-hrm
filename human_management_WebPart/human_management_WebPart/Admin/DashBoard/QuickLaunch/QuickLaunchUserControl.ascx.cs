using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.DashBoard.QuickLaunch
{
    public partial class QuickLaunchUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Checkpoint
                this.inputValue = "";
                this.inputTitle = "";
                int quarter = _com.getQuarter();
                lblQuarter.Text = " " + quarter;
                DataTable AverageCheckPoint = _com.getData(Message.TableEvaluatePoint, " distinct " + Message.BusinessEntityIDColumn
                    + "," + Message.AveragePointColumn, " where Month(" + Message.ModifiedDateColumn + ")<=" + (4 * quarter)
                    + " and MONTH(" + Message.ModifiedDateColumn + ")>=" + (4 * quarter - 3));
                if (AverageCheckPoint.Rows.Count == 0)
                {
                    this.inputValue = "Not have data yet;";
                    this.inputTitle = ";";
                }
                else
                {
                    int large9 = 0;
                    int large8 = 0;
                    int large7 = 0;
                    int large5 = 0;
                    int small5 = 0;
                    for (int i = 0; i < AverageCheckPoint.Rows.Count; i++)
                    {
                        if (float.Parse(AverageCheckPoint.Rows[i][1].ToString()) >= 9)
                        {
                            large9++;
                        }
                        else if (float.Parse(AverageCheckPoint.Rows[i][1].ToString()) >= 8)
                        {
                            large8++;
                        }
                        else if (float.Parse(AverageCheckPoint.Rows[i][1].ToString()) >= 7)
                        {
                            large7++;
                        }
                        else if (float.Parse(AverageCheckPoint.Rows[i][1].ToString()) >= 5)
                        {
                            large5++;
                        }
                        else
                        {
                            small5++;
                        }
                    }
                    if (large9 > 0)
                    {
                        this.inputValue = this.inputValue + large9 + ";";
                        this.inputTitle = this.inputTitle + "Average > 9;";
                    }
                    if (large8 > 0)
                    {
                        this.inputValue = this.inputValue + large8 + ";";
                        this.inputTitle = this.inputTitle + "Average > 8;";
                    }
                    if (large7 > 0)
                    {
                        this.inputValue = this.inputValue + large7 + ";";
                        this.inputTitle = this.inputTitle + "Average > 7;";
                    }
                    if (large5 > 0)
                    {
                        this.inputValue = this.inputValue + large5 + ";";
                        this.inputTitle = this.inputTitle + "Average > 5;";
                    }
                    if (small5 > 0)
                    {
                        this.inputValue = this.inputValue + small5 + ";";
                        this.inputTitle = this.inputTitle + "Average < 5;";
                    }
                }

                //Pending Leave Request
                DataTable pendingLeave = _com.getData(Message.TableProject + " p join " + Message.TableTask + " t"
                    + " on p." + Message.ProjectIDColumn + "=t." + Message.ProjectIDColumn + " join " + Message.TablePersonProject + " pp"
                    + " on t." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn + " join " + Message.TablePerson + " per"
                    + " on per." + Message.BusinessEntityIDColumn + "=pp." + Message.BusinessEntityIDColumn, "per." + Message.NameColumn
                    + ",pp." + Message.ModifiedDateColumn, " where " + Message.ProjectNameColumn + "='Leave' and pp."
                    + Message.CurrentFlagColumn + "='False'");
                if (pendingLeave.Rows.Count > 0)
                {
                    pnlLeave.Controls.Add(new LiteralControl("<div style=\"height:223px; \" id=\"task-list-group-panel-container\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<div style=\"height:85%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    for (int i = 0; i < pendingLeave.Rows.Count; i++)
                    {
                        DateTime time = DateTime.Parse(pendingLeave.Rows[i][1].ToString());
                        pnlLeave.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                        pnlLeave.Controls.Add(new LiteralControl("<a href=\"\">"));
                        pnlLeave.Controls.Add(new LiteralControl(i + 1 + ". " + pendingLeave.Rows[i][0].ToString() + " " + time.Day + "/" + time.Month + "/" + time.Year));
                        pnlLeave.Controls.Add(new LiteralControl("</a></td></tr>"));
                    }
                    pnlLeave.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlLeave.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlLeave.Controls.Add(new LiteralControl("Total: " + pendingLeave.Rows.Count));
                    pnlLeave.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }
                else
                {
                    pnlLeave.Controls.Add(new LiteralControl("<div style=\"height:223px; \" id=\"task-list-group-panel-container\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<div style=\"height:85%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    pnlLeave.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                    pnlLeave.Controls.Add(new LiteralControl("No Records are Available"));
                    pnlLeave.Controls.Add(new LiteralControl("</td></tr>"));
                    pnlLeave.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlLeave.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlLeave.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlLeave.Controls.Add(new LiteralControl("Total: 0"));
                    pnlLeave.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }

                //Pending Timesheet
                DataTable pendingTime = _com.getData(Message.TableTimesheet + " t join " + Message.TablePerson + " per"
                    + " on t." + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn, " distinct per."
                    + Message.NameColumn + ",t." + Message.ModifiedDateColumn, " where t." + Message.CurrentFlagColumn + "='False'");
                if (pendingTime.Rows.Count > 0)
                {
                    pnlTime.Controls.Add(new LiteralControl("<div style=\"height:223px; \" id=\"task-list-group-panel-container\">"));
                    pnlTime.Controls.Add(new LiteralControl("<div style=\"height:85%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlTime.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    for (int i = 0; i < pendingTime.Rows.Count; i++)
                    {
                        DateTime time = DateTime.Parse(pendingTime.Rows[i][1].ToString());
                        pnlTime.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                        pnlTime.Controls.Add(new LiteralControl("<a href=\"\">"));
                        pnlTime.Controls.Add(new LiteralControl(i + 1 + ". " + pendingTime.Rows[i][0].ToString() + " " + time.Day + "/" + time.Month + "/" + time.Year));
                        pnlTime.Controls.Add(new LiteralControl("</a></td></tr>"));
                    }
                    pnlTime.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlTime.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlTime.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlTime.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlTime.Controls.Add(new LiteralControl("Total: " + pendingTime.Rows.Count));
                    pnlTime.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }
                else
                {
                    pnlTime.Controls.Add(new LiteralControl("<div style=\"height:223px; \" id=\"task-list-group-panel-container\">"));
                    pnlTime.Controls.Add(new LiteralControl("<div style=\"height:85%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlTime.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    pnlTime.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                    pnlTime.Controls.Add(new LiteralControl("No Records are Available"));
                    pnlTime.Controls.Add(new LiteralControl("</td></tr>"));
                    pnlTime.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlTime.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlTime.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlTime.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlTime.Controls.Add(new LiteralControl("Total: 0"));
                    pnlTime.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }
                //Interview Schedule
                DataTable interviewSchedule = _com.getData(Message.TableJobCandidate, Message.FullNameColumn + "," + Message.InterviewDateColumn
                    , " where " + Message.StatusColumn + "='Interview Schedule'");
                if (interviewSchedule.Rows.Count > 0)
                {
                    pnlInterview.Controls.Add(new LiteralControl("<div style=\"height:223px; \" id=\"task-list-group-panel-container\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<div style=\"height:85%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    for (int i = 0; i < interviewSchedule.Rows.Count; i++)
                    {
                        DateTime time = DateTime.Parse(interviewSchedule.Rows[i][1].ToString());
                        pnlInterview.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                        pnlInterview.Controls.Add(new LiteralControl("<a href=\"\">"));
                        pnlInterview.Controls.Add(new LiteralControl(i + 1 + ". " + interviewSchedule.Rows[i][0].ToString() + " " + +time.Day + "/" + time.Month + "/" + time.Year + " " + time.TimeOfDay));
                        pnlInterview.Controls.Add(new LiteralControl("</a></td></tr>"));
                    }
                    pnlInterview.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlInterview.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlInterview.Controls.Add(new LiteralControl("Total: " + interviewSchedule.Rows.Count));
                    pnlInterview.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }
                else
                {
                    pnlInterview.Controls.Add(new LiteralControl("<div style=\"height:223px; \" id=\"task-list-group-panel-container\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<div style=\"height:85%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    pnlInterview.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                    pnlInterview.Controls.Add(new LiteralControl("No Records are Available"));
                    pnlInterview.Controls.Add(new LiteralControl("</td></tr>"));
                    pnlInterview.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlInterview.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlInterview.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlInterview.Controls.Add(new LiteralControl("Total: 0"));
                    pnlInterview.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }

                //Upcoming Task
                DataTable upcomingTask = _com.getData(Message.TableTask, Message.TaskNameColumn + "," + Message.PersonProjectEndDateColumn
                    , " where " + Message.PersonProjectEndDateColumn + ">='" + DateTime.Today + "' and " + Message.PersonProjectEndDateColumn
                    + "<='" + DateTime.Today.AddDays(7) + "'");
                if (upcomingTask.Rows.Count > 0)
                {
                    pnlUpcoming.Controls.Add(new LiteralControl("<div style=\"height:300px; \" id=\"task-list-group-panel-container\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<div style=\"height:89%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    for (int i = 0; i < interviewSchedule.Rows.Count; i++)
                    {
                        pnlUpcoming.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                        pnlUpcoming.Controls.Add(new LiteralControl("<a href=\"\">"));
                        pnlUpcoming.Controls.Add(new LiteralControl(i + 1 + ". " + upcomingTask.Rows[i][0].ToString() + " " + upcomingTask.Rows[i][1].ToString()));
                        pnlUpcoming.Controls.Add(new LiteralControl("</a></td></tr>"));
                    }
                    pnlUpcoming.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("Total: " + upcomingTask.Rows.Count));
                    pnlUpcoming.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }
                else
                {
                    pnlUpcoming.Controls.Add(new LiteralControl("<div style=\"height:300px; \" id=\"task-list-group-panel-container\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<div style=\"height:89%; overflow-x: hidden; overflow-y: auto;\" class=\"task-list-group-panel-menu_holder\" id=\"task-list-group-panel-menu_holder\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<table class=\"table hover\"><tbody>"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<tr class=\"odd\"><td>"));
                    pnlUpcoming.Controls.Add(new LiteralControl("No Records are Available"));
                    pnlUpcoming.Controls.Add(new LiteralControl("</td></tr>"));
                    pnlUpcoming.Controls.Add(new LiteralControl("</tbody></table></div>"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<div id=\"total\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<table class=\"table\"><tbody><tr class=\"total\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("<td style=\"text-align:right;padding-right:20px;\">"));
                    pnlUpcoming.Controls.Add(new LiteralControl("Total: 0"));
                    pnlUpcoming.Controls.Add(new LiteralControl("</td></tr></tbody></table></div></div>"));
                }
            }
            catch (Exception) { }
        }
        protected string inputValue { get; set; }
        protected string inputTitle { get; set; }
    }
}
