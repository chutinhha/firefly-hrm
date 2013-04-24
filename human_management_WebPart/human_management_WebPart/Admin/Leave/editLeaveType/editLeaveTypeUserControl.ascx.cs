using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Leave.editLeaveType
{
    public partial class editLeaveTypeUserControl : UserControl
    {
        private string strTaskID = "";
        private CommonFunction _com = new CommonFunction();
        protected string strStartDateValue { get; set; }
        protected string strEndDateValue { get; set; }

        protected void loadData()
        {
            strEndDateValue = "";
            strStartDateValue = "";
            string strTableName = Message.TableTask;
            string strColum = " " + Message.TaskNameColumn + "," + Message.NoteColumn + ", " + Message.LimitDateColumn + " ";
            string strCondition = " WHERE " + Message.TaskIdColumn + " = " + strTaskID;
            DataTable dt = _com.getData(strTableName, strColum, strCondition);
            txtLeaveName.Text = dt.Rows[0][0].ToString();
            txtNote.Text = dt.Rows[0][1].ToString();
            if (dt.Rows[0][2].ToString() == "0")
            {
                rdbLimitedNo.Checked = true;
                rdbLimitedYes.Checked = false;
                txtLimitDay.Text = "";
                pnlLimitedYes.Visible = false;
                pnlStartEndDateGroup.Visible = true;
                setDataDateTime();
            }
            else
            {
                rdbLimitedYes.Checked = true;
                rdbLimitedNo.Checked = false;
                txtLimitDay.Text = dt.Rows[0][2].ToString();
                pnlLimitedYes.Visible = true;
                pnlStartEndDateGroup.Visible = false;
            }
        }

        private void setDataDateTime()
        {
            string strTableName = Message.TableTask;
            string strColum = " " + Message.StartDateColumn + "," + Message.EndDateColumn + " ";
            string strCondition = " WHERE " + Message.TaskIdColumn + " = " + strTaskID;
            DataTable dt = _com.getData(strTableName, strColum, strCondition);
            if (dt.Rows.Count > 0)
            {
                if ((dt.Rows[0][0].ToString().Trim() != "") && ((dt.Rows[0][1].ToString().Trim() != "")))
                {
                    DateTime dtmStartDate = DateTime.Parse(dt.Rows[0][0].ToString().Trim());
                    strStartDateValue = dtmStartDate.Month + "/" + dtmStartDate.Day + "/" + dtmStartDate.Year;
                    DateTime dtmEndDate = DateTime.Parse(dt.Rows[0][1].ToString().Trim());
                    strEndDateValue = dtmEndDate.Month + "/" + dtmEndDate.Day + "/" + dtmEndDate.Year;
                }
                else
                {
                    strEndDateValue = "";
                    strStartDateValue = "";
                }
            }
        }

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
                        if (!IsPostBack)
                        {
                            // Get ID
                            strTaskID = Request.QueryString["TaskID"];
                            if (strTaskID == null) { }
                            else
                            {
                                //Delete link ID
                                Session["TaskID"] = strTaskID;
                                Response.Redirect(Message.EditLeaveTypePage);
                            }
                            strTaskID = Session["TaskID"].ToString();
                            loadData();
                        }
                        strTaskID = Session["TaskID"].ToString();
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtLeaveName.Text == "")
                {
                    lblUserGuide.Text = Message.MissRequired;
                    return;
                }
                if (rdbLimitedYes.Checked == true)
                {
                    if (txtLimitDay.Text == "")
                    {
                        lblUserGuide.Text = Message.MissRequired;
                        return;
                    }
                }
                //Check StartDate end Enddate
                string strStartDate = "null";
                string strEndDate = "null";
                if (rdbLimitedNo.Checked == true)
                {
                    strStartDate = Request.Form["txtStartDate"].ToString().Trim();
                    strEndDate = Request.Form["txtEndDate"].ToString().Trim();
                    if ((strEndDate == "") || (strStartDate == ""))
                    {
                        lblUserGuide.Text = "Please check input of start date and end date.";
                        return;
                    }
                    DateTime dtStartDate;
                    DateTime dtEndDate;
                    try
                    {
                        dtStartDate = DateTime.Parse(strStartDate);
                        dtEndDate = DateTime.Parse(strEndDate);
                        if (dtEndDate < dtStartDate)
                        {
                            lblUserGuide.Text = "Start date must less than end date";
                            return;
                        }
                    }
                    catch
                    {
                        lblUserGuide.Text = "Please check format of start date and end date.";
                        return;
                    }
                }
                lblUserGuide.Text = "";
                //Insert Database to Project Table
                string strTableName = Message.TableTask;
                //Leave Name;
                string strLeaveName = Message.TaskNameColumn + " = N'" + txtLeaveName.Text + "'";
                //Leave Note
                string strNote = Message.NoteColumn + " = N'" + txtNote.Text + "'";
                //LimitedDate            
                string strLimitedDate = "";
                if (txtLimitDay.Text != "") strLimitedDate = Message.LimitDateColumn + " = "
                    + txtLimitDay.Text;
                else strLimitedDate = Message.LimitDateColumn + " = 0";
                //Start Date and End Date               
                if (strStartDate != "null") strStartDate = Message.StartDateColumn + " = '" + strStartDate + "'";
                else
                    strStartDate = Message.StartDateColumn + " = null";
                if (strEndDate != "null") strEndDate = Message.EndDateColumn + " = '" + strEndDate + "'";
                else
                    strEndDate = Message.EndDateColumn + " = null";
                //Condition
                strTaskID = Session["TaskID"].ToString();
                string strCondition = strLeaveName + " , " + strNote + " , " + strLimitedDate + " , " + strStartDate + " , " + strEndDate
                    + " where " + Message.TaskIdColumn + " = " + strTaskID;
                _com.updateTable(strTableName, strCondition);



                _com.closeConnection();
                Response.Redirect(Message.LeaveTypeList, true);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.LeaveTypeList, true);
        }

        protected void rdbLimitedYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rdbLimitedYes.Checked == true)
            {
                pnlLimitedYes.Visible = true;
                pnlStartEndDateGroup.Visible = false;
                strStartDateValue = "null";
                strEndDateValue = "null";
            }
        }

        protected void rdbLimitedNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rdbLimitedNo.Checked == true)
            {
                pnlLimitedYes.Visible = false;
                txtLimitDay.Text = "";
                pnlStartEndDateGroup.Visible = true;
                setDataDateTime();
            }
        }

        protected void btnLeaveTypeList_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.LeaveTypeList, true);
        }
    }
}
