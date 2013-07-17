using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class House : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected string Lat { get; set; }
        protected string Long { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "House";
                Session["MenuID"] = "3";
                if (Session["UserLevel"] != null)
                {
                    if (Session["UserLevel"].ToString() == "1") { }
                    else
                    {
                        btnEdit.Visible = true;
                    }
                }
                else
                {
                    btnEdit.Visible = false;
                }
                string BuildingID = Request.QueryString["ID"];
                if (BuildingID != null)
                {
                    Class.Building currentBuilding = new Class.Building(BuildingID);
                    pnlContent.Controls.Add(new LiteralControl("<br><div class=\"componentheading\">"
                        + currentBuilding.Address + "</div><div class=\"table\">"));
                    string[] pictures = currentBuilding.Picture.Split('|');
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
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Type</td><td>" + currentBuilding.GetBuildingType() + "</td></tr><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Available</td><td>" + currentBuilding.isAvailable() + "</td></tr><tr>"));
                    if (currentBuilding.Price != "" && currentBuilding.Price != "0")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Price</td><td>" + currentBuilding.Price + "$</td></tr><tr>"));
                    }
                    else
                    {
                        pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Price</td><td>Negotiate</td></tr><tr>"));
                    }
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Garage</td><td>" + currentBuilding.haveGarage() + "</td></tr><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Pool</td><td>" + currentBuilding.havePool() + "</td></tr><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Garden</td><td>" + currentBuilding.haveGarden() + "</td></tr><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Bedroom</td><td>" + currentBuilding.BedRoom + "</td></tr><tr>"));
                    pnlContent.Controls.Add(new LiteralControl("<td class=\"firstColumn\">Bathroom</td><td>" + currentBuilding.BathRoom + "</td></tr>"));
                    if (currentBuilding.Area != "")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<tr><td class=\"firstColumn\">Total Area</td><td>" + currentBuilding.Area + " m2</td></tr>"));
                    }
                    string[] coor = currentBuilding.Coordinate.Split(',');
                    if (coor.Length > 1)
                    {
                        pnlContent.Controls.Add(new LiteralControl("</table></td></tr><tr><td colspan=2><iframe width=\"100%\" height=\"350\" "
                            + "frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" "
                            + "src=\"https://maps.google.com/maps?q=" + coor[0] + "," + coor[1] + "&amp;num=1&amp;t=h&amp;ie=UTF8&amp;z=14&amp;ll=" + coor[0] + "," + coor[1] + "&amp;output=embed\">"
                            + "</iframe><br /><small><a href=\"https://maps.google.com/maps?q=" + coor[0] + "," + coor[1] + "&amp;num=1&amp;t=h&amp;ie=UTF8&amp;z=14&amp;ll=" + coor[0] + "," + coor[1] + "&amp;source=embed\""
                            + "style=\"color:#0000FF;text-align:left;font-size:10pt;\">See bigger map</a></small></td></tr></table></div>"));
                    }
                    else
                    {
                        pnlContent.Controls.Add(new LiteralControl("</table></td></tr></table></div>"));
                    }
                    if (currentBuilding.Description != "")
                    {
                        pnlContent.Controls.Add(new LiteralControl("<br><div><b>Description</b>:<br><br>" + currentBuilding.Description + "</div>"));
                    }
                    pnlContent.Controls.Add(new LiteralControl("<br><div><b>Services:</b> Security, Housekeeping, Internet ADSL, Cable TV, Telephone...</div>"));
                    pnlContent.Controls.Add(new LiteralControl("<br><div><b>Furnishing:</b> Fully furnished</div>"));
                    DataTable furniture = currentBuilding.getFurniture();
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
                    btnDetail.Visible = true;
                    btnBack.Visible = true;
                    btnChooseFur.Visible = true;
                    if (!IsPostBack)
                    {
                        pnlContent2.Visible = false;
                    }
                }
                else
                {
                    btnChooseFur.Visible = false;
                    if (Session["ListBuilding"] == null)
                    {
                        string PageNumber = Request.QueryString["Page"];
                        btnDetail.Visible = false;
                        btnEdit.Visible = false;
                        btnBack.Visible = false;
                        pnlContent.Controls.Add(new LiteralControl("<br><div class=\"componentheading\">Houses"));
                        pnlContent.Controls.Add(new LiteralControl("</div><hr><br>"));
                        if (PageNumber == null)
                        {
                            DataTable AllHouses = com.getData(Message.BuildingTable, "*", " where " + Message.BuildingTypeID
                                + "<>5 order by " + Message.RentTime + " desc");
                            if (AllHouses.Rows.Count > 0)
                            {
                                int end;
                                if (AllHouses.Rows.Count <= 5)
                                {
                                    end = AllHouses.Rows.Count;
                                }
                                else
                                {
                                    end = 5;
                                }
                                pnlContent.Controls.Add(new LiteralControl("<table>"));
                                for (int i = 0; i < end; i++)
                                {
                                    if (AllHouses.Rows[i][11].ToString() != "")
                                    {
                                        string[] imageLink = AllHouses.Rows[i][11].ToString().Split('|');
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%;vertical-align:top;\"><a href=\"House.aspx?ID="
                                            + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"Images/" + imageLink[0] + "\"></a></td>"));
                                    }
                                    else
                                    {
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%;vertical-align:top;\"><a href=\"House.aspx?ID="
                                            + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"/Images/noimage.jpg\"></a></td>"));

                                    }
                                    pnlContent.Controls.Add(new LiteralControl("<td style=\"padding-left:1%;vertical-align: top;\"><a style=\"color:#1D8A0D;font-size:14pt;\" href=\"House.aspx?ID="
                                        + AllHouses.Rows[i][0].ToString() + "\">" + AllHouses.Rows[i][2].ToString() + "</a><br><br>"));
                                    Class.Building currentBuilding = new Class.Building(AllHouses.Rows[i][0].ToString());
                                    pnlContent.Controls.Add(new LiteralControl("<table style=\"font-weight:normal;width:50%;\"><tr><td>Type:</td><td>" + currentBuilding.GetBuildingType() + "</td></tr>"));
                                    pnlContent.Controls.Add(new LiteralControl("<tr><td>Price:</td><td>" + currentBuilding.Price + "$</td></tr>"));
                                    pnlContent.Controls.Add(new LiteralControl("<tr><td>Garage:</td><td>" + currentBuilding.haveGarage() + "</td></tr>"));
                                    pnlContent.Controls.Add(new LiteralControl("<tr><td>Pool:</td><td>" + currentBuilding.havePool() + "</td></tr>"));
                                    pnlContent.Controls.Add(new LiteralControl("<tr><td>Garden:</td><td>" + currentBuilding.haveGarden() + "</td></tr>"));
                                    pnlContent.Controls.Add(new LiteralControl("<tr><td>Bedroom:</td><td>" + currentBuilding.BedRoom + "</td></tr>"));
                                    pnlContent.Controls.Add(new LiteralControl("<tr><td>Bathroom:</td><td>" + currentBuilding.BathRoom + "</td></tr></table>"));
                                    pnlContent.Controls.Add(new LiteralControl("</td></tr><tr><td colspan=\"2\" style=\"height:30px;\"></td></tr>"));
                                }
                                pnlContent.Controls.Add(new LiteralControl("</table>"));
                                int totalPage;
                                if (double.Parse(AllHouses.Rows.Count.ToString()) / 5 > AllHouses.Rows.Count / 5)
                                {
                                    totalPage = AllHouses.Rows.Count / 5 + 1;
                                }
                                else
                                {
                                    totalPage = AllHouses.Rows.Count / 5;
                                }
                                pnlContent.Controls.Add(new LiteralControl("<div style=\"background:transparent url(/Images/phantrang.jpg) no-repeat right 0px;text-align:right;\">"));
                                for (int i = 0; i < totalPage; i++)
                                {
                                    if (i < 9)
                                    {
                                        pnlContent.Controls.Add(new LiteralControl("<a href=\"House.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                    }
                                    else
                                    {
                                        pnlContent.Controls.Add(new LiteralControl("...&nbsp;&nbsp;<a href=\"House.aspx?Page=" + totalPage + "\">Last page</a>&nbsp;&nbsp;"));
                                        break;
                                    }
                                }
                                pnlContent.Controls.Add(new LiteralControl("</div><br>"));
                            }
                        }
                        else
                        {
                            DataTable AllHouses = com.getData(Message.BuildingTable, "*", " where " + Message.BuildingTypeID
                                + "<>5 order by " + Message.RentTime + " desc");
                            if (AllHouses.Rows.Count > 0)
                            {
                                int end;
                                if (AllHouses.Rows.Count <= 5 * int.Parse(PageNumber))
                                {
                                    end = AllHouses.Rows.Count;
                                }
                                else
                                {
                                    end = 5 * int.Parse(PageNumber);
                                }
                                pnlContent.Controls.Add(new LiteralControl("<table>"));
                                for (int i = 5 * (int.Parse(PageNumber) - 1); i < end; i++)
                                {
                                    if (AllHouses.Rows[i][11].ToString() != "")
                                    {
                                        string[] imageLink = AllHouses.Rows[i][11].ToString().Split('|');
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"House.aspx?ID="
                                            + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"Images/" + imageLink[0] + "\"></a></td>"));
                                    }
                                    else
                                    {
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"House.aspx?ID="
                                            + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"/Images/noimage.jpg\"></a></td>"));
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("<td style=\"padding-left:1%;vertical-align: top;\"><a style=\"color:#1D8A0D;font-size:14pt;\" href=\"House.aspx?ID="
                                        + AllHouses.Rows[i][0].ToString() + "\">" + AllHouses.Rows[i][2].ToString() + "</a><br><br>"));
                                    pnlContent.Controls.Add(new LiteralControl("</td></tr><tr><td colspan=\"2\" style=\"height:30px;\"></td></tr>"));
                                }
                                pnlContent.Controls.Add(new LiteralControl("</table>"));
                                int totalPage;
                                if (double.Parse(AllHouses.Rows.Count.ToString()) / 5 > AllHouses.Rows.Count / 5)
                                {
                                    totalPage = AllHouses.Rows.Count / 5 + 1;
                                }
                                else
                                {
                                    totalPage = AllHouses.Rows.Count / 5;
                                }
                                pnlContent.Controls.Add(new LiteralControl("<div style=\"background:transparent url(/Images/phantrang.jpg) no-repeat right 0px;text-align:right;\">"));
                                int start;
                                if (int.Parse(PageNumber) * 2 < 10)
                                {
                                    start = 0;
                                }
                                else if (int.Parse(PageNumber) + 4 < totalPage)
                                {
                                    start = int.Parse(PageNumber) - 4;
                                }
                                else
                                {
                                    start = totalPage - 9;
                                }
                                if (start < 0)
                                {
                                    start = 0;
                                }
                                if (start > 0)
                                {
                                    pnlContent.Controls.Add(new LiteralControl("<a href=\"House.aspx?Page=1\">First page</a>...&nbsp;&nbsp;"));
                                }
                                for (int i = start; i < totalPage; i++)
                                {
                                    if (i <= 8 + start)
                                    {
                                        if (i == int.Parse(PageNumber) - 1)
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("<a style=\"color:blue;font-weight: bold;\" href=\"House.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                        }
                                        else
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("<a href=\"House.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                        }
                                    }
                                    else
                                    {
                                        pnlContent.Controls.Add(new LiteralControl("...&nbsp;&nbsp;<a href=\"House.aspx?Page=" + totalPage + "\">Last page</a>&nbsp;&nbsp;"));
                                        break;
                                    }
                                }
                                pnlContent.Controls.Add(new LiteralControl("</div><br>"));
                            }
                        }
                    }
                    else
                    {
                        List<string> BuildingID1 = (List<string>)Session["ListBuilding"];
                        if (BuildingID1.Count > 0)
                        {
                            string RoomList = "";
                            for (int i = 0; i < BuildingID1.Count; i++)
                            {
                                RoomList = RoomList + BuildingID1[i] + ",";
                            }
                            RoomList = RoomList.Remove(RoomList.Length - 1, 1);
                            string PageNumber = Request.QueryString["Page"];
                            btnDetail.Visible = false;
                            btnEdit.Visible = false;
                            btnBack.Visible = false;
                            pnlContent.Controls.Add(new LiteralControl("<br><div class=\"componentheading\">Houses"));
                            pnlContent.Controls.Add(new LiteralControl("</div><hr><br>"));
                            if (PageNumber == null)
                            {
                                DataTable AllHouses = com.getData(Message.BuildingTable, "*", " where " + Message.BuildingTypeID
                                    + "<>5 and " + Message.BuildingID + " in (" + RoomList + ") order by " + Message.RentTime + " desc");
                                if (AllHouses.Rows.Count > 0)
                                {
                                    int end;
                                    if (AllHouses.Rows.Count <= 5)
                                    {
                                        end = AllHouses.Rows.Count;
                                    }
                                    else
                                    {
                                        end = 5;
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("<table>"));
                                    for (int i = 0; i < end; i++)
                                    {
                                        if (AllHouses.Rows[i][11].ToString() != "")
                                        {
                                            string[] imageLink = AllHouses.Rows[i][11].ToString().Split('|');
                                            pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%;vertical-align:top;\"><a href=\"House.aspx?ID="
                                                + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"Images/" + imageLink[0] + "\"></a></td>"));
                                        }
                                        else
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%;vertical-align:top;\"><a href=\"House.aspx?ID="
                                                + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"/Images/noimage.jpg\"></a></td>"));

                                        }
                                        pnlContent.Controls.Add(new LiteralControl("<td style=\"padding-left:1%;vertical-align: top;\"><a style=\"color:#1D8A0D;font-size:14pt;\" href=\"House.aspx?ID="
                                            + AllHouses.Rows[i][0].ToString() + "\">" + AllHouses.Rows[i][2].ToString() + "</a><br><br>"));
                                        Class.Building currentBuilding = new Class.Building(AllHouses.Rows[i][0].ToString());
                                        pnlContent.Controls.Add(new LiteralControl("<table style=\"font-weight:normal;width:50%;\"><tr><td>Type:</td><td>" + currentBuilding.GetBuildingType() + "</td></tr>"));
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td>Price:</td><td>" + currentBuilding.Price + "$</td></tr>"));
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td>Garage:</td><td>" + currentBuilding.haveGarage() + "</td></tr>"));
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td>Pool:</td><td>" + currentBuilding.havePool() + "</td></tr>"));
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td>Garden:</td><td>" + currentBuilding.haveGarden() + "</td></tr>"));
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td>Bedroom:</td><td>" + currentBuilding.BedRoom + "</td></tr>"));
                                        pnlContent.Controls.Add(new LiteralControl("<tr><td>Bathroom:</td><td>" + currentBuilding.BathRoom + "</td></tr></table>"));
                                        pnlContent.Controls.Add(new LiteralControl("</td></tr><tr><td colspan=\"2\" style=\"height:30px;\"></td></tr>"));
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("</table>"));
                                    int totalPage;
                                    if (double.Parse(AllHouses.Rows.Count.ToString()) / 5 > AllHouses.Rows.Count / 5)
                                    {
                                        totalPage = AllHouses.Rows.Count / 5 + 1;
                                    }
                                    else
                                    {
                                        totalPage = AllHouses.Rows.Count / 5;
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("<div style=\"background:transparent url(/Images/phantrang.jpg) no-repeat right 0px;text-align:right;\">"));
                                    for (int i = 0; i < totalPage; i++)
                                    {
                                        if (i < 9)
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("<a href=\"House.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                        }
                                        else
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("...&nbsp;&nbsp;<a href=\"House.aspx?Page=" + totalPage + "\">Last page</a>&nbsp;&nbsp;"));
                                            break;
                                        }
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("</div><br>"));
                                }
                            }
                            else
                            {
                                DataTable AllHouses = com.getData(Message.BuildingTable, "*", " where " + Message.BuildingTypeID
                                    + "<>5 and " + Message.BuildingID + " in (" + RoomList + ") order by " + Message.RentTime + " desc");
                                if (AllHouses.Rows.Count > 0)
                                {
                                    int end;
                                    if (AllHouses.Rows.Count <= 5 * int.Parse(PageNumber))
                                    {
                                        end = AllHouses.Rows.Count;
                                    }
                                    else
                                    {
                                        end = 5 * int.Parse(PageNumber);
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("<table>"));
                                    for (int i = 5 * (int.Parse(PageNumber) - 1); i < end; i++)
                                    {
                                        if (AllHouses.Rows[i][11].ToString() != "")
                                        {
                                            string[] imageLink = AllHouses.Rows[i][11].ToString().Split('|');
                                            pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"House.aspx?ID="
                                                + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"Images/" + imageLink[0] + "\"></a></td>"));
                                        }
                                        else
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("<tr><td style=\"width:45%\"><a href=\"House.aspx?ID="
                                                + AllHouses.Rows[i][0].ToString() + "\"><img width=\"300px;\" src=\"/Images/noimage.jpg\"></a></td>"));
                                        }
                                        pnlContent.Controls.Add(new LiteralControl("<td style=\"padding-left:1%;vertical-align: top;\"><a style=\"color:#1D8A0D;font-size:14pt;\" href=\"House.aspx?ID="
                                            + AllHouses.Rows[i][0].ToString() + "\">" + AllHouses.Rows[i][2].ToString() + "</a><br><br>"));
                                        pnlContent.Controls.Add(new LiteralControl("</td></tr><tr><td colspan=\"2\" style=\"height:30px;\"></td></tr>"));
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("</table>"));
                                    int totalPage;
                                    if (double.Parse(AllHouses.Rows.Count.ToString()) / 5 > AllHouses.Rows.Count / 5)
                                    {
                                        totalPage = AllHouses.Rows.Count / 5 + 1;
                                    }
                                    else
                                    {
                                        totalPage = AllHouses.Rows.Count / 5;
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("<div style=\"background:transparent url(/Images/phantrang.jpg) no-repeat right 0px;text-align:right;\">"));
                                    int start;
                                    if (int.Parse(PageNumber) * 2 < 10)
                                    {
                                        start = 0;
                                    }
                                    else if (int.Parse(PageNumber) + 4 < totalPage)
                                    {
                                        start = int.Parse(PageNumber) - 4;
                                    }
                                    else
                                    {
                                        start = totalPage - 9;
                                    }
                                    if (start < 0)
                                    {
                                        start = 0;
                                    }
                                    if (start > 0)
                                    {
                                        pnlContent.Controls.Add(new LiteralControl("<a href=\"House.aspx?Page=1\">First page</a>...&nbsp;&nbsp;"));
                                    }
                                    for (int i = start; i < totalPage; i++)
                                    {
                                        if (i <= 8 + start)
                                        {
                                            if (i == int.Parse(PageNumber) - 1)
                                            {
                                                pnlContent.Controls.Add(new LiteralControl("<a style=\"color:blue;font-weight: bold;\" href=\"House.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                            }
                                            else
                                            {
                                                pnlContent.Controls.Add(new LiteralControl("<a href=\"House.aspx?Page=" + (i + 1).ToString() + "\">" + (i + 1).ToString() + "</a>&nbsp;&nbsp;"));
                                            }
                                        }
                                        else
                                        {
                                            pnlContent.Controls.Add(new LiteralControl("...&nbsp;&nbsp;<a href=\"House.aspx?Page=" + totalPage + "\">Last page</a>&nbsp;&nbsp;"));
                                            break;
                                        }
                                    }
                                    pnlContent.Controls.Add(new LiteralControl("</div><br>"));
                                }
                            }
                        }
                        else
                        {
                            pnlContent.Controls.Add(new LiteralControl("<br><div>Sorry! There is no house that math your request. Please try another search</div>"));
                            btnDetail.Visible = false;
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AddNews.aspx");
        }
        protected void btnDetail_Click(object sender, EventArgs e)
        {
            if (pnlContent2.Visible == false)
            {
                pnlContent2.Visible = true;
                btnDetail.Text = "See less";
            }
            else {
                btnDetail.Text = "See details";
                pnlContent2.Visible = false;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("House.aspx");
        }

        protected void btnChooseFur_Click(object sender, EventArgs e)
        {
            string BuildingID = Request.QueryString["ID"];
            Session["BuildingID"] = BuildingID;
            Response.Redirect("ChooseFurniture.aspx");
        }
    }
}