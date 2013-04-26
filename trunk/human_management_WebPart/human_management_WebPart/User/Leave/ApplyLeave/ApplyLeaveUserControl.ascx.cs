using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.User.Leave.ApplyLeave
{
    public partial class ApplyLeaveUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    if (!IsPostBack)
                    {
                        this.startDate = "";
                        this.endDate = "";
                        pnlFrom.Visible = false;
                        pnlLimit.Visible = false;
                        pnlTo.Visible = false;
                        pnlDateFrom.Visible = true;
                        pnlDateTo.Visible = true;
                        TextArea1.Text = "";
                        lblError.Text = "";
                        lblSuccess.Text = "";
                        DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn,
                            " where " + Message.ProjectNameColumn + " = 'Leave' ");
                        _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlLeave, " where "
                            + Message.ProjectIDColumn + " = " + myData.Rows[0][0].ToString()+" and "+Message.LimitDateColumn
                            +">0", false, "");
                    }
                }
                else
                {
                    Response.Redirect(Message.AdminHomePage);
                }
            }
            ddlLeave.AutoPostBack = true;
        }
        protected string confirmSave { get; set; }
        protected void ddlLeave_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                DataTable myData = _com.getData(Message.TableProject + " pro INNER JOIN " + Message.TableTask 
                    + " tas ON tas."+Message.ProjectIDColumn+" = pro."+Message.ProjectIDColumn+" ", 
                    Message.TaskNameColumn + ",tas."+Message.StartDateColumn+",tas."+Message.EndDateColumn
                    +",tas."+Message.LimitDateColumn, " where pro."+Message.ProjectNameColumn+" = 'Leave' ");
                if (ddlLeave.SelectedValue.ToString() == "Vacation")
                {
                    DataTable myDatatmp = _com.getData(Message.TableEmployee, " "+Message.VacationHoursColumn
                        +" ", " where "+Message.BusinessEntityIDColumn+" =" + Session["AccountID"].ToString());
                    lblLimitDate.Text = myDatatmp.Rows[0][0].ToString();
                    pnlLimit.Visible = true;
                    pnlLimit.Visible = true;
                    pnlDateFrom.Visible = true;
                    pnlDateTo.Visible = true;
                    pnlFrom.Visible = false;
                    pnlTo.Visible = false;
                }
                else if (ddlLeave.SelectedValue.ToString() == "Sick")
                {
                    DataTable myDatatmp = _com.getData(Message.TableEmployee, " "+Message.SickLeaveHoursColumn
                        +" ", " where "+Message.BusinessEntityIDColumn+" =" + Session["AccountID"].ToString());
                    lblLimitDate.Text = myDatatmp.Rows[0][0].ToString();
                    pnlLimit.Visible = true;
                    pnlLimit.Visible = true;
                    pnlDateFrom.Visible = true;
                    pnlDateTo.Visible = true;
                    pnlFrom.Visible = false;
                    pnlTo.Visible = false;
                }
                else
                {
                    foreach (DataRow myRow in myData.Rows)
                    {
                        if (ddlLeave.SelectedValue == myRow[0].ToString())
                        {
                            if (myRow[1].ToString() != "" && myRow[2].ToString() != "")
                            {
                                lblDateFrom.Text = myRow[1].ToString();
                                lblDateTo.Text = myRow[2].ToString();
                                pnlDateFrom.Visible = false;
                                pnlDateTo.Visible = false;
                                pnlFrom.Visible = true;
                                pnlTo.Visible = true;
                                pnlLimit.Visible = false;
                            }
                            else if (myRow[3].ToString() != "")
                            {
                                lblLimitDate.Text = myRow[3].ToString();
                                pnlLimit.Visible = true;
                                pnlDateFrom.Visible = true;
                                pnlDateTo.Visible = true;
                                pnlFrom.Visible = false;
                                pnlTo.Visible = false;
                            }
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnApply_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            lblError.Text = "";
            lblSuccess.Text = "";
            bool check = true;
            try
            {
                DataTable myData = _com.getData(Message.TableProject + " pro INNER JOIN " + Message.TableTask 
                    + " tas ON tas."+Message.ProjectIDColumn+" = pro."+Message.ProjectIDColumn+" ", 
                    Message.TaskIdColumn, " where pro."+Message.ProjectNameColumn+" = 'Leave' and tas."
                    +Message.TaskNameColumn+" = '" + ddlLeave.SelectedValue.ToString()+"'");
                string table = Message.TablePersonProject;
                string condition = Session["AccountID"].ToString() + "," + myData.Rows[0][0].ToString();
                if (TextArea1.Text.ToString() != "")
                {
                    condition = condition + "," + TextArea1.Text.ToString();
                }
                else condition = condition + ",''";
                condition = condition + ",0," + " CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATE) ";
                if (pnlFrom.Visible == true)
                {
                    condition = condition + ",CAST('" + lblDateFrom + "' AS DATE),CAST('" + lblDateTo + "' AS DATE)";
                }
                else
                {
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                    {
                        condition = condition + ",CAST('" + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE)";
                    }
                    else condition = condition + ",''";
                    if (Request.Form["txtDateFrom"].ToString().Trim() != "")
                    {
                        condition = condition + ",CAST('" + Request.Form["txtDateTo"].ToString().Trim() + "' AS DATE)";
                    }
                    else condition = condition + ",''";
                }
                int timespan = 0;
                if (pnlLimit.Visible == true)
                {
                    TimeSpan time = Convert.ToDateTime(Request.Form["txtDateTo"].ToString().Trim()) - Convert.ToDateTime(Request.Form["txtDateFrom"].ToString().Trim());
                    timespan = time.Days;
                }
                if (pnlLimit.Visible == true)
                {
                    try
                    {
                        if (Request.Form["txtDateTo"].ToString().Trim() == "" || Request.Form["txtDateFrom"].ToString().Trim() == "")
                        {
                            lblError.Text = "Please insert Dateto and Datefrom";
                            check = false;
                        }
                    }
                    catch (FormatException ex)
                    {
                        lblError.Text = ex.Message;
                        check = false;
                    }
                }
                if (pnlLimit.Visible == true && timespan > Convert.ToInt16(lblLimitDate.Text.ToString().Trim()))
                {
                    lblError.Text = "Your leave date is over the limit!";
                    check = false;
                }
                if (check == true)
                {
                    _com.insertIntoTable(table, "", condition, false);
                    lblSuccess.Text = Message.UpdateSuccess;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
