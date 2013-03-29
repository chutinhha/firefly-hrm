using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Salary.SalarySummary
{
    public partial class SalarySummaryUserControl : UserControl
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
                            + Message.BusinessEntityIDColumn + " order by "+sort);
                        _com.bindDataBlankColumn("p." + Message.BusinessEntityIDColumn + ",p.Name,p."+Message.EmailAddressColumn
                            , " on e." + Message.BusinessEntityIDColumn + "=p." 
                            + Message.BusinessEntityIDColumn + " order by "+sort, Message.TableEmployee + " e join "
                            + Message.TablePerson + " p", grdData, 1, ColumnTitle);
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
                            grdData.Rows[i].Cells[3].Controls.Add(txtSalary);
                        }
                        DataRow newRow = dt.NewRow();
                        newRow[0] = totalCostPerMonth;
                        newRow[1] = totalCostPerMonth*12;
                        dt.Rows.Clear();
                        dt.Rows.Add(newRow);
                        grdTotal.DataSource = dt;
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
                    }
                }
                else
                {
                    Response.Redirect(Message.AccessDeniedPage);
                }
            }
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Attributes.Add("style", "padding-left:5px;");
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
            _com.bindDataBlankColumn("p." + Message.BusinessEntityIDColumn + ",p.Name,p."+Message.EmailAddressColumn, " on e." + Message.BusinessEntityIDColumn + "=p."
                + Message.BusinessEntityIDColumn + " order by " + sort, Message.TableEmployee + " e join "
                + Message.TablePerson + " p", grdData,1, ColumnTitle);
            DataTable dt = _com.getData(Message.TableEmployee + " e join "
                + Message.TablePerson + " p", "p.Name,e.Salary", " on e." + Message.BusinessEntityIDColumn + "=p."
                + Message.BusinessEntityIDColumn + " order by "+sort);
            //grdData.HeaderRow.Cells[1].Text = "Edit Salary";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TextBox txtSalary = new TextBox();
                txtSalary.ID = "txtSalary" + i;
                txtSalary.Text = dt.Rows[i][1].ToString();
                txtSalary.Width = 200;
                grdData.Rows[i].Cells[3].Controls.Add(txtSalary);
            }
            float totalCostPerMonth = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                totalCostPerMonth = totalCostPerMonth + float.Parse(dt.Rows[i][1].ToString());
            }
            DataRow newRow = dt.NewRow();
            newRow[0] = totalCostPerMonth;
            newRow[1] = totalCostPerMonth * 12;
            dt.Rows.Clear();
            dt.Rows.Add(newRow);
            grdTotal.DataSource = dt;
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
                    + Message.TablePerson + " p", "p.Name,e.Salary", " on e." + Message.BusinessEntityIDColumn + "=p."
                    + Message.BusinessEntityIDColumn + " order by " + sort);
                float totalCostPerMonth = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    totalCostPerMonth = totalCostPerMonth + float.Parse(dt.Rows[i][1].ToString());
                }
                DataRow newRow = dt.NewRow();
                newRow[0] = totalCostPerMonth;
                newRow[1] = totalCostPerMonth * 12;
                dt.Rows.Clear();
                dt.Rows.Add(newRow);
                grdTotal.DataSource = dt;
                grdTotal.DataBind();
                grdTotal.HeaderRow.Cells[0].Text = "Total cost/Month";
                grdTotal.HeaderRow.Cells[1].Text = "Total cost/Year";
                _com.setGridViewStyle(grdTotal);
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
            }
        }
    }
}
