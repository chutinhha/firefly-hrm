using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP2010VisualWebPart.Admin.Checkpoint.EvaluateEmployee
{
    public partial class EvaluateEmployeeUserControl : UserControl
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
                        if (!IsPostBack)
                        {
                            txtEmployeeName.Text = "All";
                            lblError.Text = "";
                            lblTitle.Text = "Search Employee";
                            Session.Remove("BusinessID");
                            Session.Remove("isEdit");
                        }
                        foreach (GridViewRow gr in grdData.Rows)
                        {
                            RadioButton rdo = (RadioButton)gr.Cells[0].FindControl("rdoEmployee");
                            if (rdo.Checked == true)
                            {
                                Session["BusinessID"] = gr.Cells[1].Text.Trim();
                                DateTime dt = DateTime.Now;
                                int quarter;
                                if (dt.Month <= 3)
                                {
                                    quarter = 1;
                                }
                                else if (dt.Month <= 6)
                                {
                                    quarter = 2;
                                }
                                else if (dt.Month <= 9)
                                {
                                    quarter = 3;
                                }
                                else
                                {
                                    quarter = 4;
                                }
                                DataTable haveCheckPoint = _com.getData(Message.TableEvaluatePoint, "*", " where " 
                                    + Message.QuarterColumn+ "='" + quarter + "' and " + Message.BusinessEntityIDColumn 
                                    + "='" + gr.Cells[1].Text.Trim() + "'");
                                if (haveCheckPoint.Rows.Count > 0)
                                {
                                    Session["isEdit"] = "true";
                                }
                                else
                                {
                                    Session["isEdit"] = "false";
                                }
                                break;
                            }
                        }
                        if (Session["BusinessID"] != null)
                        {
                            int quarter=_com.getQuarter();
                            if (Session["isEdit"] == null||Session["isEdit"].ToString()=="false")
                            {
                                _com.generateControl(pnlGenerate, "false", Session["BusinessID"].ToString(), quarter);
                            }
                            else if(Session["isEdit"].ToString()=="true")
                            {
                                _com.generateControl(pnlGenerate, "true", Session["BusinessID"].ToString(), quarter);
                            }
                        }
                        else {
                            _com.generateControl(pnlGenerate, "false", "", 1);
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
        protected string confirmSave { get; set; }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (txtEmployeeName.Text.Trim() == "")
            {
                lblError.Text = Message.EmployeeNameError;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
            }
            else {
                try
                {
                    if (txtEmployeeName.Text != "All")
                    {
                        _com.bindData("p." + Message.BusinessEntityIDColumn + ",p." + Message.NameColumn + ",p."
                            + Message.EmailAddressColumn + " as 'Email'", " where p." + Message.RankColumn + "='User' and p." + Message.NameColumn + " like N'%"
                            + txtEmployeeName.Text.Trim() + "%'" + " and emp." + Message.CurrentFlagColumn
                            + "='True'", Message.TablePerson + " p" + " join " + Message.TableEmployee
                            + " emp on emp." + Message.BusinessEntityIDColumn + "=p."
                            + Message.BusinessEntityIDColumn, grdData);
                    }
                    else {
                        _com.bindData("p." + Message.BusinessEntityIDColumn + ",p." + Message.NameColumn + ",p."
                            + Message.EmailAddressColumn + " as 'Email'", " where p." + Message.RankColumn + "='User' and emp." 
                            + Message.CurrentFlagColumn
                            + "='True'", Message.TablePerson + " p" + " join " + Message.TableEmployee
                            + " emp on emp." + Message.BusinessEntityIDColumn + "=p."
                            + Message.BusinessEntityIDColumn, grdData);
                    }
                    if (grdData.Rows.Count > 0)
                    {
                        pnlData.Visible = true;
                        pnlSearch.Visible = false;
                        lblName.Text = txtEmployeeName.Text.Trim();
                        lblTitle.Text = "Select Employee";
                    }
                    else {
                        pnlData.Visible = false;
                        lblError.Text = Message.NotExistData;
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                    _com.setGridViewStyle(grdData);
                }
                catch (Exception ex) {
                    lblError.Text = ex.Message;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
                }
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
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
        protected void rdoEmployee_CheckedChanged(object sender, System.EventArgs e)
        {

            //Clear the existing selected row 
            foreach (GridViewRow oldrow in grdData.Rows)
            {
                ((RadioButton)oldrow.FindControl("rdoEmployee")).Checked = false;
            }

            //Set the new selected row
            RadioButton rb = (RadioButton)sender;
            GridViewRow row = (GridViewRow)rb.NamingContainer;
            ((RadioButton)row.FindControl("rdoEmployee")).Checked = true;

            foreach (GridViewRow gr in grdData.Rows)
            {
                RadioButton rdo = (RadioButton)gr.Cells[0].FindControl("rdoEmployee");
                if (rdo.Checked == true)
                {
                    Session["BusinessID"] = gr.Cells[1].Text.Trim();
                    DateTime dt = DateTime.Now;
                    int quarter;
                    if (dt.Month <= 3)
                    {
                        quarter = 1;
                    }
                    else if (dt.Month <= 6)
                    {
                        quarter = 2;
                    }
                    else if (dt.Month <= 9)
                    {
                        quarter = 3;
                    }
                    else
                    {
                        quarter = 4;
                    }
                    DataTable haveCheckPoint = _com.getData(Message.TableEvaluatePoint, "*", " where " + Message.QuarterColumn
                        +"='" + quarter + "' and "+Message.BusinessEntityIDColumn+"='" + gr.Cells[1].Text.Trim() + "'");
                    if (haveCheckPoint.Rows.Count > 0)
                    {
                        Session["isEdit"] = "true";
                    }
                    else {
                        Session["isEdit"] = "false";
                    }
                    break;
                }
            }

        } 
        protected void btnEvaluate_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            foreach (GridViewRow gr in grdData.Rows)
            {
                RadioButton rdo = (RadioButton)gr.Cells[0].FindControl("rdoEmployee");
                if (rdo.Checked==true)
                {
                    pnlData.Visible = false;
                    pnlEvaluate.Visible = true;
                    pnlGenerate.Visible = true;
                    lblName.Text = gr.Cells[2].Text.Trim();
                    lblTitle.Text = "Evaluate Employee";
                    Session["BusinessID"] = gr.Cells[1].Text.Trim();
                    break;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.EvaluateEmployeePage,true);
        }

        protected void btnCancel1_Click1(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.EvaluateEmployeePage, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            int point = 0;
            float averagePoint = 0;
            int countRdoYesNo = 1;
            int countRdoLevel = 1;
            int countTxtNote = 1;
            bool checkAnswerAll = true;
            int quarter=_com.getQuarter();
            DataTable question = _com.getData(Message.TableCheckpointQuestion, "*", "");
            for (int i = 0; i < question.Rows.Count; i++) {
                if (question.Rows[i][2].ToString() == "YesNo")
                {
                    RadioButton yes = (RadioButton)pnlGenerate.FindControl("rdoYes" + countRdoYesNo);
                    RadioButton no = (RadioButton)pnlGenerate.FindControl("rdoNo" + countRdoYesNo);
                    if (yes.Checked == false && no.Checked == false) {
                        checkAnswerAll = false;
                    }
                    else if (yes.Checked == true)
                    {
                        point = point + 10;
                        if (Session["isEdit"].ToString() == "false")
                        {
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                + "','10','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn + "='10',"
                                    +Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where "
                                    + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"].ToString()
                                    + "' and " + Message.QuarterColumn + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                    + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else {
                            _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn + "='10',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where "
                                +Message.BusinessEntityIDColumn+"='" + Session["BusinessID"].ToString() 
                                + "' and "+Message.QuarterColumn+"='" + quarter + "' and "+Message.QuestionIDColumn+"='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }
                    else {
                        if (Session["isEdit"].ToString() == "false")
                        {
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                + "','0','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn + "='0',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where "
                                + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"].ToString() + "' and "
                                + Message.QuarterColumn + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn + "='0',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where "
                                +Message.BusinessEntityIDColumn+"='" + Session["BusinessID"].ToString() + "' and "
                                +Message.QuarterColumn+"='" + quarter + "' and "+Message.QuestionIDColumn+"='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }                  
                    countRdoYesNo++;
                }
                else if (question.Rows[i][2].ToString() == "Note")
                {
                    TextBox txtNote = (TextBox)pnlGenerate.FindControl("txtNote" + countTxtNote);
                    if (txtNote.Text.Trim() == "")
                    {
                        checkAnswerAll = false;
                    }
                    else {
                        DropDownList ddlNotePoint = (DropDownList)pnlGenerate.FindControl("ddlNotePoint"+countTxtNote);
                        point = point + int.Parse(ddlNotePoint.SelectedValue);
                        if(Session["isEdit"].ToString()=="false"){
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                    + "','" + quarter + "','" + question.Rows[i][0].ToString() + "','"
                                    + int.Parse(ddlNotePoint.SelectedValue) + "','" + txtNote.Text.Trim() 
                                    + "','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn 
                                    + "='" + int.Parse(ddlNotePoint.SelectedValue)+ "'," + Message.NoteColumn
                                    + "='" + txtNote.Text.Trim() + "',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn 
                                    + "='"+ Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                    + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                    + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " "+Message.PointColumn+"='" 
                                + int.Parse(ddlNotePoint.SelectedValue) + "',"+Message.NoteColumn+"='"
                                + txtNote.Text.Trim() + "',"+ Message.ModifiedDateColumn + "='" 
                                + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and "+Message.QuarterColumn+"='"
                                + quarter + "' and " + Message.QuestionIDColumn + "='" + question.Rows[i][0].ToString() 
                                + "'");
                        }
                    }
                    countTxtNote++;
                }
                else
                {
                    RadioButton rdoPerfect = (RadioButton)pnlGenerate.FindControl("rdoPerfect"+countRdoLevel);
                    RadioButton rdoGreat = (RadioButton)pnlGenerate.FindControl("rdoGreat" + countRdoLevel);
                    RadioButton rdoNormal = (RadioButton)pnlGenerate.FindControl("rdoNormal" + countRdoLevel);
                    RadioButton rdoBad = (RadioButton)pnlGenerate.FindControl("rdoBad" + countRdoLevel);
                    RadioButton rdoVeryBad = (RadioButton)pnlGenerate.FindControl("rdoVeryBad" + countRdoLevel);
                    if (rdoPerfect.Checked == false && rdoGreat.Checked == false && rdoNormal.Checked == false
                        && rdoBad.Checked == false && rdoVeryBad.Checked == false) {
                            checkAnswerAll = false;
                        }
                    else if (rdoPerfect.Checked == true) {
                        point = point + 10;
                        if(Session["isEdit"].ToString()=="false"){
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                + "','10','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                    + "='10',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                               + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                               + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                               + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " "+Message.PointColumn
                                + "='10',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and "+Message.QuarterColumn+"='" 
                                + quarter + "' and "+Message.QuestionIDColumn+"='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }
                    else if (rdoGreat.Checked == true)
                    {
                        point = point + 8;
                        if(Session["isEdit"].ToString()=="false"){
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                + "','8','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                    + "='8',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                + "='8',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }
                    else if (rdoNormal.Checked == true)
                    {
                        point = point + 6;
                        if(Session["isEdit"].ToString()=="false"){
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" 
                                    + Session["BusinessID"].ToString()
                                    + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                    + "','6','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                    + "='6',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                    + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                    + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                    + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                + "='6',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }
                    else if (rdoBad.Checked == true)
                    {
                        point = point + 4;
                        if(Session["isEdit"].ToString()=="false"){
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                + "','4','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                    + "='4',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                    + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                    + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                    + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                + "='4',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }
                    else if (rdoVeryBad.Checked == true)
                    {
                        point = point + 2;
                        if (Session["isEdit"].ToString() == "false")
                        {
                            try
                            {
                                _com.insertIntoTable(Message.TableEvaluatePoint, "", "'" + Session["BusinessID"].ToString()
                                    + "','" + quarter + "','" + question.Rows[i][0].ToString() 
                                    + "','2','','','','" + DateTime.Now + "'", false);
                            }
                            catch (Exception) {
                                _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                    + "='2',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                   + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                   + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                   + question.Rows[i][0].ToString() + "'");
                            }
                        }
                        else
                        {
                            _com.updateTable(Message.TableEvaluatePoint, " " + Message.PointColumn
                                + "='2',"
                                    + Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " + Message.BusinessEntityIDColumn + "='"
                                + Session["BusinessID"].ToString() + "' and " + Message.QuarterColumn 
                                + "='" + quarter + "' and " + Message.QuestionIDColumn + "='"
                                + question.Rows[i][0].ToString() + "'");
                        }
                    }
                    countRdoLevel++;
                }
                if (checkAnswerAll == false) {
                    lblError.Text = Message.NotAnswerAll;
					//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    break;
                }
            }
            if (checkAnswerAll == true)
            {
                averagePoint = float.Parse(point.ToString()) / float.Parse(question.Rows.Count.ToString());
                _com.updateTable(Message.TableEvaluatePoint, Message.AveragePointColumn+"='" 
                    + averagePoint + "',"+Message.TotalPointColumn+"='" + point
                    + "',"+ Message.ModifiedDateColumn + "='" + DateTime.Today + "'" + " where " 
                    + Message.BusinessEntityIDColumn + "='" + Session["BusinessID"].ToString()
                    + "' and " + Message.QuarterColumn + "='" + quarter + "'");
                Session.Remove("BusinessID");
                Response.Redirect(Message.EvaluateEmployeePage, true);
            }
        }
    }
}
