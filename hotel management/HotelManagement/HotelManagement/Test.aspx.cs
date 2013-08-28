using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HotelManagement
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Label1.Text = HttpContext.Current.Server.MapPath("~/Images/") + "/test.txt";
                FileUpload1.SaveAs(HttpContext.Current.Server.MapPath("~/Images/") + "/test.txt");
                Label2.Text = "Done";
                int test = int.Parse("m");
                test++;
            }
            catch (Exception ex)
            {
                if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt"))
                {
                    Label2.Text = "0";
                    string content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt");
                    Label2.Text = "1";
                    content = content + "|" + ex.Message;
                    Label2.Text = "2";
                    File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", content);
                    Label2.Text = "OK";
                }
                else {
                    File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + @"/Log.txt", ex.Message);
                }
            }
        }
    }
}