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
            if (Session["UserLevel"] != null)
            {
                if (int.Parse(Session["UserLevel"].ToString()) >2) { }
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
        protected void grdAccount_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
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
                lblError.Text = "Please select a row!";
            }
            else {
                com.bindData(Message.UserID + "," + Message.UserName + "," + Message.UserLevel + "," + Message.FullName
                    + "," + Message.Email + "," + Message.PhoneNumber, " where " + Message.Status + "='True' and " + Message.UserLevel + "<3", Message.UserAccountTable, grdAccount);
                lblSuccess.Text = "Success";
            }
        }
    }
}