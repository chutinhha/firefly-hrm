﻿using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.JobCategories
{
    public partial class JobCategoriesUserControl : UserControl
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
                            _com.bindData(Message.NameColumn, "", Message.TableJobCategory, grdData);
                            Panel1.Visible = false;
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                        }
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            lblTitle.Text = "Add Job Category";
            Session["type"] = "Add";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            Panel1.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim() == "") {
                lblError.Text = Message.CategoryNameError;
            }
            else
            {
                try
                {
                    if (Session["type"].ToString() == "Add")
                    {
                        _com.insertIntoTable(Message.TableJobCategory,"", "N'" + txtName.Text.Trim() + "','"+DateTime.Now+"'",false);
                    }
                    else {
                        DataTable JobTitles = _com.getData(Message.TableJobTitle, Message.JobTitleColumn + "," + Message.JobIDColumn
                            , " where " + Message.JobCategoryColumn + "='" + Session["Name"].ToString() + "';");
                        _com.updateTable(Message.TableJobTitle, " " + Message.JobCategoryColumn + "=NULL where " + Message.JobCategoryColumn
                            + "='" + Session["Name"].ToString() + "';");
                        _com.updateTable(Message.TableJobCategory,Message.NameColumn+"=N'"+txtName.Text.Trim()
                            +"',LastModified='"+DateTime.Now+"' where "+Message.NameColumn+"=N'"+Session["Name"]+"'");
                        if (JobTitles.Rows.Count > 0) {
                            for (int i = 0; i < JobTitles.Rows.Count; i++)
                            {
                                _com.updateTable(Message.TableJobTitle, " " + Message.JobCategoryColumn + "=N'" + txtName.Text.Trim() + "' where "
                                    + Message.JobIDColumn + "='" + JobTitles.Rows[i][1].ToString() + "';");
                            }
                        }
                    }
                    Panel1.Visible = false;
                    _com.bindData(Message.NameColumn, "", Message.TableJobCategory, grdData);
                    lblError.Text = "";
                    txtName.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["type"] = "Edit";
                    Panel1.Visible = true;
                    lblTitle.Text = "Edit Job Category";
                    txtName.Text = Session["Name"].ToString();
                    break;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql;
                        SqlCommand command;
                        DataTable JobTitles = _com.getData(Message.TableJobTitle,Message.JobTitleColumn+","+Message.JobIDColumn
                            ," where "+Message.JobCategoryColumn+"='"+Server.HtmlDecode(gr.Cells[1].Text) + "';");
                        if (JobTitles.Rows.Count > 0) {
                            for (int i = 0; i < JobTitles.Rows.Count; i++) {
                                _com.updateTable(Message.TableJobCandidate, " "+Message.JobTitleColumn+"=NULL where JobTitle='" + JobTitles.Rows[i][0].ToString() + "'");
                                _com.updateTable(Message.TableVacancy, " "+Message.JobTitleColumn + "=NULL where JobTitle='" + JobTitles.Rows[i][0].ToString() + "'");
                                _com.updateTable(Message.TableEmployee, " "+Message.JobIDColumn+"=NULL where " + Message.JobIDColumn + "='" + JobTitles.Rows[i][1].ToString()
                                    + "'");
                            }
                            sql = @"delete from "+Message.TableJobTitle+" where "+Message.JobCategoryColumn+"='"
                                + Server.HtmlDecode(gr.Cells[1].Text)+"';";
                            command = new SqlCommand(sql, _com.cnn);
                            command.ExecuteNonQuery();
                        }
                        sql = @"delete from "+Message.TableJobCategory+" where "+Message.NameColumn+"=N'" 
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                        lblError.Text = "";
                    }
                }
                _com.bindData(Message.NameColumn, "", Message.TableJobCategory, grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
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
    }
}