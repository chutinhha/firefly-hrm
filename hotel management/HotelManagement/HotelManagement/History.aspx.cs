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
    public partial class History : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Lịch sử";
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
                string FurnitureID = Request.QueryString["ID"];
                if (!IsPostBack)
                {
                    if (Session["UserLevel"].ToString() == "2")
                    {
                        Session["MenuID"] = "2";
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
                        Session["MenuID"] = "2";
                        com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlBuilding, "", true, "Xin hãy chọn");
                    }
                    ddlRoom.Items.Clear();
                    ddlRoom.Items.Add("Xin hãy chọn");
                    if (FurnitureID != null)
                    {
                        com.bindData("fu.FurnitureID,fu.Name,bu.Address +' - Room '+ cast(ro.RoomNo as varchar(MAX)) as 'Address',bu1.Address +' - Room '+ cast(ro1.RoomNo as varchar(MAX)) as 'Address1', fh.MoveDate, us.FullName as 'Mover',fh.Reason",
                        "where fu.FurnitureID=" + FurnitureID + " order by fh.FurnitureID,fh.MoveDate",
                        "FurnitureHistory fh join Furniture fu on fh.FurnitureID = fu.FurnitureID "
                        + "join Building bu on bu.BuildingID = fh.CurrentBuildingID join UserAccount us "
                        + "on us.UserID = fh.HandoverID join Room ro on ro.RoomID = fh.CurrentRoomID "
                        + "join Building bu1 on bu1.BuildingID = fh.TargetBuildingID "
                        + "join Room ro1 on ro1.RoomID = fh.TargetRoomID ", grdFurniture);
                        UpdatePanel1.Visible = false;
                    }
                    else
                    {
                        UpdatePanel1.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }
        protected void grdFurniture_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
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
            e.Row.Cells[2].Attributes.Add("width", "150px");
            e.Row.Cells[3].Attributes.Add("width", "150px");
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = "Vật tư ID";
                e.Row.Cells[0].Attributes.Add("width", "65px");
                e.Row.Cells[1].Text = "Tên";
                e.Row.Cells[2].Text = "Điểm xuất phát";
                e.Row.Cells[3].Text = "Điểm đến";
                e.Row.Cells[4].Text = "Ngày chuyển";

                e.Row.Cells[5].Text = "Người bàn giao";
                e.Row.Cells[5].Attributes.Add("width", "105px");
                e.Row.Cells[6].Text = "Lý do";
                e.Row.Cells[6].Attributes.Add("width", "40px");
            }
            else {
                e.Row.Cells[4].Text = DateTime.Parse(e.Row.Cells[4].Text).ToShortDateString();
                
            }
        }
        protected void txtStart_OnChanged(object sender, EventArgs e)
        {
            
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string condition = "";
                try
                {
                    this.startDate = Request.Form["txtStart"].ToString().Trim();
                    DateTime date = DateTime.Parse(this.startDate);
                    condition = " and fh.MoveDate>='" + date.ToString() + "'";
                }
                catch (FormatException) { }
                try
                {
                    this.endDate = Request.Form["txtEnd"].ToString().Trim();
                    DateTime date = DateTime.Parse(this.endDate);
                    condition = condition + " and fh.MoveDate<='" + date.ToString() + "'";
                }
                catch (FormatException) { }
                if (ddlBuilding.Visible == true)
                {
                    if (ddlBuilding.SelectedIndex != 0)
                    {
                        condition = condition + " and fu.CurrentBuildingID=" + ddlBuilding.SelectedValue;
                    }
                    if (ddlRoom.SelectedIndex != 0)
                    {
                        condition = condition + " and fu.CurrentRoomID=" + ddlRoom.SelectedValue;
                    }
                    else {
                        if (Session["UserLevel"].ToString() == "2") {
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
                            condition = condition + " and fu.CurrentBuildingID in ("+buildingCondition1+")";
                        }
                    }
                }
                string FurnitureID = Request.QueryString["ID"];
                if (FurnitureID != null)
                {
                    com.bindData("fu.FurnitureID,fu.Name,bu.Address +' - Room '+ cast(ro.RoomNo as varchar(MAX)) as 'Address',bu1.Address +' - Room '+ cast(ro1.RoomNo as varchar(MAX)) as 'Address1', fh.MoveDate, us.FullName as 'Mover',fh.Reason",
                        "where fu.FurnitureID=" + FurnitureID + condition + " order by fh.FurnitureID,fh.MoveDate",
                        "FurnitureHistory fh join Furniture fu on fh.FurnitureID = fu.FurnitureID "
                        + "join Building bu on bu.BuildingID = fh.CurrentBuildingID join UserAccount us "
                        + "on us.UserID = fh.HandoverID join Room ro on ro.RoomID = fh.CurrentRoomID "
                        + "join Building bu1 on bu1.BuildingID = fh.TargetBuildingID "
                        + "join Room ro1 on ro1.RoomID = fh.TargetRoomID ", grdFurniture);
                }
                else
                {
                    com.bindData("fu.FurnitureID,fu.Name,bu.Address +' - Room '+ cast(ro.RoomNo as varchar(MAX)) as 'Address',bu1.Address +' - Room '+ cast(ro1.RoomNo as varchar(MAX)) as 'Address1', fh.MoveDate, us.FullName as 'Mover',fh.Reason",
                        "where 1=1 " + condition + " order by fh.FurnitureID,fh.MoveDate",
                        "FurnitureHistory fh join Furniture fu on fh.FurnitureID = fu.FurnitureID "
                        +"join Building bu on bu.BuildingID = fh.CurrentBuildingID join UserAccount us "
                        +"on us.UserID = fh.HandoverID join Room ro on ro.RoomID = fh.CurrentRoomID "
                        +"join Building bu1 on bu1.BuildingID = fh.TargetBuildingID "
                        + "join Room ro1 on ro1.RoomID = fh.TargetRoomID ", grdFurniture);
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }

        protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlBuilding.SelectedIndex != 0)
                {
                    com.SetItemList(Message.RoomNo + "," + Message.RoomID, Message.RoomTable, ddlRoom, " where " + Message.BuildingID
                        + "=" + ddlBuilding.SelectedValue, true, "Xin hãy chọn");
                }
                else
                {
                    ddlRoom.Items.Clear();
                    ddlRoom.Items.Add("Xin hãy chọn");
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }
    }
}