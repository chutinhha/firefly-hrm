using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.TimeSheet.ApproveTimesheet
{
    public partial class ApproveTimesheetUserControl : UserControl
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
                            ddlApprove.AutoPostBack = true;
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
                        grdData.GridLines = GridLines.None;
                        grdData.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#2CA6CD");
                        grdData.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                        grdData.HeaderStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
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
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
        }

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
                ddlApprove.AutoPostBack = true;
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
                    ddlApprove.AutoPostBack = true;
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
            }
        }
    }
}
