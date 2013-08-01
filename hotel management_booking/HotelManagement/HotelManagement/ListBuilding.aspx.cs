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
            try
            {
                Page.Title = "Manage Building";
                if (Session["UserLevel"] != null)
                {
                    if (int.Parse(Session["UserLevel"].ToString()) >= 2) { }
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
                if (Session["UserLevel"].ToString() == "2")
                {
                    Session["MenuID"] = "3";
                    btnAdd.Visible = false;
                    btnDelete.Visible = false;
                }
                else
                {
                    Session["MenuID"] = "4";
                    btnAdd.Visible = true;
                    btnDelete.Visible = true;
                }
                lblSuccess.Text = "";
                lblError.Text = "";
                this.confirmSave = Message.ConfirmSave;
                this.confirmDelete = Message.ConfirmDelete;
                string ID = Request.QueryString["ID"];
                if (!IsPostBack)
                {
                    Session.Remove("Image");
                    Session.Remove("BID");
                    if (ID != null)
                    {
                        pnlList.Visible = false;
                        pnlAdd.Visible = true;
                        DataTable customer = com.getData(Message.CustomerTable, Message.LastName
                                + "," + Message.MiddleName + "," + Message.FirstName + "," + Message.CustomerID, "");
                        ddlCustomer.Items.Clear();
                        ddlCustomer.Items.Add("Không có");
                        for (int i = 0; i < customer.Rows.Count; i++)
                        {
                            ListItem newItem = new ListItem(customer.Rows[i][0].ToString() + " " +
                                customer.Rows[i][1].ToString() + " " +
                            customer.Rows[i][2].ToString(), customer.Rows[i][3].ToString());
                            ddlCustomer.Items.Add(newItem);
                        }
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            btnSave.Text = "Send Email Request";
                            btnSave.Width = 150;
                        }
                        else {
                            btnSave.Text = "Lưu";
                            btnSave.Width = 80;
                        }
                        com.SetItemList(Message.Description + "," + Message.BuildingTypeID, Message.BuildingTypeTable,
                        ddlBuildingType, "", true, "Xin hãy chọn");
                        Class.Building newBuilding = new Class.Building(ID);
                        DataTable cus = com.getData(Message.RoomTable, Message.CurrentCustomer, " where "
                            + Message.BuildingID + "=" + ID);
                        string currentCus = "Error";
                        if(cus.Rows.Count>0){
                            currentCus = cus.Rows[0][0].ToString().Trim();
                        }
                        for (int i = 0; i < cus.Rows.Count; i++) {
                            if (cus.Rows[i][0].ToString().Trim() != currentCus) {
                                currentCus = "Error";
                                break;
                            }
                        }
                        if (currentCus != "Error") {
                            ddlCustomer.SelectedValue = currentCus;
                        }
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
                if (ID == null)
                {
                    lblCustomer.Visible = false;
                    ddlCustomer.Visible = false;
                    if (pnlList.Visible == true)
                    {
                        if (!IsPostBack)
                        {
                            com.SetItemList(Message.Description + "," + Message.BuildingTypeID, Message.BuildingTypeTable,
                                ddlChooseType, "", true, "Tất cả");
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
                            if (Session["UserLevel"].ToString() == "2")
                            {
                                //Get building list
                                DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                    + Message.UserID + "=" + Session["UserID"]);
                                string[] buildingList = building.Rows[0][0].ToString().Split('|');
                                string buildingCondition = "";
                                for (int i = 0; i < buildingList.Length - 1; i++)
                                {
                                    DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                                        + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                                    if (buildingAddress.Rows.Count > 0)
                                    {
                                        buildingCondition = buildingCondition + buildingList[i] + ",";
                                    }
                                }
                                buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                                condition = condition +" and bui." + Message.BuildingID + " in (" + buildingCondition + ") and bui." + Message.Status + "<>3";
                            }
                            com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                                + ",bui." + Message.Price+","+Message.Status+" as 'Còn phòng trống'", condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                                + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
                        }
                    }
                    else if (pnlAdd.Visible == true)
                    {
                        lblCustomer.Visible = false;
                        ddlCustomer.Visible = false;
                    }
                }
            }
            catch (Exception)
            {
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
            try
            {
                if (ddlBuildingType.SelectedIndex == 0 || txtAddress.Text.Trim() == "" || ddlDistrict.SelectedIndex == 0)
                {
                    lblError.Text = "Bạn đã điền thiếu 1 số thông tin bắt buộc";
                }
                else
                {
                    if (Session["UserLevel"].ToString() == "3")
                    {
                        Class.Building newBuilding;
                        if (Session["BID"] == null)
                        {
                            newBuilding = new Class.Building();
                        }
                        else
                        {
                            newBuilding = new Class.Building(Session["BID"].ToString());
                        }
                        newBuilding.Address = txtAddress.Text;
                        newBuilding.Area = txtArea.Text;
                        if (ddlBathRoom.SelectedIndex != 0)
                        {
                            newBuilding.BathRoom = ddlBathRoom.SelectedValue;
                        }
                        if (ddlBedRoom.SelectedIndex != 0)
                        {
                            newBuilding.BedRoom = ddlBedRoom.SelectedValue;
                        }
                        newBuilding.BuildingTypeID = ddlBuildingType.SelectedValue;
                        newBuilding.Description = txtDescription.Text;
                        if (chkGarage.Checked == true)
                        {
                            newBuilding.Garage = "True";
                        }
                        else
                        {
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
                        if (Session["Image"] != null)
                        {
                            newBuilding.Picture = Session["Image"].ToString();
                        }
                        newBuilding.Price = txtPrice.Text;
                        if (Session["BID"] == null)
                        {
                            newBuilding.RentTime = "0";
                            newBuilding.Status = "0";
                        }
                        newBuilding.District = ddlDistrict.SelectedValue;
                        newBuilding.NumberFloor = txtNumberFloor.Text;
                        if (txtLat.Text.Trim() != "")
                        {
                            newBuilding.Coordinate = txtLat.Text;
                        }
                        if (Session["BID"] == null)
                        {
                            newBuilding.AddBuilding();
                        }
                        else
                        {
                            newBuilding.UpdateBuilding();
                        }
                        if (ddlCustomer.SelectedIndex != 0) {
                            DataTable dt = com.getData(Message.RoomTable, Message.RoomID, " where "
                                + Message.BuildingID + "=" + Session["BID"].ToString());
                            for (int i = 0; i < dt.Rows.Count;i++ ) {
                                Class.Room newRoom = new Class.Room(dt.Rows[i][0].ToString());
                                newRoom.CurrentCustomerID = ddlCustomer.SelectedValue;
                                newRoom.UpdateRoom();
                            }
                        }
                    }
                    else {
                        string content = "";
                        content = content + "Tòa nhà: " + txtAddress.Text+"<br>";
                        content = content + "Diện tích: " + txtArea.Text + "<br>";
                        if (ddlBathRoom.SelectedIndex != 0)
                        {
                            content = content + "Phòng tắm: " + ddlBathRoom.SelectedValue + "<br>";
                        }
                        if (ddlBedRoom.SelectedIndex != 0)
                        {
                            content = content + "Phòng ngủ: " + ddlBedRoom.SelectedValue + "<br>";
                        }
                        content = content + "Kiểu phòng: " + ddlBuildingType.SelectedItem.Text + "<br>";
                        content = content + "Mô tả: " + txtDescription.Text + "<br>";
                        if (chkGarage.Checked == true)
                        {
                            content = content + "Garage: Có" + "<br>";
                        }
                        else
                        {
                            content = content + "Garage: Không" + "<br>";
                        }
                        if (chkPool.Checked == true)
                        {
                            content = content + "Bể bơi: Có" + "<br>";
                        }
                        else
                        {
                            content = content + "Bể bơi: Không" + "<br>";
                        }
                        if (chkGarden.Checked == true)
                        {
                            content = content + "Vườn: Có" + "<br>";
                        }
                        else
                        {
                            content = content + "Vườn: Không" + "<br>";
                        }
                        if (Session["Image"] != null)
                        {
                            content = content + "Ảnh: " + Session["Image"].ToString() + "<br>";
                        }
                        content = content + "Giá thuê: " + txtPrice.Text + "<br>";
                        content = content + "Quận: " + ddlDistrict.SelectedValue + "<br>";
                        content = content + "Số tầng: " + txtNumberFloor.Text + "<br>";
                        if (txtLat.Text.Trim() != "")
                        {
                            content = content + "Tọa độ: " + txtLat.Text + "<br>";
                        }
                        if (ddlCustomer.SelectedIndex != 0)
                        {
                            content = content + "Khách hàng: "+ddlCustomer.SelectedItem.Text;
                        }
                        DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                                    + ">=3");
                            for (int i = 0; i < email.Rows.Count; i++)
                            {
                                if (Session["RID"] == null)
                                {
                                    com.SendMail(email.Rows[i][0].ToString(), "Yêu cầu sửa tòa nhà từ " + Session["FullName"], content);
                                }
                                else
                                {
                                    com.SendMail(email.Rows[i][0].ToString(), "Yêu cầu sửa tòa nhà từ " + Session["FullName"], content);
                                }
                            }
                    }
                    lblSuccess.Text = "Thành công";
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
                        Response.Redirect("ListBuilding.aspx");
                    }
                }
            }
            catch (Exception)
            {
            }
        }
        protected void btnReset_Click(object sender, EventArgs e) {
            try
            {
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
                else
                {
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
            catch (Exception)
            {
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e) {
            try
            {
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
                Response.Redirect("ListBuilding.aspx");
            }
            catch (Exception)
            {
            }
            
        }
        protected void btnAdd_Click(object sender, EventArgs e) {
            try
            {
                pnlList.Visible = false;
                pnlAdd.Visible = true;
                com.SetItemList(Message.Description + "," + Message.BuildingTypeID, Message.BuildingTypeTable,
                        ddlBuildingType, "", true, "Xin hãy chọn");
            }
            catch (Exception)
            {
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e) {
            try
            {
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
                        ddlBuildingType, "", true, "Xin hãy chọn");
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
        protected void btnDelete_Click(object sender, EventArgs e) {
            try
            {
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
                        DataTable dt1 = com.getData(Message.RoomTable, "*", " where " + Message.BuildingID + "="
                            + newBuilding.BID);
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = lblError.Text + "Tòa nhà " + newBuilding.Address + " không thể bị xóa vì có 1 số vật tư đang thuộc biên chế tòa nhà này. Nếu thực sự cần xóa bỏ tòa nhà, hãy gỡ bỏ những vật tư đó trước.<br>";
                        }
                        else if (dt1.Rows.Count > 0)
                        {
                            lblError.Text = lblError.Text + "Tòa nhà " + newBuilding.Address + " không thể bị xóa vì có 1 số phòng đang thuộc biên chế tòa nhà này. Nếu thực sự cần xóa bỏ tòa nhà, hãy gỡ bỏ những phòng đó trước.<br>";
                        }
                        else
                        {
                            newBuilding.RemoveBuilding();
                            lblSuccess.Text = lblSuccess.Text + "Xóa tòa nhà " + newBuilding.Address + " thành công.<br>";
                        }
                    }
                }
                if (isCheck == false)
                {
                    lblError.Text = "Xin hãy chọn ít nhất 1 dòng";
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
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress.Rows.Count > 0)
                        {
                            buildingCondition = buildingCondition + buildingList[i] + ",";
                        }
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    condition = condition + " and bui." + Message.BuildingID + " in (" + buildingCondition + ") and bui." + Message.Status + "<>3";
                }
                com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                    + ",bui." + Message.Price + "," + Message.Status + " as 'Còn phòng trống'", condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                    + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
            }
            catch (Exception)
            {
            }
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
            e.Row.Cells[3].Attributes.Add("width", "280px");
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
                if (e.Row.Cells[6].Text == "1")
                {
                    e.Row.Cells[6].Text = "Không";
                }
                else {
                    e.Row.Cells[6].Text = "Có";
                }
                string Location = "ListBuilding.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else {
                e.Row.Cells[2].Text = "Mô tả";
                e.Row.Cells[3].Text = "Tòa nhà";
                e.Row.Cells[4].Text = "Quận";
                e.Row.Cells[5].Text = "Giá thuê";
            }
        }

        protected void ddlChooseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
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
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress.Rows.Count > 0)
                        {
                            buildingCondition = buildingCondition + buildingList[i] + ",";
                        }
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    condition = condition + " and bui." + Message.BuildingID + " in (" + buildingCondition + ") and bui." + Message.Status + "<>3";
                }
                com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                    + ",bui." + Message.Price + "," + Message.Status + " as 'Còn phòng trống'", condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                    + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
            }
            catch (Exception)
            {
            }
        }

        protected void ddlChooseDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
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
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress.Rows.Count > 0)
                        {
                            buildingCondition = buildingCondition + buildingList[i] + ",";
                        }
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    condition = condition + " and bui." + Message.BuildingID + " in (" + buildingCondition + ") and bui." + Message.Status + "<>3";
                }
                com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                    + ",bui." + Message.Price + "," + Message.Status + " as 'Còn phòng trống'", condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                    + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
            }
            catch (Exception)
            {
            }
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
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
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress.Rows.Count > 0)
                        {
                            buildingCondition = buildingCondition + buildingList[i] + ",";
                        }
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    condition = condition + " and bui." + Message.BuildingID + " in (" + buildingCondition + ") and bui." + Message.Status + "<>3";
                }
                DataTable sql = com.bindData(" bui." + Message.BuildingID + ", buiT." + Message.Description + ",bui." + Message.Address + ",bui." + Message.District
                    + ",bui." + Message.Price + "," + Message.Status + " as 'Còn_phòng_trống'", condition + " order by bui." + Message.District, Message.BuildingTable + " bui join " + Message.BuildingTypeTable
                    + " buiT on bui." + Message.BuildingTypeID + " = buiT." + Message.BuildingTypeID, grdBuilding);
                com.ExportToExcel(sql,grdBuilding, "Building_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    + DateTime.Now.Year + ".xls", Response);
                lblSuccess.Text = "Thành công";
            }
            catch (Exception ex)
            {
            }
        }
    }
}