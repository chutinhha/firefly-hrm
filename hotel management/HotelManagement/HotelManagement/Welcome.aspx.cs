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
    public partial class Welcome : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["MenuID"] = "5";
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
                DataTable dt = com.getData(Message.Stuff, "*", " where " + Message.StuffID + "=6");
                if (dt.Rows.Count > 0)
                {
                    NewsContent.Text = dt.Rows[0][1].ToString();
                }
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
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
                Class.Stuff newStuff = new Class.Stuff(6);
                newStuff.StuffContent = CKEditor1.Text;
                newStuff.UpdateStuff();
                NewsContent.Text = newStuff.StuffContent;
                pnlNew.Visible = true;
                pnlEdit.Visible = false;
            }
            catch (Exception ex)
            {
                if(!ex.Message.Contains("Thread was being aborted")){if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt")){string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");content = content + "|" + ex.Message;File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);}else {File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);}}
            }
        }
    }
}