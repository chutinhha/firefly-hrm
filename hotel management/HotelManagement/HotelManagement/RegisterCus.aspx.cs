﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace HotelManagement
{
    public partial class RegisterCus : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["MenuID"] = "7";
            Page.Title = "Register";
            lblError.Text = "";
            lblSuccess.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlTitle.SelectedIndex == 0 || txtConfirmPassword.Text == "" || txtEmail.Text.Trim() == ""
                    || txtFName.Text.Trim() == "" || txtPassword.Text.Trim() == "" || txtLName.Text.Trim() == "")
                {
                    lblError.Text = "Some required data are missing!";
                }
                else
                {
                    if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
                    {
                        lblError.Text = "Your password and confirm password are not the same! Please try again!";
                    }
                    else
                    {
                        if (!txtEmail.Text.Contains("@")) { }
                        else
                        {
                            DataTable dt = com.getData(Message.CustomerTable, "*", " where "
                                + Message.Email + "='" + txtEmail.Text + "'");
                            if (dt.Rows.Count == 0)
                            {
                                Class.Customer cus = new Class.Customer();
                                cus.Gender = (ddlTitle.SelectedIndex - 1).ToString();
                                cus.FirstName = txtFName.Text.Trim();
                                cus.LastName = txtLName.Text.Trim();
                                cus.MiddleName = txtMName.Text.Trim();
                                cus.PhoneNumber = txtPhone.Text.Trim();
                                cus.Password = txtPassword.Text.Trim();
                                cus.Email = txtEmail.Text.Trim();
                                cus.AddCustomer();
                                lblSuccess.Text = "Successful";
                                com.SendMail(txtEmail.Text, "Register successful", "Your account have been created.");
                            }
                            else
                            {
                                lblError.Text = "This email is already exist in our system. If you have forgot your password. Please click <a style=\"color:Blue;\" href=\"ResetPassword.aspx\">here</a> to reset password!";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }
    }
}