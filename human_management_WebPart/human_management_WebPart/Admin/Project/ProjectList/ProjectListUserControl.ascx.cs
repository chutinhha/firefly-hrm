using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Project.ProjectList
{
    public partial class ProjectListUserControl : UserControl
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
                            _com.bindData("*", " where '" + DateTime.Today + "'>=" + Message.StartDateColumn
                                + " and '" + DateTime.Today + "'<=" + Message.EndDateColumn, Message.TableProject, grdData);
                            _com.setGridViewStyle(grdData);
                            ddlType.AutoPostBack = true;
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

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlType.SelectedValue == "All")
                {
                    _com.bindData("*", "", Message.TableProject, grdData);
                }
                else if (ddlType.SelectedValue == "Current Project")
                {
                    _com.bindData("*", " where '" + DateTime.Today + "'>=" + Message.StartDateColumn
                        + " and '" + DateTime.Today + "'<=" + Message.EndDateColumn, Message.TableProject, grdData);
                }
                else if (ddlType.SelectedValue == "Finished Project")
                {
                    _com.bindData("*", " where '" + DateTime.Today + "'>" + Message.EndDateColumn
                        , Message.TableProject, grdData);
                }
                else
                {
                    _com.bindData("*", " where '" + DateTime.Today + "'<" + Message.StartDateColumn
                        , Message.TableProject, grdData);
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(Message.AddProjectPage, true);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["ProjectID"] = Server.HtmlDecode(gr.Cells[1].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.EditProjectPage, true);
                }
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}
