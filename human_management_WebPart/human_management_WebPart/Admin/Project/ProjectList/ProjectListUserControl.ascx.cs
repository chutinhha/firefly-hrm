using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Project.ProjectList
{
    public partial class ProjectListUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
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
                            Session.Remove("ProjectID");
                            grdData.HeaderRow.Cells[2].Text = "Project Name";
                            grdData.HeaderRow.Cells[4].Text = "Start Date";
                            grdData.HeaderRow.Cells[5].Text = "End Date";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlType.SelectedValue == "All")
                {
                    _com.bindData("*", " where "+Message.ProjectNameColumn+"<>'Leave'", Message.TableProject, grdData);
                }
                else if (ddlType.SelectedValue == "Current Project")
                {
                    _com.bindData("*", " where '" + DateTime.Today + "'>=" + Message.StartDateColumn
                        + " and '" + DateTime.Today + "'<=" + Message.EndDateColumn + " and " + Message.ProjectNameColumn 
                        + "<>'Leave'", Message.TableProject, grdData);
                }
                else if (ddlType.SelectedValue == "Finished Project")
                {
                    _com.bindData("*", " where '" + DateTime.Today + "'>" + Message.EndDateColumn
                        + " and " + Message.ProjectNameColumn + "<>'Leave'", Message.TableProject, grdData);
                }
                else
                {
                    _com.bindData("*", " where '" + DateTime.Today + "'<" + Message.StartDateColumn
                        + " and " + Message.ProjectNameColumn + "<>'Leave'", Message.TableProject, grdData);
                }
                grdData.HeaderRow.Cells[2].Text = "Project Name";
                grdData.HeaderRow.Cells[4].Text = "Start Date";
                grdData.HeaderRow.Cells[5].Text = "End Date";
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
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
            lblError.Text = Message.NotChooseItemEdit;
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditProjectPage+"/?ProjectID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
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
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
    }
}
