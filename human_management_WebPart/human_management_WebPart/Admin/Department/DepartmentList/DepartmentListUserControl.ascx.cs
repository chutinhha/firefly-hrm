using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Department.DepartmentList
{
    public partial class DepartmentListUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            _com.bindData(Message.NameColumn, "", Message.TableDepartment, grdData);
                            Panel1.Visible = false;
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\'") + "');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            lblTitle.Text = "Add New Department";
            Session["type"] = "Add";
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //string Location = "JobCategories.aspx/?Type=Edit&" + Server.HtmlDecode(e.Row.Cells[2].Text)
                //+ "&Email=" + Server.HtmlDecode(e.Row.Cells[3].Text);
                //e.Row.Style["cursor"] = "pointer";
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
            txtName.Text = "";
            Panel1.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim() == "")
            {
                lblError.Text = Message.DepartmentNameError;
                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
            }
            else
            {
                try
                {
                    if (Session["type"].ToString() == "Add")
                    {
                        DataTable existDepartment = _com.getData(Message.TableDepartment, "*", " where " + Message.NameColumn
                            + "='" + txtName.Text.Trim() + "'");
                        if (existDepartment.Rows.Count == 0)
                        {
                            _com.insertIntoTable(Message.TableDepartment, "("+Message.NameColumn+","+Message.ModifiedDateColumn
                                +")", "N'" + txtName.Text.Trim() + "','" + DateTime.Now + "'", false);
                            Panel1.Visible = false;
                        }
                        else
                        {
                            lblError.Text = Message.AlreadyExistDepartment;
                            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                        }
                    }
                    else
                    {
                        _com.updateTable(Message.TableDepartment, Message.NameColumn + "=N'" + txtName.Text.Trim()
                            + "'," + Message.ModifiedDateColumn + "='" + DateTime.Now + "' where " + Message.NameColumn + "=N'" + Session["Name"] + "'");
                        Panel1.Visible = false;
                    }
                    _com.bindData(Message.NameColumn, "", Message.TableDepartment, grdData);
                    lblError.Text = "";
                    txtName.Text = "";
                }
                catch (Exception ex)
                {
                    if (ex.Message.Contains("duplicate key"))
                    {
                        lblError.Text = Message.AlreadyExistDepartment;
                    }
                    else
                    {
                        lblError.Text = ex.Message;
                    }
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\'") + "');", true);
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["type"] = "Edit";
                    Panel1.Visible = true;
                    lblTitle.Text = "Edit Department";
                    txtName.Text = Session["Name"].ToString();
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = Message.NotChooseItemEdit;
                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        string sql;
                        SqlCommand command;
                        sql = @"delete from " + Message.TableDepartment + " where " + Message.NameColumn + "=N'"
                            + Server.HtmlDecode(gr.Cells[1].Text) + "';";
                        command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                        lblError.Text = "";
                    }
                }
                if (isCheck == true)
                {
                    _com.bindData(Message.NameColumn, "", Message.TableDepartment, grdData);
                }
                else
                {
                    lblError.Text = Message.NotChooseItemDelete;
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\'") + "');", true);
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
