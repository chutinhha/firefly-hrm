using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class Room : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Phòng";
                Session["MenuID"] = "1";
                string RoomID = Request.QueryString["ID"];
                if (RoomID != null)
                {
                    Class.Room currentRoom = new Class.Room(RoomID);
                    DataTable dt = com.getData(Message.BuildingTable + " bui join " + Message.RoomTable + " rom on bui." + Message.BuildingID
                        + "=rom." + Message.BuildingID, Message.Address, " where " + Message.RoomID + "=" + RoomID);
                    pnlContent.Controls.Add(new LiteralControl("<br><div class=\"componentheading\">" + dt.Rows[0][0].ToString() + " - Room "
                        + currentRoom.RoomNo + "</div><div class=\"table\">"));
                    string[] pictures = currentRoom.Picture.Split('|');
                    pnlContent.Controls.Add(new LiteralControl("<table width=\"100%\"><tr><td width=\"65%\" style=\"border:none;\">"));
                    for (int i = 0; i < pictures.Length; i++)
                    {
                        if (pictures[i].Trim() != "")
                        {
                            pnlContent.Controls.Add(new LiteralControl("<img width=\"95%\" src=Images/" + pictures[i] + ">"));
                        }
                    }
                    if (pictures.Length == 1 && pictures[0].Trim() == "")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<img width=\"300px\" src=\"/Images/noimage.jpg\">"));
                    }
                    pnlContent.Controls.Add(new LiteralControl("</td><td style=\"vertical-align:top;border:none;\"><table cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #ccc;width:100%\"><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Available</td><td>" + currentRoom.isAvailable() + "</td></tr><tr>"));
                    if (currentRoom.Price != "" && currentRoom.Price != "0")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Price</td><td>" + currentRoom.Price + "$</td></tr><tr>"));
                    }
                    else
                    {
                        pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Price</td><td>Negotiate</td></tr><tr>"));
                    }
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Bedroom</td><td>" + currentRoom.BedRoom + "</td></tr><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Bathroom</td><td>" + currentRoom.BathRoom + "</td></tr>"));
                    if (currentRoom.Area != "")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<tr><td class=\"firstColumn\">Total Area</td><td>" + currentRoom.Area + " m2</td></tr>"));
                    }
                    pnlContent.Controls.Add(new LiteralControl("</table></td></tr></table></div>"));
                    if (currentRoom.Description != "")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<br><div><b>Description</b>:<br><br>" + currentRoom.Description + "</div>"));
                    }
                    pnlContent.Controls.Add(new LiteralControl("<br><div><b>Services:</b> Security, Housekeeping, Internet ADSL, Cable TV, Telephone...</div>"));
                    pnlContent.Controls.Add(new LiteralControl("<br><div><b>Furnishing:</b> Fully furnished</div>"));
                    DataTable furniture = currentRoom.getFurniture();
                    pnlContent2.Controls.Add(new LiteralControl("<br><div style=\"height: 300px; overflow: scroll;\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tr><th>Name</th><th>Description</th>"
                        + "<th>Made In</th><th>Number</th><th>Picture</th></tr>"));
                    for (int i = 0; i < furniture.Rows.Count; i++)
                    {
                        pnlContent2.Controls.Add(new LiteralControl("<tr>"));
                        for (int j = 0; j < furniture.Columns.Count; j++)
                        {
                            if (j == furniture.Columns.Count - 1)
                            {
                                pnlContent2.Controls.Add(new LiteralControl("<td><a href=\"Images/" + furniture.Rows[i][j].ToString() + "\"><img width=\"50px\" src=Images/" + furniture.Rows[i][j].ToString() + "></a></td>"));
                            }
                            else
                            {
                                pnlContent2.Controls.Add(new LiteralControl("<td>" + furniture.Rows[i][j].ToString() + "</td>"));
                            }
                        }
                        pnlContent2.Controls.Add(new LiteralControl("</tr>"));
                    }
                    pnlContent2.Controls.Add(new LiteralControl("</tr></table></div>"));
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception)
            {
            }
        }
    }
}