using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class ChooseFurniture : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["BuildingID"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("AccessDenied.aspx");
            }
            DataTable dt = com.getData(Message.FurnitureTypeTable, Message.Description+","+Message.FurnitureType, "");
            pnlAll.Controls.Add(new LiteralControl("<div style=\"height:300px;overflow:scroll;\">"));
            for (int i = 0; i < dt.Rows.Count; i++) {
                DataTable fur = com.getData(Message.FurnitureTable + " fur join " + Message.BuildingTable + " bui on fur."
                    + Message.CurrentBuilding + " = bui." + Message.BuildingID, Message.FurnitureID + "," + Message.Name
                    + "," + Message.MadeIn + ",fur." + Message.Picture+",fur."+Message.Description, " where " + Message.FurnitureType + "="
                    + dt.Rows[i][1].ToString() + " and bui." + Message.BuildingID + "=" + Session["BuildingID"].ToString());
                if (fur.Rows.Count > 0)
                {
                    pnlAll.Controls.Add(new LiteralControl("<div style=\"color:#1D8A0D;font-size:14pt;\">Choose " + dt.Rows[i][0].ToString() + "</div><br/><div class=\"table\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tr><th></th><th>Name</th><th>Made in</th>"
                    + "<th>Description</th></tr>"));

                    for (int j = 0; j < fur.Rows.Count; j++)
                    {
                        CheckBox cb = new CheckBox();
                        cb.ID = "CheckBox" + fur.Rows[j][0].ToString();
                        pnlAll.Controls.Add(new LiteralControl("<tr><td>"));
                        pnlAll.Controls.Add(cb);
                        pnlAll.Controls.Add(new LiteralControl("</td>"));
                        pnlAll.Controls.Add(new LiteralControl("<td>" + fur.Rows[j][1].ToString() + "</td><td>"
                            + fur.Rows[j][2].ToString() + "</td><td>" + fur.Rows[j][4].ToString() + "</td></tr>"));
                    }
                    pnlAll.Controls.Add(new LiteralControl("</table></div><br><hr><br>"));
                }
            }
            pnlAll.Controls.Add(new LiteralControl("</div>"));
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            DataTable dt = com.getData(Message.FurnitureTypeTable, Message.Description + "," + Message.FurnitureType, "");
            string content = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable fur = com.getData(Message.FurnitureTable + " fur join " + Message.BuildingTable + " bui on fur."
                    + Message.CurrentBuilding + " = bui." + Message.BuildingID, Message.FurnitureID + "," + Message.Name
                    + "," + Message.MadeIn + ",fur." + Message.Picture, " where " + Message.FurnitureType + "="
                    + dt.Rows[i][1].ToString() + " and bui." + Message.BuildingID + "=" + Session["BuildingID"].ToString());
                
                for (int j = 0; j < fur.Rows.Count; j++)
                {
                    CheckBox cb = (CheckBox)pnlAll.FindControl("CheckBox" + fur.Rows[j][0].ToString());
                    if (cb.Checked == true) {
                        content = content + "Customer request "+dt.Rows[i][0].ToString()+"<br>Name:"
                            +fur.Rows[j][1].ToString()+"<br>Made In: "+fur.Rows[j][2].ToString()+"<br><br>";
                    }
                }
            }
            content = content + "<br>" + txtComment.Text;
            DataTable email = com.getData(Message.UserAccountTable, Message.Email, " where " + Message.UserLevel
                + "=3 or " + Message.RoomManage + " like '%" + Session["BuildingID"].ToString() + "|%'");
            for (int i = 0; i < email.Rows.Count; i++)
            {
                com.SendMail(email.Rows[i][0].ToString(), "Customer request", content);
            }
            lblSuccess.Text = "Your request were send successfully!";
        }
    }
}