using System;
using System.Web.UI;


namespace SP2010VisualWebPart.AddVacancy
{
    public partial class AddVacancyUserControl : UserControl
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
                    Response.Redirect(Message.AccessDeniedPage);
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
                                + txtVacancy.Text.Trim() + "',N'" + txtNoOfPosition.Text 
                                + "',N'" + txtDescription.Text + "',"
                                + "N'" + active + "','"+DateTime.Now+"'",false);
                            _com.closeConnection();
                            Response.Redirect(Message.VacancyPage, true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }else{
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
                            _com.insertIntoTable(Message.TableVacancy, "", "N'" + ddlJobTitle.SelectedValue + "',N'"
                                + txtVacancy.Text.Trim() + "',N'" + txtNoOfPosition.Text
                                + "',N'" + txtDescription.Text + "',"
                                + "N'" + active + "','" + DateTime.Now + "'", false);
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
