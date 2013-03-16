using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;


namespace SP2010VisualWebPart.AddVacancy
{
    public partial class AddVacancyUserControl : UserControl
    {
        private Common _com = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"].ToString() == "Admin")
            {
                try
                {
                    if (!IsPostBack)
                    {
                        _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", false, "");
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
            else
            {
                Response.Write("<script language='JavaScript'> alert('"+Message.AcessDenied+"'); </script>");
                if (Session["Account"] != null)
                {
                    Response.Redirect(Session["Account"] + ".aspx", true);
                }
                else
                {
                    Response.Redirect(Message.HomePage, true);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtVacancy.Text.Trim() == "")
            {
                lblError.Text = Message.VacancyNameError;
            }
            else {
                try
                {
                    if (txtNoOfPosition.Text.Trim() != "")
                    {
                        int no = int.Parse(txtNoOfPosition.Text.Trim());
                        try
                        {
                            string active;
                            if (chkActive.Checked == true)
                            {
                                active = "Active";
                            }
                            else
                            {
                                active = "Closed";
                            }
                            _com.insertIntoTable(Message.TableVacancy,"", "N'" + ddlJobTitle.SelectedValue + "',N'"
                                + txtVacancy.Text.Trim() + "',N'" + txtHiringManager.Text + "',N'" + txtNoOfPosition.Text 
                                + "',N'" + txtDescription.Text + "',"
                                + "N'" + active + "','"+DateTime.Now+"'",false);
                            _com.closeConnection();
                            Response.Redirect(Message.VacancyPage, true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
                catch (FormatException) {
                    lblError.Text = Message.NumberOfPosition;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.VacancyPage, true);
        }
    }
}
