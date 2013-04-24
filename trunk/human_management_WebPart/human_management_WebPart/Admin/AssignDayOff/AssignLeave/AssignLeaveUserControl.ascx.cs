using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Collections.Generic;

namespace SP2010VisualWebPart.Admin.AssignDayOff.AssignLeave
{
    public partial class AssignLeaveUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmAssign = Message.ConfirmAssign;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    if (Session["TaskName"] == null)
                    {
                        Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                    else
                    {
                        try
                        {
                            if (!IsPostBack)
                            {
                                txtDayOff.Text = Session["TaskName"].ToString();
                                txtEmployee.Text = "";
                                lblError.Text = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                else
                {
                    Session.Remove("TaskName");
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmAssign { get; set; }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                string column = "emp."+Message.BusinessEntityIDColumn+", per." + Message.PersonNameColumn 
                    + ",per." + Message.EmailAddressColumn + ",job." + Message.JobTitleColumn;
                string condition = " INNER JOIN " + Message.TableEmployee + " emp ON job."+Message.JobIDColumn+" = "
                    +"emp."+Message.JobIDColumn+") INNER JOIN "+Message.TablePerson+" per ON per."
                    +Message.BusinessEntityIDColumn +" = emp."+Message.BusinessEntityIDColumn+" WHERE "
                    +"emp."+Message.CurrentFlagColumn+" = 'True' and per."+Message.RankColumn+"='User'";
                string table = "(" + Message.TableJobTitle+" job";
                if (txtEmployee.Text != "")
                {
                    condition = condition + " and per." + Message.PersonNameColumn + " LIKE  '%" 
                        + txtEmployee.Text.ToString().Trim() + "%'";
                }
                _com.bindData(column, condition, table, grdData);
                if (grdData.Rows.Count == 0)
                {
                    lblError.Text = Message.NotExistData;
                }
                else
                {
                    _com.setGridViewStyle(grdData);
                    grdData.HeaderRow.Cells[1].Text = "BusinessEntityId";
                    grdData.HeaderRow.Cells[2].Text = "Employee Name";
                    grdData.HeaderRow.Cells[3].Text = "Email";
                    grdData.HeaderRow.Cells[4].Text = "Job Title";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            bool checkRedirect = false;
            bool checkCB = false;
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked) checkCB = true;
            }
            if (checkCB == true)
            {
                try
                {
                    DataTable myData = _com.getData(Message.TableProject + " pro", Message.TaskIdColumn, " INNER JOIN "
                        + Message.TableTask + " tas ON pro." + Message.ProjectIDColumn + " = tas." + Message.ProjectIDColumn
                        + " WHERE pro." + Message.ProjectNameColumn + " = 'Leave' and tas." + Message.TaskNameColumn
                        + " = '" + txtDayOff.Text.ToString() + "'");
                    foreach (GridViewRow gr in grdData.Rows)
                    {
                        CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                        if (cb.Checked)
                        {
                            DataTable myDatatmp = _com.getData(Message.TablePersonProject + " pp join "
                                + Message.TableEmployee + " emp on pp." + Message.BusinessEntityIDColumn + "=emp."
                                + Message.BusinessEntityIDColumn, "pp." + Message.CurrentFlagColumn
                                , " where pp." + Message.BusinessEntityIDColumn + " = '" + gr.Cells[1].Text
                                + "' and pp." + Message.TaskIdColumn + " = '" + myData.Rows[0][0].ToString() + "'"
                                + " and emp." + Message.CurrentFlagColumn + "='True'");
                            if (myDatatmp.Rows.Count > 0)
                            {
                                if (myDatatmp.Rows[0][0].ToString() == "1")
                                {
                                    lblError.Text = Message.AlreadyAssign;
                                }
                                else if (myDatatmp.Rows[0][0].ToString() != "1")
                                {
                                    bool employeeStatus = bool.Parse(_com.getData(Message.TableEmployee,
                                        Message.CurrentFlagColumn, " where " + Message.BusinessEntityIDColumn
                                        + "='" + gr.Cells[1].Text + "'").Rows[0][0].ToString());
                                    if (employeeStatus == true)
                                    {
                                        _com.updateTable(Message.TablePersonProject, " " + Message.CurrentFlagColumn
                                            + " = '1', " + Message.ModifiedDateColumn + " = CAST( '"
                                            + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME) where "
                                            + Message.BusinessEntityIDColumn + " = '" + gr.Cells[1].Text + "' and "
                                            + Message.TaskIdColumn + " = '" + myData.Rows[0][0].ToString() + "'");
                                        checkRedirect = true;
                                    }
                                }
                            }
                            else
                            {
                                bool employeeStatus = bool.Parse(_com.getData(Message.TableEmployee,
                                    Message.CurrentFlagColumn, " where " + Message.BusinessEntityIDColumn
                                    + "='" + gr.Cells[1].Text + "'").Rows[0][0].ToString());
                                if (employeeStatus == true)
                                {
                                    _com.insertIntoTable(Message.TablePersonProject, "", "'" + gr.Cells[1].Text + "','"
                                        + myData.Rows[0][0].ToString() + "',NULL,1,CAST( '"
                                        + DateTime.Now.ToString("yyyy-MM-dd") + "' AS DATETIME),NULL,NULL", false);
                                    checkRedirect = true;
                                }
                            }
                        }
                    }
                    if (checkRedirect == true)
                    {
                        Response.Redirect(Message.AssignDayOffPage);
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
            else lblError.Text = "You must select employee first!";
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
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.AssignDayOffPage);
        }
    }
}
