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
                if (!IsPostBack) {
                    grdCategory.Visible = true;
                    lblCategory.Visible = true;
                }
                Panel1.Visible = true;
            }
            else {
                btnAdd.Visible = true;
                btnRequest.Visible = false;
                grdCategory.Visible = false;
                lblCategory.Visible = false;
                Panel1.Visible = false;
            }
            Session["MenuID"] = "2";
            Page.Title = "Manage Furniture";
            lblSuccess.Text = "";
            lblError.Text = "";
            this.confirmSave = Message.ConfirmSave;
            string ID = Request.QueryString["ID"];
            if (ID != null)
            {
                pnlList.Visible = false;
                pnlEdit.Visible = true;
                this.startDate = "";
                this.endDate = "";
                ddlEditCountry.DataSource = com.getCountryList();
                ddlEditCountry.DataBind();
                ListItem item = new ListItem("Please select");
                ddlEditCountry.Items.Insert(0, item);
                Class.Furniture newFuniture = new Class.Furniture(ID);
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
                Session["FurID"] = newFuniture.FurID;
            }
            else
            {
                if (!IsPostBack)
                {
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
                            + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total Price'"
                            , " where fur." + Message.CurrentBuilding + " in (" + buildingCondition1 + ")", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                            + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType, grdCategory);
                        lblCategory.Text = "Show Category Statistic";
                        grdCategory.Visible = false;
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
                        ListItem item = new ListItem("Please select");
                        ddlCountry.Items.Insert(0, item);
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            //Get building list
                            DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                                + Message.UserID + "=" + Session["UserID"]);
                            string[] buildingList = building.Rows[0][0].ToString().Split('|');
                            ddlBuilding.Items.Clear();
                            ddlBuilding.Items.Add("Please select");
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
                            com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlBuilding, "", true, "Please select");
                        }
                        com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlType, "", true, "Please select");
                        ddlRoom.Items.Clear();
                        ddlRoom.Items.Add("Please select");
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
                            ddlChooseBuilding.Items.Add("All");
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
                            com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlChooseBuilding, "", true, "All");
                        }
                        com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlChooseType, "", true, "All");
                        ddlChooseRoom.Items.Clear();
                        ddlChooseRoom.Items.Add("All");
                        if (Session["UserLevel"].ToString() == "2")
                        {
                            com.bindData("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture,
                                " where fur.CurrentBuildingID in (" + buildingCondition + ") and (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)", Message.FurnitureTable
                                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
                        }
                        else
                        {
                            com.bindData("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                                + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                                + Message.EndWarranty + " as 'End Warranty' ,fur." + Message.Picture,
                                " where (" + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)", Message.FurnitureTable
                                + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                                + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                                + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                                + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, grdFurniture);
                        }
                    }
                    else
                    {
                        this.startDate = "";
                        this.endDate = "";
                        ddlCountry.DataSource = com.getCountryList();
                        ddlCountry.DataBind();
                        ListItem item = new ListItem("Please select");
                        ddlCountry.Items.Insert(0, item);
                    }
                }
            }
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected string confirmSave { get; set; }
        protected void grdFurniture_RowDataBound(object sender, GridViewRowEventArgs e)
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
                e.Row.Cells[7].Text = "<a href=\"Images/"+e.Row.Cells[7].Text+"\"><img width=\"50\" src=\"Images/" + e.Row.Cells[7].Text + "\"></a>";
                if (e.Row.Cells[6].Text != "&nbsp;") {
                    e.Row.Cells[6].Text = DateTime.Parse(e.Row.Cells[6].Text).ToShortDateString();
                }
            }
            else {
                e.Row.Cells[4].Attributes.Add("width","150px");
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Class.Furniture newFurniture = new Class.Furniture(e.Row.Cells[1].Text);
                if (newFurniture.TargetRoomID != "")
                {
                    e.Row.Cells[4].Text = "On moving to " + e.Row.Cells[4].Text;
                }
                string Location = "ListFurniture.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
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
            if (txtName.Text.Trim() == "" || ddlBuilding.SelectedIndex == 0 || ddlRoom.SelectedIndex == 0
                ||txtPrice.Text.Trim()=="")
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
                    Response.Redirect("ListFurniture.aspx");
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
                else {
                    condition = " where ("
                        + Message.ApproveDelete + "<>1 or " + Message.ApproveDelete + " is NULL)";
                }
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
            if (Session["UserLevel"].ToString() == "2")
            {
                //Get building list
                DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                    + Message.UserID + "=" + Session["UserID"]);
                string[] buildingList = building.Rows[0][0].ToString().Split('|');
                ddlBuilding.Items.Clear();
                ddlBuilding.Items.Add("Please select");
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
                com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlBuilding, "", true, "Please select");
            }
            com.SetItemList(Message.Description + "," + Message.Description, Message.FurnitureTypeTable, ddlType, "", true, "Please select");
            ddlRoom.Items.Clear();
            ddlRoom.Items.Add("Please select");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlAdd.Visible = false;
            pnlList.Visible = true;
            Response.Redirect("ListFurniture.aspx");
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
                    Response.Redirect("ListFurniture.aspx");
                }
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
            pnlRequest.Visible = false;
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
                DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                    + ">=3");
                for (int i = 0; i < email.Rows.Count; i++)
                {
                    com.SendMail(email.Rows[i][0].ToString(), "Confirm remove furniture from " + Session["FullName"], txtReason.Text);
                }
                lblSuccess.Text = "Send email success!";
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
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        btnConfirmMove.Text = "Move";
                        btnConfirmMove.Width = 80;
                        //Get building list
                        DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                            + Message.UserID + "=" + Session["UserID"]);
                        string[] buildingList = building.Rows[0][0].ToString().Split('|');
                        ddlTargetBuilding.Items.Clear();
                        ddlTargetBuilding.Items.Add("Please select");
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
                        com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlTargetBuilding, "", true, "Please select");
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
                if (Session["UserLevel"].ToString() == "2")
                {
                    string[] buildingManage = newUser.RoomManage.Split('|');
                    for (int i = 0; i < buildingManage.Length; i++)
                    {
                        if (buildingManage[i].Contains(ddlTargetBuilding.SelectedValue))
                        {
                            btnConfirmMove.Text = "Move";
                            btnConfirmMove.Width = 80;
                            break;
                        }
                        else
                        {
                            btnConfirmMove.Width = 150;
                            btnConfirmMove.Text = "Send Email Request";
                        }
                    }
                }
                else {
                    btnConfirmMove.Text = "Move";
                    btnConfirmMove.Width = 80;
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
                        newFurniture.CurrentBuilding = ddlTargetBuilding.SelectedValue;
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
                    DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                        + ">=3");
                    for (int i = 0; i < email.Rows.Count; i++)
                    {
                        com.SendMail(email.Rows[i][0].ToString(), "Confirm move furniture from " + Session["FullName"], txtMoveReason.Text);
                    }
                    lblSuccess.Text = "Send email success!";
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
            if (txtComment.Text.Trim() == "")
            {
                lblError.Text = "Please enter your request!";
            }
            else {
                DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                    + ">=3");
                for (int i = 0; i < email.Rows.Count; i++)
                {
                    com.SendMail(email.Rows[i][0].ToString(), "Request furniture from " + Session["FullName"], txtComment.Text);
                }
                lblSuccess.Text = "Success!";
                pnlRequest.Visible = false;
            }
        }

        protected void lblCategory_Click(object sender, EventArgs e)
        {
            if (grdCategory.Visible == true)
            {
                grdCategory.Visible = false;
                lblCategory.Text = "Show Category Statistic";
            }
            else {
                grdCategory.Visible = true;
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
                    + ") from " + Message.FurnitureTable + " where " + Message.FurnitureType + "=fur." + Message.FurnitureType + " and " + Message.CurrentBuilding + " in (" + buildingCondition1 + ")) as 'Total Price'"
                    , " where fur." + Message.CurrentBuilding + " in (" + buildingCondition1 + ")", Message.FurnitureTable + " fur join " + Message.FurnitureTypeTable + " furType"
                    + " on fur." + Message.FurnitureType + "=furType." + Message.FurnitureType, grdCategory);
                lblCategory.Text = "Hide Category Statistic";
            }
        }
    }
}