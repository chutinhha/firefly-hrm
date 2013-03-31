using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Admin.Timesheet_Summary.EmployeeReport
{
    public partial class EmployeeReportUserControl : UserControl
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
                            txtEmployee.Text = "";
                            CheckBox1.Checked = false;
                            txtEmail.Text = "";
                            lblEmail.Visible = false;
                            txtEmail.Visible = false;
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, "", true, "All");
                            ddlTask.Items.Clear();
                            ddlTask.Items.Add("All");
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

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (ddlProject.SelectedValue == "All") 
            {
                ddlTask.Items.Clear();
                ddlTask.Items.Add("All");
            }
            else
            {
                try
                {
                    DataTable myData = _com.getData(Message.TableProject, " * ", " WHERE ProjectName like '%" + ddlProject.SelectedValue.ToString() + "%'");
                    _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, " WHERE ProjectId = " + (int)myData.Rows[0][0], true, "All");
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        protected void ddlTask_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Session ["EmployeeName"] = Server.HtmlDecode(txtEmployee.Attributes["value"].ToString().Trim());
            if (txtEmail.Attributes["value"] != null)
            {
                Session["Email"] = Server.HtmlDecode(txtEmail.Attributes["value"].ToString().Trim());
            }
            else Session["Email"] = "";
            Session ["ProjectName"] = Server.HtmlDecode(ddlProject.SelectedValue.ToString());
            Session ["TaskName"] = Server.HtmlDecode(ddlTask.SelectedValue.ToString());
            Session ["Approved"] = Server.HtmlDecode(CheckBox1.Checked.ToString());
            Session ["DateFrom"] = Server.HtmlDecode(Request.Form["txtDateFrom"].ToString().Trim());
            Session ["DateTo"] = Server.HtmlDecode(Request.Form["txtDateTo"].ToString().Trim());
            _com.closeConnection();
            Response.Redirect(Message.ViewEmployeeReportPage, true);
        }

        protected void txtEmployee_TextChanged(object sender, EventArgs e)
        {
            txtEmployee.Attributes["value"] = txtEmployee.Text;
            try
            {
                DataTable myData = _com.getData(Message.TablePerson, " * ", " WHERE Name like '%" + txtEmployee.ToString().Trim() + "%'");
                if (myData.Rows.Count >= 2)
                {
                    lblEmail.Visible = true;
                    txtEmail.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            txtEmail.Attributes["value"] = txtEmail.Text;
        }
    }
}
