using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class RecieveFurniture : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Confirm Recieve Furniture";
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
                    Session["MenuID"] = "2";
                }
                else
                {
                    Session["MenuID"] = "2";
                }
                string[] column = new string[1];
                column[0] = "Trạng thái";
                string condition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building1 = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList1 = building1.Rows[0][0].ToString().Split('|');
                    for (int i = 0; i < buildingList1.Length - 1; i++)
                    {
                        DataTable buildingAddress1 = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList1[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress1.Rows.Count > 0)
                        {
                            condition = condition + buildingList1[i] + ",";
                        }
                    }
                    condition = condition.Remove(condition.Length - 1, 1);
                    condition = " and fur." + Message.CurrentBuilding + " in (" + condition + ")";
                }
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", fur." + Message.MadeIn
                    + " as 'Made In',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No'",
                    " where fur." + Message.TargetRoomID + " is not NULL" + condition, "Furniture fur join Building bui on fur.CurrentBuildingID"
                    + "=bui.BuildingID join Room rom on fur.CurrentRoomID=rom.RoomID", grdData, 1, column);
                DataTable dt = com.getData("Furniture fur join Building bui on fur.CurrentBuildingID"
                    + "=bui.BuildingID join Room rom on fur.CurrentRoomID=rom.RoomID", "fur." + Message.FurnitureID + ",fur." + Message.Name + ", fur." + Message.MadeIn
                    + " as 'Made In',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No'",
                    " where fur." + Message.TargetRoomID + " is not NULL" + condition);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Chưa nhận");
                    ddlApprove.Items.Add("Đã nhận");
                    ddlApprove.SelectedValue = "Chưa nhận";
                    grdData.Rows[i].Cells[5].Controls.Add(ddlApprove);
                }
            }
            catch (Exception)
            {
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if (e.Row.RowType != DataControlRowType.DataRow) {
                e.Row.Cells[1].Text = "Tên";
                e.Row.Cells[2].Text = "Xuất xứ";
                e.Row.Cells[3].Text = "Tòa nhà";
                e.Row.Cells[4].Text = "Phòng";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string content = "";
                for (int i = 0; i < grdData.Rows.Count; i++)
                {
                    DropDownList ddlApprove = (DropDownList)grdData.Rows[i].Cells[5].FindControl("ddlApprove" + i);
                    Class.Furniture newFurniture = new Class.Furniture(grdData.Rows[i].Cells[0].Text);
                    if (ddlApprove.SelectedValue == "Đã nhận")
                    {
                        com.updateTable(Message.FurnitureTable, Message.TargetRoomID + "=NULL where "
                            + Message.FurnitureID + "=" + newFurniture.FurID);
                        content = content + grdData.Rows[i].Cells[1].Text + " đã được gửi tới " + grdData.Rows[i].Cells[3].Text + "<br>";
                    }
                }
                DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                        + ">=3");
                for (int i = 0; i < email.Rows.Count; i++)
                {
                    com.SendMail(email.Rows[i][0].ToString(), "Xác nhận nhận bàn giao vật tư từ " + Session["FullName"], content);
                }
                grdData.DataSource = null;
                grdData.DataBind();
                string[] column = new string[1];
                column[0] = "Trạng thái";
                string condition = "";
                if (Session["UserLevel"].ToString() == "2")
                {
                    //Get building list
                    DataTable building1 = com.getData(Message.UserAccountTable, Message.RoomManage, " where "
                        + Message.UserID + "=" + Session["UserID"]);
                    string[] buildingList1 = building1.Rows[0][0].ToString().Split('|');
                    for (int i = 0; i < buildingList1.Length - 1; i++)
                    {
                        DataTable buildingAddress1 = com.getData(Message.BuildingTable, Message.Address + "," + Message.BuildingID, " where "
                            + Message.BuildingID + "=" + buildingList1[i] + " and " + Message.Status + "<>3");
                        if (buildingAddress1.Rows.Count > 0)
                        {
                            condition = condition + buildingList1[i] + ",";
                        }
                    }
                    condition = condition.Remove(condition.Length - 1, 1);
                    condition = " and fur." + Message.CurrentBuilding + " in (" + condition + ")";
                }
                com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", fur." + Message.MadeIn
                    + " as 'Made In',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No'",
                    " where fur." + Message.TargetRoomID + " is not NULL" + condition, "Furniture fur join Building bui on fur.CurrentBuildingID"
                    + "=bui.BuildingID join Room rom on fur.CurrentRoomID=rom.RoomID", grdData, 1, column);
                DataTable dt = com.getData("Furniture fur join Building bui on fur.CurrentBuildingID"
                    + "=bui.BuildingID join Room rom on fur.CurrentRoomID=rom.RoomID", "fur." + Message.FurnitureID + ",fur." + Message.Name + ", fur." + Message.MadeIn
                    + " as 'Made In',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No'",
                    " where fur." + Message.TargetRoomID + " is not NULL" + condition);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Chưa nhận");
                    ddlApprove.Items.Add("Đã nhận");
                    ddlApprove.SelectedValue = "Chưa nhận";
                    grdData.Rows[i].Cells[5].Controls.Add(ddlApprove);
                }
                lblSuccess.Text = "Thành công";
            }
            catch (Exception)
            {
            }
        }
    }
}