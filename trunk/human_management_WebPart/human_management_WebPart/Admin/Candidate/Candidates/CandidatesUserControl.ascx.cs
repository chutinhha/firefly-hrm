using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace SP2010VisualWebPart.Candidates
{
    public partial class CandidatesUserControl : UserControl
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
                            _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "All");
                            _com.SetItemList(Message.VacancyNameColumn, Message.TableVacancy, ddlVacancy, "", true, "All");
                            _com.SetItemList(Message.StatusColumn, Message.TableCandidateStatus, ddlStatus, "", true, "All");
                            _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.HiringManagerColumn
                                + "," + Message.EmailColumn + "," + Message.ApplyDateColumn + "," + Message.StatusColumn + "", "", Message.TableJobCandidate, grdData);
                            Session.Remove("Name");
                            Session.Remove("Email");
                            _com.setGridViewStyle(grdData);
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

        protected void CheckUncheckAll(object sender, EventArgs e)
        {
            //Check or uncheck all checkbox
            CheckBox cbSelectedHeader = (CheckBox)grdData.HeaderRow.FindControl("CheckBox2");
            foreach (GridViewRow row in grdData.Rows)
            {
                CheckBox cbSelected = (CheckBox)row.FindControl("myCheckBox");
                if (cbSelectedHeader.Checked == true)
                {
                    cbSelected.Checked = true;
                }
                else
                {
                    cbSelected.Checked = false;
                }       
            }
        }

        protected void ddlJobTitle_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
        }

        protected void cldData_SelectionChanged1(object sender, EventArgs e)
        {
        }

        protected void btnDateTo_Click(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                ddlJobTitle.SelectedIndex = 0;
                ddlVacancy.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;
                ddlApplyMethod.SelectedIndex = 0;
                txtHiringManager.Text = "";
                txtCandidateName.Text = "";
                txtKeyword.Text = "";
                _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.HiringManagerColumn
                            + "," + Message.EmailColumn + "," + Message.ApplyDateColumn + "," + Message.StatusColumn 
                            + "", "", Message.TableJobCandidate, grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnDateFrom_Click(object sender, EventArgs e)
        {
        }

        protected void txtDateFrom_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cldData1_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void txtHiringManager_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string condition = " where ";
                if (ddlJobTitle.SelectedValue == "All") { }
                else
                {
                    condition = condition + Message.JobTitleColumn+"='" + ddlJobTitle.SelectedItem.Text + "' and ";
                }
                if (ddlVacancy.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.JobVacancyColumn+"='" + ddlVacancy.SelectedItem.Text + "' and ";
                }
                if (ddlStatus.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.StatusColumn+"='" + ddlStatus.SelectedItem.Text + "' and ";
                }
                if (ddlApplyMethod.SelectedItem.Text == "All") { }
                else
                {
                    condition = condition + Message.MethodOfApplyColumn+"='" + ddlApplyMethod.SelectedItem.Text + "' and ";
                }
                if (txtHiringManager.Text.Trim() == "") { }
                else
                {
                    condition = condition + Message.HiringManagerColumn+" like'%" + txtHiringManager.Text + "%' and ";
                }
                if (txtCandidateName.Text.Trim() == "") { }
                else
                {
                    condition = condition + Message.FullNameColumn+" like'%" + txtCandidateName.Text + "%' and ";
                }
                if (txtKeyword.Text.Trim() == "") { }
                else
                {
                    condition = condition + Message.KeywordColumn+" like'%" + txtKeyword.Text + "%' and ";
                }
                if (Request.Form["txtDateFrom"].ToString().Trim() == "") { }
                else
                {
                    condition = condition + Message.ApplyDateColumn + " >= '" + Request.Form["txtDateFrom"].ToString().Trim() + "' and ";
                }
                if (Request.Form["txtDateTo"].ToString().Trim() == "") { }
                else
                {
                    condition = condition + Message.ApplyDateColumn + " <= '" + Request.Form["txtDateTo"].ToString().Trim() + "' and ";
                }
                if (condition == " where ")
                {
                    condition = "";
                }
                else
                {
                    condition = condition.Substring(0, condition.Length - 4);
                }
                _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.HiringManagerColumn
                            + "," + Message.EmailColumn + "," + Message.ApplyDateColumn + "," + Message.StatusColumn 
                            + "",condition, Message.TableJobCandidate, grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void grdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try{
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from "+Message.TableJobCandidate+" where "+Message.FullNameColumn+"=N'" 
                            + Server.HtmlDecode(gr.Cells[2].Text)+"' and "+Message.EmailColumn+"='"+gr.Cells[4].Text+"';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                _com.bindData(Message.JobVacancyColumn + "," + Message.FullNameColumn + "," + Message.HiringManagerColumn
                            + "," + Message.EmailColumn + "," + Message.ApplyDateColumn + "," + Message.StatusColumn 
                            + "", "", Message.TableJobCandidate, grdData);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[2].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.EditCandidatePage,true);
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.AddCandidatePage,true);
        }
    }
}
