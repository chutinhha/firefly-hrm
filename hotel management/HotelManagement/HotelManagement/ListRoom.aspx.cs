using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class ListRoom : System.Web.UI.Page
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
                Session["MenuID"] = "3";
            }
            else {
                Session["MenuID"] = "4";
            }
            lblSuccess.Text = "";
            lblError.Text = "";
            Page.Title = "Manage Room";
            this.confirmSave = Message.ConfirmSave;
            this.confirmDelete = Message.ConfirmDelete;
            string ID = Request.QueryString["ID"];
            if (!IsPostBack)
            {
                if (ID != null) {
                    pnlList.Visible = false;
                    pnlAdd.Visible = true;
                    Class.Room newRoom = new Class.Room(ID);
                    Class.Building newBuilding = new Class.Building(newRoom.BuildingID);
                    ddlBuilding.Visible = false;
                    txtBuilding.Visible = true;
                    Session["RID"] = newRoom.RoomID;
                    txtBuilding.Text = newBuilding.Address;
                    ddlFloor.Items.Clear();
                    ddlFloor.Items.Add("Please select");
                    for (int i = 1; i < int.Parse(newBuilding.NumberFloor) + 1; i++)
                    {
                        ddlFloor.Items.Add(i.ToString());
                    }
                    ddlFloor.SelectedValue = newRoom.Floor;
                    txtRoomNo.Text = newRoom.RoomNo;
                    if (newRoom.IsWareHouse == "False" || newRoom.IsWareHouse == "0")
                    {
                        chkWareHouse.Checked = false;
                    }
                    else
                    {
                        chkWareHouse.Checked = true;
                    }
                }
            }
            if (ID == null)
            {
                if (pnlList.Visible == true)
                {
                    if (!IsPostBack)
                    {
                        string condition = "";
                        if (Session["UserLevel"].ToString() == "2")
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
                                    + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                                if (buildingAddress.Rows.Count > 0)
                                {
                                    ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                                    ddlChooseBuilding.Items.Add(buildingItem);
                                    buildingCondition = buildingCondition + buildingList[i] + ",";
                                }
                            }
                            buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                            condition = " where rom." + Message.BuildingID + " in (" + buildingCondition + ") and rom." + Message.Status + "<>3";
                        }
                        else {
                            condition = " where rom." + Message.Status + "<>3";
                            com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlChooseBuilding, " where " + Message.Status
                                + "<>3", true, "All");
                        }
                        if (ddlChooseBuilding.SelectedIndex == 0) { }
                        else
                        {
                            condition = condition + " and rom." + Message.BuildingID + "=" + ddlChooseBuilding.SelectedValue;
                        }
                        if (ddlRoomType.SelectedIndex == 0) { }
                        else
                        {
                            condition = condition + " and IsWareHouse=" + (ddlRoomType.SelectedIndex - 1).ToString();
                        }
                        com.bindData(" " + Message.RoomID + ",bui." + Message.Address + " as 'Building'," + Message.Floor + "," + Message.RoomNo
                            + " as 'Room No',CAST(IsWareHouse as varchar(MAX)) as 'Is Warehouse'", condition + " order by bui." + Message.Address,
                            Message.RoomTable + " rom join " + Message.BuildingTable + " bui on rom." + Message.BuildingID
                            + "=bui." + Message.BuildingID, grdRoom);
                    }
                }
            }
        }
        protected string confirmSave { get; set; }
        protected string confirmDelete { get; set; }

        protected void ddlChooseBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            string condition = "";
            if (Session["UserLevel"].ToString() == "2")
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
                        + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                    if (buildingAddress.Rows.Count > 0)
                    {
                        ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                        ddlChooseBuilding.Items.Add(buildingItem);
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                }
                buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                condition = " where rom." + Message.BuildingID + " in (" + buildingCondition + ") and rom." + Message.Status + "<>3";
            }
            else
            {
                condition = " where rom." + Message.Status + "<>3";
            }
            if (ddlChooseBuilding.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and rom." + Message.BuildingID + "=" + ddlChooseBuilding.SelectedValue;
            }
            if (ddlRoomType.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and IsWareHouse=" + (ddlRoomType.SelectedIndex - 1).ToString();
            }
            com.bindData(" " + Message.RoomID + ",bui." + Message.Address + " as 'Building'," + Message.Floor + "," + Message.RoomNo
                + " as 'Room No',CAST(IsWareHouse as varchar(MAX)) as 'Is Warehouse'", condition + " order by bui." + Message.Address,
                Message.RoomTable + " rom join " + Message.BuildingTable + " bui on rom." + Message.BuildingID
                + "=bui." + Message.BuildingID, grdRoom);
        }

        protected void ddlRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            string condition = " where rom." + Message.BuildingID + " in (" + buildingCondition + ") and rom." + Message.Status + "<>3";
            if (ddlChooseBuilding.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and rom." + Message.BuildingID + "=" + ddlChooseBuilding.SelectedValue;
            }
            if (ddlRoomType.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and IsWareHouse=" + (ddlRoomType.SelectedIndex - 1).ToString();
            }
            com.bindData(" " + Message.RoomID + ",bui." + Message.Address + " as 'Building'," + Message.Floor + "," + Message.RoomNo
                + " as 'Room No',CAST(IsWareHouse as varchar(MAX)) as 'Is Warehouse'", condition + " order by bui." + Message.Address,
                Message.RoomTable + " rom join " + Message.BuildingTable + " bui on rom." + Message.BuildingID
                + "=bui." + Message.BuildingID, grdRoom);
        }
        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdRoom.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdRoom.Rows)
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
        protected void grdRoom_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if(e.Row.RowType==DataControlRowType.DataRow){
                if (e.Row.Cells[5].Text == "0")
                {
                    e.Row.Cells[5].Text = "No";
                }
                else
                {
                    e.Row.Cells[5].Text = "Yes";
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = "ListRoom.aspx?ID=" + Server.HtmlDecode(e.Row.Cells[1].Text);
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session.Remove("RID");
            pnlAdd.Visible = true; 
            pnlList.Visible = false;
            ddlBuilding.Visible = true;
            txtBuilding.Visible=false;
            ddlFloor.Items.Clear();
            ddlFloor.Items.Add("Please select");
            txtRoomNo.Text = "";
            chkWareHouse.Checked = false;
            if (Session["UserLevel"].ToString() == "2")
            {
                //Get building list
                DataTable building = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                    + Message.UserID + "=" + Session["UserID"]);
                string[] buildingList = building.Rows[0][0].ToString().Split('|');
                ddlBuilding.Items.Clear();
                ddlBuilding.Items.Add("Please select");
                ddlFloor.Items.Clear();
                ddlFloor.Items.Add("Please select");
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
            else {
                com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlBuilding, " where " + Message.Status
                    + "<>3", true, "Please select");
                ddlFloor.Items.Clear();
                ddlFloor.Items.Add("Please select");
            }
        }

        protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = com.getData(Message.BuildingTable, Message.NumberFloor, " where "
                + Message.BuildingID + "=" + ddlBuilding.SelectedValue);
            ddlFloor.Items.Clear();
            ddlFloor.Items.Add("Please select");
            for (int i = 1; i < int.Parse(dt.Rows[0][0].ToString()) + 1; i++) {
                ddlFloor.Items.Add(i.ToString());
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (Session["RID"] == null)
            {
                ddlBuilding.SelectedIndex = 0;
                ddlFloor.Items.Clear();
                ddlFloor.Items.Add("Please select");
                txtRoomNo.Text = "";
                chkWareHouse.Checked = false;
            }
            else {
                Class.Room newRoom = new Class.Room(Session["RID"].ToString());
                Class.Building newBuilding = new Class.Building(newRoom.BuildingID);
                ddlBuilding.Visible = false;
                txtBuilding.Visible = true;
                txtBuilding.Text = newBuilding.Address;
                ddlFloor.Items.Clear();
                ddlFloor.Items.Add("Please select");
                for (int i = 1; i < int.Parse(newBuilding.NumberFloor) + 1; i++)
                {
                    ddlFloor.Items.Add(i.ToString());
                }
                ddlFloor.SelectedValue = newRoom.Floor;
                txtRoomNo.Text = newRoom.RoomNo;
                if (newRoom.IsWareHouse == "0" || newRoom.IsWareHouse == "False")
                {
                    chkWareHouse.Checked = false;
                }
                else
                {
                    chkWareHouse.Checked = true;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("RID");
            Response.Redirect("ListRoom.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Class.Room newRoom;
            if (Session["RID"] == null)
            {
                newRoom = new Class.Room();
                newRoom.BuildingID = ddlBuilding.SelectedValue;
            }
            else {
                newRoom = new Class.Room(Session["RID"].ToString());
            }
            
            newRoom.Floor = ddlFloor.SelectedValue;
            newRoom.RoomNo = txtRoomNo.Text;
            if (chkWareHouse.Checked)
            {
                newRoom.IsWareHouse = "1";
            }
            else {
                newRoom.IsWareHouse = "0";
            }
            if (Session["RID"] == null)
            {
                newRoom.AddRoom();
                ddlBuilding.SelectedIndex = 0;
                ddlFloor.Items.Clear();
                ddlFloor.Items.Add("Please select");
                txtRoomNo.Text = "";
                chkWareHouse.Checked = false;
            }
            else {
                newRoom.UpdateRoom();
            }
            lblSuccess.Text = "Success";
            Session.Remove("RID");
            Response.Redirect("ListRoom.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (GridViewRow gr in grdRoom.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    pnlList.Visible = false;
                    pnlAdd.Visible = true;
                    Class.Room newRoom = new Class.Room(gr.Cells[1].Text);
                    Class.Building newBuilding = new Class.Building(newRoom.BuildingID);
                    ddlBuilding.Visible = false;
                    txtBuilding.Visible = true;
                    Session["RID"] = newRoom.RoomID;
                    txtBuilding.Text = newBuilding.Address;
                    ddlFloor.Items.Clear();
                    ddlFloor.Items.Add("Please select");
                    for (int i = 1; i < int.Parse(newBuilding.NumberFloor) + 1; i++)
                    {
                        ddlFloor.Items.Add(i.ToString());
                    }
                    ddlFloor.SelectedValue = newRoom.Floor;
                    txtRoomNo.Text = newRoom.RoomNo;
                    if (newRoom.IsWareHouse == "False" || newRoom.IsWareHouse == "0")
                    {
                        chkWareHouse.Checked = false;
                    }
                    else {
                        chkWareHouse.Checked = true;
                    }
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
            foreach (GridViewRow gr in grdRoom.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    isCheck = true;
                    Class.Room newRoom = new Class.Room(gr.Cells[1].Text);
                    DataTable dt = com.getData(Message.FurnitureTable, "*", " where " + Message.CurrentRoom
                        + "=" + newRoom.RoomID + " and (" + Message.ApproveDelete + "<>1 or ApproveDelete is NULL)");
                    if (dt.Rows.Count > 0)
                    {
                        lblError.Text = lblError.Text + "Room " + newRoom.RoomNo + " can not be remove because it contain some furniture. Please remove these furniture first<br>";
                    }
                    else
                    {
                        newRoom.RemoveRoom();
                        lblSuccess.Text = lblSuccess.Text + "Remove room " + newRoom.RoomNo + " success<br>";
                    }
                }
            }
            if (isCheck == false)
            {
                lblError.Text = "Please select a row!";
            }
            string condition = "";
            if (Session["UserLevel"].ToString() == "2")
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
                        + Message.BuildingID + "=" + buildingList[i] + " and " + Message.Status + "<>3");
                    if (buildingAddress.Rows.Count > 0)
                    {
                        ListItem buildingItem = new ListItem(buildingAddress.Rows[0][0].ToString(), buildingAddress.Rows[0][1].ToString());
                        ddlChooseBuilding.Items.Add(buildingItem);
                        buildingCondition = buildingCondition + buildingList[i] + ",";
                    }
                }
                buildingCondition = buildingCondition.Remove(buildingCondition.Length - 1, 1);
                condition = " where rom." + Message.BuildingID + " in (" + buildingCondition + ") and rom." + Message.Status + "<>3";
            }
            else
            {
                condition = " where rom." + Message.Status + "<>3";
            }
            if (ddlChooseBuilding.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and rom." + Message.BuildingID + "=" + ddlChooseBuilding.SelectedValue;
            }
            if (ddlRoomType.SelectedIndex == 0) { }
            else
            {
                condition = condition + " and IsWareHouse=" + (ddlRoomType.SelectedIndex - 1).ToString();
            }
            com.bindData(" " + Message.RoomID + ",bui." + Message.Address + " as 'Building'," + Message.Floor + "," + Message.RoomNo
                + " as 'Room No',CAST(IsWareHouse as varchar(MAX)) as 'Is Warehouse'", condition + " order by bui." + Message.Address,
                Message.RoomTable + " rom join " + Message.BuildingTable + " bui on rom." + Message.BuildingID
                + "=bui." + Message.BuildingID, grdRoom);
        }
    }
}