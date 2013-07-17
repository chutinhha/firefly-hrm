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
            try
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
                Session["MenuID"] = "7";
                Page.Title = "Manage News";
                lblSuccess.Text = "";
                lblError.Text = "";
                this.confirmSave = Message.ConfirmSave;
                this.confirmDelete = Message.ConfirmDelete;
                string ID = Request.QueryString["ID"];
                if (!IsPostBack)
                {
                    if (ID != null)
                    {
                        pnlList.Visible = false;
                        pnlAdd.Visible = true;
                        Class.News News = new Class.News(int.Parse(ID));
                        txtTitle.Text = News.Title;
                        CKEditor1.Text = News.NewsContent;
                        Session["NewsID"] = ID;
                    }
                }
                if (ID == null)
                {
                    if (pnlList.Visible == true)
                    {
                        if (!IsPostBack)
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
                    }
                }
            }
            catch (Exception)
            {
            }
        }
        protected void grdNew_RowDataBound(object sender, GridViewRowEventArgs e)
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
                e.Row.Cells[3].Text = DateTime.Parse(e.Row.Cells[3].Text).ToShortDateString();
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = "ListNew.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else {
                e.Row.Cells[2].Text = "Tên bài";
                e.Row.Cells[3].Text = "Ngày";
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
            try
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
            catch (Exception)
            {
            }
        }

        protected void rdoYear_CheckedChanged(object sender, EventArgs e)
        {
            try
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
            catch (Exception)
            {
            }
        }

        protected void rdoMonth_CheckedChanged(object sender, EventArgs e)
        {
            try
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
            catch (Exception)
            {
            }
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
            Response.Redirect("ListNew.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTitle.Text.Trim() == "" || CKEditor1.Text.Trim() == "")
                {
                    lblError.Text = "Bạn phải nhập vào tên và nội dung của bài!";
                }
                else
                {
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
                    else
                    {
                        Session.Remove("NewsID");
                        News.UpdateNews();
                    }
                    txtTitle.Text = "";
                    CKEditor1.Text = "";
                    pnlAdd.Visible = false;
                    pnlList.Visible = true;
                    lblSuccess.Text = "Thành công";
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
                    Response.Redirect("ListNew.aspx");
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
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
                    lblError.Text = "Xin hãy chọn ít nhất 1 dòng";
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
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
                    lblError.Text = "Xin hãy chọn ít nhất 1 dòng";
                }
                else
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
                    lblSuccess.Text = "Thành công";
                }
            }
            catch (Exception)
            {
            }
        }
    }
}