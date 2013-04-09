using System;
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
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    pnlFrom.Visible = false;
                    pnlLimit.Visible = false;
                    pnlTo.Visible = false;
                    pnlDateFrom.Visible = true;
                    pnlDateTo.Visible = true;
                    TextArea1.InnerText = "";
                    lblError.Text = "";
                    lblSuccess.Text = "";
                    DataTable myData = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where ProjectName = 'Leave' ");
                    _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlLeave, " where ProjectId = " + myData.Rows[0][0].ToString(), true, "");
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void ddlLeave_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                DataTable myData = _com.getData(Message.TableProject + " INNER JOIN " + Message.TableTask + " ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId ", Message.TaskNameColumn + ",HumanResources.Task.StartDate,HumanResources.Task.EndDate,HumanResouces.Task.LimiDate", " where ProjectName = 'Leave' ");
                if (ddlLeave.SelectedValue.ToString() == "Vacation")
                {
                    DataTable myDatatmp = _com.getData(Message.TableEmployee, " HumanResouces.Employee.VacationDate ", " where BusinessEntityId =" + Session["AccountID"].ToString());
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
                    DataTable myDatatmp = _com.getData(Message.TableEmployee, " HumanResouces.Employee.SickLeaveDate ", " where BusinessEntityId =" + Session["AccountID"].ToString());
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

        protected void btnApply_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblSuccess.Text = "";
            try
            {
                DataTable myData = _com.getData(Message.TableProject + " INNER JOIN " + Message.TableTask + " ON HumanResources.Task.ProjectId = HumanResources.Project.ProjectId ", Message.TaskIdColumn, " where ProjectName = 'Leave' and TaskName = " + ddlLeave.SelectedValue.ToString());
                string table = Message.TablePersonProject;
                string condition = Session["AccountID"].ToString() + "," + myData.Rows[0][0].ToString();
                if (TextArea1.InnerText.ToString() != "")
                {
                    condition = condition + "," + TextArea1.InnerText.ToString();
                }
                else condition = condition + ",''";
                condition = condition + ",0," + " CAST( '" + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATE ";
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
                _com.insertIntoTable(table, "", condition, false);
                lblSuccess.Text = Message.UpdateSuccess;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
