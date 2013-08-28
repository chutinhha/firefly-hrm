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
    public partial class Register : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Create new account";
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
                if (!IsPostBack)
                {
                    pnlRoom.Visible = false;
                }
                Session["MenuID"] = "5";
                string[] column = new string[1];
                column[0] = "Quản lý hiện tại";
                DataTable dt;
                com.bindDataBlankColumn(Message.BuildingID + "," + Message.Address + ",romType."
                    + Message.Description, " where romType." + Message.Description + "<>'Warehouse'", Message.BuildingTable
                    + " rom join " + Message.BuildingTypeTable + " romType on rom." + Message.BuildingTypeID + "=romType."
                    + Message.BuildingTypeID, grdRoom, 1, column);
                dt = com.getData(Message.UserAccountTable, Message.RoomManage + "," + Message.FullName,
                    " where " + Message.UserLevel + "=2 and "
                    + Message.RoomManage + " is not NULL");
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string[] roomMa = dt.Rows[i][0].ToString().Split('|');
                        for (int j = 0; j < roomMa.Length - 1; j++)
                        {
                            for (int k = 0; k < grdRoom.Rows.Count; k++)
                            {
                                if (roomMa[j] == grdRoom.Rows[k].Cells[1].Text)
                                {
                                    if (grdRoom.Rows[k].Cells[4].Text == "&nbsp;")
                                    {
                                        grdRoom.Rows[k].Cells[4].Text = dt.Rows[i][1].ToString() + "<br>";
                                    }
                                    else
                                    {
                                        grdRoom.Rows[k].Cells[4].Text = grdRoom.Rows[k].Cells[4].Text + dt.Rows[i][1].ToString() + "<br>";
                                    }
                                    grdRoom.Rows[k].ForeColor = System.Drawing.ColorTranslator.FromHtml("#BB3438");
                                    grdRoom.Rows[k].Attributes.Add("style", "font-weight:bold");
                                }
                            }
                        }
                    }
                }
                string ID = Request.QueryString["ID"];
                if (!IsPostBack)
                {
                    if (ID != null)
                    {
                        Class.User newUser = new Class.User(int.Parse(ID));
                        btnRegister.Text = "Lưu";
                        txtUserName.Text = newUser.UserName;
                        txtPassword.Text = newUser.Password;
                        txtPhone.Text = newUser.PhoneNumber;
                        txtAddress.Text = newUser.Address;
                        txtMail.Text = newUser.Email;
                        txtName.Text = newUser.FullName;
                        ddlAccountType.SelectedIndex = newUser.UserLevel;
                        if (newUser.UserLevel == 2)
                        {
                            pnlRoom.Visible = true;
                            string[] building = newUser.RoomManage.Split('|');
                            foreach (GridViewRow row in grdRoom.Rows)
                            {
                                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                                for (int i = 0; i < building.Length - 1; i++)
                                {
                                    if (building[i] == row.Cells[1].Text)
                                    {
                                        cbSelected.Checked = true;
                                        break;
                                    }
                                    else
                                    {
                                        cbSelected.Checked = false;
                                    }
                                }
                            }
                        }
                    }
                    else {
                        btnRegister.Text = "Đăng ký";
                    }
                }
                if (ID == null)
                {
                    txtUserName.Enabled = true;
                    txtPassword.Enabled = true;
                }
                else
                {
                    txtUserName.Enabled = false;
                    txtPassword.Enabled = false;
                    if (ID != null)
                    {
                        Class.User newUser = new Class.User(int.Parse(ID));
                        if (newUser.UserLevel == 2)
                        {
                            pnlRoom.Visible = true;
                            string[] building = newUser.RoomManage.Split('|');
                            foreach (GridViewRow row in grdRoom.Rows)
                            {
                                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                                for (int i = 0; i < building.Length - 1; i++)
                                {
                                    if (building[i] == row.Cells[1].Text)
                                    {
                                        cbSelected.Checked = true;
                                        break;
                                    }
                                    else
                                    {
                                        cbSelected.Checked = false;
                                    }
                                }
                            }
                        }
                    }
                }

                if (IsPostBack)
                {
                    txtPassword.Attributes["value"] = txtPassword.Text;
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }
        protected void ddlAccountType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAccountType.SelectedValue == "Quản lý tòa nhà")
            {
                pnlRoom.Visible = true;
            }
            else {
                pnlRoom.Visible = false;
            }
        }
        protected void grdRoom_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Attributes.Add("style", "width:350px");
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
                e.Row.Cells[2].Text = "Tòa nhà";
                e.Row.Cells[3].Text = "Mô tả";
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblSuccess.Text = "";
                string ID = Request.QueryString["ID"];
                if (ddlAccountType.SelectedValue != "Xin hãy chọn")
                {
                    if (ddlAccountType.SelectedValue == "Quản lý tòa nhà")
                    {
                        if ((txtUserName.Text.Trim() == "" || txtPassword.Text.Trim() == "")&&ID==null)
                        {
                            lblError.Text = "Bạn đang điền thiếu 1 số thông tin bắt buộc";
                        }
                        else
                        {
                            DataTable dt;
                            if (ID == null)
                            {
                                dt = com.getData(Message.UserAccountTable, Message.UserName,
                                    " where " + Message.UserName + "='" + txtUserName.Text.Trim() + "'");
                            }
                            else
                            {
                                dt = null;
                            }
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                lblError.Text = "User name này đã tồn tại";
                            }
                            else
                            {
                                if (txtMail.Text.Trim() != "" && (!txtMail.Text.Contains("@") || txtMail.Text.Contains("@.")))
                                {
                                    lblError.Text = "Email không đúng định dạng";
                                }
                                else
                                {
                                    Class.User newUser;
                                    if (ID == null)
                                    {
                                        newUser = new Class.User();
                                    }
                                    else
                                    {
                                        newUser = new Class.User(int.Parse(ID));
                                    }
                                    newUser.Address = txtAddress.Text;
                                    newUser.Email = txtMail.Text;
                                    newUser.FullName = txtName.Text;
                                    if (ID == null)
                                    {
                                        newUser.Password = txtPassword.Text;
                                    }
                                    newUser.PhoneNumber = txtPhone.Text;
                                    newUser.Status = true;
                                    newUser.UserName = txtUserName.Text.Trim();
                                    newUser.UserLevel = ddlAccountType.SelectedIndex;
                                    bool isCheck = false;
                                    foreach (GridViewRow gr in grdRoom.Rows)
                                    {
                                        CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                                        string checkedState = Request.Form[cb.UniqueID];
                                        if (checkedState != null)
                                        {
                                            isCheck = true;
                                            if (newUser.RoomManage.Contains("|" + gr.Cells[1].Text + "|")
                                                || (newUser.RoomManage.Contains(gr.Cells[1].Text + "|")
                                                && newUser.RoomManage.IndexOf(gr.Cells[1].Text + "|") == 0)) { }
                                            else
                                            {
                                                newUser.RoomManage = newUser.RoomManage + gr.Cells[1].Text + "|";
                                            }
                                        }
                                        else
                                        {
                                            if (newUser.RoomManage.Contains("|" + gr.Cells[1].Text + "|"))
                                            {
                                                newUser.RoomManage = newUser.RoomManage.Replace("|" + gr.Cells[1].Text + "|", "|");
                                            }
                                            else if (newUser.RoomManage.Contains(gr.Cells[1].Text + "|")
                                                && newUser.RoomManage.IndexOf(gr.Cells[1].Text + "|") == 0)
                                            {
                                                newUser.RoomManage = newUser.RoomManage.Substring(gr.Cells[1].Text.Length + 1, newUser.RoomManage.Length - gr.Cells[1].Text.Length - 1);
                                            }
                                        }
                                    }
                                    if (isCheck == true)
                                    {
                                        if (ID == null)
                                        {
                                            newUser.AddUser();
                                        }
                                        else
                                        {
                                            newUser.UpdateUser();
                                        }
                                        lblSuccess.Text = "Thành công";
                                        string[] column = new string[1];
                                        column[0] = "Quản lý hiện tại";
                                        dt = null;
                                        com.bindDataBlankColumn(Message.BuildingID + "," + Message.Address + ",romType."
                                            + Message.Description, " where romType." + Message.Description + "<>'Warehouse'", Message.BuildingTable
                                            + " rom join " + Message.BuildingTypeTable + " romType on rom." + Message.BuildingTypeID + "=romType."
                                            + Message.BuildingTypeID, grdRoom, 1, column);
                                        dt = com.getData(Message.UserAccountTable, Message.RoomManage + "," + Message.FullName,
                                            " where " + Message.UserLevel + "=2 and "
                                            + Message.RoomManage + " is not NULL");
                                        if (dt.Rows.Count > 0)
                                        {
                                            for (int i = 0; i < dt.Rows.Count; i++)
                                            {
                                                string[] roomMa = dt.Rows[i][0].ToString().Split('|');
                                                for (int j = 0; j < roomMa.Length - 1; j++)
                                                {
                                                    for (int k = 0; k < grdRoom.Rows.Count; k++)
                                                    {
                                                        if (roomMa[j] == grdRoom.Rows[k].Cells[1].Text)
                                                        {
                                                            if (grdRoom.Rows[k].Cells[4].Text == "&nbsp;")
                                                            {
                                                                grdRoom.Rows[k].Cells[4].Text = dt.Rows[i][1].ToString() + "<br>";
                                                            }
                                                            else
                                                            {
                                                                grdRoom.Rows[k].Cells[4].Text = grdRoom.Rows[k].Cells[4].Text + dt.Rows[i][1].ToString() + "<br>";
                                                            }
                                                            grdRoom.Rows[k].ForeColor = System.Drawing.ColorTranslator.FromHtml("#BB3438");
                                                            grdRoom.Rows[k].Attributes.Add("style", "font-weight:bold");
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        string[] building = newUser.RoomManage.Split('|');
                                        foreach (GridViewRow row in grdRoom.Rows)
                                        {
                                            CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                                            for (int i = 0; i < building.Length - 1; i++)
                                            {
                                                if (building[i] == row.Cells[1].Text)
                                                {
                                                    cbSelected.Checked = true;
                                                    break;
                                                }
                                                else
                                                {
                                                    cbSelected.Checked = false;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        if ((txtUserName.Text.Trim() == "" || txtPassword.Text.Trim() == "")&&ID==null)
                        {
                            lblError.Text = "Bạn đang điền thiếu 1 số thông tin bắt buộc";
                        }
                        else
                        {
                            DataTable dt;
                            if (ID == null)
                            {
                                dt = com.getData(Message.UserAccountTable, Message.UserName,
                                    " where " + Message.UserName + "='" + txtUserName.Text.Trim() + "'");
                            }
                            else
                            {
                                dt = null;
                            }
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                lblError.Text = "User name này đã tồn tại";
                            }
                            else
                            {
                                if (txtMail.Text.Trim() != "" && (!txtMail.Text.Contains("@") || txtMail.Text.Contains("@.")))
                                {
                                    lblError.Text = "Email không đúng định dạng";
                                }
                                else
                                {
                                    Class.User newUser;
                                    if (ID == null)
                                    {
                                        newUser = new Class.User();
                                    }
                                    else
                                    {
                                        newUser = new Class.User(int.Parse(ID));
                                    }
                                    newUser.Address = txtAddress.Text;
                                    newUser.Email = txtMail.Text;
                                    newUser.FullName = txtName.Text;
                                    if (ID == null)
                                    {
                                        newUser.Password = txtPassword.Text;
                                    }
                                    newUser.PhoneNumber = txtPhone.Text;
                                    newUser.Status = true;
                                    newUser.UserName = txtUserName.Text.Trim();
                                    if (ddlAccountType.SelectedValue == "Quản lý tin tức")
                                    {
                                        newUser.UserLevel = 1;
                                    }
                                    else
                                    {
                                        newUser.UserLevel = 3;
                                    }
                                    if (ID == null)
                                    {
                                        newUser.AddUser();
                                    }
                                    else
                                    {
                                        newUser.UpdateUser();
                                    }
                                    lblSuccess.Text = "Thành công";
                                    string[] column = new string[1];
                                    column[0] = "Quản lý hiện tại";
                                    dt = null;
                                    com.bindDataBlankColumn(Message.BuildingID + "," + Message.Address + ",romType."
                                        + Message.Description, " where romType." + Message.Description + "<>'Warehouse'", Message.BuildingTable
                                        + " rom join " + Message.BuildingTypeTable + " romType on rom." + Message.BuildingTypeID + "=romType."
                                        + Message.BuildingTypeID, grdRoom, 1, column);
                                    dt = com.getData(Message.UserAccountTable, Message.RoomManage + "," + Message.FullName,
                                        " where " + Message.UserLevel + "=2 and "
                                        + Message.RoomManage + " is not NULL");
                                    if (dt.Rows.Count > 0)
                                    {
                                        for (int i = 0; i < dt.Rows.Count; i++)
                                        {
                                            string[] roomMa = dt.Rows[i][0].ToString().Split('|');
                                            for (int j = 0; j < roomMa.Length - 1; j++)
                                            {
                                                for (int k = 0; k < grdRoom.Rows.Count; k++)
                                                {
                                                    if (roomMa[j] == grdRoom.Rows[k].Cells[1].Text)
                                                    {
                                                        if (grdRoom.Rows[k].Cells[4].Text == "&nbsp;")
                                                        {
                                                            grdRoom.Rows[k].Cells[4].Text = dt.Rows[i][1].ToString() + "<br>";
                                                        }
                                                        else
                                                        {
                                                            grdRoom.Rows[k].Cells[4].Text = grdRoom.Rows[k].Cells[4].Text + dt.Rows[i][1].ToString() + "<br>";
                                                        }
                                                        grdRoom.Rows[k].ForeColor = System.Drawing.ColorTranslator.FromHtml("#BB3438");
                                                        grdRoom.Rows[k].Attributes.Add("style", "font-weight:bold");
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    lblError.Text = "Bạn đang điền thiếu 1 số thông tin bắt buộc";
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }

        protected void myCheckBox_OnCheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = (CheckBox)sender;
            //HiddenField1.Value = cb.Checked.ToString();
        }
    }
}