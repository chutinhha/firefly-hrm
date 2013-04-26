using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Collections.Generic;
using System.IO;

namespace SP2010VisualWebPart.Admin.Employee.inforEmployee
{
    public partial class inforEmployeeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        private string strBusinessEntityId = "";
        protected string strBirthDateValue { get; set; }
        protected string strBirtDateEditable { get; set; }
        protected string strBirtDateID { get; set; }
        bool isAdmin = true;
        bool isUpdatePersonDetails = true;
        bool isUpdatePersonContact = true;
        // Person Details
        private void loadPersonDetailsData()
        {
            try
            {
                string strColumn = "per." + Message.NameColumn + ", emp." + Message.BirthDateColumn + ", per."
                    + Message.SSNNumberColumn + ", emp." + Message.GenderColumn + ", emp." + Message.MaritalStatusColumn
                    +",per."+Message.RankColumn;
                string strTable = Message.TableEmployee + " emp join " + Message.TablePerson + " per on emp."
                    + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn;
                string strCondition = " where emp." + Message.BusinessEntityIDColumn + " = '"
                    + strBusinessEntityId + "'";
                DataTable dt = _com.getData(strTable, strColumn, strCondition);
                if (dt.Rows.Count > 0)
                {
                    txtFullName.Text = dt.Rows[0][0].ToString();
                    if (dt.Rows[0][1].ToString().Trim() != "")
                    {
                        DateTime dtmBirtDate = DateTime.Parse(dt.Rows[0][1].ToString().Trim());
                        strBirthDateValue = dtmBirtDate.Month + "/" + dtmBirtDate.Day + "/" + dtmBirtDate.Year;
                    }
                    txtSSNNumber.Text = dt.Rows[0][2].ToString().Trim();
                    ddlRank.SelectedValue = dt.Rows[0][5].ToString();
                    if (dt.Rows[0][3].ToString().Trim().Equals("M"))
                        rdbGenderMale.Checked = true;
                    else
                        if (dt.Rows[0][3].ToString().Trim().Equals("F"))
                            rdbGenderFemale.Checked = true;

                    if (dt.Rows[0][4].ToString().Trim().Equals("S"))
                        rdbMaritalSingle.Checked = true;
                    else
                        if (dt.Rows[0][4].ToString().Trim().Equals("M"))
                            rdbMaritalMerried.Checked = true;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void loadControlStateOfPersonDetailsData(bool isState)
        {
            if (isState == true)
            {
                // Load data
                loadPersonDetailsData();
                // Setup State
                txtFullName.Enabled = false;
                txtSSNNumber.Enabled = false;
                rdbGenderFemale.Enabled = false;
                rdbGenderMale.Enabled = false;
                rdbMaritalMerried.Enabled = false;
                rdbMaritalSingle.Enabled = false;
                strBirtDateEditable = "Readonly";
                strBirtDateID = "";
                ddlRank.Enabled = false;
            }
            else
            {
                // Load data
                loadPersonDetailsData();
                // Setup State
                txtFullName.Enabled = true;
                txtSSNNumber.Enabled = true;
                rdbGenderFemale.Enabled = true;
                rdbGenderMale.Enabled = true;
                rdbMaritalMerried.Enabled = true;
                rdbMaritalSingle.Enabled = true;
                strBirtDateEditable = "";
                strBirtDateID = "txtBirthDate";
                if (isAdmin)
                {
                    ddlRank.Enabled = true;
                }
                else
                {
                    ddlRank.Enabled = false;
                }
            }
        }

        private void loadEmployeeImage()
        {
            try
            {
                string strColumn = "per." + Message.NameColumn + ", emp." + Message.ImageColumn;
                string strTable = Message.TableEmployee + " emp join " + Message.TablePerson + " per on emp."
                    + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn;
                string strCondition = " where emp." + Message.BusinessEntityIDColumn + " = '"
                    + strBusinessEntityId + "'";
                DataTable dt = _com.getData(strTable, strColumn, strCondition);
                if (dt.Rows.Count > 0)
                {
                    lblEmployeeImageTitle.Text = dt.Rows[0][0].ToString();
                    imgEmployeeImage.ImageUrl = "/_layouts/Images/21_2_ob/" + dt.Rows[0][1].ToString();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void updateEmployeDetails()
        {
            try
            {
                // Check Input Required            
                // Check Name
                if (txtFullName.Text == "")
                {
                    lblPersonDetailGuideLine.Text = "* Required Failed";
                    isUpdatePersonDetails = false;
                    return;
                }
                // Check Birthdate
                string strBirtDate = Request.Form["txtBirthDate"].ToString().Trim();
                if (strBirtDate != "")
                {
                    try
                    {
                        DateTime dtBirthDate = DateTime.Parse(strBirtDate);
                        if (dtBirthDate >= DateTime.Now)
                        {
                            lblPersonDetailGuideLine.Text = "Birth time is wrong.";
                            isUpdatePersonDetails = false;
                            return;
                        }
                    }
                    catch (FormatException) {
                        lblPersonDetailGuideLine.Text = "Birth time is wrong.";
                        isUpdatePersonDetails = false;
                        return;
                    }
                }
                
                lblPersonDetailGuideLine.Text = "";
                // Update data to Employees Table
                string strTableName = Message.TableEmployee;
                string strCondition = "";
                //BirthDate
                if (strBirtDate != "")
                {
                    strBirtDate = "'" + strBirtDate + "'";
                }
                else {
                    strBirtDate = "NULL";
                }
                strCondition = strCondition + Message.BirthDateColumn + " = " + strBirtDate;
                //MaritalStatus
                string strMaritalStatus = "";
                if (rdbMaritalSingle.Checked == true) strMaritalStatus = "'S'";
                else strMaritalStatus = "'M'";
                strCondition = strCondition + " , " + Message.MaritalStatusColumn + " = " + strMaritalStatus;
                //Gender
                string strGender = "";
                if (rdbGenderMale.Checked == true) strGender = "'M'";
                else strGender = "'F'";
                strCondition = strCondition + " , " + Message.GenderColumn + " = " + strGender;
                //ModifiedDate
                string strModifiedDate = System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString();
                strModifiedDate = "'" + strModifiedDate + "'";
                strCondition = strCondition + " , " + Message.ModifiedDateColumn + " = " + strModifiedDate;

                strCondition = strCondition + " where " + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId;
                _com.updateTable(strTableName, strCondition);

                // Check Table Person Exist
                strTableName = Message.TablePerson;
                DataTable dt = _com.getData(strTableName, "*", " where " + Message.BusinessEntityIDColumn
                    + " = " + strBusinessEntityId);
                // IF not Exist -> create new rows.
                if (dt.Rows.Count == 0)
                {
                    string strColumn = "(" + Message.BusinessEntityIDColumn + "," + Message.ModifiedDateColumn
                        + "," + Message.NameColumn + "," + Message.RankColumn + ")";
                    strCondition = strBusinessEntityId + " , " + strModifiedDate;
                    //Name
                    string strName = "'" + txtFullName.Text + "'";
                    strCondition = strCondition + " , " + strName;
                    // Insert into Table
                    _com.insertIntoTable(strTableName, strColumn, strCondition, false);
                }

                // Update data to Peson Table                        
                strTableName = Message.TablePerson;
                strCondition = "";
                //Name
                string strFullName = "N'" + txtFullName.Text + "'";
                strCondition = strCondition + " " + Message.NameColumn + " = " + strFullName;
                //Rank
                if (ddlRank.SelectedIndex == 0) strCondition = strCondition + " , " + Message.RankColumn + " = 'User'";
                else strCondition = strCondition + " , " + Message.RankColumn + " = 'Admin'";
                //SSNNumber
                string strSSNNumber = "'" + txtSSNNumber.Text + "'";
                strCondition = strCondition + " , " + Message.SSNNumberColumn + " = " + strSSNNumber;
                strCondition = strCondition + " where " + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId;
                _com.updateTable(strTableName, strCondition);
                isUpdatePersonDetails = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        //Person Contact
        private void loadPersonContact()
        {
            try
            {
                string strCountry = "";
                string strColumn = Message.EmailAddressColumn + ", " + Message.HomePhoneColumn + ", " + Message.MobileColumn
                    + ", " + Message.CityColumn + ", " + Message.CountryColumn + ", " + Message.AddressColumn;
                string strTable = Message.TablePerson;
                string strCondition = " where " + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId;
                DataTable dt = _com.getData(strTable, strColumn, strCondition);
                if (dt.Rows.Count > 0)
                {
                    txtEmail.Text = dt.Rows[0][0].ToString();
                    txtHomePhone.Text = dt.Rows[0][1].ToString();
                    txtMobile.Text = dt.Rows[0][2].ToString();
                    txtCity.Text = dt.Rows[0][3].ToString();
                    strCountry = dt.Rows[0][4].ToString();
                    txtAddressStreet.Text = dt.Rows[0][5].ToString();
                }
                // Set data to ddlCountry                        
                List<string> lstTemp = _com.getCountryList();
                lstTemp.Insert(0, "None");
                ddlCountry.DataSource = lstTemp;
                if (strCountry != "")
                {
                    ddlCountry.SelectedValue = strCountry;
                }
                else
                    ddlCountry.SelectedValue = "None";
                ddlCountry.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void loadControlStateOfPersonContactData(bool isStateLoad)
        {
            //Set state of Birthdate textbox
            setBirthDateControl();

            if (isStateLoad)
            {
                // Load data
                loadPersonContact();
                // Setup State
                txtEmail.Enabled = false;
                txtHomePhone.Enabled = false;
                txtMobile.Enabled = false;
                txtCity.Enabled = false;
                ddlCountry.Enabled = false;
                txtAddressStreet.Enabled = false;
            }
            else
            {
                // Load data
                loadPersonContact();
                // Setup State
                txtEmail.Enabled = true;
                txtHomePhone.Enabled = true;
                txtMobile.Enabled = true;
                txtCity.Enabled = true;
                ddlCountry.Enabled = true;
                txtAddressStreet.Enabled = true;
            }
        }

        private void updatePersonContact()
        {
            try
            {
                //Validate email data
                if (txtEmail.Text != "")
                    if (txtEmail.Text.IndexOf("@") < 1)
                    {
                        lblPersonContactGuide.Visible = true;
                        isUpdatePersonContact = false;
                        return;
                    }
                    else
                    {
                        if ((txtEmail.Text.IndexOf(".") < 1) || (txtEmail.Text.IndexOf(".") == txtEmail.Text.IndexOf("@") + 1)
                            || (txtEmail.Text.IndexOf(".") == txtEmail.Text.Length - 1))
                        {
                            lblPersonContactGuide.Visible = true;
                            isUpdatePersonContact = false;
                            return;
                        }
                    }
                lblPersonContactGuide.Visible = false;
                // Update data to Peson Table                        
                string strTableName = Message.TablePerson;
                string strCondition = "";
                //EmailAddress
                string strEmailAddress = "'" + txtEmail.Text + "'";
                strCondition = strCondition + Message.EmailAddressColumn + " = " + strEmailAddress;
                //HomePhone
                string strHomePhone = "'" + txtHomePhone.Text + "'";
                strCondition = strCondition + " , " + Message.HomePhoneColumn + " = " + strHomePhone;
                //Mobile
                string strMobile = "'" + txtMobile.Text + "'";
                strCondition = strCondition + " , " + Message.MobileColumn + " = " + strMobile;
                //City
                string strCity = "N'" + txtCity.Text + "'";
                strCondition = strCondition + " , " + Message.CityColumn + " = " + strCity;
                //Country
                string strCountry = "N'" + ddlCountry.SelectedValue + "'";
                strCondition = strCondition + " , " + Message.CountryColumn + " = " + strCountry;
                //AddressStreet
                string strAddressStreet = "N'" + txtAddressStreet.Text + "'";
                strCondition = strCondition + " , " + Message.AddressColumn + " = " + strAddressStreet;
                //ModifiedDate
                string strModifiedDate = System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString();
                strModifiedDate = "'" + strModifiedDate + "'";
                strCondition = strCondition + " , " + Message.ModifiedDateColumn + " = " + strModifiedDate;

                strCondition = strCondition + " where " + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId;
                _com.updateTable(strTableName, strCondition);
                isUpdatePersonContact = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void loadEmpState()
        {
            try
            {
                //Set data to Job Title dropdownlist
                string strColumn = "j." + Message.JobTitleColumn;
                string strTable = " ( " + Message.TableEmployee + " e LEFT JOIN " + Message.TableJobTitle
                    + " j ON e." + Message.JobIDColumn + " = j." + Message.JobIDColumn + ") ";
                string strCondition = " Where (e." + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId + ")";
                DataTable dtJobTitle = _com.getData(strTable, strColumn, strCondition);
                if (dtJobTitle.Rows.Count > 0)
                {
                    string strJobTitle = dtJobTitle.Rows[0][0].ToString();
                    _com.SetItemListWithID(Message.JobIDColumn, Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "-----");
                    DropDownList ddlTemp = ddlJobTitle;
                    if (strJobTitle != "") ddlJobTitle.SelectedValue = ddlTemp.Items.FindByText(strJobTitle).Value;
                }

                //Set data to Current Flag
                strColumn = "CAST(" + Message.CurrentFlagColumn + " AS VARCHAR(1))";
                strTable = " " + Message.TableEmployee + " ";
                strCondition = " Where (" + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId + ")";
                DataTable dtCurrentFlag = _com.getData(strTable, strColumn, strCondition);
                if (dtCurrentFlag.Rows.Count > 0)
                {
                    string strCurrentFlag = dtCurrentFlag.Rows[0][0].ToString();
                    if (strCurrentFlag == "0") ddlCurrentFlag.SelectedValue = "Inactive";
                    else
                        if (strCurrentFlag == "1") ddlCurrentFlag.SelectedValue = "Active";
                }
                //Get current department
                DataTable dt = _com.getData(Message.TableDepartment + " dep join " + Message.TableHistoryDepartment
                    + " edh on dep." + Message.DepartmentIDColumn + "=edh." + Message.DepartmentIDColumn, " dep."
                    + Message.NameColumn + ",edh." + Message.StartDateColumn, " where edh."
                    + Message.BusinessEntityIDColumn + "='" + strBusinessEntityId
                    + "' and (edh." + Message.EndDateColumn + " is NULL or edh." + Message.EndDateColumn + "='')");
                if (dt.Rows.Count > 0)
                {
                    txtDepartment.Text = dt.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            //Set data to Department History gridview
            /*string strTableName = "(HumanResources.Department d INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON D.DepartmentID = edh.DepartmentID)";
            strColumn = "d.Name, edh.StartDate, edh.EndDate";
            strCondition = " where edh.BusinessEntityId = " + strBusinessEntityId + " order by  StartDate DESC";
            _com.bindData(strColumn, strCondition, strTableName, grdDepHistory);
            if (grdDepHistory.Rows.Count > 0)
            {
                pnlDepHistory.Visible = true;
                for (int i = 0; i < grdDepHistory.Rows.Count; i++)
                {
                    if (grdDepHistory.Rows[i].Cells[2].Text == "") grdDepHistory.Rows[i].Cells[2].Text = "Now";
                }

                grdDepHistory.HeaderRow.Cells[0].Text = "Department";
                grdDepHistory.HeaderRow.Cells[1].Text = "Start Date";
                grdDepHistory.HeaderRow.Cells[2].Text = "End Date";
            }
            _com.setGridViewStyle(grdDepHistory);*/
        }

        protected void loadControlStateOfEmpStateData(bool isLoad)
        {
            //Set state of Birthdate textbox
            setBirthDateControl();

            if (isLoad)
            {
                loadEmpState();
                ddlJobTitle.Enabled = false;
                ddlCurrentFlag.Enabled = false;
            }
            else
            {
                if (isAdmin)
                {
                    loadEmpState();
                    ddlJobTitle.Enabled = true;
                    ddlCurrentFlag.Enabled = true;
                }
            }
        }

        protected void setBirthDateControl()
        {
            if (btnEditPersonDetails.Text == "Save")
            {
                //Editable
                strBirthDateValue = Request.Form["txtBirthDate"].ToString().Trim();
                strBirtDateID = "txtBirthDate";
                strBirtDateEditable = "";
            }
            else
            {
                //set data to birthdate
                string strColumn = "emp." + Message.BirthDateColumn + " ";
                string strTable = Message.TableEmployee + " emp ";
                string strCondition = " where emp." + Message.BusinessEntityIDColumn + " = '"
                    + strBusinessEntityId + "'";
                DataTable dt = _com.getData(strTable, strColumn, strCondition);
                if (dt.Rows.Count > 0)
                    if (dt.Rows[0][0].ToString().Trim() != "")
                    {
                        DateTime dtmBirtDate = DateTime.Parse(dt.Rows[0][0].ToString().Trim());
                        strBirthDateValue = dtmBirtDate.Month + "/" + dtmBirtDate.Day + "/" + dtmBirtDate.Year;
                    }
                strBirtDateID = "";
                strBirtDateEditable = "Readonly";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "Admin")
                {
                    lbtnDepartment.Text = "Edit Department";
                    isAdmin = true;
                    btnEmpListPage.Visible = true;
                    try
                    {
                        if (!IsPostBack)
                        {
                            // Get ID
                            strBusinessEntityId = Request.QueryString["BusinessEntityId"];
                            if (strBusinessEntityId == null) { }
                            else
                            {
                                //Delete link ID
                                Session["BusinessEntityId"] = strBusinessEntityId;
                                Response.Redirect(Message.EditEmployeePage);
                            }
                            strBusinessEntityId = Session["BusinessEntityId"].ToString();
                            loadControlStateOfPersonDetailsData(true);
                            loadControlStateOfPersonContactData(true);
                            loadControlStateOfEmpStateData(true);
                            loadEmployeeImage();
                        }
                        strBusinessEntityId = Session["BusinessEntityId"].ToString();
                        setBirthDateControl();
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                    }
                }
                else
                {
                    lbtnDepartment.Text = "Department History";
                    btnEmpListPage.Visible = false;
                    isAdmin = false;
                    strBusinessEntityId = Session["AccountID"].ToString();
                    loadControlStateOfPersonDetailsData(true);
                    loadControlStateOfPersonContactData(true);
                    loadControlStateOfEmpStateData(true);
                    loadEmployeeImage();
                    // Disable edit of employe state
                    btnEditEmpState.Visible = false;
                    btnCancelEditEmpState.Visible = false;
                }
                string strColumn = "per." + Message.NameColumn + ", emp." + Message.BirthDateColumn + ", per."
                    + Message.SSNNumberColumn + ", emp." + Message.GenderColumn + ", emp." + Message.MaritalStatusColumn
                    +",per."+Message.RankColumn;
                string strTable = Message.TableEmployee + " emp join " + Message.TablePerson + " per on emp."
                    + Message.BusinessEntityIDColumn + "=per." + Message.BusinessEntityIDColumn;
                string strCondition = " where emp." + Message.BusinessEntityIDColumn + " = '"
                    + strBusinessEntityId + "'";
                DataTable dt = _com.getData(strTable, strColumn, strCondition);
                if (dt.Rows.Count > 0)
                {
                    ddlRank.SelectedValue = dt.Rows[0][5].ToString();
                }
            }
        }

        //Button action
        //btn edit details
        protected void btnEditPersonDetails_Click(object sender, EventArgs e)
        {
            if (btnEditPersonDetails.Text == "Edit")
            {
                //Reload State of controls
                loadControlStateOfPersonDetailsData(false);
                btnCancelPersonDetails.Visible = true;
                btnEditPersonDetails.Text = "Save";
                lblPersonDetailGuideLine.Text = "";
            }
            else
                if (btnEditPersonDetails.Text == "Save")
                {
                    //Update data to table
                    updateEmployeDetails();
                    if (isUpdatePersonDetails)
                    {
                        //Reload State of controls
                        loadControlStateOfPersonDetailsData(true);
                        btnCancelPersonDetails.Visible = false;
                        btnEditPersonDetails.Text = "Edit";
                        lblPersonDetailGuideLine.Text = "";
                    }
                    else
                        loadControlStateOfPersonDetailsData(false);
                }
        }

        protected void btnCancelPersonDetails_Click(object sender, EventArgs e)
        {
            loadControlStateOfPersonDetailsData(true);
            btnCancelPersonDetails.Visible = false;
            btnEditPersonDetails.Text = "Edit";
            lblPersonDetailGuideLine.Text = "";
        }

        //btn edit contact
        protected void btnEditContactDetails_Click(object sender, EventArgs e)
        {
            if (btnEditContactDetails.Text == "Edit")
            {
                //Reload State of controls
                btnEditContactDetails.Text = "Save";
                btnCancelEditContactDetails.Visible = true;
                loadControlStateOfPersonContactData(false);
            }
            else
                if (btnEditContactDetails.Text == "Save")
                {
                    //Update data to table
                    updatePersonContact();
                    if (isUpdatePersonContact == true)
                    {
                        //Reload State of controls
                        btnEditContactDetails.Text = "Edit";
                        btnCancelEditContactDetails.Visible = false;
                        loadControlStateOfPersonContactData(true);
                    }
                }
        }

        protected void btnCancelEditContactDetails_Click(object sender, EventArgs e)
        {
            loadControlStateOfPersonContactData(true);
            btnCancelEditContactDetails.Visible = false;
            btnEditContactDetails.Text = "Edit";
        }

        protected void btnUpdateImage_Click(object sender, EventArgs e)
        {
            if (btnUpdateImage.Text == "Change Image")
            {
                fudEmployeePhoto.Visible = true;
                btnUpdateImage.Text = "Update";
                btnUpdateImage.Width = 80;
            }
            else
            {
                string strImageURL = "";
                if (fudEmployeePhoto.HasFile)
                {
                    //try
                    //{
                        if ((fudEmployeePhoto.PostedFile.ContentType == "image/jpeg")
                            || (fudEmployeePhoto.PostedFile.ContentType == "image/jpg")
                            || (fudEmployeePhoto.PostedFile.ContentType == "image/pjpeg"))
                        {
                            if (fudEmployeePhoto.PostedFile.ContentLength < 102400000 * 5)
                            {
                                //Delete old image
                                string strColumn = "emp." + Message.ImageColumn;
                                string strTable = Message.TableEmployee + " emp ";
                                string strCondition = " where emp." + Message.BusinessEntityIDColumn + " = '"
                                    + strBusinessEntityId + "'";
                                DataTable dt = _com.getData(strTable, strColumn, strCondition);
                                if (dt.Rows.Count > 0)
                                    if (dt.Rows[0][0].ToString() != "add_user.png")
                                    {
                                        string strUrl = "/_layouts/Images/21_2_ob/" + dt.Rows[0][0].ToString();
                                        if (File.Exists(Server.MapPath(strUrl))) File.Delete(Server.MapPath(strUrl));
                                    }

                                //Save new image
                                strImageURL = strBusinessEntityId + "_" + fudEmployeePhoto.FileName;
                                string strURL = Server.MapPath("/_layouts/Images/21_2_ob/") + strImageURL;
                                if (Directory.Exists(Server.MapPath("/_layouts/Images/21_2_ob/")) == false)
                                    Directory.CreateDirectory(Server.MapPath("/_layouts/Images/21_2_ob/"));
                                if (File.Exists(strURL)) File.Delete(strURL);
                                fudEmployeePhoto.SaveAs(strURL);
                                lblPhotoDetail.Text = "";
                                string strTableName = Message.TableEmployee;
                                strCondition = " " + Message.ImageColumn + " = '" + strImageURL + "' where "
                                    + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId;
                                _com.updateTable(strTableName, strCondition);
                                loadEmployeeImage();
                                lblPhotoDetail.Text = "";
                            }
                            else
                            {
                                lblPhotoDetail.Text = "Upload failed: File must less than 5MB";
                                return;
                            }
                        }
                        else
                        {
                            lblPhotoDetail.Text = Message.NotJpeg;
                            return;
                        }
                    //}
                    //catch (Exception)
                    //{
                    //    lblPhotoDetail.Text = Message.CanNotUpload;
                    //    return;
                    //}
                }
                fudEmployeePhoto.Visible = false;
                btnUpdateImage.Text = "Change Image";
                btnUpdateImage.Width = 150;
            }

        }

        protected void grdDepHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //string Location = Message.EditEmployeePage + "/?BusinessEntityId=" + Server.HtmlDecode(e.Row.Cells[5].Text);
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
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (i != 0)
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;line-height: 20px;");
                    }
                    else
                    {
                        e.Row.Cells[i].Attributes.Add("style", "padding-top:7px;padding-bottom:7px;padding-left:5px;line-height: 20px;");
                    }
                    //e.Row.Cells[i].Attributes.Add("onClick", string.Format("javascript:window.location='{0}';", Location));
                }
            }
            else
            {
                e.Row.Cells[0].Attributes.Add("style", "padding-left:5px;");
            }
        }

        protected void btnEditEmpState_Click(object sender, EventArgs e)
        {
            if (btnEditEmpState.Text == "Edit")
            {
                btnEditEmpState.Text = "Save";
                loadControlStateOfEmpStateData(false);
                btnCancelEditEmpState.Visible = true;
            }
            else
            {
                updateDateToEmpState();
                btnEditEmpState.Text = "Edit";
                loadControlStateOfEmpStateData(true);
                btnCancelEditEmpState.Visible = false;
            }
        }

        private void updateDateToEmpState()
        {
            try
            {
                string strTableName = Message.TableEmployee;
                string strCondition = "";
                //Job Title
                string strJobID = ddlJobTitle.SelectedItem.Value;
                if (strJobID != "") strCondition = strCondition + " " + Message.JobIDColumn + " = " + strJobID;
                else strCondition = strCondition + " " + Message.JobIDColumn + " = null";
                //Current Flag
                string strCurrentFlag = "";
                if (ddlCurrentFlag.SelectedValue == "Active") strCurrentFlag = "1";
                else strCurrentFlag = "0";
                strCondition = strCondition + " , " + Message.CurrentFlagColumn + " = " + strCurrentFlag;

                strCondition = strCondition + " where " + Message.BusinessEntityIDColumn + " = " + strBusinessEntityId;

                //Update
                _com.updateTable(strTableName, strCondition);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnEmpListPage_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.EmployeeListPage, true);
        }

        protected void lbtnDepartment_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = _com.getData(Message.TablePerson, Message.NameColumn, " where "
                    + Message.BusinessEntityIDColumn + "='" + strBusinessEntityId + "'");
                if (Session["Account"].ToString() == "Admin")
                {
                    Response.Redirect(Message.EditEmployeeDepartmentPage + "/?BusinessID=" + strBusinessEntityId
                        + "&EmployeeName=" + dt.Rows[0][0].ToString());
                }
                else
                {
                    Response.Redirect(Message.MyDepartmentPage);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnCancelEditEmpState_Click(object sender, EventArgs e)
        {
            btnEditEmpState.Text = "Edit";
            loadControlStateOfEmpStateData(true);
            btnCancelEditEmpState.Visible = false;
        }
    }
}
