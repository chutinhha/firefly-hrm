using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using CuteWebUI;

namespace HotelManagement
{
    public partial class ListBuilding : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLevel"] != null)
            {
                if (int.Parse(Session["UserLevel"].ToString()) >=3) { }
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
            Session["MenuID"] = "4";
            lblSuccess.Text = "";
            lblError.Text = "";
            this.confirmSave = Message.ConfirmSave;
            this.confirmDelete = Message.ConfirmDelete;
            if (!IsPostBack) {
                Session.Remove("Image");
                Session.Remove("BID");
            }
            if (pnlList.Visible == true)
            {
                if (!IsPostBack)
                {
                    com.SetItemList(Message.Description + "," + Message.BuildingTypeID, Message.BuildingTypeTable,
                        ddlChooseType, "", true, "All");
                    string condition = " where bui."+Message.Status+"<>'3' ";
                    if (ddlChooseType.SelectedIndex == 0) { }
                    else
                    {
                        condition = condition + " and bui." + Message.BuildingTypeID + "=" + ddlChooseType.SelectedValue;
                    }
                    if (ddlChooseDistrict.SelectedIndex == 0) { }
                    else
                    {
                        condition = " and bui." + Message.District + "=N'" + ddlChooseDistrict.SelectedValue + "'";
                    }
                    com.bindData(" bui."+Message.BuildingID+", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                        + ",bui." + Message.Price, condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                        + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
                }
            }
            else if (pnlAdd.Visible == true) {

            }
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }
        protected void ddlBuildingType_SelectedIndexChanged(object sender, EventArgs e) {
            if (ddlBuildingType.SelectedItem.Text == "Warehouse")
            {
                Panel1.Visible = false;
            }
            else {
                Panel1.Visible = true;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e) {
            if (ddlBuildingType.SelectedIndex == 0 || txtAddress.Text.Trim() == "" || ddlDistrict.SelectedIndex == 0)
            {
                lblError.Text = "Some required field are missing";
            }
            else {
                Class.Building newBuilding;
                if (Session["BID"] == null)
                {
                    newBuilding = new Class.Building();
                }
                else {
                    newBuilding = new Class.Building(Session["BID"].ToString());
                }
                newBuilding.Address = txtAddress.Text;
                newBuilding.Area = txtArea.Text;
                if (ddlBathRoom.SelectedIndex != 0) {
                    newBuilding.BathRoom = ddlBathRoom.SelectedValue;
                }
                if (ddlBedRoom.SelectedIndex != 0) {
                    newBuilding.BedRoom = ddlBedRoom.SelectedValue;
                }
                newBuilding.BuildingTypeID = ddlBuildingType.SelectedValue;
                newBuilding.Description = txtDescription.Text;
                if (chkGarage.Checked == true)
                {
                    newBuilding.Garage = "True";
                }
                else {
                    newBuilding.Garage = "False";
                }
                if (chkPool.Checked == true)
                {
                    newBuilding.Pool = "True";
                }
                else
                {
                    newBuilding.Pool = "False";
                }
                if (chkGarden.Checked == true)
                {
                    newBuilding.Garden = "True";
                }
                else
                {
                    newBuilding.Garden = "False";
                }
                if(Session["Image"]!=null){
                    newBuilding.Picture = Session["Image"].ToString();
                }
                newBuilding.Price = txtPrice.Text;
                newBuilding.RentTime = "0";
                newBuilding.Status = "0";
                newBuilding.District = ddlDistrict.SelectedValue;
                newBuilding.NumberFloor = txtNumberFloor.Text;
                if (txtLat.Text.Trim() != "") {
                    newBuilding.Coordinate = txtLat.Text;
                }
                if (Session["BID"] == null)
                {
                    newBuilding.AddBuilding();
                }
                else {
                    newBuilding.UpdateBuilding();
                }
                lblSuccess.Text = "Success!";
                ddlBuildingType.SelectedIndex = 0;
                ddlBathRoom.SelectedIndex = 0;
                ddlBedRoom.SelectedIndex = 0;
                ddlDistrict.SelectedIndex = 0;
                txtAddress.Text = "";
                txtPrice.Text = "";
                chkGarage.Checked = false;
                chkGarden.Checked = false;
                chkPool.Checked = false;
                txtArea.Text = "";
                Session.Remove("Image");
                txtDescription.Text = "";
                if (Session["BID"] == null)
                {
                }
                else
                {
                    pnlAdd.Visible = false;
                    pnlList.Visible = true;
                    Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e) {
            if (Session["BID"] == null)
            {
                ddlBuildingType.SelectedIndex = 0;
                ddlBathRoom.SelectedIndex = 0;
                ddlBedRoom.SelectedIndex = 0;
                ddlDistrict.SelectedIndex = 0;
                txtAddress.Text = "";
                txtPrice.Text = "";
                txtNumberFloor.Text = "";
                chkGarage.Checked = false;
                chkGarden.Checked = false;
                chkPool.Checked = false;
                txtArea.Text = "";
                Session.Remove("Image");
                txtDescription.Text = "";
            }
            else {
                Class.Building newBuilding = new Class.Building(Session["BID"].ToString());
                ddlBathRoom.SelectedValue = newBuilding.BathRoom;
                ddlBedRoom.SelectedValue = newBuilding.BedRoom;
                ddlBuildingType.SelectedValue = newBuilding.BuildingTypeID;
                ddlDistrict.SelectedValue = newBuilding.District;
                txtAddress.Text = newBuilding.Address;
                txtArea.Text = newBuilding.Area;
                txtDescription.Text = newBuilding.Description;
                txtPrice.Text = newBuilding.Price;
                txtNumberFloor.Text = newBuilding.NumberFloor;
                if (newBuilding.Garage == "True")
                {
                    chkGarage.Checked = true;
                }
                else
                {
                    chkGarage.Checked = false;
                }
                if (newBuilding.Pool == "True")
                {
                    chkPool.Checked = true;
                }
                else
                {
                    chkPool.Checked = false;
                }
                if (newBuilding.Garden == "True")
                {
                    chkGarden.Checked = true;
                }
                else
                {
                    chkGarden.Checked = false;
                }
                txtArea.Text = newBuilding.Area;
                txtDescription.Text = newBuilding.Description;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e) {
            ddlBuildingType.SelectedIndex = 0;
            ddlBathRoom.SelectedIndex = 0;
            ddlBedRoom.SelectedIndex = 0;
            ddlDistrict.SelectedIndex = 0;
            txtAddress.Text = "";
            txtPrice.Text = "";
            chkGarage.Checked = false;
            chkGarden.Checked = false;
            chkPool.Checked = false;
            txtArea.Text = "";
            Session.Remove("Image");
            Session.Remove("BID");
            txtDescription.Text = "";
            pnlAdd.Visible = false;
            pnlList.Visible = true;
            
        }
        protected void btnAdd_Click(object sender, EventArgs e) {
            pnlList.Visible = false;
            pnlAdd.Visible = true;
            com.SetItemList(Message.Description + "," + Message.BuildingTypeID, Message.BuildingTypeTable,
                    ddlBuildingType, "", true, "Please select");
        }
        protected void btnEdit_Click(object sender, EventArgs e) {
            bool isCheck = false;
            foreach (GridViewRow gr in grdBuilding.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    pnlList.Visible = false;
                    pnlAdd.Visible = true;
                    com.SetItemList(Message.Description + "," + Message.BuildingTypeID, Message.BuildingTypeTable,
                    ddlBuildingType, "", true, "Please select");
                    Class.Building newBuilding = new Class.Building(gr.Cells[1].Text);
                    Session["BID"] = newBuilding.BID;
                    ddlBathRoom.SelectedValue = newBuilding.BathRoom;
                    ddlBedRoom.SelectedValue = newBuilding.BedRoom;
                    ddlBuildingType.SelectedValue = newBuilding.BuildingTypeID;
                    ddlDistrict.SelectedValue = newBuilding.District;
                    txtAddress.Text = newBuilding.Address;
                    txtArea.Text = newBuilding.Area;
                    txtDescription.Text = newBuilding.Description;
                    txtPrice.Text = newBuilding.Price;
                    txtNumberFloor.Text = newBuilding.NumberFloor;
                    if (newBuilding.Garage == "True")
                    {
                        chkGarage.Checked = true;
                    }
                    else {
                        chkGarage.Checked = false;
                    }
                    if (newBuilding.Pool == "True")
                    {
                        chkPool.Checked = true;
                    }
                    else
                    {
                        chkPool.Checked = false;
                    }
                    if (newBuilding.Garden == "True")
                    {
                        chkGarden.Checked = true;
                    }
                    else
                    {
                        chkGarden.Checked = false;
                    }
                    txtArea.Text = newBuilding.Area;
                    txtDescription.Text = newBuilding.Description;
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e) {
            bool isCheck = false;
            foreach (GridViewRow gr in grdBuilding.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    Class.Building newBuilding = new Class.Building(gr.Cells[1].Text);
                    DataTable dt = com.getData(Message.FurnitureTable, "*", " where " + Message.CurrentBuilding
                        + "=" + newBuilding.BID + " and (" + Message.ApproveDelete + "<>1 or ApproveDelete is NULL)");
                    if (dt.Rows.Count > 0) {
                        lblError.Text = lblError.Text + "Building " + newBuilding.Address + " can not be remove because it contain some furniture. Please remove these furniture first<br>";
                    }else{
                        newBuilding.RemoveBuilding();
                        lblSuccess.Text=lblSuccess.Text+ "Remove building "+newBuilding.Address+" success<br>";
                    }
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
            string condition = " where bui." + Message.Status + "<>'3' ";
            if (ddlChooseType.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and bui." + Message.BuildingTypeID + "=" + ddlChooseType.SelectedValue;
            }
            if (ddlChooseDistrict.SelectedIndex == 0) { }
            else
            {
                condition = " and bui." + Message.District + "=N'" + ddlChooseDistrict.SelectedValue + "'";
            }
            com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                + ",bui." + Message.Price, condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
        }
        protected void btnConfirmDelete_Click(object sender, EventArgs e) {
            
        }
        protected void btnConfirmCancel_Click(object sender, EventArgs e) {
            pnlList.Visible = true;
        }
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdBuilding.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdBuilding.Rows)
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
        protected void grdBuilding_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }

        protected void ddlChooseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string condition = " where bui." + Message.Status + "<>'3' ";
            if (ddlChooseType.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and bui." + Message.BuildingTypeID + "=" + ddlChooseType.SelectedValue;
            }
            if (ddlChooseDistrict.SelectedIndex == 0) { }
            else
            {
                condition = " and bui." + Message.District + "=N'" + ddlChooseDistrict.SelectedValue + "'";
            }
            com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                + ",bui." + Message.Price, condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
        }

        protected void ddlChooseDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            string condition = " where bui." + Message.Status + "<>'3' ";
            if (ddlChooseType.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and bui." + Message.BuildingTypeID + "=" + ddlChooseType.SelectedValue;
            }
            if (ddlChooseDistrict.SelectedIndex == 0) { }
            else
            {
                condition = " and bui." + Message.District + "=N'" + ddlChooseDistrict.SelectedValue + "'";
            }
            com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                + ",bui." + Message.Price, condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
        }
    }
}