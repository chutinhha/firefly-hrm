using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                txtPassword.Visible = false;
                txtUser.Visible = false;
                btnLogin.Text = "Logout";
                lblLogin.Text = "Hello, "+Session["FullName"];
            }
            else {
                txtPassword.Visible = true;
                txtUser.Visible = true;
                btnLogin.Text = "Login";
                lblLogin.Text = "Login:";
                if (!IsPostBack) {
                    txtUser.Text = "";
                    txtPassword.Text = "";
                }
            }
            
            //Set item for ddl Type
            if (!IsPostBack)
            {
                com.SetItemList(Message.Description + "," + Message.Description, Message.BuildingTypeTable, ddlType, " where "
                    + Message.Description + " <> 'Warehouse'", true, "All");

            }

            //Set banner picture
            pnlBanner.Controls.Add(new LiteralControl("<div id=\"banner\" class=\"part\"><div "
                +"id=\"slider\">"));
            DataTable Banner = com.getData(Message.BannerPicture, Message.Picture, "");
            if (Banner.Rows.Count > 0) {
                for (int i = 0; i < Banner.Rows.Count; i++) {
                    pnlBanner.Controls.Add(new LiteralControl("<img src=\"/Images/"
                        +Banner.Rows[i][0].ToString()+"\" />"));
                }
            }
            pnlBanner.Controls.Add(new LiteralControl("</div><div style=\"clear: both; height: 0;\">"
                +"</div></div>"));

            //Set menu bar
            pnlMenu.Controls.Add(new LiteralControl("<ul class=\"menu\" id=\"dvd_mainmenu\">"));
            if (Session["UserLevel"] == null || Session["UserLevel"].ToString() == "1")
            {
                DataTable Menubar = com.getData(Message.MenuBar, "*", " order by " + Message.AppearNo);
                if (Menubar.Rows.Count > 0)
                {
                    for (int i = 0; i < Menubar.Rows.Count; i++)
                    {
                        if (Menubar.Rows[i][3].ToString() == "1" && i != Menubar.Rows.Count - 1)
                        {
                            if (Menubar.Rows[i + 1][3].ToString() == "1")
                            {
                                if (i == 0)
                                {
                                    pnlMenu.Controls.Add(new LiteralControl("<li style=\"color:#103459;"
                                        + "font-weight:bold;background:none;\" onmouseout=\"menuitemMouseOut"
                                        + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                                        + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\""
                                        + Menubar.Rows[i][2].ToString() + "\"><span>"
                                        + Menubar.Rows[i][1].ToString() + "</span></a></li>"));
                                }
                                else
                                {
                                    pnlMenu.Controls.Add(new LiteralControl("<li onmouseout=\"menuitemMouseOut"
                                        + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                                        + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\""
                                        + Menubar.Rows[i][2].ToString() + "\"><span>"
                                        + Menubar.Rows[i][1].ToString() + "</span></a></li>"));
                                }
                            }
                            else
                            {
                                if (i == 0)
                                {
                                    pnlMenu.Controls.Add(new LiteralControl("<li style=\"color:#103459;"
                                        + "font-weight:bold;background:none;\" onmouseout=\"menuitemMouseOut"
                                        + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                                        + "(this,'dvd_mainmenu')\" class=\"parent item58\"><a href=\""
                                        + Menubar.Rows[i][2].ToString() + "\">" + "<span>" + Menubar.Rows[i][1].ToString()
                                        + "</span></a>" + "<ul style=\"display: none;\">"));
                                }
                                else
                                {
                                    pnlMenu.Controls.Add(new LiteralControl("<li onmouseout=\"menuitemMouseOut"
                                        + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                                        + "(this,'dvd_mainmenu')\" class=\"parent item58\"><a href=\""
                                        + Menubar.Rows[i][2].ToString() + "\">" + "<span>" + Menubar.Rows[i][1].ToString()
                                        + "</span></a>" + "<ul style=\"display: none;\">"));
                                }
                                for (int j = i + 1; j < Menubar.Rows.Count; j++)
                                {
                                    if (Menubar.Rows[j][3].ToString() == "2")
                                    {
                                        pnlMenu.Controls.Add(new LiteralControl("<li onmouseout=\"menuitem"
                                            + "MouseOut(this,'dvd_mainmenu',false)\" onmouseover=\"menuitem"
                                            + "MouseOver(this,'dvd_mainmenu')\" class=\"item87\"><a href=\""
                                            + Menubar.Rows[j][2].ToString() + "\">" + "<span>"
                                            + Menubar.Rows[j][1].ToString() + "</span></a></li>"));
                                    }
                                    else
                                    {
                                        i = j - 1;
                                        break;
                                    }
                                }
                                pnlMenu.Controls.Add(new LiteralControl("</ul></li>"));
                            }
                        }
                        else if (Menubar.Rows[i][3].ToString() == "1")
                        {
                            pnlMenu.Controls.Add(new LiteralControl("<li onmouseout=\"menuitemMouseOut"
                                + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                                + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\""
                                + Menubar.Rows[i][2].ToString() + "\"><span>"
                                + Menubar.Rows[i][1].ToString() + "</span></a></li>"));
                        }
                    }
                }
                pnlMenu.Controls.Add(new LiteralControl("</ul>"));
            }
            else if (Session["UserLevel"].ToString() == "2") {
                pnlMenu.Controls.Add(new LiteralControl("<li style=\"color:#103459;"
                    + "font-weight:bold;background:none;\" onmouseout=\"menuitemMouseOut"
                    + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                    + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\"ListFurniture.aspx\"><span>Furniture List</span></a></li>"));
            }
            else if (Session["UserLevel"].ToString() == "3") {
                pnlMenu.Controls.Add(new LiteralControl("<li style=\"color:#103459;"
                    + "font-weight:bold;background:none;\" onmouseout=\"menuitemMouseOut"
                    + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                    + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\"ApproveMove.aspx\"><span>Approve Move Furniture</span></a></li>"));
                pnlMenu.Controls.Add(new LiteralControl("<li onmouseout=\"menuitemMouseOut"
                    + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                    + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\"ApproveRemove.aspx\"><span>Approve Remove Furniture</span></a></li>"));
                pnlMenu.Controls.Add(new LiteralControl("<li onmouseout=\"menuitemMouseOut"
                    + "(this,'dvd_mainmenu',false)\" onmouseover=\"menuitemMouseOver"
                    + "(this,'dvd_mainmenu')\" class=\"item54\"><a href=\"Register.aspx\"><span>Create New Account</span></a></li>"));
                
            }
            if (!IsPostBack)
            {
                if (Session["keyword"] != null)
                {
                    txtKeyword.Text = Session["keyword"].ToString();
                    ddlType.SelectedValue = Session["buildingType"].ToString();
                    ddlDistrict.SelectedValue = Session["location"].ToString();
                    txtStartPrice.Text = Session["startPrice"].ToString();
                    txtEndPrice.Text = Session["endPrice"].ToString();
                    ddlBedRoom.SelectedValue = Session["bedRoom"].ToString();
                    ddlBathRoom.SelectedValue = Session["bathRoom"].ToString();
                    chkGarage.Checked = bool.Parse(Session["garage"].ToString());
                    chkGarden.Checked = bool.Parse(Session["garden"].ToString());
                    chkPool.Checked = bool.Parse(Session["pool"].ToString());
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (btnLogin.Text == "Login")
            {
                if (txtUser.Text.Trim() == "" || txtPassword.Text.Trim() == "") { }
                else
                {
                    Class.User currentUser = new Class.User(txtUser.Text.Trim());
                    if (currentUser.FullName == null)
                    {
                    }
                    else
                    {
                        if (currentUser.Password.ToUpper() == com.CalculateMD5Hash(txtPassword.Text.Trim()).ToUpper())
                        {
                            Session["UserID"] = currentUser.UID;
                            Session["UserName"] = currentUser.UserName;
                            Session["UserLevel"] = currentUser.UserLevel;
                            Session["FullName"] = currentUser.FullName;
                            lblLogin.Text = "Hello, " + currentUser.FullName;
                            txtPassword.Visible = false;
                            txtUser.Visible = false;
                            btnLogin.Text = "Logout";
                        }
                    }
                }
            }
            else {
                Session.Remove("UserID");
                Session.Remove("UserName");
                Session.Remove("UserLevel");
                Session.Remove("FullName");
                lblLogin.Text = "Login:";
                txtPassword.Visible = true;
                txtUser.Visible = true;
                btnLogin.Text = "Login";
                Response.Redirect("Home.aspx");
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtKeyword.Text.Trim();
            string buildingType = ddlType.SelectedValue;
            string location = ddlDistrict.SelectedValue;
            string startPrice = txtStartPrice.Text.Trim();
            string endPrice = txtEndPrice.Text.Trim();
            string bedRoom = ddlBedRoom.SelectedValue;
            string bathRoom = ddlBathRoom.SelectedValue;
            bool garage = chkGarage.Checked;
            bool pool = chkPool.Checked;
            bool garden = chkGarden.Checked;
            Session["keyword"] = keyword;
            Session["buildingType"] = buildingType;
            Session["location"] = location;
            Session["startPrice"] = startPrice;
            Session["endPrice"] = endPrice;
            Session["bedRoom"] = bedRoom;
            Session["bathRoom"] = bathRoom;
            Session["garage"] = garage;
            Session["pool"] = pool;
            Session["garden"] = garden;
            string condition=" where ";
            if (buildingType != "All") {
                condition = condition + " type." + Message.Description + "='" + buildingType + "' and ";
            }
            if (startPrice != "") {
                condition = condition + Message.Price + ">=" + startPrice + " and ";
            }
            if (endPrice != "") {
                condition = condition + Message.Price + "<=" + endPrice + " and ";
            }
            if (bedRoom != "All") {
                condition = condition + Message.BedRoom+"="+bedRoom+" and ";
            }
            if (bathRoom != "All") {
                condition = condition + Message.BathRoom + "=" + bathRoom + " and ";
            }
            if (garage) {
                condition = condition + Message.Garage + "=1 and ";
            }
            if (pool) {
                condition = condition + Message.Pool + "=1 and ";
            }
            if (garden) {
                condition = condition + Message.Garden + "=1 and ";
            }
            if (location != "All") {
                condition = condition + Message.District + "='" + location + "' and ";
            }
            if (condition.Contains(" and "))
            {
                condition = condition.Remove(condition.Length - 5, 4);
            }
            else {
                condition = "";
            }
            DataTable dt = com.getData(Message.BuildingTable + " rom join " + Message.BuildingTypeTable + " type "
                + "on rom." + Message.BuildingTypeID + "=type." + Message.BuildingTypeID, "*", condition);
            List<string> BuildingID = new List<string>();
            if (keyword != "")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        if (dt.Rows[i][j].ToString().ToLower().Contains(keyword.ToLower()))
                        {
                            BuildingID.Add(dt.Rows[i][0].ToString());
                        }
                    }
                }
            }
            else {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    BuildingID.Add(dt.Rows[i][0].ToString());
                }
            }
            Session["ListBuilding"] = BuildingID;
            Response.Redirect("House.aspx");
        }
    }
}
