using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace HotelManagement
{
    public partial class ListFurniture : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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
                    btnAdd.Visible = false;
                    btnRequest.Visible = true;
                    if (!IsPostBack)
                    {
                        grdCategory.Visible = true;
                        lblCategory.Visible = true;
                        btnExport1.Visible = true;
                    }
                    Panel1.Visible = true;
                    btnDelete.Text = "Yêu cầu xóa";
                    btnMove.Text = "Yêu cầu di chuyển";
                    btnDelete.Width = 120;
                    btnMove.Width = 120;
                }
                else
                {
                    btnAdd.Visible = true;
                    btnRequest.Visible = false;
                    grdCategory.Visible = false;
                    lblCategory.Visible = false;
                    btnExport1.Visible = false;
                    Panel1.Visible = false;
                    btnDelete.Text = "Xóa";
                    btnMove.Text = "Di chuyển";
                    btnDelete.Width = 80;
                    btnMove.Width = 80;
                }
                Session["MenuID"] = "2";
                Page.Title = "Manage Furniture";
                lblSuccess.Text = "";
                lblError.Text = "";
                this.confirmSave = Message.ConfirmSave;
                string ID = Request.QueryString["ID"];
                if (ID != null&&!IsPostBack)
                {
                    pnlList.Visible = false;
                    pnlEdit.Visible = true;
                    this.startDate = "";
                    this.endDate = "";
                    ddlEditCountry.DataSource = com.getCountryList();
                    ddlEditCountry.DataBind();
                    ListItem item = new ListItem("Xin hãy chọn");
                    ddlEditCountry.Items.Insert(0, item);
                    Class.Furniture newFuniture = new Class.Furniture(ID);
                    txtEditDes.Text = newFuniture.Description;
                    txtEditName.Text = newFuniture.Name;
                    txtEditPrice.Text = newFuniture.Price;
                    if (newFuniture.Status == "0" || newFuniture.Status == "True" || newFuniture.Status == "")
                    {
                        ddlStatus.SelectedValue = "Bình thường";
                    }
                    else
                    {
                        ddlStatus.SelectedValue = "Hỏng";
                    }
                    ddlEditCountry.SelectedValue = newFuniture.MadeIn;
                    this.startDate = newFuniture.StartWarranty;
                    this.endDate = newFuniture.EndWarranty;
                    imgPicture.ImageUrl = "Images/" + newFuniture.Picture;
                    Session["FurID"] = newFuniture.FurID;
                }
                else
                {
                    if (!IsPostBack)
                    {
                        DataTable customer = com.getData(Message.CustomerTable, Message.LastName
                                + "," + Message.MiddleName + "," + Message.FirstName + "," + Message.CustomerID, "");
                        ddlCustomer.Items.Clear();
                        ddlCustomer.Items.Add("Tất cả");
                        for (int i = 0; i < customer.Rows.Count; i++)
                        {
                            ListItem newItem = new ListItem(customer.Rows[i][0].ToString() + " " +
                                customer.Rows[i][1].ToString() + " " +
                            customer.Rows[i][2].ToString(), customer.Rows[i][3].ToString());
                            ddlCustomer.Items.Add(newItem);
                        }
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            //Get building list
                            DataTable building1 = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                + Message.UserID + "=" + Session["UserID"]);
                            string[] buildingList1 = building1.Rows[0][0].ToString().Split('|');
                            string buildingCondition1 = "";
                            for (int i = 0; i < buildingList1.Length - 1; i++)
                            {
                                DataTable buildingAddress1 = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                                    + Message.BuildingID + "=" + buildingList1[i] + " and " + Message.Status + "<>3");
                                if (buildingAddress1.Rows.Count > 0)
                                {
                                    buildingCondition1 = buildingCondition1 + buildingList1[i] + ",";
                                }
                            }
                            buildingCondition1 = buildingCondition1.Remove(buildingCondition1.Length - 1, 1);
                            com.bindData("distinct furType." + Message.Description
                                + ",(select count(*) from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType
                                + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ") and (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete
                                + " is NULL)) as 'Available',(select count(*) from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType
                                + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total',(select SUM(" + Message.Price
                                + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total Value'"
                                , " where fur." + Message.CurrentBuilding + " in (" + buildingCondition1 + ")", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                                + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType, grdCategory);
                            lblCategory.Text = "Hiện thống kê vật tư";
                            grdCategory.Visible = false;
                            btnExport1.Visible = false;
                        }
                    }
                    if (!IsPostBack)
                    {
                        if (pnlAdd.Visible == true)
                        {

                            this.startDate = "";
                            this.endDate = "";
                            ddlCountry.DataSource = com.getCountryList();
                            ddlCountry.DataBind();
                            ListItem item = new ListItem("Xin hãy chọn");
                            ddlCountry.Items.Insert(0, item);
                            if (Session["UserLevel"].ToString() == "2")
                            {
                                //Get building list
                                DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                    + Message.UserID + "=" + Session["UserID"]);
                                string[] buildingList = building.Rows[0][0].ToString().Split('|');
                                ddlBuilding.Items.Clear();
                                ddlBuilding.Items.Add("Xin hãy chọn");
                                for (int i = 0; i < buildingList.Length - 1; i++)
                                {
                                    DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                                        + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                                    if (buildingAddress.Rows.Count > 0)
                                    {
                                        ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                                        ddlBuilding.Items.Add(buildingItem);
                                    }
                                }
                            }
                            else
                            {
                                com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlBuilding, "", true, "Xin hãy chọn");
                            }
                            com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlType, "", true, "Xin hãy chọn");
                            ddlRoom.Items.Clear();
                            ddlRoom.Items.Add("Xin hãy chọn");
                        }
                        else if (pnlList.Visible == true)
                        {

                            string buildingCondition = "";
                            if (Session["UserLevel"].ToString() == "2")
                            {
                                //Get building list
                                DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                    + Message.UserID + "=" + Session["UserID"]);
                                string[] buildingList = building.Rows[0][0].ToString().Split('|');
                                ddlChooseBuilding.Items.Clear();
                                ddlChooseBuilding.Items.Add("Tất cả");
                                for (int i = 0; i < buildingList.Length - 1; i++)
                                {
                                    DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                                        + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                                    if (buildingAddress.Rows.Count > 0)
                                    {
                                        ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                                        ddlChooseBuilding.Items.Add(buildingItem);
                                        buildingCondition = buildingCondition + buildingList[i] + ",";
                                    }
                                }
                                buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                            }
                            else
                            {
                                com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlChooseBuilding, "", true, "Tất cả");
                            }
                            com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlChooseType, "", true, "Tất cả");
                            ddlChooseRoom.Items.Clear();
                            ddlChooseRoom.Items.Add("Tất cả");
                            if (Session["UserLevel"].ToString() == "2")
                            {
                                string[] column = new string[1];
                                column[0] = "Lịch sử";
                                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture,
                                    " where fur.CurrentBuildingID in (" + buildingCondition + ") and (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)", Message.FurnitureTable
                                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
                            }
                            else
                            {
                                string[] column = new string[1];
                                column[0] = "Lịch sử";
                                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture,
                                    " where (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)", Message.FurnitureTable
                                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
                            }
                        }
                        else
                        {
                            this.startDate = "";
                            this.endDate = "";
                            ddlCountry.DataSource = com.getCountryList();
                            ddlCountry.DataBind();
                            ListItem item = new ListItem("Xin hãy chọn");
                            ddlCountry.Items.Insert(0, item);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected string confirmSave { get; set; }
        protected void grdFurniture_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[8].Attributes.Add("style","width:50px;");
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
                e.Row.Cells[7].Text = "<a href=\"Images/"+e.Row.Cells[7].Text+"\"><img width=\"50\" src=\"Images/" + e.Row.Cells[7].Text + "\"></a>";
                if (e.Row.Cells[6].Text != "&nbsp;") {
                    e.Row.Cells[6].Text = DateTime.Parse(e.Row.Cells[6].Text).ToShortDateString();
                }
                e.Row.Cells[8].Attributes.Add("style", "width:50px;");
                e.Row.Cells[8].Text = "<a style=\"color:blue;\" href=\"History.aspx?ID=" + e.Row.Cells[1].Text + "\">Click để xem chi tiết!</a>";
            }
            else {
                e.Row.Cells[4].Attributes.Add("width","150px");
                e.Row.Cells[2].Text = "Tên";
                e.Row.Cells[3].Text = "Kiểu";
                e.Row.Cells[4].Text = "Tòa nhà";
                e.Row.Cells[5].Text = "Phòng";
                e.Row.Cells[6].Text = "Hết hạn BH";
                e.Row.Cells[7].Text = "Ảnh";
                e.Row.Cells[8].Text = "Lịch Sử";
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Class.Furniture newFurniture = new Class.Furniture(e.Row.Cells[1].Text);
                if (newFurniture.TargetRoomID != "")
                {
                    e.Row.Cells[4].Text = "Đang chuyển tới " + e.Row.Cells[4].Text;
                }
                string Location = "ListFurniture.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void grdCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
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
            }
            else
            {
                e.Row.Cells[0].Text = "Mô tả";
                e.Row.Cells[1].Text = "Sẵn sàng";
                e.Row.Cells[2].Text = "Tổng số lượng";
                e.Row.Cells[3].Text = "Tổng giá trị";
            }
        }
        protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlBuilding.SelectedIndex != 0)
                {
                    com.SetItemList(Message.RoomNo + "," + Message.RoomNo, Message.RoomTable, ddlRoom, " where " + Message.BuildingID
                        + "=" + ddlBuilding.SelectedValue, true, "Xin hãy chọn");
                }
                else
                {
                    ddlRoom.Items.Clear();
                    ddlRoom.Items.Add("Xin hãy chọn");
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                txtName.Text = "";
                txtPrice.Text = "";
                this.startDate = "";
                this.endDate = "";
                ddlBuilding.SelectedIndex = 0;
                ddlCountry.SelectedIndex = 0;
                ddlRoom.SelectedIndex = 0;
                ddlType.SelectedIndex = 0;
                txtDes.Text = "";
            }
            catch (Exception)
            {
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblSuccess.Text = "";
                this.startDate = Request.Form["txtStart"].ToString().Trim();
                this.endDate = Request.Form["txtEnd"].ToString().Trim();
                if (txtName.Text.Trim() == "" || ddlBuilding.SelectedIndex == 0 || ddlRoom.SelectedIndex == 0
                    || txtPrice.Text.Trim() == "")
                {
                    lblError.Text = "Bạn đang điền thiếu 1 số thông tin bắt buộc!";
                }
                else
                {
                    bool checkCondition = true;
                    string fileName = null;
                    if (fulPicture.HasFile)
                    {
                        fileName = fulPicture.FileName;
                        if (!Path.GetExtension(fileName).Contains(".jpg") &&
                            !Path.GetExtension(fileName).Contains(".jpeg") &&
                            !Path.GetExtension(fileName).Contains(".bmp") &&
                            !Path.GetExtension(fileName).Contains(".png") &&
                            !Path.GetExtension(fileName).Contains(".gif") &&
                            !Path.GetExtension(fileName).Contains(".tif") &&
                            !Path.GetExtension(fileName).Contains(".dib"))
                        {
                            lblError.Text = "Hệ thống chỉ chấp nhận các loại file ảnh jpg,jpeg,png,bmp,gif,tif và dib!";
                            checkCondition = false;
                        }
                    }
                    if (checkCondition == true)
                    {
                        string name = txtName.Text.Trim();
                        string building = ddlBuilding.SelectedValue;
                        DataTable roomID = com.getData(Message.RoomTable, Message.RoomID, " where " + Message.BuildingID
                            + "=" + building + " and " + Message.RoomNo + "=" + ddlRoom.SelectedValue);
                        string room = roomID.Rows[0][0].ToString();
                        string type = ddlType.SelectedValue;
                        string price = txtPrice.Text.Trim();
                        string made = ddlCountry.SelectedValue;
                        string startWarranty = Request.Form["txtStart"].ToString().Trim();
                        string endWarranty = Request.Form["txtEnd"].ToString().Trim();
                        string description = txtDes.Text.Trim();
                        if (fileName != null)
                        {
                            string pathRoot = HttpContext.Current.Server.MapPath("~/Images/");
                            if (!File.Exists(pathRoot + fileName))
                            {
                                fulPicture.SaveAs(pathRoot + fileName);
                            }
                            else
                            {
                                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                                var stringChars = new char[8];
                                var random = new Random();

                                for (int i = 0; i < stringChars.Length; i++)
                                {
                                    stringChars[i] = chars[random.Next(chars.Length)];
                                }

                                var finalString = new String(stringChars);
                                fulEditPicture.SaveAs(pathRoot + fileName.Replace(".", finalString + "."));
                                FileInfo old = new FileInfo(pathRoot + fileName.Replace(".", finalString + "."));
                                FileInfo newFile = new FileInfo(pathRoot + fileName);
                                if (old.Length == newFile.Length)
                                {
                                    File.Delete(pathRoot + fileName.Replace(".", finalString + "."));
                                }
                                else
                                {
                                    fileName = fileName.Replace(".", finalString + ".");
                                }
                            }
                        }
                        Class.Furniture newFurniture = new Class.Furniture();
                        newFurniture.CurrentBuilding = building;
                        newFurniture.CurrentRoom = room;
                        newFurniture.Description = description;
                        if (endWarranty != null && endWarranty != "")
                        {
                            newFurniture.EndWarranty = endWarranty;
                        }
                        newFurniture.FurType = newFurniture.GetFurTypeID(ddlType.SelectedValue);
                        newFurniture.MadeIn = made;
                        newFurniture.Name = name;
                        newFurniture.Picture = fileName;
                        if (price != null && price != "")
                        {
                            newFurniture.Price = price;
                        }
                        if (startWarranty != null && startWarranty != "")
                        {
                            newFurniture.StartWarranty = startWarranty;
                        }
                        newFurniture.Status = "true";
                        newFurniture.AddFurniture();
                        lblSuccess.Text = "Thành công";
                        txtName.Text = "";
                        txtPrice.Text = "";
                        this.startDate = "";
                        this.endDate = "";
                        ddlBuilding.SelectedIndex = 0;
                        ddlCountry.SelectedIndex = 0;
                        ddlRoom.SelectedIndex = 0;
                        ddlType.SelectedIndex = 0;
                        txtDes.Text = "";
                        Response.Redirect("ListFurniture.aspx");
                    }
                }
            }
            catch (Exception)
            {
            }
        }
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdFurniture.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdFurniture.Rows)
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

        protected void ddlChooseBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlChooseBuilding.SelectedIndex != 0)
                {
                    com.SetItemList(Message.RoomNo + "," + Message.RoomNo, Message.RoomTable, ddlChooseRoom, " where " + Message.BuildingID
                        + "=" + ddlChooseBuilding.SelectedValue, true, "Tất cả");
                }
                else
                {
                    ddlChooseRoom.Items.Clear();
                    ddlChooseRoom.Items.Add("Tất cả");
                }
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    +" left join "+Message.CustomerTable+" cus on cus."+Message.CustomerID+"=fur."+Message.CurrentCustomer, grdFurniture, 1, column);
            }
            catch (Exception)
            {
            }
        }

        protected void ddlChooseRoom_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
            }
            catch (Exception)
            {
            }
        }

        protected void ddlChooseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);

            }
            catch (Exception)
            {
            }
        }

        protected void ddlInWarraty_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
            }
            catch (Exception)
            {
            }
        }

        protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
            }
            catch (Exception)
            {
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
            }
            catch (Exception)
            {
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                pnlAdd.Visible = true;
                pnlList.Visible = false;
                this.startDate = "";
                this.endDate = "";
                ddlCountry.DataSource = com.getCountryList();
                ddlCountry.DataBind();
                ListItem item = new ListItem("Xin hãy chọn");
                ddlCountry.Items.Insert(0, item);
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    ddlBuilding.Items.Clear();
                    ddlBuilding.Items.Add("Xin hãy chọn");
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress.Rows.Count > 0)
                        {
                            ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                            ddlBuilding.Items.Add(buildingItem);
                        }
                    }
                }
                else
                {
                    com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlBuilding, "", true, "Xin hãy chọn");
                }
                com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlType, "", true, "Xin hãy chọn");
                ddlRoom.Items.Clear();
                ddlRoom.Items.Add("Xin hãy chọn");
            }
            catch (Exception)
            {
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlAdd.Visible = false;
            pnlList.Visible = true;
            Response.Redirect("ListFurniture.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdFurniture.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        pnlList.Visible = false;
                        pnlEdit.Visible = true;
                        this.startDate = "";
                        this.endDate = "";
                        ddlEditCountry.DataSource = com.getCountryList();
                        ddlEditCountry.DataBind();
                        ListItem item = new ListItem("Xin hãy chọn");
                        ddlEditCountry.Items.Insert(0, item);
                        Class.Furniture newFuniture = new Class.Furniture(gr.Cells[1].Text);
                        txtEditDes.Text = newFuniture.Description;
                        txtEditName.Text = newFuniture.Name;
                        txtEditPrice.Text = newFuniture.Price;
                        if (newFuniture.Status == "0" || newFuniture.Status == "True" || newFuniture.Status == "")
                        {
                            ddlStatus.SelectedValue = "Bình thường";
                        }
                        else
                        {
                            ddlStatus.SelectedValue = "Hỏng";
                        }
                        ddlEditCountry.SelectedValue = newFuniture.MadeIn;
                        this.startDate = newFuniture.StartWarranty;
                        this.endDate = newFuniture.EndWarranty;
                        imgPicture.ImageUrl = "Images/" + newFuniture.Picture;
                        Session["FurID"] = newFuniture.FurID;
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

        protected void btnEditReset_Click(object sender, EventArgs e)
        {
            try
            {
                Class.Furniture newFuniture = new Class.Furniture(Session["FurID"].ToString());
                txtEditDes.Text = newFuniture.Description;
                txtEditName.Text = newFuniture.Name;
                txtEditPrice.Text = newFuniture.Price;
                if (newFuniture.Status == "0" || newFuniture.Status == "True" || newFuniture.Status == "")
                {
                    ddlStatus.SelectedValue = "Bình thường";
                }
                else
                {
                    ddlStatus.SelectedValue = "Hỏng";
                }
                ddlEditCountry.SelectedValue = newFuniture.MadeIn;
                this.startDate = newFuniture.StartWarranty;
                this.endDate = newFuniture.EndWarranty;
                imgPicture.ImageUrl = "Images/" + newFuniture.Picture;
            }
            catch (Exception)
            {
            }
        }

        protected void btnEditSave_Click(object sender, EventArgs e)
        {
            try
            {
                Class.Furniture newFurniture = new Class.Furniture(Session["FurID"].ToString());
                lblError.Text = "";
                lblSuccess.Text = "";
                this.startDate = Request.Form["txtEditStart"].ToString().Trim();
                this.endDate = Request.Form["txtEditEnd"].ToString().Trim();
                if (txtEditName.Text.Trim() == ""||txtEditPrice.Text.Trim()=="")
                {
                    lblError.Text = "Bạn đang điền thiếu 1 số thông tin bắt buộc!";
                }
                else
                {
                    bool checkCondition = true;
                    string fileName = newFurniture.Picture;
                    if (fulEditPicture.HasFile)
                    {
                        fileName = fulEditPicture.FileName;
                        if (!Path.GetExtension(fileName).Contains(".jpg") &&
                            !Path.GetExtension(fileName).Contains(".jpeg") &&
                            !Path.GetExtension(fileName).Contains(".bmp") &&
                            !Path.GetExtension(fileName).Contains(".png") &&
                            !Path.GetExtension(fileName).Contains(".gif") &&
                            !Path.GetExtension(fileName).Contains(".tif") &&
                            !Path.GetExtension(fileName).Contains(".dib"))
                        {
                            lblError.Text = "Hệ thống chỉ chấp nhận các loại file ảnh jpg,jpeg,png,bmp,gif,tif và dib!";
                            checkCondition = false;
                        }
                    }
                    if (checkCondition == true)
                    {
                        string name = txtEditName.Text.Trim();
                        string price = txtEditPrice.Text.Trim();
                        string made = ddlEditCountry.SelectedValue;
                        string startWarranty = Request.Form["txtEditStart"].ToString().Trim();
                        string endWarranty = Request.Form["txtEditEnd"].ToString().Trim();
                        string description = txtEditDes.Text.Trim();
                        if (fileName != null)
                        {
                            if (fulEditPicture.HasFile)
                            {
                                string pathRoot = HttpContext.Current.Server.MapPath("~/Images/");
                                if (!File.Exists(pathRoot + fileName))
                                {
                                    fulEditPicture.SaveAs(pathRoot + fileName);
                                }
                                else
                                {
                                    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                                    var stringChars = new char[8];
                                    var random = new Random();

                                    for (int i = 0; i < stringChars.Length; i++)
                                    {
                                        stringChars[i] = chars[random.Next(chars.Length)];
                                    }

                                    var finalString = new String(stringChars);
                                    fulEditPicture.SaveAs(pathRoot + fileName.Replace(".", finalString + "."));
                                    FileInfo old = new FileInfo(pathRoot + fileName.Replace(".", finalString + "."));
                                    FileInfo newFile = new FileInfo(pathRoot + fileName);
                                    if (old.Length == newFile.Length)
                                    {
                                        File.Delete(pathRoot + fileName.Replace(".", finalString + "."));
                                    }
                                    else {
                                        fileName = fileName.Replace(".", finalString + ".");
                                    }
                                }
                            }
                        }
                        newFurniture.Description = description;
                        if (endWarranty != null && endWarranty != "")
                        {
                            newFurniture.EndWarranty = endWarranty;
                        }
                        newFurniture.MadeIn = made;
                        newFurniture.Name = name;
                        newFurniture.Picture = fileName;
                        if (price != null && price != "")
                        {
                            newFurniture.Price = price;
                        }
                        if (startWarranty != null && startWarranty != "")
                        {
                            newFurniture.StartWarranty = startWarranty;
                        }
                        if (ddlStatus.SelectedValue == "Bình thường")
                        {
                            newFurniture.Status = "True";
                        }
                        else
                        {
                            newFurniture.Status = "False";
                        }
                        newFurniture.UpdateFurniture();
                        Response.Redirect("ListFurniture.aspx");
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnEditCancel_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = false;
            pnlList.Visible = true;
            Session.Remove("FurID");
            Response.Redirect("ListFurniture.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdFurniture.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        pnlDelete.Visible = true;
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            btnConfirmDelete.Text = "Gửi Email Yêu Cầu";
                            btnConfirmDelete.Width = 150;
                        }
                        else
                        {
                            btnConfirmDelete.Text = "Xóa";
                            btnConfirmDelete.Width = 80;
                        }
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

        protected void btnConfirmCancel_Click(object sender, EventArgs e)
        {
            pnlDelete.Visible = false;
            pnlList.Visible = true;
            pnlRequest.Visible = false;
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdFurniture.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        Class.Furniture newFurniture = new Class.Furniture(gr.Cells[1].Text);
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            newFurniture.RemoveFurniture(0);
                        }
                        else
                        {
                            newFurniture.RemoveFurniture(1);
                        }
                    }
                }
                if (isCheck == false)
                {
                    lblError.Text = "Xin hãy chọn ít nhất 1 dòng";
                }
                else
                {
                    DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                        + ">=3");
                    for (int i = 0; i < email.Rows.Count; i++)
                    {
                        com.SendMail(email.Rows[i][0].ToString(), "Xác nhận gỡ bỏ vật tư từ " + Session["FullName"], txtReason.Text);
                    }
                    lblSuccess.Text = "Gửi email thành công!";
                    pnlDelete.Visible = false;
                    pnlList.Visible = true;
                    string buildingCondition = "";
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        //Get building list
                        DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                            + Message.UserID + "=" + Session["UserID"]);
                        string[] buildingList = building.Rows[0][0].ToString().Split('|');

                        for (int i = 0; i < buildingList.Length - 1; i++)
                        {
                            buildingCondition = buildingCondition + buildingList[i] + ",";
                        }
                        buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    }
                    string condition = "";
                    if (ddlChooseBuilding.SelectedIndex == 0)
                    {
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                                + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                        }
                        else
                        {
                            condition = " where ("
                                + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                        }
                    }
                    else
                    {
                        condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                    }
                    if (ddlChooseRoom.SelectedIndex != 0)
                    {
                        condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                    }
                    if (ddlChooseType.SelectedIndex != 0)
                    {
                        condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                    }
                    if (ddlInWarraty.SelectedIndex != 0)
                    {
                        if (ddlInWarraty.SelectedIndex == 1)
                        {
                            condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                        }
                        else
                        {
                            condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                        }
                    }
                    if (ddlPosition.SelectedIndex != 0)
                    {
                        if (ddlPosition.SelectedIndex != 1)
                        {
                            condition = condition + " and " + Message.IsWarehouse + "='True'";
                        }
                        else
                        {
                            condition = condition + " and " + Message.IsWarehouse + "='False'";
                        }
                    }
                    if (ddlCustomer.SelectedIndex != 0)
                    {
                        condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                    }
                    string[] column = new string[1];
                    column[0] = "Lịch sử";
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                        + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnMove_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdFurniture.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        pnlMove.Visible = true;
                        Class.Furniture newFurniture = new Class.Furniture(gr.Cells[1].Text);
                        Class.Building newBuilding = new Class.Building(newFurniture.CurrentBuilding);
                        DataTable dt = com.getData(Message.RoomTable, Message.RoomNo, " where " + Message.RoomID
                            + "=" + newFurniture.CurrentRoom);
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            btnConfirmMove.Text = "Gửi Email Yêu Cầu";
                            btnConfirmMove.Width = 150;
                            //Get building list
                            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                + Message.UserID + "=" + Session["UserID"]);
                            string[] buildingList = building.Rows[0][0].ToString().Split('|');
                            ddlTargetBuilding.Items.Clear();
                            ddlTargetBuilding.Items.Add("Xin hãy chọn");
                            for (int i = 0; i < buildingList.Length - 1; i++)
                            {
                                DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                                    + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                                if (buildingAddress.Rows.Count > 0)
                                {
                                    ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                                    ddlTargetBuilding.Items.Add(buildingItem);
                                }
                            }
                        }
                        else
                        {
                            btnConfirmMove.Text = "Di chuyển";
                            btnConfirmMove.Width = 80;
                            com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlTargetBuilding, "", true, "Xin hãy chọn");
                        }
                        ddlTargetRoom.Items.Clear();
                        ddlTargetRoom.Items.Add("Xin hãy chọn");
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

        protected void ddlTargetBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlTargetBuilding.SelectedIndex != 0)
                {
                    Class.User newUser = new Class.User(int.Parse(Session["UserID"].ToString()));
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        btnConfirmMove.Width = 150;
                        btnConfirmMove.Text = "Gửi Email Yêu Cầu";
                    }
                    else
                    {
                        btnConfirmMove.Text = "Di chuyển";
                        btnConfirmMove.Width = 80;
                    }
                    DataTable room = com.getData(Message.RoomTable, Message.RoomNo + "," + Message.RoomID, " where "
                        + Message.BuildingID + "=" + ddlTargetBuilding.SelectedValue);
                    ddlTargetRoom.Items.Clear();
                    ddlTargetRoom.Items.Add("Xin hãy chọn");
                    for (int i = 0; i < room.Rows.Count; i++)
                    {
                        ListItem buildingItem = new ListItem(room.Rows[i][0].ToString(), room.Rows[i][1].ToString());
                        ddlTargetRoom.Items.Add(buildingItem);
                    }
                }
                else
                {
                    ddlTargetRoom.Items.Clear();
                    ddlTargetRoom.Items.Add("Xin hãy chọn");
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnMoveCancel_Click(object sender, EventArgs e)
        {
            ddlTargetBuilding.SelectedIndex = 0;
            ddlTargetRoom.SelectedIndex = 0;
            pnlMove.Visible = false;
        }

        protected void btnConfirmMove_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlTargetBuilding.SelectedIndex != 0 && ddlTargetRoom.SelectedIndex != 0)
                {
                    bool isCheck = false;
                    foreach (GridViewRow gr in grdFurniture.Rows)
                    {
                        CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                        if (cb.Checked)
                        {
                            isCheck = true;
                            Class.Furniture newFurniture = new Class.Furniture(gr.Cells[1].Text);
                            newFurniture.CurrentBuilding = ddlTargetBuilding.SelectedValue;
                            if (btnConfirmMove.Text == "Di chuyển")
                            {
                                newFurniture.MoveFurniture(int.Parse(ddlTargetRoom.SelectedValue), 1, Session["UserID"].ToString(), txtMoveReason.Text);
                            }
                            else
                            {
                                newFurniture.MoveFurniture(int.Parse(ddlTargetRoom.SelectedValue), 0, Session["UserID"].ToString(), txtMoveReason.Text);
                            }
                        }
                    }
                    if (isCheck == false)
                    {
                        lblError.Text = "Xin hãy chọn ít nhất 1 dòng";
                    }
                    else
                    {
                        DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                            + ">=3");
                        for (int i = 0; i < email.Rows.Count; i++)
                        {
                            com.SendMail(email.Rows[i][0].ToString(), "Xác nhận di chuyển vật tư từ " + Session["FullName"], txtMoveReason.Text);
                        }
                        lblSuccess.Text = "Gửi email thành công!";
                        pnlMove.Visible = false;
                        pnlList.Visible = true;
                        string buildingCondition = "";
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            //Get building list
                            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                + Message.UserID + "=" + Session["UserID"]);
                            string[] buildingList = building.Rows[0][0].ToString().Split('|');

                            for (int i = 0; i < buildingList.Length - 1; i++)
                            {
                                buildingCondition = buildingCondition + buildingList[i] + ",";
                            }
                            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                        }
                        string condition = "";
                        if (ddlChooseBuilding.SelectedIndex == 0)
                        {
                            if (Session["UserLevel"].ToString() == "2")
                            {
                                condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                                    + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                            }
                            else
                            {
                                condition = " where ("
                                    + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                            }
                        }
                        else
                        {
                            condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                        }
                        if (ddlChooseRoom.SelectedIndex != 0)
                        {
                            condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                        }
                        if (ddlChooseType.SelectedIndex != 0)
                        {
                            condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                        }
                        if (ddlInWarraty.SelectedIndex != 0)
                        {
                            if (ddlInWarraty.SelectedIndex == 1)
                            {
                                condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                            }
                            else
                            {
                                condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                            }
                        }
                        if (ddlPosition.SelectedIndex != 0)
                        {
                            if (ddlPosition.SelectedIndex != 1)
                            {
                                condition = condition + " and " + Message.IsWarehouse + "='True'";
                            }
                            else
                            {
                                condition = condition + " and " + Message.IsWarehouse + "='False'";
                            }
                        }
                        if (ddlCustomer.SelectedIndex != 0)
                        {
                            condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                        }
                        string[] column = new string[1];
                        column[0] = "Lịch sử";
                        com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                            + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                            + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                            + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
                    }
                }
                else
                {
                    lblError.Text = "Xin hãy chọn 1 tòa nhà và 1 phòng";
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            pnlRequest.Visible = true;
            pnlAdd.Visible = false;
            pnlDelete.Visible = false;
            pnlEdit.Visible = false;
            pnlMove.Visible = false;
            txtComment.Text = "";
        }

        protected void btnRequestFurniture_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtComment.Text.Trim() == "")
                {
                    lblError.Text = "Xin hãy nhập yêu cầu của bạn!";
                }
                else
                {
                    DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                        + ">=3");
                    for (int i = 0; i < email.Rows.Count; i++)
                    {
                        com.SendMail(email.Rows[i][0].ToString(), "Yêu cầu vật tư từ " + Session["FullName"], txtComment.Text);
                    }
                    lblSuccess.Text = "Thành công";
                    pnlRequest.Visible = false;
                }
            }
            catch (Exception)
            {
            }
        }

        protected void lblCategory_Click(object sender, EventArgs e)
        {
            try
            {
                if (grdCategory.Visible == true)
                {
                    grdCategory.Visible = false;
                    btnExport1.Visible = false;
                    lblCategory.Text = "Hiện thống kê vật tư";
                }
                else
                {
                    grdCategory.Visible = true;
                    btnExport1.Visible = true;
                    //Get building list
                    DataTable building1 = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList1 = building1.Rows[0][0].ToString().Split('|');
                    string buildingCondition1 = "";
                    for (int i = 0; i < buildingList1.Length - 1; i++)
                    {
                        DataTable buildingAddress1 = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList1[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress1.Rows.Count > 0)
                        {
                            buildingCondition1 = buildingCondition1 + buildingList1[i] + ",";
                        }
                    }
                    buildingCondition1 = buildingCondition1.Remove(buildingCondition1.Length - 1, 1);
                    com.bindData("distinct furType." + Message.Description
                        + ",(select count(*) from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType
                        + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ") and (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete
                        + " is NULL)) as 'Available',(select count(*) from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType
                        + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total',(select SUM(" + Message.Price
                        + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total Value'"
                        , " where fur." + Message.CurrentBuilding + " in (" + buildingCondition1 + ")", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                        + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType, grdCategory);
                    lblCategory.Text = "Ẩn thống kê vật tư";
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
                string buildingCondition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');

                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                }
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                    else
                    {
                        condition = " where ("
                            + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                    }
                }
                else
                {
                    condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
                }
                if (ddlChooseRoom.SelectedIndex != 0)
                {
                    condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
                }
                if (ddlChooseType.SelectedIndex != 0)
                {
                    condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
                }
                if (ddlInWarraty.SelectedIndex != 0)
                {
                    if (ddlInWarraty.SelectedIndex == 1)
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                    else
                    {
                        condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                    }
                }
                if (ddlPosition.SelectedIndex != 0)
                {
                    if (ddlPosition.SelectedIndex != 1)
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='True'";
                    }
                    else
                    {
                        condition = condition + " and " + Message.IsWarehouse + "='False'";
                    }
                }
                if (ddlCustomer.SelectedIndex != 0)
                {
                    condition = condition + " and cus." + Message.CustomerID + "=" + ddlCustomer.SelectedValue;
                }
                string[] column = new string[1];
                column[0] = "Lịch sử";
                string sql = com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + ",bui." + Message.Address + ",rom." + Message.RoomNo + ", fur."
                    + Message.EndWarranty + ",fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom
                    + " left join " + Message.CustomerTable + " cus on cus." + Message.CustomerID + "=fur." + Message.CurrentCustomer, grdFurniture, 1, column);
                int fromIndex = -4;
                string temp_sql = sql;
                while (temp_sql.Contains("from"))
                {
                    fromIndex = fromIndex + temp_sql.IndexOf("from") + 4;
                    temp_sql = temp_sql.Substring(temp_sql.IndexOf("from") + 4, temp_sql.Length - temp_sql.IndexOf("from") - 4);
                }
                fromIndex++;
                com.ExportToExcel(sql, Server.MapPath(@"Excel/Furniture_" + DateTime.Now.Hour+"_"+DateTime.Now.Minute+"_"+ DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    +DateTime.Now.Year+".xls"),@"ANHTUNG",fromIndex);
                lblSuccess.Text = "Thành công";
                Response.Redirect(@"Excel/Furniture_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    + DateTime.Now.Year + ".xls");
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnExport1_Click(object sender, EventArgs e)
        {
            try
            {
                //Get building list
                DataTable building1 = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                    + Message.UserID + "=" + Session["UserID"]);
                string[] buildingList1 = building1.Rows[0][0].ToString().Split('|');
                string buildingCondition1 = "";
                for (int i = 0; i < buildingList1.Length - 1; i++)
                {
                    DataTable buildingAddress1 = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                        + Message.BuildingID + "=" + buildingList1[i] + " and " + Message.Status + "<>3");
                    if (buildingAddress1.Rows.Count > 0)
                    {
                        buildingCondition1 = buildingCondition1 + buildingList1[i] + ",";
                    }
                }
                buildingCondition1 = buildingCondition1.Remove(buildingCondition1.Length - 1, 1);
                string sql = com.bindData("distinct furType." + Message.Description
                    + ",(select count(*) from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType
                    + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ") and (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete
                    + " is NULL)) as 'Available',(select count(*) from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType
                    + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total',(select SUM(" + Message.Price
                    + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total_Value'"
                    , " where fur." + Message.CurrentBuilding + " in (" + buildingCondition1 + ")", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                    + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType, grdCategory);
                int fromIndex = -4;
                string temp_sql = sql;
                while (temp_sql.Contains("from")) {
                    fromIndex = fromIndex+ temp_sql.IndexOf("from")+4;
                    temp_sql = temp_sql.Substring(temp_sql.IndexOf("from") + 4, temp_sql.Length - temp_sql.IndexOf("from") - 4);
                }
                fromIndex++;
                com.ExportToExcel(sql, Server.MapPath(@"Excel/Furniture_Category_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    + DateTime.Now.Year + ".xls"), @"ANHTUNG",fromIndex);
                lblSuccess.Text = "Thành công";
                Response.Redirect(@"Excel/Furniture_Category_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_"
                    + DateTime.Now.Year + ".xls");
            }
            catch (Exception ex)
            {
            }
        }
    }
}