using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class Approve : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLevel"] != null)
            {
                if (Session["UserLevel"].ToString() == "3") { }
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
            lblSuccess.Text = "";
            string[] column = new string[1];
            column[0] = "Approve";
            DataTable dt;
            if (ddlShow.SelectedValue == "All")
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
            else if (ddlShow.SelectedValue == "Pending Approve")
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
                dt = com.getData( Message.FurnitureTable
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
                dt = com.getData( Message.FurnitureTable
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
                ddlApprove.Items.Add("Approve");
                ddlApprove.Items.Add("Pending Approve");
                ddlApprove.Items.Add("Reject");
                //ddlApprove.AutoPostBack = true;
                if (dt.Rows[i][0].ToString() == "0")
                {
                    ddlApprove.SelectedValue = "Pending Approve";
                }
                else
                {
                    ddlApprove.SelectedValue = "Reject";
                }
                grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
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
        }

        protected void ddlShow_SelectedIndexChanged(object sender, EventArgs e)
        {     
            grdData.DataSource = null;
            grdData.DataBind();
            string[] column = new string[1];
            column[0] = "Approve";
            DataTable dt;
            if (ddlShow.SelectedValue == "All")
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
            else if (ddlShow.SelectedValue == "Pending Approve")
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
                ddlApprove.Items.Add("Approve");
                ddlApprove.Items.Add("Pending Approve");
                ddlApprove.Items.Add("Reject");
                //ddlApprove.AutoPostBack = true;
                if (dt.Rows[i][0].ToString() == "0")
                {
                    ddlApprove.SelectedValue = "Pending Approve";
                }
                else
                {
                    ddlApprove.SelectedValue = "Reject";
                }
                grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string content = "";
            for (int i = 0; i < grdData.Rows.Count; i++) {
                DropDownList ddlApprove = (DropDownList)grdData.Rows[i].Cells[6].FindControl("ddlApprove"+i);
                Class.Furniture newFurniture = new Class.Furniture(grdData.Rows[i].Cells[0].Text);
                if (ddlApprove.SelectedValue == "Approve") {
                    newFurniture.RemoveFurniture(1);
                    content = content + "Furniture: " + grdData.Rows[i].Cells[1].Text + "<br/> Room: "
                        + grdData.Rows[i].Cells[4].Text + "<br/> Building: "
                        + grdData.Rows[i].Cells[3].Text + "<br/> Approved<br/><br/>";
                }
                else if (ddlApprove.SelectedValue == "Pending Approve") {
                    newFurniture.RemoveFurniture(0);
                    content = content + "Furniture: " + grdData.Rows[i].Cells[1].Text + "<br/> Room: "
                        + grdData.Rows[i].Cells[4].Text + "<br/> Building: "
                        + grdData.Rows[i].Cells[3].Text + "<br/> Pending Approve<br/><br/>";
                }
                else if (ddlApprove.SelectedValue == "Reject") {
                    newFurniture.RemoveFurniture(2);
                    content = content + "Furniture: " + grdData.Rows[i].Cells[1].Text + "<br/> Room: "
                        + grdData.Rows[i].Cells[4].Text + "<br/> Building: "
                        + grdData.Rows[i].Cells[3].Text + "<br/> Rejected<br/><br/>";
                }
            }
            grdData.DataSource = null;
            grdData.DataBind();
            string[] column = new string[1];
            column[0] = "Approve";
            DataTable dt;
            if (ddlShow.SelectedValue == "All")
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
            else if (ddlShow.SelectedValue == "Pending Approve")
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
                ddlApprove.Items.Add("Approve");
                ddlApprove.Items.Add("Pending Approve");
                ddlApprove.Items.Add("Reject");
                //ddlApprove.AutoPostBack = true;
                if (dt.Rows[i][0].ToString() == "0")
                {
                    ddlApprove.SelectedValue = "Pending Approve";
                }
                else
                {
                    ddlApprove.SelectedValue = "Reject";
                }
                grdData.Rows[i].Cells[6].Controls.Add(ddlApprove);
            }
            com.SendMail(Message.targetEmail, "Confirm remove furniture from " + Session["FullName"], content);
            lblSuccess.Text = "Success! Email were send";
        }       
    }
}