﻿using System;
using System.Data;
using System.Web.UI;

namespace SP2010VisualWebPart.Admin.Project.EditTask
{
    public partial class EditTaskUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    if (Session["TaskID"] == null)
                    {
                        Response.Redirect(Message.AccessDeniedPage);
                    }
                    else {
                        if (!IsPostBack) {
                            DataTable dt = _com.getData(Message.TableTask, "*", " where " + Message.TaskIdColumn
                                    + "='" + Session["TaskID"].ToString() + "'");
                            txtTaskName.Text = dt.Rows[0][2].ToString();
                            txtNote.Text = dt.Rows[0][3].ToString();
                            this.startDate = dt.Rows[0][4].ToString();
                            this.endDate = dt.Rows[0][5].ToString();
                        }
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.TaskListPage, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.startDate = Request.Form["txtStartDate"].ToString().Trim();
                this.endDate = Request.Form["txtEndDate"].ToString().Trim();
                if (txtTaskName.Text.Trim() == "")
                {
                    lblError.Text = Message.NotEnterProjectName;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else if (Request.Form["txtStartDate"].ToString().Trim() == ""
                    || Request.Form["txtEndDate"].ToString().Trim() == "")
                {
                    lblError.Text = Message.NotEnterStartEndDate;
					ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                else
                {
                    DateTime start = DateTime.Parse(Request.Form["txtStartDate"].ToString().Trim());
                    DateTime end = DateTime.Parse(Request.Form["txtEndDate"].ToString().Trim());
                    if (DateTime.Compare(start, end) > 0)
                    {
                        lblError.Text = Message.StartLargeThanEnd;
						ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    else
                    {
                        DataTable dt = _com.getData(Message.TableTask, "*", " where " + Message.TaskNameColumn
                            + "='" + txtTaskName.Text.Trim() + "' and " + Message.ProjectIDColumn + "='" 
                            + Session["ProjectID"].ToString() + "' and "+Message.TaskIdColumn+"<>'"+Session["TaskID"].ToString()+"'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = Message.AlreadyExistTask;
							ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            _com.updateTable(Message.TableTask, " " + Message.TaskNameColumn + "=N'" + txtTaskName.Text
                                + "'," + Message.NoteColumn + "=N'" + txtNote.Text + "'," + Message.StartDateColumn + "='"
                                + Request.Form["txtStartDate"].ToString().Trim() + "'," + Message.EndDateColumn + "='"
                                + Request.Form["txtEndDate"].ToString().Trim() + "' where " + Message.TaskIdColumn
                                + "='" + Session["TaskID"].ToString() + "'");
                            Session.Remove("TaskID");
                            Response.Redirect(Message.TaskListPage, true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
