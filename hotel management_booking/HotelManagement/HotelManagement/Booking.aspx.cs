using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class Booking : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.MaintainScrollPositionOnPostBack = true;
                Page.Title = "Booking Online";
                Session["MenuID"] = "1";
                if (!IsPostBack)
                {
                    com.bindData(Message.BuildingID + "," + Message.District + "," + Message.Address + "," + Message.Price + " as 'Price ($)'", " where "
                        + Message.Status + "<2 order by " + Message.District + "," + Message.Price + " desc", Message.BuildingTable, grdBuilding);
                }
            }
            catch (Exception)
            {
            }
        }

        protected void rdoBuilding_CheckedChanged(object sender, System.EventArgs e)
        {
            try
            {
                //Clear the existing selected row 
                foreach (GridViewRow oldrow in grdBuilding.Rows)
                {
                    ((RadioButton)oldrow.FindControl("rdoBuilding")).Checked = false;
                }

                //Set the new selected row
                RadioButton rb = (RadioButton)sender;
                GridViewRow row = (GridViewRow)rb.NamingContainer;
                ((RadioButton)row.FindControl("rdoBuilding")).Checked = true;

                foreach (GridViewRow gr in grdBuilding.Rows)
                {
                    RadioButton rdo = (RadioButton)gr.Cells[0].FindControl("rdoBuilding");
                    if (rdo.Checked == true)
                    {
                        Session["BuildingID"] = gr.Cells[1].Text.Trim();
                        string[] column = new string[1];
                        column[0] = "Chi tiết";
                        com.bindDataBlankColumn(Message.RoomID + "," + Message.Floor + "," + Message.RoomNo + ","
                            + Message.BedRoom + "," + Message.BathRoom + "," + Message.Area + "," + Message.Price, " where "
                            + Message.IsWarehouse + "='0' and " + Message.Status + "='0' and "
                            + Message.BuildingID + "=" + gr.Cells[1].Text, Message.RoomTable, grdRoom, 1, column);
                        break;
                    }
                }
            }
            catch (Exception)
            {
            }
        }
        protected void grdBuilding_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if (e.Row.RowType == DataControlRowType.DataRow) {
                e.Row.Cells[3].Text = "<a href=\"House.aspx?ID=" + e.Row.Cells[1].Text + "\">" + e.Row.Cells[3].Text + "</a>";
            }
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
            if (e.Row.RowType == DataControlRowType.DataRow) {
                e.Row.Cells[8].Text = "<a style=\"color:Blue;\" target=\"_blank\" href=\"Room.aspx?ID=" + e.Row.Cells[1].Text + "\">Click to see room details!</a>";
            }
        }
        protected void grdRoomBook_RowDataBound(object sender, GridViewRowEventArgs e)
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
        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < grdBuilding.Rows.Count; i++)
                {
                    RadioButton rdo = (RadioButton)grdBuilding.Rows[i].Cells[0].FindControl("rdoBuilding");
                    if (rdo.Checked == true)
                    {
                        Session["BuildingID"] = grdBuilding.Rows[i].Cells[1].Text;
                        break;
                    }
                }
                if (Session["BuildingID"] == null)
                {
                    lblError.Text = "Xin hãy chọn a building!";
                }
                else
                {
                    for (int i = 0; i < grdRoom.Rows.Count; i++)
                    {
                        CheckBox chk = (CheckBox)grdRoom.Rows[i].Cells[0].FindControl("myCheckBox");
                        if (chk.Checked == true)
                        {
                            if (Session["RoomID"] == null)
                            {
                                Session["RoomID"] = grdRoom.Rows[0].Cells[1].Text + ",";
                            }
                            else
                            {
                                Session["RoomID"] = Session["RoomID"].ToString() + grdRoom.Rows[i].Cells[1].Text + ",";
                            }
                        }
                    }
                    if (Session["RoomID"] == null)
                    {
                        lblError.Text = "Xin hãy chọn 1 or more room!";
                    }
                    else
                    {
                        Session["RoomID"] = Session["RoomID"].ToString().Remove(Session["RoomID"].ToString().Length - 1, 1);
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Class.Building building = new Class.Building(Session["BuildingID"].ToString());
                        lblBuildingAddress.Text = building.Address;
                        com.bindData(Message.Floor + "," + Message.RoomNo + ","
                            + Message.BedRoom + "," + Message.BathRoom + "," + Message.Area + "," + Message.Price, " where "
                            + Message.RoomID + " in (" + Session["RoomID"].ToString() + ")", Message.RoomTable, grdRoomBook);
                        float totalPrice = 0;
                        for (int i = 0; i < grdRoomBook.Rows.Count; i++)
                        {
                            if (grdRoomBook.Rows[i].Cells[5].Text != "@nbsp;")
                            {
                                totalPrice = totalPrice + float.Parse(grdRoomBook.Rows[i].Cells[5].Text);
                            }
                        }
                        lblTotal.Text = "Total price: " + totalPrice;
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Session.Remove("BuildingID");
            Session.Remove("RoomID");
        }
    }
}