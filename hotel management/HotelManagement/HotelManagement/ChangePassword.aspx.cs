using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HotelManagement
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblSuccess.Text = "";
                if (Session["UserLevel"] != null || Session["Email"] != null)
                {
                }
                else
                {
                    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtConfirm.Text.Trim() == "" || txtNew.Text.Trim() == "" || txtOld.Text.Trim() == "")
                {
                    lblError.Text = "Please enter old,new and confirm password!";
                }
                else
                {
                    if (Session["UserID"] != null)
                    {
                        Class.User currentUser = new Class.User(int.Parse(Session["UserID"].ToString()));
                        if (com.CalculateMD5Hash(txtOld.Text.Trim()).ToLower() != currentUser.Password.ToLower())
                        {
                            lblError.Text = "Your old password is not correct, please try again!";
                        }
                        else
                        {
                            if (txtNew.Text.Trim() != txtConfirm.Text.Trim())
                            {
                                lblError.Text = "Your new password and confirm password are not the same, please try again!";
                            }
                            else
                            {
                                currentUser.Password = txtNew.Text.Trim();
                                currentUser.UpdateUser();
                                lblSuccess.Text = "Thành công";
                            }
                        }
                    }
                    else
                    {
                        Class.Customer currentUser = new Class.Customer(int.Parse(Session["CustomerID"].ToString()));
                        if (com.CalculateMD5Hash(txtOld.Text.Trim()).ToLower() != currentUser.Password.ToLower())
                        {
                            lblError.Text = "Your old password is not correct, please try again!";
                        }
                        else
                        {
                            if (txtNew.Text.Trim() != txtConfirm.Text.Trim())
                            {
                                lblError.Text = "Your new password and confirm password are not the same, please try again!";
                            }
                            else
                            {
                                currentUser.Password = txtNew.Text.Trim();
                                currentUser.UpdateCustomer();
                                lblSuccess.Text = "Thành công";
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