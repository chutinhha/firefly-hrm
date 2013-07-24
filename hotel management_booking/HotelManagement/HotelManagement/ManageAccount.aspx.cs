using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagement
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserLevel"] != null)
                {
                    if (int.Parse(Session["UserLevel"].ToString()) > 2) { }
                    else
                    {
                        Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                    Response.Redirect("Home.aspx");
                }
                Session["MenuID"] = "5";
                lblSuccess.Text = "";
                lblError.Text = "";
                this.confirmSave = Message.ConfirmSave;
                this.confirmDelete = Message.ConfirmDelete;
                Page.Title = "Manage Account";
                if (!IsPostBack)
                {
                    com.bindData(Message.UserID + "," + Message.UserName + "," + Message.UserLevel + "," + Message.FullName
                        + "," + Message.Email + "," + Message.PhoneNumber, " where " + Message.Status + "='True' and " + Message.UserLevel + "<3", Message.UserAccountTable, grdAccount);
                }
            }
            catch (Exception)
            {
            }
        }
        protected void grdAccount_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
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
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = "Register.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else {
                e.Row.Cells[2].Text = "User Name";
                e.Row.Cells[3].Text = "User Level";
                e.Row.Cells[4].Text = "Tên";
                e.Row.Cells[6].Text = "Điện Thoại";
            }
        }
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdAccount.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdAccount.Rows)
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdAccount.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        Class.User newUser = new Class.User(int.Parse(gr.Cells[1].Text));
                        newUser.RemoveUser();
                    }
                }
                if (isCheck == false)
                {
                    lblError.Text = "Xin hãy chọn ít nhất 1 dòng";
                }
                else
                {
                    com.bindData(Message.UserID + "," + Message.UserName + "," + Message.UserLevel + "," + Message.FullName
                        + "," + Message.Email + "," + Message.PhoneNumber, " where " + Message.Status + "='True' and " + Message.UserLevel + "<3", Message.UserAccountTable, grdAccount);
                    lblSuccess.Text = "Thành công";
                }
            }
            catch (Exception)
            {
            }
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = com.bindData(Message.UserID + "," + Message.UserName + "," + Message.UserLevel + "," + Message.FullName
                        + "," + Message.Email + "," + Message.PhoneNumber, " where " + Message.Status + "='True' and " + Message.UserLevel + "<3", Message.UserAccountTable, grdAccount);
                int fromIndex = -4;
                string temp_sql = sql;
                while (temp_sql.Contains("from"))
                {
                    fromIndex = fromIndex + temp_sql.IndexOf("from") + 4;
                    temp_sql = temp_sql.Substring(temp_sql.IndexOf("from") + 4, temp_sql.Length - temp_sql.IndexOf("from") - 4);
                }
                fromIndex++;
                com.ExportToExcel(sql, Server.MapPath(@"Excel/Account_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    + DateTime.Now.Year + ".xls"), @"ANHTUNG", fromIndex);
                lblSuccess.Text = "Thành công";
                Response.Redirect(@"Excel/Account_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    + DateTime.Now.Year + ".xls");
            }
            catch (Exception ex)
            {
            }
        }
    }
}