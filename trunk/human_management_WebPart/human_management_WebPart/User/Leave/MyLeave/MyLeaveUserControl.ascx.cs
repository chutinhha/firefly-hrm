using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.User.Leave.MyLeave
{
    public partial class MyLeaveUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    pnlData.Visible = false;
                    if (!IsPostBack) {
                        this.startDate = "";
                        this.endDate = "";
                        _com.setGridViewStyle(grdData);
                        _com.SetItemList("tas." + Message.TaskNameColumn, Message.TableProject + " pro join "
                            + Message.TableTask + " tas on pro." + Message.ProjectIDColumn + " = tas." + Message.ProjectIDColumn
                            , ddlDayOff, " where pro." + Message.ProjectNameColumn + "='Leave'", true, "All");
                    }
                }
                else
                {
                    Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            pnlData.Visible = false;
        }

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
            this.endDate = Request.Form["txtDateTo"].ToString().Trim();
            string column = " tas."+Message.TaskNameColumn+" as 'Leave Type',pp."+Message.StartDateColumn
                +" as 'Start Date',pp."+Message.EndDateColumn+" as 'End Date',CAST(pp."+Message.CurrentFlagColumn+" AS nvarchar(15)) AS"
                +" 'Status',pp."+Message.NoteColumn;
            string condition = " where pp."+Message.BusinessEntityIDColumn+"='"+Session["AccountID"]
                +"' and pro."+Message.ProjectNameColumn+"='Leave'";
            string table= Message.TablePersonProject+" pp join "+Message.TableTask+" tas on pp."+Message.TaskIdColumn
                +"=tas."+Message.TaskIdColumn+" join "+Message.TableProject+" pro on pro."+Message.ProjectIDColumn
                +"=tas."+Message.ProjectIDColumn;
            if (Request.Form["txtDateFrom"].ToString().Trim() != "")
            {
                condition = condition + " and pp."+Message.StartDateColumn+" >= CAST('" 
                    + Request.Form["txtDateFrom"].ToString().Trim() + "' AS DATE) ";  
            }
            if (Request.Form["txtDateTo"].ToString().Trim() != "")
            {
                condition = condition + " and pp." + Message.StartDateColumn + " <= CAST('"
                    + Request.Form["txtDateTo"].ToString().Trim() + "' AS DATE) ";
            }
            if (ddlStatus.SelectedValue == "Approved")
            {
                condition = condition + " and pp."+Message.CurrentFlagColumn+" = '1'";
            }
            if (ddlStatus.SelectedValue == "Not Approved")
            {
                condition = condition + " and pp."+Message.CurrentFlagColumn+" = '0'";
            }
            if (ddlStatus.SelectedValue == "Reject")
            {
                condition = condition + " and pp."+Message.CurrentFlagColumn+" = '2'";
            }
            if (ddlDayOff.SelectedValue != "All") {
                condition = condition + " and tas."+Message.TaskNameColumn+"='" + ddlDayOff.SelectedValue + "'";
            }
            _com.bindData(column, condition, table, grdData);
            if (grdData.Rows.Count > 0)
            {
                foreach (GridViewRow myRow in grdData.Rows)
                {
                    if (myRow.Cells[3].Text.ToString() == "0")
                    {
                        myRow.Cells[3].Text = "Not Approved";
                    }
                    else if (myRow.Cells[3].Text.ToString() == "1")
                    {
                        myRow.Cells[3].Text = "Approved";
                    }
                    else
                    {
                        myRow.Cells[3].Text = "Reject";
                    }
                }
                lblError.Text = "";
                pnlData.Visible = true;
            }
            else
            {
                lblError.Text = Message.NotExistData;
                pnlData.Visible = false;
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //string Location = "EditCandidate.aspx/?Name=" + Server.HtmlDecode(e.Row.Cells[2].Text)
                //+ "&Email=" + Server.HtmlDecode(e.Row.Cells[3].Text);
                e.Row.Style["cursor"] = "pointer";
                e.Row.Attributes.Add("onMouseOver", "this.style.cursor = 'hand';this.style.backgroundColor = '#CCCCCC';");
                if (e.Row.RowIndex % 2 != 0)
                {
                    e.Row.Attributes.Add("style", "background-color:white;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = 'white';");
                }
                else
                {
                    e.Row.Attributes.Add("style", "background-color:#EAEAEA;");
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor = '#EAEAEA';");
                }
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (i != 0)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    }
                    else {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;padding-left:5px;line-height: 20px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void ddlDayOff_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
