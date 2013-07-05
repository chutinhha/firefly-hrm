using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class ManageFurnitureCategory : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
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
            Session["MenuID"] = "2";
            lblSuccess.Text = "";
            lblError.Text = "";
            this.confirmSave = Message.ConfirmSave;
            this.confirmDelete = Message.ConfirmDelete;
            Page.Title = "Manage Furniture Category";
            string ID = Request.QueryString["ID"];
            if (!IsPostBack)
            {
                if (ID != null)
                {
                    pnlList.Visible = false;
                    pnlAdd.Visible = true;
                    DataTable dt = com.getData(Message.FurnitureTypeTable, Message.Description, " where "
                        + Message.FurnitureType + "=" + ID);
                    txtName.Text = dt.Rows[0][0].ToString();
                    Session["CateID"] = ID;
                }
                else
                {
                    com.bindData("distinct fur." + Message.FurnitureType + ",furType." + Message.Description
                        + ",furType." + Message.Available + ",furType." + Message.Total + ",(select SUM(" + Message.Price
                        + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + ") as 'Total Value'"
                        , "", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                        + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType + " order by fur." + Message.FurnitureType, grdCategory);
                }
            }
        }
        protected void grdCategory_RowDataBound(object sender, GridViewRowEventArgs e)
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
                string Location = "ManageFurnitureCategory.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdCategory.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdCategory.Rows)
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
            Session.Remove("CateID");
            pnlAdd.Visible = true;
            pnlList.Visible = false;
            txtName.Text = "";
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdCategory.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    pnlList.Visible = false;
                    pnlAdd.Visible = true;
                    DataTable dt = com.getData(Message.FurnitureTypeTable, Message.Description, " where "
                        + Message.FurnitureType + "=" + gr.Cells[1].Text);
                    txtName.Text = dt.Rows[0][0].ToString();
                    Session["CateID"] = gr.Cells[1].Text;
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("CateID");
            txtName.Text = "";
            pnlList.Visible = true;
            pnlAdd.Visible = false;
            Response.Redirect("ManageFurnitureCategory.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim() == "")
            {
                lblError.Text = "Please enter category name!";
            }
            else {
                
                if (Session["CateID"] == null)
                {
                    DataTable dt = com.getData(Message.FurnitureTypeTable, "*", " where " + Message.Description
                        + "=" + com.ToValue(txtName.Text));
                    if (dt.Rows.Count == 0)
                    {
                        com.insertIntoTable(Message.FurnitureTypeTable, "", com.ToValue(txtName.Text)
                            + ",0,0", false);
                        pnlAdd.Visible = false;
                        pnlList.Visible = true;
                        com.bindData("distinct fur." + Message.FurnitureType + ",furType." + Message.Description
                    + ",furType." + Message.Available + ",furType." + Message.Total + ",(select SUM(" + Message.Price
                    + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + ") as 'Total Value'"
                    , "", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                    + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType + " order by fur." + Message.FurnitureType, grdCategory);
                        Response.Redirect("ManageFurnitureCategory.aspx");
                    }
                    else {
                        lblError.Text = "There is another category with the same name exist!";
                    }
                }
                else {
                    DataTable dt = com.getData(Message.FurnitureTypeTable, "*", " where " + Message.Description
                        + "=" + com.ToValue(txtName.Text)+" and "+Message.FurnitureType+"<>"+Session["CateID"].ToString());
                    if (dt.Rows.Count == 0)
                    {
                        com.updateTable(Message.FurnitureTypeTable, Message.Description + "="
                            + com.ToValue(txtName.Text) + " where " + Message.FurnitureType + "=" + Session["CateID"].ToString());
                        pnlAdd.Visible = false;
                        pnlList.Visible = true;
                        com.bindData("distinct fur." + Message.FurnitureType + ",furType." + Message.Description
                    + ",furType." + Message.Available + ",furType." + Message.Total + ",(select SUM(" + Message.Price
                    + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + ") as 'Total Value'"
                    , "", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                    + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType + " order by fur." + Message.FurnitureType, grdCategory);
                        Response.Redirect("ManageFurnitureCategory.aspx");
                    }
                    else
                    {
                        lblError.Text = "There is another category with the same name exist!";
                    }
                }
            }
        }
    }
}