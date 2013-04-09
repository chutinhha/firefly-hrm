using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Attendance.AttendanceSummary
{
    public partial class AttendanceSummaryUserControl : UserControl
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
                            this.fromDate = "";
                            this.toDate = "";
                            txtEmployeeName.Text = "All";
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "",true, "All");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //string Location = "EditCandidate.aspx/?Name=" + Server.HtmlDecode(e.Row.Cells[2].Text)
               //+ "&Email=" + Server.HtmlDecode(e.Row.Cells[3].Text);
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
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected string fromDate { get; set; }
        protected string toDate { get; set; }
        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmployeeName.Text.Trim() == "")
                {
                    lblError.Text = Message.EmployeeNameError;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else {
                    string condition = "";
                    if (txtEmployeeName.Text.Trim() == "All") { }
                    else {
                        condition = " where p."+Message.NameColumn+" like '%"+txtEmployeeName.Text.Trim()+"%'";
                    }
                    if (ddlJobTitle.SelectedValue == "All") { }
                    else {
                        if (condition == "")
                        {
                            condition = " where j." + Message.JobTitleColumn + " = N'" + ddlJobTitle.SelectedValue + "'";
                        }
                        else
                        {
                            condition = condition + " and j." + Message.JobTitleColumn + " = N'" + ddlJobTitle.SelectedValue + "'";
                        }
                    }
                    try
                    {
                        DateTime dt;
                        DateTime dt1;
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                        {
                            dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                            if (condition == "")
                            {
                                condition = " where a." + Message.PunchInColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'";
                            }
                            else
                            {
                                condition = condition + " and a." + Message.PunchInColumn + " >='" + dt.Month + "-" + dt.Day + "-"
                                    + dt.Year + "'";
                            }
                            this.fromDate = Request.Form["txtDateFrom"].ToString().Trim();
                        }
                        if (Request.Form["txtDateTo"].ToString().Trim() != "")
                        {
                            dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                            dt1 = dt1.AddDays(1.0);
                            if (condition == "")
                            {
                                condition = " where a." + Message.PunchOutColumn + "<='" + dt1.Month + "-" + dt1.Day
                                    + "-" + dt1.Year + "'";
                            }
                            else
                            {
                                condition = condition + " and a." + Message.PunchOutColumn + "<='" + dt1.Month + "-" + dt1.Day
                                    + "-" + dt1.Year + "'";
                            }
                            this.toDate = Request.Form["txtDateTo"].ToString().Trim();
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = Message.InvalidDate;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    condition = condition + " order by p." + Message.NameColumn;
                    _com.bindDataAttendanceSummary("p." + Message.NameColumn + ",a." + Message.PunchInColumn
                        + ",a." + Message.PunchOutColumn+",p."+Message.BusinessEntityIDColumn+",p."+Message.EmailAddressColumn, condition, Message.TableAttendance + " a join "
                        + Message.TablePerson + " p on a." + Message.BusinessEntityIDColumn + " = p."
                        + Message.BusinessEntityIDColumn + " join " + Message.TableEmployee + " e on a."
                        + Message.BusinessEntityIDColumn + " = e." + Message.BusinessEntityIDColumn + " join "
                        + Message.TableJobTitle + " j on j." + Message.JobIDColumn + "=e." + Message.JobIDColumn, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        lblError.Text = "";
                        pnlData.Visible = true;
                        lblDate.Text = "&nbsp;Search Employee: " + txtEmployeeName.Text.Trim();
                        if (Request.Form["txtDateFrom"].ToString().Trim() != "") {
                            lblDate.Text = lblDate.Text + "<br />&nbsp;From " + Request.Form["txtDateFrom"].ToString().Trim();
                        }
                        if (Request.Form["txtDateTo"].ToString().Trim() != "") {
                            lblDate.Text = lblDate.Text + "<br />&nbsp;To " + Request.Form["txtDateTo"].ToString().Trim();
                        }
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        pnlData.Visible = false;
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
