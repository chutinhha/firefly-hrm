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
    public partial class Approve : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Approve Remove Furniture";
                if (Session["UserLevel"] != null)
                {
                    if (int.Parse(Session["UserLevel"].ToString()) >= 3) { }
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
                if (!IsPostBack)
                {
                    com.SetItemList(Message.Address + "," + Message.BuildingID, Message.BuildingTable, ddlMove, " where "
                        + Message.BuildingTypeID + "=5", true, "Xin hãy chọn");
                }
                string[] column = new string[1];
                column[0] = "Xác nhận";
                DataTable dt;
                if (ddlShow.SelectedValue == "Tất cả")
                {
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "<>1",
                        Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                        grdData, 1, column);
                    dt = com.getData(Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                        " where fur." + Message.ApproveDelete + "<>1");
                }
                else if (ddlShow.SelectedValue == "Chờ xác nhận")
                {
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "=0",
                        Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                        grdData, 1, column);
                    dt = com.getData(Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                        " where fur." + Message.ApproveDelete + "=0");
                }
                else
                {
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "=2",
                        Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                        grdData, 1, column);
                    dt = com.getData(Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                        " where fur." + Message.ApproveDelete + "=2");
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Xác nhận");
                    ddlApprove.Items.Add("Chờ xác nhận");
                    ddlApprove.Items.Add("Từ chối");
                    //ddlApprove.AutoPostBack = true;
                    if (dt.Rows[i][0].ToString() == "0")
                    {
                        ddlApprove.SelectedValue = "Chờ xác nhận";
                    }
                    else
                    {
                        ddlApprove.SelectedValue = "Từ chối";
                    }
                    grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[2].Visible = false;
            e.Row.Cells[3].Attributes.Add("width", "240px");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[5].Text != "&nbsp;")
                {
                    e.Row.Cells[5].Text = DateTime.Parse(e.Row.Cells[5].Text).ToShortDateString();
                }
            }
            else {
                e.Row.Cells[2].Text = "Tên";
                e.Row.Cells[3].Text = "Tòa nhà";
                e.Row.Cells[4].Text = "Phòng";
                e.Row.Cells[5].Text = "Hết hạn BH";
            }
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
        }

        protected void ddlShow_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                grdData.DataSource = null;
                grdData.DataBind();
                string[] column = new string[1];
                column[0] = "Xác nhận";
                DataTable dt;
                if (ddlShow.SelectedValue == "Tất cả")
                {
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "<>1",
                        Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                        grdData, 1, column);
                    dt = com.getData(Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                        " where fur." + Message.ApproveDelete + "<>1");
                }
                else if (ddlShow.SelectedValue == "Chờ xác nhận")
                {
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "=0",
                        Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                        grdData, 1, column);
                    dt = com.getData(Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                        " where fur." + Message.ApproveDelete + "=0");
                }
                else
                {
                    com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                        + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                        + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "=2",
                        Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                        grdData, 1, column);
                    dt = com.getData(Message.FurnitureTable
                        + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                        + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                        + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                        + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                        " where fur." + Message.ApproveDelete + "=2");
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlApprove = new DropDownList();
                    ddlApprove.ID = "ddlApprove" + i;
                    ddlApprove.Items.Add("Xác nhận");
                    ddlApprove.Items.Add("Chờ xác nhận");
                    ddlApprove.Items.Add("Từ chối");
                    //ddlApprove.AutoPostBack = true;
                    if (dt.Rows[i][0].ToString() == "0")
                    {
                        ddlApprove.SelectedValue = "Chờ xác nhận";
                    }
                    else
                    {
                        ddlApprove.SelectedValue = "Từ chối";
                    }
                    grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlMove.SelectedIndex == 0)
                {
                    lblError.Text = "Xin hãy chọn tòa nhà để chuyển vật tư!";
                }
                else
                {
                    string content = "";
                    List<string> buildingManager = new List<string>();
                    List<string> mailContent = new List<string>();
                    for (int i = 0; i < grdData.Rows.Count; i++)
                    {
                        DropDownList ddlApprove = (DropDownList)grdData.Rows[i].Cells[6].FindControl("ddlApprove" + i);
                        Class.Furniture newFurniture = new Class.Furniture(grdData.Rows[i].Cells[0].Text);
                        if (ddlApprove.SelectedValue == "Xác nhận")
                        {
                            newFurniture.RemoveFurniture(1);
                            content = "Vật tư: " + grdData.Rows[i].Cells[1].Text + "<br/> Phòng: "
                                + grdData.Rows[i].Cells[4].Text + "<br/> Tòa nhà: "
                                + grdData.Rows[i].Cells[3].Text + "<br/> Đã được chấp thuận yêu cầu<br/><br/>";
                            com.updateTable(Message.FurnitureTable, Message.CurrentBuilding + "=" + ddlMove.SelectedValue
                                + "," + Message.CurrentRoom + "=NULL where " + Message.FurnitureID + "=" + newFurniture.FurID);
                        }
                        else if (ddlApprove.SelectedValue == "Chờ xác nhận")
                        {
                            newFurniture.RemoveFurniture(0);
                            content = "Vật tư: " + grdData.Rows[i].Cells[1].Text + "<br/> Phòng: "
                                + grdData.Rows[i].Cells[4].Text + "<br/> Tòa nhà: "
                                + grdData.Rows[i].Cells[3].Text + "<br/> Chờ xác nhận yêu cầu<br/><br/>";
                        }
                        else if (ddlApprove.SelectedValue == "Từ chối")
                        {
                            newFurniture.RemoveFurniture(2);
                            content = "Furniture: " + grdData.Rows[i].Cells[1].Text + "<br/> Phòng: "
                                + grdData.Rows[i].Cells[4].Text + "<br/> Tòa nhà: "
                                + grdData.Rows[i].Cells[3].Text + "<br/> Đã bị từ chối<br/><br/>";
                        }
                        DataTable dtEmail = com.getData(Message.UserAccountTable, Message.Email, " where "
                            + Message.RoomManage + " like '%" + newFurniture.CurrentBuilding + "|%'");
                        for (int j = 0; j < dtEmail.Rows.Count; j++)
                        {
                            bool isExist = false;
                            int id = 0;
                            for (int k = 0; k < buildingManager.Count; k++)
                            {
                                if (dtEmail.Rows[j][0].ToString() == buildingManager[k])
                                {
                                    isExist = true;
                                    id = k;
                                    break;
                                }
                            }
                            if (isExist == true)
                            {
                                mailContent[id] = mailContent[id] + content;
                            }
                            else
                            {
                                buildingManager.Add(dtEmail.Rows[j][0].ToString());
                                mailContent.Add(content);
                            }
                        }
                    }
                    grdData.DataSource = null;
                    grdData.DataBind();
                    string[] column = new string[1];
                    column[0] = "Xác nhận";
                    DataTable dt;
                    if (ddlShow.SelectedValue == "Tất cả")
                    {
                        com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                            + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                            + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "<>1",
                            Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                            grdData, 1, column);
                        dt = com.getData(Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                            " where fur." + Message.ApproveDelete + "<>1");
                    }
                    else if (ddlShow.SelectedValue == "Chờ xác nhận")
                    {
                        com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                            + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                            + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "=0",
                            Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                            grdData, 1, column);
                        dt = com.getData(Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                            " where fur." + Message.ApproveDelete + "=0");
                    }
                    else
                    {
                        com.bindDataBlankColumn("fur." + Message.FurnitureID + ",fur." + Message.Name + ", furType."
                            + Message.Description + " as 'Furniture Type',bui." + Message.Address + " as 'Building',rom." + Message.RoomNo + " as 'Room No', fur."
                            + Message.EndWarranty + " as 'End Warranty'", " where fur." + Message.ApproveDelete + "=2",
                            Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom,
                            grdData, 1, column);
                        dt = com.getData(Message.FurnitureTable
                            + " fur join " + Message.BuildingTable + " bui on fur." + Message.CurrentBuilding
                            + " = bui." + Message.BuildingID + " join " + Message.FurnitureTypeTable + " furType on "
                            + "fur." + Message.FurnitureType + " = furType." + Message.FurnitureType + " join "
                            + Message.RoomTable + " rom on rom." + Message.RoomID + " = fur." + Message.CurrentRoom, Message.ApproveDelete,
                            " where fur." + Message.ApproveDelete + "=2");
                    }
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DropDownList ddlApprove = new DropDownList();
                        ddlApprove.ID = "ddlApprove" + i;
                        ddlApprove.Items.Add("Xác nhận");
                        ddlApprove.Items.Add("Chờ xác nhận");
                        ddlApprove.Items.Add("Từ chối");
                        //ddlApprove.AutoPostBack = true;
                        if (dt.Rows[i][0].ToString() == "0")
                        {
                            ddlApprove.SelectedValue = "Chờ xác nhận";
                        }
                        else
                        {
                            ddlApprove.SelectedValue = "Từ chối";
                        }
                        grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
                    }
                    content = "";
                    for (int i = 0; i < buildingManager.Count; i++)
                    {
                        content = content + mailContent[i];
                        com.SendMail(buildingManager[i], "Xác nhận gỡ bỏ vật tư từ " + Session["FullName"], mailContent[i]);
                    }
                    DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                        + ">=3");
                    for (int i = 0; i < email.Rows.Count; i++)
                    {
                        com.SendMail(email.Rows[i][0].ToString(), "Xác nhận gỡ bỏ vật tư từ " + Session["FullName"], content);
                    }
                    lblError.Text = "";
                    lblSuccess.Text = "Thành công! Email đã được gửi đi";
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }       
    }
}