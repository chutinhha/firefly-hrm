using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.Admin.Timesheet_Summary.ProjectReport
{
    public partial class ProjectReportUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            lblError.Text = "";
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, "", true, "All");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
            ddlProject.AutoPostBack = true;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Session["ProjectName"] = Server.HtmlDecode(ddlProject.SelectedValue.ToString());
            Session["Approved"] = Server.HtmlDecode(CheckBox1.Checked.ToString());
            Session["DateFrom"] = Server.HtmlDecode(Request.Form["txtDateFrom"].ToString().Trim());
            Session["DateTo"] = Server.HtmlDecode(Request.Form["txtDateTo"].ToString().Trim());
            _com.closeConnection();
            Response.Redirect(Message.ViewProjectReportPage, true);
        }

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
