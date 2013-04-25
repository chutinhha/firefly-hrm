using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace SP2010VisualWebPart.Admin.Salary.SalarySummary
{
    public partial class SalarySummaryUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        string sort;
                        if (ddlSort.SelectedValue == "Name")
                        {
                            sort = "Name";
                        }
                        else if (ddlSort.SelectedValue == "Highest Salary")
                        {
                            sort = "Salary desc";
                        }
                        else
                        {
                            sort = "Salary asc";
                        }
                        string[] ColumnTitle = new string[1];
                        ColumnTitle[0] = "Salary";
                        DataTable dt = _com.getData(Message.TableEmployee + " e join "
                            + Message.TablePerson + " p", "p.Name,e.Salary", " on e." + Message.BusinessEntityIDColumn + "=p."
                            + Message.BusinessEntityIDColumn + " where e."+Message.CurrentFlagColumn+"='True' and p.Rank='User' order by "+sort);
                        _com.bindDataBlankColumn("p." + Message.BusinessEntityIDColumn + ",p.Name,p."+Message.EmailAddressColumn+" as 'Email'"
                            , " on e." + Message.BusinessEntityIDColumn + "=p."
                            + Message.BusinessEntityIDColumn + " where e." + Message.CurrentFlagColumn + "='True' and p.Rank='User' order by " 
                            + sort, Message.TableEmployee + " e join "+ Message.TablePerson + " p", grdData, 1, ColumnTitle);
                        float totalCostPerMonth = 0;
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i][1].ToString() != "")
                            {
                                totalCostPerMonth = totalCostPerMonth + float.Parse(dt.Rows[i][1].ToString());
                            }
                        }
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            TextBox txtSalary = new TextBox();
                            txtSalary.ID = "txtSalary" + i;
                            txtSalary.Text = dt.Rows[i][1].ToString();
                            txtSalary.Width = 200;
                            txtSalary.Attributes.Add("onkeyup", "ValidateText(this);");
                            grdData.Rows[i].Cells[3].Controls.Add(txtSalary);
                        }
                        DataTable dtCloned = dt.Clone();
                        dtCloned.Columns[0].DataType = typeof(string);
                        dtCloned.Columns[1].DataType = typeof(string);
                        DataRow newRow = dtCloned.NewRow();
                        newRow[0] = totalCostPerMonth.ToString("N");
                        newRow[1] = (totalCostPerMonth * 12).ToString("N");
                        dtCloned.Rows.Add(newRow);
                        grdTotal.DataSource = dtCloned;
                        grdTotal.DataBind();
                        grdTotal.HeaderRow.Cells[0].Text = "Total cost/Month";
                        grdTotal.HeaderRow.Cells[1].Text = "Total cost/Year";
                        _com.setGridViewStyle(grdTotal);
                        Session.Remove("Name");
                        Session.Remove("Email");
                        _com.setGridViewStyle(grdData);
                        ddlSort.AutoPostBack = true;
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            //e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
            //e.Row.Cells[3].Attributes.Add("style", "padding-top:5px;padding-bottom:5px;");
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
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    if (i != 1)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    }
                    else
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;padding-left:5px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else {
                e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
            }
        }

        protected void grdTotal_RowDataBound(object sender, GridViewRowEventArgs e)
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
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            lblError.Text = "";
            string sort;
            if (ddlSort.SelectedValue == "Name")
            {
                sort = "Name";
            }
            else if (ddlSort.SelectedValue == "Highest Salary")
            {
                sort = "Salary desc";
            }
            else
            {
                sort = "Salary asc";
            }
            string[] ColumnTitle = new string[1];
            ColumnTitle[0] = "Salary";
            _com.bindDataBlankColumn("p." + Message.BusinessEntityIDColumn + ",p.Name,p."+Message.EmailAddressColumn
                +" as 'Email'", " on e." + Message.BusinessEntityIDColumn + "=p."
                + Message.BusinessEntityIDColumn + " where e." + Message.CurrentFlagColumn + "='True' and p.Rank='User' order by " 
                + sort, Message.TableEmployee + " e join "+ Message.TablePerson + " p", grdData,1, ColumnTitle);
            DataTable dt = _com.getData(Message.TableEmployee + " e join "
                + Message.TablePerson + " p", "p.Name,e.Salary", " on e." + Message.BusinessEntityIDColumn + "=p."
                + Message.BusinessEntityIDColumn + " where e." + Message.CurrentFlagColumn + "='True' and p.Rank='User' order by " + sort);
            //grdData.HeaderRow.Cells[1].Text = "Edit Salary";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TextBox txtSalary = new TextBox();
                txtSalary.ID = "txtSalary" + i;
                txtSalary.Text = dt.Rows[i][1].ToString();
                txtSalary.Width = 200;
                txtSalary.Attributes.Add("onkeyup", "ValidateText(this);");
                grdData.Rows[i].Cells[3].Controls.Add(txtSalary);
            }
            float totalCostPerMonth = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][1].ToString() != "")
                {
                    totalCostPerMonth = totalCostPerMonth + float.Parse(dt.Rows[i][1].ToString());
                }
            }
            DataTable dtCloned = dt.Clone();
            dtCloned.Columns[0].DataType = typeof(string);
            dtCloned.Columns[1].DataType = typeof(string);
            DataRow newRow = dtCloned.NewRow();
            newRow[0] = totalCostPerMonth.ToString("N");
            newRow[1] = (totalCostPerMonth * 12).ToString("N");
            dtCloned.Rows.Add(newRow);
            grdTotal.DataSource = dtCloned;
            grdTotal.DataBind();
            grdTotal.HeaderRow.Cells[0].Text = "Total cost/Month";
            grdTotal.HeaderRow.Cells[1].Text = "Total cost/Year";
            _com.setGridViewStyle(grdTotal);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < grdData.Rows.Count; i++)
                {
                    TextBox txtSalary = (TextBox)grdData.Rows[i].Cells[2].FindControl("txtSalary"+i);
                    _com.updateTable(Message.TableEmployee," Salary='"+txtSalary.Text.Trim()+"' where "
                        +Message.BusinessEntityIDColumn+"='"+grdData.Rows[i].Cells[0].Text+"'");
                }
                lblSuccess.Text = Message.UpdateSuccess;
                string sort;
                if (ddlSort.SelectedValue == "Name")
                {
                    sort = "Name";
                }
                else if (ddlSort.SelectedValue == "Highest Salary")
                {
                    sort = "Salary desc";
                }
                else
                {
                    sort = "Salary asc";
                }
                DataTable dt = _com.getData(Message.TableEmployee + " e join "
                    + Message.TablePerson + " p", "p.Name,e.Salary", " on e." + Message.BusinessEntityIDColumn
                    + "=p." + Message.BusinessEntityIDColumn + " where e." + Message.CurrentFlagColumn + "='True' and p.Rank='User' order by " + sort);
                float totalCostPerMonth = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i][1].ToString() != "")
                    {
                        totalCostPerMonth = totalCostPerMonth + float.Parse(dt.Rows[i][1].ToString());
                    }
                }
                DataTable dtCloned = dt.Clone();
                dtCloned.Columns[0].DataType = typeof(string);
                dtCloned.Columns[1].DataType = typeof(string);
                DataRow newRow = dtCloned.NewRow();
                newRow[0] = totalCostPerMonth.ToString("N");
                newRow[1] = (totalCostPerMonth * 12).ToString("N");
                dtCloned.Rows.Add(newRow);
                grdTotal.DataSource = dtCloned;
                grdTotal.DataBind();
                grdTotal.HeaderRow.Cells[0].Text = "Total cost/Month";
                grdTotal.HeaderRow.Cells[1].Text = "Total cost/Year";
                _com.setGridViewStyle(grdTotal);
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
