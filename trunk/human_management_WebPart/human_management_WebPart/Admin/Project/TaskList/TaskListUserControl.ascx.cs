﻿using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Project.TaskList
{
    public partial class TaskListUserControl : UserControl
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
                        if (!IsPostBack) {
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProjectName, "", false, "");
                            DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                            _com.bindData(Message.TaskIdColumn + "," + Message.TaskNameColumn + "," + Message.NoteColumn
                                + "," + Message.StartDateColumn + "," + Message.EndDateColumn, " where " + Message.ProjectIDColumn
                                + "='" + dt.Rows[0][0].ToString() + "'", Message.TableTask, grdData);
                            _com.setGridViewStyle(grdData);
                            ddlProjectName.AutoPostBack = true;
                            Session.Remove("ProjectID");
                            Session.Remove("TaskID");
                        }
                    }
                    catch (Exception ex) {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try{
                DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                _com.bindData(Message.TaskIdColumn + "," + Message.TaskNameColumn + "," + Message.NoteColumn
                    + "," + Message.StartDateColumn + "," + Message.EndDateColumn, " where " + Message.ProjectIDColumn
                    + "='" + dt.Rows[0][0].ToString() + "'", Message.TableTask, grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
            Session["ProjectID"]=dt.Rows[0][0].ToString();
            Response.Redirect(Message.AddTaskPage, true);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["TaskID"] = Server.HtmlDecode(gr.Cells[1].Text);
                    DataTable dt = _com.getData(Message.TableProject, Message.ProjectIDColumn, " where "
                                + Message.ProjectNameColumn + "='" + ddlProjectName.SelectedValue + "'");
                    Session["ProjectID"] = dt.Rows[0][0].ToString();
                    _com.closeConnection();
                    Response.Redirect(Message.EditTaskPage, true);
                }
            }
            lblError.Text = Message.NotSelectProject;
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}