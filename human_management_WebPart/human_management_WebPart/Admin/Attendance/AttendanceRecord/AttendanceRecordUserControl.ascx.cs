using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SP2010VisualWebPart.AttendanceRecord
{
    public partial class AttendanceRecordUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        private string _condition = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.confirmDelete = Message.ConfirmDelete;
            if (Session["Account"] == null) {
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
                            txtEmployeeName.Text = "";
                            pnlDateTo.Visible = false;
                            lblDateTo.Visible = false;
                            lblDateFrom.Visible = false;
                            rdoViewDate.AutoPostBack = true;
                            rdoViewRange.AutoPostBack = true;
                            rdoViewAll.AutoPostBack = true;
                            lblError.Text = "";
                            _com.setGridViewStyle(grdData);
                            
                        }
                        if (Session[Message.EmployeeName] != null)
                        {
                            //In case return from Add or Edit Attendance Record
                            txtEmployeeName.Text = Session[Message.EmployeeName].ToString();
                            rdoViewAll.Checked = true;
                            lblError.Text = "";
                            _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn + ",a." 
                                + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." 
                                + Message.NameColumn + "=N'" + txtEmployeeName.Text + "'" + _condition
                                +" and emp."+Message.CurrentFlagColumn+"='True'", Message.TableAttendance
                                +" a join "+Message.TablePerson+" p on a."+ Message.BusinessEntityIDColumn
                                +"=p."+Message.BusinessEntityIDColumn+" join "+Message.TableEmployee+" emp on emp."
                                +Message.BusinessEntityIDColumn+"=p."+Message.BusinessEntityIDColumn, grdData);
                            if (grdData.Rows.Count > 0)
                            {
                                grdData.HeaderRow.Cells[1].Text = "Employee Name";
                                grdData.HeaderRow.Cells[2].Text = "In Time";
                                grdData.HeaderRow.Cells[3].Text = "Out Time";
                                grdData.HeaderRow.Cells[4].Text = "Email";
                            }
                            pnlData.Visible = true;
                            Session.Remove(Message.EmployeeName);
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
                    Response.Redirect(Message.UserHomePage);
                }
            }
        }
        //For text in input textbox
        protected string startDate { get; set; }
        protected string endDate { get; set; }
        protected string confirmDelete { get; set; }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Location = Message.EditAttendancePage+"/?Name=" + Server.HtmlDecode(e.Row.Cells[1].Text)
                    + "&In=" + e.Row.Cells[2].Text + "&Out=" + e.Row.Cells[3].Text
                    + "&Email=" + Server.HtmlDecode(e.Row.Cells[4].Text);
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
                    e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
        }
        protected void rdoViewDate_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewDate.Checked == true)
            {
                pnlDateTo.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                pnlDateFrom.Visible = true;
                lblDateDescription.Visible = true;
            }
        }

        protected void rdoViewRange_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewRange.Checked == true)
            {
                pnlDateFrom.Visible = true;
                pnlDateTo.Visible = true;
                lblDateTo.Visible = true;
                lblDateFrom.Visible = true;
                lblDate.Visible = true;
                lblDateDescription.Visible = true;
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

        protected void btnView_Click(object sender, EventArgs e)
        {
            Boolean check = false;
            lblError.Text = "";
            if(txtEmployeeName.Text.Trim()==""){
                lblError.Text=Message.EmployeeNameError;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else{
                try
                {
                    if(rdoViewAll.Checked==true){
                        //Case 1: View All Attendance of a Employee
                        lblError.Text = "";
                        _com.bindDataAttendance("p."+Message.NameColumn+",a."+Message.PunchInColumn+",a."
                            +Message.PunchOutColumn+",p."+Message.EmailAddressColumn
                            , " where p." + Message.NameColumn + " like N'%" + txtEmployeeName.Text
                            + "%'" + _condition+" and emp."+Message.CurrentFlagColumn+"='True'", 
                            Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                            + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn 
                            + " join " + Message.TableEmployee + " emp on emp."
                            + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                        check = true;
                    }
                    else if (rdoViewDate.Checked == true)
                    {
                        //Case 2: View Attendance of a date of a employee
                        if (Request.Form["txtDateFrom"].ToString().Trim() == "")
                        {
                            lblError.Text = Message.NotChooseDate;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            try
                            {
                                this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
                                DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                _condition = " and CAST(DAY("+Message.PunchInColumn+") as varchar(50))+'-'+CAST(MONTH("
                                + Message.PunchInColumn+") as varchar(50))+'-'+CAST(YEAR("+Message.PunchInColumn
                                +") as varchar(50)) = '"+ dt.Day + "-" + dt.Month + "-" + dt.Year + "'";
                                lblError.Text = "";
                                _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn 
                                    + ",a." + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, 
                                    " where p." + Message.NameColumn + " like N'%" + txtEmployeeName.Text
                                    + "%'" + _condition+" and emp."+Message.CurrentFlagColumn+"='True'", 
                                    Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                    + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn
                                    + " join " + Message.TableEmployee + " emp on emp."
                                    + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                                check = true;
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.InvalidDate;
								//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                            }
                        }
                    }
                    else {
                        //Case 3: View Attendance in a range of date of a employee
                        if (Request.Form["txtDateFrom"].ToString().Trim() == "" || Request.Form["txtDateTo"].ToString().Trim() == "")
                        {
                            lblError.Text = Message.NotChooseFromToDate;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                        else
                        {
                            try
                            {
                                this.startDate = Request.Form["txtDateFrom"].ToString().Trim();
                                this.endDate = Request.Form["txtDateTo"].ToString().Trim();
                                DateTime dt = DateTime.Parse(Request.Form["txtDateFrom"].ToString().Trim());
                                DateTime dt1 = DateTime.Parse(Request.Form["txtDateTo"].ToString().Trim());
                                dt1 = dt1.AddDays(1.0);
                                if(dt.CompareTo(dt1)<0){
                                    _condition = " and "+Message.PunchInColumn+" > '" + dt.Month + "-" + dt.Day + "-" 
                                        + dt.Year + "'" + " and "+Message.PunchInColumn+" < '" + dt1.Month + "-" 
                                        + dt1.Day + "-" + dt1.Year + "'";
                                    lblError.Text = "";
                                    _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn 
                                        + ",a." + Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, 
                                        " where p." + Message.NameColumn + " like N'%"+ txtEmployeeName.Text
                                        + "%'" + _condition + " and emp." + Message.CurrentFlagColumn + "='True'"
                                        , Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                                        + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn
                                        + " join " + Message.TableEmployee + " emp on emp."
                                        + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                                    check = true;
                                }
                            }
                            catch (FormatException)
                            {
                                lblError.Text = Message.InvalidDate;
								//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                            }
                        }
                    }
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                }
            }
            //Show Data if Gridview have data and bindDataAttendance method success
            if (grdData.Rows.Count > 0 && check==true)
            {
                pnlData.Visible = true;
                grdData.HeaderRow.Cells[1].Text = "Employee Name";
                grdData.HeaderRow.Cells[2].Text = "In Time";
                grdData.HeaderRow.Cells[3].Text = "Out Time";
                grdData.HeaderRow.Cells[4].Text = "Email";
            }
            else {
                if (lblError.Text == "")
                {
                    lblError.Text = Message.NotExistData;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                }
                pnlData.Visible = false;
            }
            if (check == true) {
                DataTable employee = _com.getData(Message.TablePerson, Message.NameColumn, " where "
                    + Message.NameColumn + "=N'" + txtEmployeeName.Text + "'");
                if (employee.Rows.Count > 0)
                {
                    pnlData.Visible = true;
                }
            }
        }

        protected void rdoViewAll_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoViewAll.Checked == true)
            {
                pnlDateTo.Visible = false;
                pnlDateFrom.Visible = false;
                lblDateTo.Visible = false;
                lblDateFrom.Visible = false;
                lblDate.Visible = false;
                lblDateDescription.Visible = false;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCheck = false;
                foreach (GridViewRow gr in grdData.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        isCheck = true;
                        DataTable getID = _com.getData(Message.TablePerson + " p join " 
                            + Message.TableEmployee + " e on p." + Message.BusinessEntityIDColumn + "=e." 
                            + Message.BusinessEntityIDColumn, "p." + Message.BusinessEntityIDColumn
                            , " where e."+Message.CurrentFlagColumn+"='True' and p." + Message.NameColumn 
                            + "='" + Server.HtmlDecode(gr.Cells[1].Text).Trim() + "'"+ " and (p." 
                            + Message.EmailAddressColumn + "=N'" + Server.HtmlDecode(gr.Cells[4].Text).Trim() 
                            + "' or p."+Message.EmailAddressColumn+" is NULL)");
                        string sql = @"delete from "+Message.TableAttendance+" where "+Message.BusinessEntityIDColumn+"=N'" 
                            + getID.Rows[0][0].ToString() + "' and "+Message.PunchInColumn+"='"+gr.Cells[2].Text
                            +"' and "+Message.PunchOutColumn+"='"+gr.Cells[3].Text+"';";
                        SqlCommand command = new SqlCommand(sql, _com.cnn);
                        command.ExecuteNonQuery();
                    }
                }
                if (isCheck == true)
                {
                    _com.bindDataAttendance("p." + Message.NameColumn + ",a." + Message.PunchInColumn 
                        + ",a."+ Message.PunchOutColumn + ",p." + Message.EmailAddressColumn, " where p." 
                        + Message.NameColumn + " like N'%" + txtEmployeeName.Text
                        + "%'" + _condition + " and emp." + Message.CurrentFlagColumn + "='True'", 
                        Message.TableAttendance + " a join " + Message.TablePerson + " p on a."
                        + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn
                        + " join " + Message.TableEmployee + " emp on emp."
                        + Message.BusinessEntityIDColumn + "=p." + Message.BusinessEntityIDColumn, grdData);
                    if (grdData.Rows.Count > 0)
                    {
                        grdData.HeaderRow.Cells[1].Text = "Employee Name";
                        grdData.HeaderRow.Cells[2].Text = "In Time";
                        grdData.HeaderRow.Cells[3].Text = "Out Time";
                        grdData.HeaderRow.Cells[4].Text = "Email";
                    }
                    else
                    {
                        lblError.Text = Message.NotExistData;
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                        pnlData.Visible = false;
                    }
                }
                else {
                    lblError.Text = Message.NotChooseItemDelete;
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    _com.closeConnection();
                    Response.Redirect(Message.PunchAttendancePage, true);
                }
            }           
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in grdData.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[1].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    Session["In"] = gr.Cells[2].Text;
                    Session["Out"] = gr.Cells[3].Text;
                    _com.closeConnection();
                    Response.Redirect(Message.EditAttendancePage, true);
                }
            }
            lblError.Text = Message.NotChooseItemEdit;
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript", "alert('" + lblError.Text.Replace("'", "\\'") + "');", true);
        }
    }
}
