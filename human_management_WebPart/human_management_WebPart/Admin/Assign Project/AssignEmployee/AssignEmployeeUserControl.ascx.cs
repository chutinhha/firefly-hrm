using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Admin.Assign_Project.AssignEmployee
{
    public partial class AssignEmployeeUserControl : UserControl
    {
        private Common _com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect(Message.HomePage, true);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            _com.SetItemList(Message.ProjectNameColumn, Message.TableProject, ddlProject, "", true, "");
                            _com.bindData(Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn
                                          , "INNER JOIN " + Message.TableEmployee + "ON  HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID", "(" + Message.TableJobTitle, grdData);
                            Session.Remove("Name");
                            Session.Remove("Email");
                            _com.setGridViewStyle(grdData);
                            grdData.HeaderRow.Cells[1].Text = "Employee Name";
                            grdData.HeaderRow.Cells[2].Text = "Birthdate";
                            grdData.HeaderRow.Cells[3].Text = "Job Title";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Write("<script language='JavaScript'> alert('" + Message.AcessDenied + "'); </script>");
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
            }
        }


        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable myData = _com.getData(Message.TableProject, "WHERE ProjectId = " + ddlProject.SelectedIndex);
            _com.SetItemList(Message.TaskNameColumn, Message.TableTask, ddlTask, "WHERE ProjectId = " + myData.Rows[0][0], true,"");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string condition = " where ";
            try
            {
                if (Request.Form["txtDateFrom"].ToString().Trim() == "" && Request.Form["txtDateTo"].ToString().Trim() == "")
                {
                    _com.bindData(Message.PersonNameColumn + "," + Message.BirthDateColumn + "," + Message.JobTitleColumn
                    , "INNER JOIN " + Message.TableEmployee + "ON  HumanResources.JobTitle.JobId = HumanResources.Employee.JobId) INNER JOIN HumanResources.Person ON HumanResources.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID", "(" + Message.TableJobTitle, grdData);
                    Session.Remove("Name");
                    Session.Remove("Email");
                    _com.setGridViewStyle(grdData);
                    grdData.HeaderRow.Cells[1].Text = "Employee Name";
                    grdData.HeaderRow.Cells[2].Text = "Birthdate";
                    grdData.HeaderRow.Cells[3].Text = "Job Title";
                }
                else
                {
                    if (Request.Form["txtDateFrom"].ToString().Trim() == "") { }
                    else
                        condition = condition + Message.PersonProjectStartDateColumn + ">=" + "CAST(" + Request.Form["txtDateFrom"].ToString().Trim() + " AS DATE)" + " and ";
                    if (Request.Form["txtDateTo"].ToString().Trim() == "") { }
                    else
                        condition = condition + Message.PersonProjectStartDateColumn + "<=" + "CAST(" + Request.Form["txtDateFrom"].ToString().Trim() + " AS DATE)" + " and ";
                    condition = condition.Substring(0, condition.Length - 4);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}