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
            Page.MaintainScrollPositionOnPostBack = true;
            Page.Title = "Booking Online";
            Session["MenuID"] = "1";
            if (!IsPostBack) {
                com.bindData(Message.BuildingID + ","+Message.District+"," + Message.Address + "," + Message.Price+" as 'Price ($)'", " where "
                    + Message.Status + "<2 order by "+Message.District+","+Message.Price+" desc", Message.BuildingTable, grdBuilding);
            }
        }

        protected void rdoBuilding_CheckedChanged(object sender, System.EventArgs e)
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
                    com.bindData(Message.RoomID + "," + Message.Floor + "," + Message.RoomNo, " where "
                        + Message.IsWarehouse + "='0' and " + Message.Status + "='0' and "
                        +Message.BuildingID+"="+gr.Cells[1].Text, Message.RoomTable, grdRoom);
                    break;
                }
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
        }
    }
}