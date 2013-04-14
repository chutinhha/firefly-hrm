using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SP2010VisualWebPart.User.MyTask.MyTask
{
    public partial class MyTaskUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    _com.bindData("tas." + Message.TaskNameColumn + ",tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + ",tas." + Message.EndDateColumn, " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, grdData);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
                _com.setGridViewStyle(grdData);
            }
        }

        protected void ddlShow_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                if (ddlShow.SelectedValue == "All") {
                    _com.bindData("tas." + Message.TaskNameColumn + ",tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + ",tas." + Message.EndDateColumn, " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "'", Message.TableTask + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, grdData);
                }
                else if (ddlShow.SelectedValue == "Current Task")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + ",tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + ",tas." + Message.EndDateColumn, " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas."+Message.StartDateColumn+"<='"+DateTime.Today
                            +"' and tas."+Message.EndDateColumn+">='"+DateTime.Today+"'", Message.TableTask 
                            + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, grdData);
                }
                else if (ddlShow.SelectedValue == "Finished Task")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + ",tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + ",tas." + Message.EndDateColumn, " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.EndDateColumn + "<'" + DateTime.Today 
                            + "'", Message.TableTask+ " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, grdData);
                }
                else if (ddlShow.SelectedValue == "Future Task")
                {
                    _com.bindData("tas." + Message.TaskNameColumn + ",tas." + Message.NoteColumn + ",tas." + Message.StartDateColumn
                        + ",tas." + Message.EndDateColumn, " where pp." + Message.BusinessEntityIDColumn + "='"
                            + Session["AccountID"] + "' and tas." + Message.StartDateColumn + ">'" + DateTime.Today
                            + "'", Message.TableTask
                            + " tas join " + Message.TablePersonProject + " pp"
                            + " on tas." + Message.TaskIdColumn + "=pp." + Message.TaskIdColumn, grdData);
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
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
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height:20px;");
                    }
                    else
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;padding-left:5px;line-height:20px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else {
                e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            }
        }
    }
}
