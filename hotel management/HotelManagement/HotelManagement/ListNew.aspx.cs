using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class ListNew : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLevel"] != null)
            {
                if (Session["UserLevel"].ToString() == "1") { }
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
            Session["MenuID"] = "1";
            lblSuccess.Text = "";
            lblError.Text = "";
            this.confirmSave = Message.ConfirmSave;
            this.confirmDelete = Message.ConfirmDelete;
            if (pnlList.Visible == true)
            {
                if (!IsPostBack)
                {
                    string condition = "";
                    if (rdoAll.Checked == true) {
                    }
                    else if (rdoMonth.Checked == true) {
                        condition = " where Date>='"+DateTime.Now.Year+"/"+DateTime.Now.Month+"/01'";
                    }
                    else if (rdoYear.Checked == true) {
                        condition = " where Date>='" + DateTime.Now.Year + "/01/01'";
                    }
                    condition=condition+" order by "+Message.Date+" desc";
                    com.bindData(Message.NewsID + "," + Message.Title + "," + Message.Date, condition, Message.NewsTable, grdNew);
                }
            }
        }
        protected void grdNew_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].Text = DateTime.Parse(e.Row.Cells[3].Text).ToShortDateString();
            }
            
        }
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdNew.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdNew.Rows)
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
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }

        protected void rdoAll_CheckedChanged(object sender, EventArgs e)
        {
            string condition = "";
            if (rdoAll.Checked == true)
            {
            }
            else if (rdoMonth.Checked == true)
            {
                condition = " where Date>='" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/01'";
            }
            else if (rdoYear.Checked == true)
            {
                condition = " where Date>='" + DateTime.Now.Year + "/01/01'";
            }
            condition = condition + " order by " + Message.Date + " desc";
            com.bindData(Message.NewsID + "," + Message.Title + "," + Message.Date, condition, Message.NewsTable, grdNew);
        }

        protected void rdoYear_CheckedChanged(object sender, EventArgs e)
        {
            string condition = "";
            if (rdoAll.Checked == true)
            {
            }
            else if (rdoMonth.Checked == true)
            {
                condition = " where Date>='" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/01'";
            }
            else if (rdoYear.Checked == true)
            {
                condition = " where Date>='" + DateTime.Now.Year + "/01/01'";
            }
            condition = condition + " order by " + Message.Date + " desc";
            com.bindData(Message.NewsID + "," + Message.Title + "," + Message.Date, condition, Message.NewsTable, grdNew);
        }

        protected void rdoMonth_CheckedChanged(object sender, EventArgs e)
        {
            string condition = "";
            if (rdoAll.Checked == true)
            {
            }
            else if (rdoMonth.Checked == true)
            {
                condition = " where Date>='" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/01'";
            }
            else if (rdoYear.Checked == true)
            {
                condition = " where Date>='" + DateTime.Now.Year + "/01/01'";
            }
            condition = condition + " order by " + Message.Date + " desc";
            com.bindData(Message.NewsID + "," + Message.Title + "," + Message.Date, condition, Message.NewsTable, grdNew);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            pnlList.Visible = false;
            pnlAdd.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            CKEditor1.Text = "";
            txtTitle.Text = "";
            pnlAdd.Visible = false;
            pnlList.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtTitle.Text.Trim() == "" || CKEditor1.Text.Trim() == "")
            {
                lblError.Text = "You must enter title and content of news!";
            }
            else {
                Class.News News;
                if (Session["NewsID"] != null)
                {
                    News = new Class.News(int.Parse(Session["NewsID"].ToString()));
                }
                else
                {
                    News = new Class.News();
                }
                News.Date = DateTime.Today;
                News.NewsContent = CKEditor1.Text;
                News.Poster = Session["UserID"].ToString();
                News.Title = txtTitle.Text;
                if (Session["NewsID"] == null)
                {
                    News.AddNews();
                }
                else {
                    Session.Remove("NewsID");
                    News.UpdateNews();
                }
                txtTitle.Text = "";
                CKEditor1.Text = "";
                pnlAdd.Visible = false;
                pnlList.Visible = true;
                lblSuccess.Text = "Success";
                string condition = "";
                if (rdoAll.Checked == true)
                {
                }
                else if (rdoMonth.Checked == true)
                {
                    condition = " where Date>='" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/01'";
                }
                else if (rdoYear.Checked == true)
                {
                    condition = " where Date>='" + DateTime.Now.Year + "/01/01'";
                }
                condition = condition + " order by " + Message.Date + " desc";
                com.bindData(Message.NewsID + "," + Message.Title + "," + Message.Date, condition, Message.NewsTable, grdNew);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdNew.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    pnlList.Visible = false;
                    pnlAdd.Visible = true;
                    Class.News News = new Class.News(int.Parse(gr.Cells[1].Text));
                    txtTitle.Text = News.Title;
                    CKEditor1.Text = News.NewsContent;
                    Session["NewsID"] = gr.Cells[1].Text;
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdNew.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    Class.News News = new Class.News(int.Parse(gr.Cells[1].Text));
                    News.RemoveNews();
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
            else {
                string condition = "";
                if (rdoAll.Checked == true)
                {
                }
                else if (rdoMonth.Checked == true)
                {
                    condition = " where Date>='" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/01'";
                }
                else if (rdoYear.Checked == true)
                {
                    condition = " where Date>='" + DateTime.Now.Year + "/01/01'";
                }
                condition = condition + " order by " + Message.Date + " desc";
                com.bindData(Message.NewsID + "," + Message.Title + "," + Message.Date, condition, Message.NewsTable, grdNew);
                lblSuccess.Text = "Success";
            }
        }
    }
}