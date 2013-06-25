﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelManagement
{
    public partial class TopSecret : System.Web.UI.Page
    {
        CommonFunction com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["MenuID"] = "4";
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
            Page.Header.Title = "Top Secret";
            DataTable dt = com.getData(Message.Stuff, "*", " where " + Message.StuffID + "=4");
            if (dt.Rows.Count > 0)
            {
                NewsContent.Text = dt.Rows[0][1].ToString();
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
            Class.Stuff newStuff = new Class.Stuff(4);
            newStuff.StuffContent = CKEditor1.Text;
            newStuff.UpdateStuff();
            NewsContent.Text = newStuff.StuffContent;
            pnlNew.Visible = true;
            pnlEdit.Visible = false;
        }
    }
}