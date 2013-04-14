using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.TimeSheet.ApproveTimesheet
{
    public partial class ApproveTimesheetUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
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
                        string[] column = new string[1];
                        column[0]="Approve";
                        DataTable dt;
                        if (ddlShow.SelectedValue == "All")
                        {
                            _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                                + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                                + " as 'Task description',t."
                                + Message.TimesheetTimeColumn + " as 'Time(Hours)'", "", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                                + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData
                                ,1,column);
                            dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, "");
                        }
                        else if (ddlShow.SelectedValue == "Approved")
                        {
                            _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                                + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                                + " as 'Task description',t."
                                + Message.TimesheetTimeColumn + " as 'Time(Hours)'", " where t." + Message.CurrentFlagColumn
                                + "='True'", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                                + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData, 1, column);
                            dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, " where " + Message.CurrentFlagColumn
                                + "='True'");
                        }
                        else
                        {
                            _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                                + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                                + " as 'Task description',t."
                                + Message.TimesheetTimeColumn + " as 'Time(Hours)'", " where t." + Message.CurrentFlagColumn
                                + "='False'", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                                + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData, 1, column);
                            dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, " where " + Message.CurrentFlagColumn
                                + "='False'");
                        }
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            DropDownList ddlApprove = new DropDownList();
                            ddlApprove.ID = "ddlApprove" + i;
                            ddlApprove.Items.Add("Approve");
                            ddlApprove.Items.Add("Not Approve");
                            //ddlApprove.AutoPostBack = true;
                            if (dt.Rows[i][0].ToString() == "True")
                            {
                                ddlApprove.SelectedValue = "Approve";
                            }
                            else
                            {
                                ddlApprove.SelectedValue = "Not Approve";
                            }
                            grdData.Rows[i].Cells[5].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                            grdData.Rows[i].Cells[5].Controls.Add(ddlApprove);
                            grdData.Rows[i].Cells[5].Controls.Add(new LiteralControl("</div>"));
                        }
                        ddlShow.AutoPostBack = true;
                        _com.setGridViewStyle(grdData);
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
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
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
                    if (i != 1)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    }
                    else {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;padding-left:5px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected string confirmSave { get; set; }
        protected void ddlShow_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] column = new string[1];
            column[0] = "Approve";
            DataTable dt;
            if (ddlShow.SelectedValue == "All")
            {
                _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                    + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                    + " as 'Task description',t."
                    + Message.TimesheetTimeColumn + " as 'Time(Hours)'", "", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                    + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData
                    , 1, column);
                dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, "");
            }
            else if (ddlShow.SelectedValue == "Approved")
            {
                _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                    + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                    + " as 'Task description',t."
                    + Message.TimesheetTimeColumn + " as 'Time(Hours)'", " where t." + Message.CurrentFlagColumn
                    + "='True'", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                    + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData, 1, column);
                dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, " where " + Message.CurrentFlagColumn
                    + "='True'");
            }
            else
            {
                _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                    + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                    + " as 'Task description',t."
                    + Message.TimesheetTimeColumn + " as 'Time(Hours)'", " where t." + Message.CurrentFlagColumn
                    + "='False'", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                    + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData, 1, column);
                dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, " where " + Message.CurrentFlagColumn
                    + "='False'");
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DropDownList ddlApprove = new DropDownList();
                ddlApprove.ID = "ddlApprove" + i;
                ddlApprove.Items.Add("Approve");
                ddlApprove.Items.Add("Not Approve");
                //ddlApprove.AutoPostBack = true;
                if (dt.Rows[i][0].ToString() == "True")
                {
                    ddlApprove.SelectedValue = "Approve";
                }
                else {
                    ddlApprove.SelectedValue = "Not Approve";
                }
                grdData.Rows[i].Cells[5].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                grdData.Rows[i].Cells[5].Controls.Add(ddlApprove);
                grdData.Rows[i].Cells[5].Controls.Add(new LiteralControl("</div>"));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            try{
                foreach (GridViewRow row in grdData.Rows)
                {
                    DropDownList ddlApprove = (DropDownList)row.FindControl("ddlApprove"+row.RowIndex);
                    if (ddlApprove.SelectedValue == "Approve")
                    {
                        _com.updateTable(Message.TableTimesheet, " " + Message.CurrentFlagColumn + "='True' "
                            + "where " + Message.TimesheetIDColumn + "='" + row.Cells[0].Text + "'");
                    }
                    else {
                        _com.updateTable(Message.TableTimesheet, " " + Message.CurrentFlagColumn + "='False' "
                            + "where " + Message.TimesheetIDColumn + "='" + row.Cells[0].Text + "'");
                    }
                }
                string[] column = new string[1];
                column[0] = "Approve";
                DataTable dt;
                if (ddlShow.SelectedValue == "All")
                {
                    _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                        + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                        + " as 'Task description',t."
                        + Message.TimesheetTimeColumn + " as 'Time(Hours)'", "", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                        + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData
                        , 1, column);
                    dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, "");
                }
                else if (ddlShow.SelectedValue == "Approved")
                {
                    _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                        + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                        + " as 'Task description',t."
                        + Message.TimesheetTimeColumn + " as 'Time(Hours)'", " where t." + Message.CurrentFlagColumn
                        + "='True'", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                        + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData, 1, column);
                    dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, " where " + Message.CurrentFlagColumn
                        + "='True'");
                }
                else
                {
                    _com.bindDataBlankColumn(" t." + Message.TimesheetIDColumn + ",t." + Message.TimesheetDateColumn + " as 'Date',p."
                        + Message.NameColumn + " as 'Employee Name',t." + Message.TaskDescriptionColumn
                        + " as 'Task description',t."
                        + Message.TimesheetTimeColumn + " as 'Time(Hours)'", " where t." + Message.CurrentFlagColumn
                        + "='False'", " " + Message.TableTimesheet + " t join " + Message.TablePerson + " p on t."
                        + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, grdData, 1, column);
                    dt = _com.getData(Message.TableTimesheet, Message.CurrentFlagColumn, " where " + Message.CurrentFlagColumn
                        + "='False'");
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Approve");
                    ddlApprove.Items.Add("Not Approve");
                    //ddlApprove.AutoPostBack = true;
                    if (dt.Rows[i][0].ToString() == "True")
                    {
                        ddlApprove.SelectedValue = "Approve";
                    }
                    else
                    {
                        ddlApprove.SelectedValue = "Not Approve";
                    }
                    grdData.Rows[i].Cells[5].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                    grdData.Rows[i].Cells[5].Controls.Add(ddlApprove);
                    grdData.Rows[i].Cells[5].Controls.Add(new LiteralControl("</div>"));
                }
                lblSuccess.Text = Message.UpdateSuccess;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
