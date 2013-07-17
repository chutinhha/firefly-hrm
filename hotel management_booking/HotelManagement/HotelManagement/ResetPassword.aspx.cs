using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblSuccess.Text = "";
            Page.Title = "Reset password";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmail.Text.Trim() == "")
                {
                    lblError.Text = "Please enter your email!";
                }
                else
                {
                    if (!txtEmail.Text.Contains("@"))
                    {
                        lblError.Text = "Format of your email may be not correct, please try again!";
                    }
                    else
                    {
                        DataTable dt = com.getData(Message.UserAccountTable, Message.UserID + "," + Message.Email,
                            " where " + Message.Email + "='" + txtEmail.Text.Trim() + "'");
                        if (dt.Rows.Count == 0)
                        {
                            dt = com.getData(Message.CustomerTable, Message.CustomerID + "," + Message.Email,
                            " where " + Message.Email + "='" + txtEmail.Text.Trim() + "'");
                            if (dt.Rows.Count == 0)
                            {
                                lblError.Text = "Sorry! Your email is not recognize as one of our member, please try again!";
                            }
                            else
                            {
                                Class.Customer currentUser = new Class.Customer(int.Parse(dt.Rows[0][0].ToString()));
                                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                                var stringChars = new char[8];
                                var random = new Random();

                                for (int i = 0; i < stringChars.Length; i++)
                                {
                                    stringChars[i] = chars[random.Next(chars.Length)];
                                }

                                var finalString = new String(stringChars);
                                currentUser.Password = finalString;
                                currentUser.UpdateCustomer();
                                com.SendMail(dt.Rows[0][1].ToString(), "Reset password", "Your new password is: " + finalString);
                                lblSuccess.Text = "Success! Please check out your email!";
                            }
                        }
                        else
                        {
                            Class.User currentUser = new Class.User(int.Parse(dt.Rows[0][0].ToString()));
                            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                            var stringChars = new char[8];
                            var random = new Random();

                            for (int i = 0; i < stringChars.Length; i++)
                            {
                                stringChars[i] = chars[random.Next(chars.Length)];
                            }

                            var finalString = new String(stringChars);
                            currentUser.Password = finalString;
                            currentUser.UpdateUser();
                            com.SendMail(dt.Rows[0][1].ToString(), "Reset password", "Your new password is: " + finalString);
                            lblSuccess.Text = "Success! Please check out your email!";
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
        }
    }
}