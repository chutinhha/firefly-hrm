using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class Register : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Create new account";
            if (Session["UserLevel"] != null)
            {
                if (Session["UserLevel"].ToString() == "3") { }
                else
                {
                    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                    Response.Redirect("AccessDenied.aspx");
                }
            }
            else
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("AccessDenied.aspx");
            }
            if (!IsPostBack) {
                pnlRoom.Visible = false;
            }
            string[] column = new string[1];
            column[0] = "Current Manager";
            DataTable dt;
            com.bindDataBlankColumn(Message.BuildingID + "," + Message.Address + ",romType."
                + Message.Description, " where romType." + Message.Description + "<>'Warehouse'", Message.BuildingTable
                + " rom join " + Message.BuildingTypeTable + " romType on rom." + Message.BuildingTypeID + "=romType."
                + Message.BuildingTypeID,grdRoom,1,column);
            dt = com.getData(Message.UserAccountTable, Message.RoomManage+","+Message.FullName, 
                " where " + Message.UserLevel + "=2 and "
                + Message.RoomManage + " is not NULL");
            if (dt.Rows.Count > 0) {
                for (int i = 0; i < dt.Rows.Count; i++) {
                    string[] roomMa = dt.Rows[i][0].ToString().Split('|');
                    for (int j = 0; j < roomMa.Length - 1; j++) {
                        for (int k = 0; k < grdRoom.Rows.Count; k++) {
                            if (roomMa[j] == grdRoom.Rows[k].Cells[1].Text) {
                                grdRoom.Rows[k].Cells[4].Text = grdRoom.Rows[k].Cells[4].Text + dt.Rows[i][1].ToString() + "<br>";
                                grdRoom.Rows[k].ForeColor = System.Drawing.ColorTranslator.FromHtml("#BB3438");
                                grdRoom.Rows[k].Attributes.Add("style", "font-weight:bold");
                            }
                        }
                    }
                }
            }
        }
        protected void ddlAccountType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAccountType.SelectedValue == "Building Manager")
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
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblSuccess.Text = "";
            if (ddlAccountType.SelectedValue != "Please select")
            {
                if (ddlAccountType.SelectedValue == "Building Manager") {
                    if (txtUserName.Text.Trim() == "" || txtPassword.Text.Trim() == "")
                    {
                        lblError.Text = "Some required field are missing";
                    }
                    else
                    {
                        DataTable dt = com.getData(Message.UserAccountTable, Message.UserName,
                            " where " + Message.UserName + "='" + txtUserName.Text.Trim() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = "This user name already exist!";
                        }
                        else
                        {
                            if (txtMail.Text.Trim() != "" && (!txtMail.Text.Contains("@") || txtMail.Text.Contains("@.")))
                            {
                                lblError.Text = "Email is not in right format";
                            }
                            else
                            {
                                Class.User newUser = new Class.User();
                                newUser.Address = txtAddress.Text;
                                newUser.Email = txtMail.Text;
                                newUser.FullName = txtName.Text;
                                newUser.Password = txtPassword.Text;
                                newUser.PhoneNumber = txtPhone.Text;
                                newUser.Status = true;
                                newUser.UserName = txtUserName.Text.Trim();
                                newUser.UserLevel = 2;
                                bool isCheck = false;
                                foreach (GridViewRow gr in grdRoom.Rows)
                                {
                                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                                    string checkedState = Request.Form[cb.UniqueID];
                                    if (checkedState!=null)
                                    {
                                        isCheck = true;
                                        newUser.RoomManage = newUser.RoomManage + gr.Cells[1].Text + "|";
                                    }
                                }
                                if (isCheck == true)
                                {
                                    newUser.AddUser();
                                    lblSuccess.Text = "Successful";
                                }
                            }
                        }
                    }
                }
                else
                {
                    if (txtUserName.Text.Trim() == "" || txtPassword.Text.Trim() == "")
                    {
                        lblError.Text = "Some required field are missing";
                    }
                    else
                    {
                        DataTable dt = com.getData(Message.UserAccountTable, Message.UserName,
                            " where " + Message.UserName + "='" + txtUserName.Text.Trim() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            lblError.Text = "This user name already exist!";
                        }
                        else
                        {
                            if (txtMail.Text.Trim() != "" && (!txtMail.Text.Contains("@") || txtMail.Text.Contains("@.")))
                            {
                                lblError.Text = "Email is not in right format";
                            }
                            else
                            {
                                Class.User newUser = new Class.User();
                                newUser.Address = txtAddress.Text;
                                newUser.Email = txtMail.Text;
                                newUser.FullName = txtName.Text;
                                newUser.Password = txtPassword.Text;
                                newUser.PhoneNumber = txtPhone.Text;
                                newUser.Status = true;
                                newUser.UserName = txtUserName.Text.Trim();
                                if (ddlAccountType.SelectedValue == "Website Manager")
                                {
                                    newUser.UserLevel = 1;
                                }
                                else
                                {
                                    newUser.UserLevel = 3;
                                }
                                newUser.AddUser();
                                lblSuccess.Text = "Successful";
                            }
                        }
                    }
                }
            }
            else {
                lblError.Text = "Some required field are missing";
            }
        }

        protected void myCheckBox_OnCheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = (CheckBox)sender;
            HiddenField1.Value = cb.Checked.ToString();
        }
    }
}