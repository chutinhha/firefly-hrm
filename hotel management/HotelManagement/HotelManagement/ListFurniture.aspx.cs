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
            if (Session["UserLevel"] != null)
            {
                if (Session["UserLevel"].ToString() == "2") { }
                else
                {
                    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                    Response.Redirect("AccessDenied.aspx");
                }
            }
            else
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("AccessDenied.aspx");
            }
            lblSuccess.Text = "";
            lblError.Text = "";
            this.confirmSave = Message.ConfirmSave;
            if (!IsPostBack) {
                if (pnlAdd.Visible == true)
                {
                    this.startDate = "";
                    this.endDate = "";
                    ddlCountry.DataSource = com.getCountryList();
                    ddlCountry.DataBind();
                    ListItem item = new ListItem("Please select");
                    ddlCountry.Items.Insert(0, item);
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    ddlBuilding.Items.Clear();
                    ddlBuilding.Items.Add("Please select");
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i]);
                        ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                        ddlBuilding.Items.Add(buildingItem);
                    }
                    com.SetItemList(Message.Description+","+Message.Description, Message.FurnitureTypeTable, ddlType, "", true, "Please select");
                    ddlRoom.Items.Clear();
                    ddlRoom.Items.Add("Please select");
                }
                else if (pnlList.Visible == true)
                {
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    ddlChooseBuilding.Items.Clear();
                    ddlChooseBuilding.Items.Add("All");
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList[i]);
                        ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                        ddlChooseBuilding.Items.Add(buildingItem);
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlChooseType, "", true, "All");
                    ddlChooseRoom.Items.Clear();
                    ddlChooseRoom.Items.Add("All");
                    com.bindData("fur."+Message.FurnitureID+",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture,
                        " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)", Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
                }
                else {
                    this.startDate = "";
                    this.endDate = "";
                    ddlCountry.DataSource = com.getCountryList();
                    ddlCountry.DataBind();
                    ListItem item = new ListItem("Please select");
                    ddlCountry.Items.Insert(0, item);
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected string confirmSave { get; set; }
        protected void grdFurniture_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[7].Text = "<a href=\"Images/"+e.Row.Cells[7].Text+"\"><img width=\"50\" src=\"Images/" + e.Row.Cells[7].Text + "\"></a>";
                if (e.Row.Cells[6].Text != "&nbsp;") {
                    e.Row.Cells[6].Text = DateTime.Parse(e.Row.Cells[6].Text).ToShortDateString();
                }
            }
            else {
                e.Row.Cells[4].Attributes.Add("width","150px");
            }
        }
        protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBuilding.SelectedIndex != 0)
            {
                com.SetItemList(Message.RoomNo + "," + Message.RoomNo, Message.RoomTable, ddlRoom, " where " + Message.BuildingID
                    + "=" + ddlBuilding.SelectedValue, true, "Please select");
            }
            else {
                ddlRoom.Items.Clear();
                ddlRoom.Items.Add("Please select");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblError.Text="";
            lblSuccess.Text="";
            this.startDate = Request.Form["txtStart"].ToString().Trim();
            this.endDate = Request.Form["txtEnd"].ToString().Trim(); 
            if (txtName.Text.Trim() == "" || ddlBuilding.SelectedIndex == 0 || ddlRoom.SelectedIndex == 0)
            {
                lblError.Text = "Some required field are missing!";
            }
            else {
                bool checkCondition = true;
                string fileName = null;
                if (fulPicture.HasFile) {
                    fileName = fulPicture.FileName;
                    if (!Path.GetExtension(fileName).Contains(".jpg") &&
                        !Path.GetExtension(fileName).Contains(".jpeg") &&
                        !Path.GetExtension(fileName).Contains(".bmp") &&
                        !Path.GetExtension(fileName).Contains(".png") &&
                        !Path.GetExtension(fileName).Contains(".gif") &&
                        !Path.GetExtension(fileName).Contains(".tif") &&
                        !Path.GetExtension(fileName).Contains(".dib"))
                    {
                        lblError.Text = "Only accept jpg,jpeg,png,bmp,gif,tif and dib file type!";
                        checkCondition = false;
                    }
                }
                if (checkCondition == true)
                {
                    string name = txtName.Text.Trim();
                    string building = ddlBuilding.SelectedValue;
                    DataTable roomID = com.getData(Message.RoomTable,Message.RoomID," where "+Message.BuildingID
                        +"="+building+" and "+Message.RoomNo+"="+ddlRoom.SelectedValue);
                    string room = roomID.Rows[0][0].ToString();
                    string type = ddlType.SelectedValue;
                    string price = txtPrice.Text.Trim();
                    string made = ddlCountry.SelectedValue;
                    string startWarranty = Request.Form["txtStart"].ToString().Trim();
                    string endWarranty = Request.Form["txtEnd"].ToString().Trim();
                    string description = txtDes.Text.Trim();
                    if (fileName != null) {
                        string pathRoot = HttpContext.Current.Server.MapPath("~/Images/");
                        if (!File.Exists(pathRoot + fileName))
                        {
                            fulPicture.SaveAs(pathRoot + fileName);
                        }
                        else {
                            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                            var stringChars = new char[8];
                            var random = new Random();

                            for (int i = 0; i < stringChars.Length; i++)
                            {
                                stringChars[i] = chars[random.Next(chars.Length)];
                            }

                            var finalString = new String(stringChars);
                            fulPicture.SaveAs(pathRoot + fileName.Replace(".", finalString + "."));
                            fileName = fileName.Replace(".", finalString + ".");
                        }
                    }
                    Class.Furniture newFurniture = new Class.Furniture();
                    newFurniture.CurrentBuilding = building;
                    newFurniture.CurrentRoom = room;
                    newFurniture.Description = description;
                    if (endWarranty != null&&endWarranty!="")
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
                    if (startWarranty != null&&startWarranty!="")
                    {
                        newFurniture.StartWarranty = startWarranty;
                    }
                    newFurniture.Status = "true";
                    newFurniture.AddFurniture();
                    lblSuccess.Text = "Success";
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
            if (ddlChooseBuilding.SelectedIndex != 0)
            {
                com.SetItemList(Message.RoomNo + "," + Message.RoomNo, Message.RoomTable, ddlChooseRoom, " where " + Message.BuildingID
                    + "=" + ddlChooseBuilding.SelectedValue, true, "All");
            }
            else
            {
                ddlChooseRoom.Items.Clear();
                ddlChooseRoom.Items.Add("All");
            }
            //Get building list
            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                + Message.UserID + "=" + Session["UserID"]);
            string[] buildingList = building.Rows[0][0].ToString().Split('|');
            string buildingCondition = "";
            for (int i = 0; i < buildingList.Length - 1; i++)
            {
                buildingCondition = buildingCondition + buildingList[i] + ",";
            }
            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
            string condition = "";
            if (ddlChooseBuilding.SelectedIndex == 0)
            {
                condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
            }
            else {
                condition = " where fur.CurrentBuildingID =" + ddlChooseBuilding.SelectedValue;
            }
            if (ddlChooseRoom.SelectedIndex != 0) {
                condition = condition + " and rom." + Message.RoomNo + "=" + ddlChooseRoom.SelectedValue;
            }
            if (ddlChooseType.SelectedIndex != 0) {
                condition = condition + " and furType." + Message.Description + "=N'" + ddlChooseType.SelectedValue + "'";
            }
            if (ddlInWarraty.SelectedIndex != 0) {
                if (ddlInWarraty.SelectedIndex == 1)
                {
                    condition = condition + " and ((fur." + Message.EndWarranty + ">='" + DateTime.Today + "') or ("+Message.EndWarranty+" is NULL))";
                }
                else {
                    condition = condition + " and ((fur." + Message.EndWarranty + "<'" + DateTime.Today + "') or (" + Message.EndWarranty + " is NULL))";
                }
            }
            if (ddlPosition.SelectedIndex != 0) {
                if (ddlPosition.SelectedIndex != 1)
                {
                    condition = condition + " and " + Message.IsWarehouse + "='True'";
                }
                else {
                    condition = condition + " and "+Message.IsWarehouse+"='False'";
                }
            }
            com.bindData("fur."+Message.FurnitureID+",fur." + Message.Name + ", furType."
                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
        }

        protected void ddlChooseRoom_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get building list
            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                + Message.UserID + "=" + Session["UserID"]);
            string[] buildingList = building.Rows[0][0].ToString().Split('|');
            string buildingCondition = "";
            for (int i = 0; i < buildingList.Length - 1; i++)
            {
                buildingCondition = buildingCondition + buildingList[i] + ",";
            }
            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
            string condition = "";
            if (ddlChooseBuilding.SelectedIndex == 0)
            {
                condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
            com.bindData("fur."+Message.FurnitureID+",fur." + Message.Name + ", furType."
                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
        }

        protected void ddlChooseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get building list
            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                + Message.UserID + "=" + Session["UserID"]);
            string[] buildingList = building.Rows[0][0].ToString().Split('|');
            string buildingCondition = "";
            for (int i = 0; i < buildingList.Length - 1; i++)
            {
                buildingCondition = buildingCondition + buildingList[i] + ",";
            }
            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
            string condition = "";
            if (ddlChooseBuilding.SelectedIndex == 0)
            {
                condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
            com.bindData("fur."+Message.FurnitureID+",fur." + Message.Name + ", furType."
                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
        }

        protected void ddlInWarraty_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get building list
            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                + Message.UserID + "=" + Session["UserID"]);
            string[] buildingList = building.Rows[0][0].ToString().Split('|');
            string buildingCondition = "";
            for (int i = 0; i < buildingList.Length - 1; i++)
            {
                buildingCondition = buildingCondition + buildingList[i] + ",";
            }
            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
            string condition = "";
            if (ddlChooseBuilding.SelectedIndex == 0)
            {
                condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
            com.bindData("fur."+Message.FurnitureID+",fur." + Message.Name + ", furType."
                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
        }

        protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get building list
            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                + Message.UserID + "=" + Session["UserID"]);
            string[] buildingList = building.Rows[0][0].ToString().Split('|');
            string buildingCondition = "";
            for (int i = 0; i < buildingList.Length - 1; i++)
            {
                buildingCondition = buildingCondition + buildingList[i] + ",";
            }
            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
            string condition = "";
            if (ddlChooseBuilding.SelectedIndex == 0)
            {
                condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
            com.bindData("fur."+Message.FurnitureID+",fur." + Message.Name + ", furType."
                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            pnlAdd.Visible = true;
            pnlList.Visible = false;
            this.startDate = "";
            this.endDate = "";
            ddlCountry.DataSource = com.getCountryList();
            ddlCountry.DataBind();
            ListItem item = new ListItem("Please select");
            ddlCountry.Items.Insert(0, item);
            //Get building list
            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                + Message.UserID + "=" + Session["UserID"]);
            string[] buildingList = building.Rows[0][0].ToString().Split('|');
            ddlBuilding.Items.Clear();
            ddlBuilding.Items.Add("Please select");
            for (int i = 0; i < buildingList.Length - 1; i++)
            {
                DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                    + Message.BuildingID + "=" + buildingList[i]);
                ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                ddlBuilding.Items.Add(buildingItem);
            }
            com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlType, "", true, "Please select");
            ddlRoom.Items.Clear();
            ddlRoom.Items.Add("Please select");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlAdd.Visible = false;
            pnlList.Visible = true;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
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
                    ListItem item = new ListItem("Please select");
                    ddlEditCountry.Items.Insert(0, item);
                    Class.Furniture newFuniture = new Class.Furniture(gr.Cells[1].Text);
                    txtEditDes.Text = newFuniture.Description;
                    txtEditName.Text = newFuniture.Name;
                    txtEditPrice.Text = newFuniture.Price;
                    if (newFuniture.Status == "0" || newFuniture.Status == "True" || newFuniture.Status == "")
                    {
                        ddlStatus.SelectedValue = "Normal";
                    }
                    else {
                        ddlStatus.SelectedValue = "Broke";
                    }
                    ddlEditCountry.SelectedValue = newFuniture.MadeIn;
                    this.startDate = newFuniture.StartWarranty;
                    this.endDate = newFuniture.EndWarranty;
                    imgPicture.ImageUrl = "Images/"+newFuniture.Picture;
                    Session["FurID"] = newFuniture.FurID;
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
        }

        protected void btnEditReset_Click(object sender, EventArgs e)
        {
            Class.Furniture newFuniture = new Class.Furniture(Session["FurID"].ToString());
            txtEditDes.Text = newFuniture.Description;
            txtEditName.Text = newFuniture.Name;
            txtEditPrice.Text = newFuniture.Price;
            if (newFuniture.Status == "0" || newFuniture.Status == "True" || newFuniture.Status == "")
            {
                ddlStatus.SelectedValue = "Normal";
            }
            else
            {
                ddlStatus.SelectedValue = "Broke";
            }
            ddlEditCountry.SelectedValue = newFuniture.MadeIn;
            this.startDate = newFuniture.StartWarranty;
            this.endDate = newFuniture.EndWarranty;
            imgPicture.ImageUrl = "Images/" + newFuniture.Picture;
        }

        protected void btnEditSave_Click(object sender, EventArgs e)
        {
            Class.Furniture newFurniture = new Class.Furniture(Session["FurID"].ToString());
            lblError.Text = "";
            lblSuccess.Text = "";
            this.startDate = Request.Form["txtEditStart"].ToString().Trim();
            this.endDate = Request.Form["txtEditEnd"].ToString().Trim();
            if (txtEditName.Text.Trim() == "")
            {
                lblError.Text = "Required field is missing!";
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
                        lblError.Text = "Only accept jpg,jpeg,png,bmp,gif,tif and dib file type!";
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
                                fileName = fileName.Replace(".", finalString + ".");
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
                    if (ddlStatus.SelectedValue == "Normal")
                    {
                        newFurniture.Status = "True";
                    }
                    else {
                        newFurniture.Status = "False";
                    }
                    newFurniture.UpdateFurniture();
                    lblSuccess.Text = "Success";
                    pnlEdit.Visible = false;
                    pnlList.Visible = true;
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    string condition = "";
                    if (ddlChooseBuilding.SelectedIndex == 0)
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
                    com.bindData("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
                }
            }
        }

        protected void btnEditCancel_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = false;
            pnlList.Visible = true;
            Session.Remove("FurID");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdFurniture.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    pnlDelete.Visible = true;
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
        }

        protected void btnConfirmCancel_Click(object sender, EventArgs e)
        {
            pnlDelete.Visible = false;
            pnlList.Visible = true;
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdFurniture.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    Class.Furniture newFurniture = new Class.Furniture(gr.Cells[1].Text);
                    newFurniture.RemoveFurniture(0);
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
            else
            {
                com.SendMail(Message.targetEmail, "Confirm remove furniture from " + Session["FullName"], txtReason.Text);
                lblSuccess.Text = "Send email success!";
                pnlDelete.Visible = false;
                pnlList.Visible = true;
                //Get building list
                DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                    + Message.UserID + "=" + Session["UserID"]);
                string[] buildingList = building.Rows[0][0].ToString().Split('|');
                string buildingCondition = "";
                for (int i = 0; i < buildingList.Length - 1; i++)
                {
                    buildingCondition = buildingCondition + buildingList[i] + ",";
                }
                buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                string condition = "";
                if (ddlChooseBuilding.SelectedIndex == 0)
                {
                    condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
                com.bindData("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                    + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                    + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                    + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                    + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                    + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                    + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
            }
        }

        protected void btnMove_Click(object sender, EventArgs e)
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
                    DataTable dt = com.getData(Message.RoomTable,Message.RoomNo," where "+Message.RoomID
                        +"="+newFurniture.CurrentRoom);
                    DataTable buildingAddress = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, "");
                    ddlTargetBuilding.Items.Clear();
                    ddlTargetBuilding.Items.Add("Please select");
                    for (int i = 0; i < buildingAddress.Rows.Count; i++)
                    {
                        ListItem buildingItem = new ListItem(buildingAddress.Rows[i][0].ToString(), buildingAddress.Rows[i][1].ToString());
                        ddlTargetBuilding.Items.Add(buildingItem);
                    }
                    ddlTargetRoom.Items.Clear();
                    ddlTargetRoom.Items.Add("Please select");
                    break;
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
        }

        protected void ddlTargetBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTargetBuilding.SelectedIndex != 0)
            {
                Class.User newUser = new Class.User(int.Parse(Session["UserID"].ToString()));
                string[] buildingManage = newUser.RoomManage.Split('|');
                for(int i=0;i<buildingManage.Length;i++){
                    if (buildingManage[i].Contains(ddlTargetBuilding.SelectedValue))
                    {
                        btnConfirmMove.Text = "Move";
                        btnConfirmMove.Width = 80;
                        break;
                    }
                    else {
                        btnConfirmMove.Width = 150;
                        btnConfirmMove.Text = "Send Email Request";
                    }
                }
                DataTable room = com.getData(Message.RoomTable, Message.RoomNo + "," + Message.RoomID, " where "
                    +Message.BuildingID+"="+ddlTargetBuilding.SelectedValue);
                ddlTargetRoom.Items.Clear();
                ddlTargetRoom.Items.Add("Please select");
                for (int i = 0; i < room.Rows.Count; i++)
                {
                    ListItem buildingItem = new ListItem(room.Rows[i][0].ToString(), room.Rows[i][1].ToString());
                    ddlTargetRoom.Items.Add(buildingItem);
                }
            }
            else
            {
                ddlTargetRoom.Items.Clear();
                ddlTargetRoom.Items.Add("Please select");
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
                        if (btnConfirmMove.Text == "Move") {
                            newFurniture.MoveFurniture(int.Parse(ddlTargetRoom.SelectedValue), 1, Session["UserID"].ToString(),txtMoveReason.Text);
                        }
                        else
                        {
                            newFurniture.MoveFurniture(int.Parse(ddlTargetRoom.SelectedValue), 0, Session["UserID"].ToString(), txtMoveReason.Text);
                        }
                    }
                }
                if (isCheck == false)
                {
                    lblError.Text = "Please select a row!";
                }
                else
                {
                    if (btnConfirmMove.Text != "Move")
                    {
                        com.SendMail(Message.targetEmail, "Confirm move furniture from " + Session["FullName"], txtMoveReason.Text);
                        lblSuccess.Text = "Send email success!";
                    }
                    else {
                        lblSuccess.Text = "Move success!";
                    }
                    pnlMove.Visible = false;
                    pnlList.Visible = true;
                    //Get building list
                    DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList = building.Rows[0][0].ToString().Split('|');
                    string buildingCondition = "";
                    for (int i = 0; i < buildingList.Length - 1; i++)
                    {
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                    buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                    string condition = "";
                    if (ddlChooseBuilding.SelectedIndex == 0)
                    {
                        condition = " where fur.CurrentBuildingID in (" + buildingCondition + ") and ("+Message.ApproveDelete+"<>1 or "+Message.ApproveDelete+" is NULL)";
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
                    com.bindData("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture, condition, Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
                }
            }
            else {
                lblError.Text = "Please select a building and a room";
            }
        }
    }
}