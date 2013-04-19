using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace SP2010VisualWebPart.User.Attendance
{
    public partial class AttendanceUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmSave = Message.ConfirmSave;
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    try
                    {
                        if (Session["Attendance"] != null && btnInOut.Text != "Out")
                        {
                            txtNote.Text = "";
                            btnInOut.Text = "Out";
                            lblError.Text = "";
                        }
                        else {
                            if (!IsPostBack)
                            {
                                DataTable attendance = _com.getData(Message.TableAttendance, "*", " where " + Message.PunchInColumn
                                    + "=" + Message.PunchOutColumn + " and DAY(" + Message.PunchOutColumn + ")=" + DateTime.Now.Day
                                    + " and MONTH(" + Message.PunchOutColumn + ")=" + DateTime.Now.Month + " and YEAR(" + Message.PunchOutColumn + ")="
                                    + DateTime.Now.Year);
                                if (attendance.Rows.Count > 0)
                                {
                                    txtNote.Text = "";
                                    btnInOut.Text = "Out";
                                    lblError.Text = "";
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.AdminHomePage);
                }
            }
        }
        protected string confirmSave { get; set; }
        protected void btnInOut_Click(object sender, EventArgs e)
        {
            try{
                if (btnInOut.Text == "In")
                {
                    _com.insertIntoTable(Message.TableAttendance, "", "'"+Session["AccountID"]+"','" 
                        + DateTime.Now+"','"+ txtNote.Text.Trim() + "','"+ DateTime.Now + "',NULL,'"
                        + DateTime.Now + "'", false);
                    Session["Attendance"] = "In";
                    txtNote.Text = "";
                    btnInOut.Text = "Out";
                    lblError.Text = "";
                }
                else {
                    _com.updateTable(Message.TableAttendance, " " + Message.PunchOutColumn + "='" + DateTime.Now + "',"
                        + Message.PunchOutNoteColumn + "=N'" + txtNote.Text.Trim() + "'," + Message.ModifiedDateColumn
                        + "='" + DateTime.Now + "' where " + Message.BusinessEntityIDColumn + "='" + Session["AccountID"].ToString()
                        + "' and " + Message.PunchInColumn + "=" + Message.PunchOutColumn);
                    Session.Remove("Attendance");
                    txtNote.Text = "";
                    btnInOut.Text = "In";
                    lblError.Text = "";
                    lblSuccess.Text = Message.UpdateSuccess;
                }
            }catch(Exception ex){
                lblError.Text=ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
        }
    }
}
