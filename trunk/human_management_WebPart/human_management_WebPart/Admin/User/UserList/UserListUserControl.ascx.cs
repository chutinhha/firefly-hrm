using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Security.Cryptography;

namespace SP2010VisualWebPart.Admin.User.UserList
{
    public partial class UserListUserControl : UserControl
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
                        string condition;
                        if (ddlType.SelectedValue == "All")
                        {
                            condition = "";
                        }
                        else if (ddlType.SelectedValue == "Have " + Message.LoginIDColumn)
                        {
                            condition = " where " + Message.LoginIDColumn + "<>'' and " + Message.LoginIDColumn + "<>'NULL'";
                        }
                        else
                        {
                            condition = " where (" + Message.LoginIDColumn + "='' or " + Message.LoginIDColumn + "='NULL')";
                        }
                        if (ddlRankUser.SelectedValue == "All")
                        {
                        }
                        else
                        {
                            if (condition == "")
                            {
                                condition = " where " + Message.RankColumn + "='" + ddlRankUser.SelectedValue + "'";
                            }
                            else {
                                condition = condition + " and " + Message.RankColumn + "='" + ddlRankUser.SelectedValue + "'";
                            }
                        }
                        condition = condition + " order by Name";
                        ddlRankUser.AutoPostBack = true;
                        string[] ColumnTitle = new string[2];
                        ColumnTitle[0] = "LoginID";
                        ColumnTitle[1] = "Rank";
                        DataTable dt = _com.getData(Message.TableEmployee+" e join "+Message.TablePerson
                            +" p on e."+Message.BusinessEntityIDColumn+"=p."+Message.BusinessEntityIDColumn, "e."
                            +Message.BusinessEntityIDColumn +", p."+Message.NameColumn+", "+Message.LoginIDColumn+",p."+Message.RankColumn, condition);
                        _com.bindDataBlankColumn("e."+ Message.BusinessEntityIDColumn + ", p." + Message.NameColumn
                            , condition, Message.TableEmployee + " e join " + Message.TablePerson
                            + " p on e." + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData,2,ColumnTitle);
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            TextBox txtUser = new TextBox();
                            txtUser.ID = "txtUser" + i;
                            txtUser.Text = dt.Rows[i][2].ToString();
                            txtUser.Width = 200;
                            grdData.Rows[i].Cells[2].Controls.Add(txtUser);
                            DropDownList ddlRank = new DropDownList();
                            ddlRank.ID = "ddlRank" + i;
                            //ddlRank.Width = 200;
                            ddlRank.Items.Add("Admin");
                            ddlRank.Items.Add("User");
                            ddlRank.AutoPostBack=true;
                            ddlRank.SelectedValue = dt.Rows[i][3].ToString();
                            grdData.Rows[i].Cells[3].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                            grdData.Rows[i].Cells[3].Controls.Add(ddlRank);
                            grdData.Rows[i].Cells[3].Controls.Add(new LiteralControl("</div>"));
                        }
                        _com.setGridViewStyle(grdData);
                        ddlType.AutoPostBack = true;
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
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            string condition;
            if (ddlType.SelectedValue == "All")
            {
                condition = "";
            }
            else if (ddlType.SelectedValue == "Have " + Message.LoginIDColumn)
            {
                condition = " where " + Message.LoginIDColumn + "<>'' and " + Message.LoginIDColumn + "<>'NULL'";
            }
            else
            {
                condition = " where (" + Message.LoginIDColumn + "='' or " + Message.LoginIDColumn + "='NULL')";
            }
            if (ddlRankUser.SelectedValue == "All")
            {
            }
            else
            {
                if (condition == "")
                {
                    condition = " where " + Message.RankColumn + "='" + ddlRankUser.SelectedValue + "'";
                }
                else
                {
                    condition = condition + " and " + Message.RankColumn + "='" + ddlRankUser.SelectedValue + "'";
                }
            }
            condition = condition + " order by Name";
            string[] ColumnTitle = new string[2];
            ColumnTitle[0] = "LoginID";
            ColumnTitle[1] = "Rank";
            DataTable dt = _com.getData(Message.TableEmployee + " e join " + Message.TablePerson
                + " p on e." + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "e."
                + Message.BusinessEntityIDColumn + ", p." + Message.NameColumn + ", " + Message.LoginIDColumn + ",p." + Message.RankColumn, condition);
            _com.bindDataBlankColumn("e." + Message.BusinessEntityIDColumn + ", p." + Message.NameColumn
                , condition, Message.TableEmployee + " e join " + Message.TablePerson
                + " p on e." + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData,2, ColumnTitle);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TextBox txtUser = new TextBox();
                txtUser.ID = "txtUser" + i;
                txtUser.Text = dt.Rows[i][2].ToString();
                txtUser.Width = 200;
                grdData.Rows[i].Cells[2].Controls.Add(txtUser);
                DropDownList ddlRank = new DropDownList();
                ddlRank.ID = "ddlRank" + i;
                //ddlRank.Width = 200;
                ddlRank.Items.Add("Admin");
                ddlRank.Items.Add("User");
                ddlRank.AutoPostBack = true;
                ddlRank.SelectedValue = dt.Rows[i][3].ToString();
                grdData.Rows[i].Cells[3].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                grdData.Rows[i].Cells[3].Controls.Add(ddlRank);
                grdData.Rows[i].Cells[3].Controls.Add(new LiteralControl("</div>"));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            try
            {
                for (int i = 0; i < grdData.Rows.Count; i++)
                {
                    TextBox txtUser = (TextBox)grdData.Rows[i].Cells[2].FindControl("txtUser" + i);
                    DropDownList ddlRank = (DropDownList)grdData.Rows[i].Cells[3].FindControl("ddlRank" + i);
                    DataTable user = _com.getData(Message.TableEmployee, Message.BusinessEntityIDColumn + ","
                        + Message.LoginIDColumn, " where " + Message.BusinessEntityIDColumn + "='" 
                        + grdData.Rows[i].Cells[0].Text + "'");
                    _com.updateTable(Message.TableEmployee, " "+Message.LoginIDColumn+"='" + txtUser.Text.Trim() 
                        + "',"+Message.ModifiedDateColumn+"='"+DateTime.Now+"' where "
                            + Message.BusinessEntityIDColumn + "='" + grdData.Rows[i].Cells[0].Text + "'");
                    _com.updateTable(Message.TablePerson, " "+Message.RankColumn+"='" + ddlRank.SelectedValue 
                        + "',"+Message.ModifiedDateColumn+"='"+DateTime.Now+"' where "
                            + Message.BusinessEntityIDColumn + "='" + grdData.Rows[i].Cells[0].Text + "'");
                    if (user.Rows[0][1] != null && user.Rows[0][1].ToString().Trim() != "")
                    { }
                    else { 
                        MD5 md5Hash = MD5.Create();
                        string Password = _com.GetMd5Hash(md5Hash, txtUser.Text.Trim());
                        DataTable pw = _com.getData(Message.TablePassword, "*", " where " + Message.BusinessEntityIDColumn + "='"
                        + grdData.Rows[i].Cells[0].Text + "'");
                        if (pw.Rows.Count > 0)
                        {
                            _com.updateTable(Message.TablePassword, " " + Message.PasswordColumn + "='" + Password 
                                + "',"+Message.ModifiedDateColumn+"='"+DateTime.Now+"' where "
                                + Message.BusinessEntityIDColumn + "='" + grdData.Rows[i].Cells[0].Text + "'");
                        }
                        else {
                            _com.insertIntoTable(Message.TablePassword, "", "'" + grdData.Rows[i].Cells[0].Text + "','"
                                + Password + "','" + DateTime.Now + "'", false);
                        }
                    }
                    lblSuccess.Text = Message.UpdateSuccess;
                    lblError.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ddlRankUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            string condition;
            if (ddlType.SelectedValue == "All")
            {
                condition = "";
            }
            else if (ddlType.SelectedValue == "Have " + Message.LoginIDColumn)
            {
                condition = " where " + Message.LoginIDColumn + "<>'' and " + Message.LoginIDColumn + "<>'NULL'";
            }
            else
            {
                condition = " where (" + Message.LoginIDColumn + "='' or " + Message.LoginIDColumn + "='NULL')";
            }
            if (ddlRankUser.SelectedValue == "All")
            {
            }
            else
            {
                if (condition == "")
                {
                    condition = " where " + Message.RankColumn + "='" + ddlRankUser.SelectedValue + "'";
                }
                else
                {
                    condition = condition + " and " + Message.RankColumn + "='" + ddlRankUser.SelectedValue + "'";
                }
            }
            condition = condition + " order by Name";
            string[] ColumnTitle = new string[2];
            ColumnTitle[0] = "LoginID";
            ColumnTitle[1] = "Rank";
            DataTable dt = _com.getData(Message.TableEmployee + " e join " + Message.TablePerson
                + " p on e." + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, "e."
                + Message.BusinessEntityIDColumn + ", p." + Message.NameColumn + ", " + Message.LoginIDColumn + ",p." + Message.RankColumn, condition);
            _com.bindDataBlankColumn("e." + Message.BusinessEntityIDColumn + ", p." + Message.NameColumn
                , condition, Message.TableEmployee + " e join " + Message.TablePerson
                + " p on e." + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData, 2, ColumnTitle);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TextBox txtUser = new TextBox();
                txtUser.ID = "txtUser" + i;
                txtUser.Text = dt.Rows[i][2].ToString();
                txtUser.Width = 200;
                grdData.Rows[i].Cells[2].Controls.Add(txtUser);
                DropDownList ddlRank = new DropDownList();
                ddlRank.ID = "ddlRank" + i;
                //ddlRank.Width = 200;
                ddlRank.Items.Add("Admin");
                ddlRank.Items.Add("User");
                ddlRank.AutoPostBack = true;
                ddlRank.SelectedValue = dt.Rows[i][3].ToString();
                grdData.Rows[i].Cells[3].Controls.Add(new LiteralControl("<div class=\"styled-selectLong\">"));
                grdData.Rows[i].Cells[3].Controls.Add(ddlRank);
                grdData.Rows[i].Cells[3].Controls.Add(new LiteralControl("</div>"));
            }
        }
    }
}
