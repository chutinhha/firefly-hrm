using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class Contact : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["MenuID"] = "6";
                lblError.Text = "";
                lblSuccess.Text = "";
                Page.Header.Title = "Contacts";
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
                DataTable dt = com.getData(Message.Stuff, "*", " where " + Message.StuffID + "=7");
                if (dt.Rows.Count > 0)
                {
                    NewsContent.Text = dt.Rows[0][1].ToString();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = true;
            pnlNew.Visible = false;
            CKEditor1.Text = NewsContent.Text;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlNew.Visible = true;
            pnlEdit.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Class.Stuff newStuff = new Class.Stuff(7);
                newStuff.StuffContent = CKEditor1.Text;
                newStuff.UpdateStuff();
                NewsContent.Text = newStuff.StuffContent;
                pnlNew.Visible = true;
                pnlEdit.Visible = false;
            }
            catch (Exception)
            {
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmail.Text.Trim() == "" || txtMessage.Text.Trim() == "" || txtName.Text.Trim() == "" || txtSubject.Text.Trim() == "")
                {
                    lblError.Text = "Please enter your name, email, subject and content of email!";
                }
                else
                {
                    if (!txtEmail.Text.Contains("@"))
                    {
                        lblError.Text = "The email you have enter may be not correct, please re-enter!";
                    }
                    else
                    {
                        DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                       + ">=3");
                        for (int i = 0; i < email.Rows.Count; i++)
                        {
                            com.SendMail(email.Rows[i][0].ToString(), txtSubject.Text + " from " + txtName.Text
                                + "/" + txtEmail.Text, txtMessage.Text);
                        }
                        if (chkEmail.Checked == true)
                        {
                            com.SendMail(txtEmail.Text, txtSubject.Text + " from " + txtName.Text
                                + "/" + txtEmail.Text, txtMessage.Text);
                        }
                        lblSuccess.Text = "Thành công";
                    }
                }
            }
            catch (Exception)
            {
            }
        }
    }
}