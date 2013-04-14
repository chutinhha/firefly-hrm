using System;
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

        // Person Details
        private void loadPersonDetailsData()
        {
            string strColumn = "Name, BirthDate, SSNNumber, Gender, MaritalStatus";
            string strTable = "HumanResources.Employee, HumanResources.Person";
            string strCondition = " where (HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId) AND (HumanResources.Employee.BusinessEntityId = " + strBusinessEntityId + ")";
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
                ddlJobTitle.Enabled = false;
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
                    ddlJobTitle.Enabled = true;
                    ddlRank.Enabled = true;
                }
                else
                {
                    ddlJobTitle.Enabled = false;
                    ddlRank.Enabled = true;
                }
            }
        }

        private void loadEmployeeImage()
        {
            string strColumn = "Name, Image";
            string strTable = "HumanResources.Employee, HumanResources.Person";
            string strCondition = " where (HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId) AND (HumanResources.Employee.BusinessEntityId = " + strBusinessEntityId + ")";
            DataTable dt = _com.getData(strTable, strColumn, strCondition);
            if (dt.Rows.Count > 0)
            {
                lblEmployeeImageTitle.Text = dt.Rows[0][0].ToString();
                imgEmployeeImage.ImageUrl = "/_layouts/Images/21_2_ob/" + dt.Rows[0][1].ToString();
                //imgEmployeeImage.ImageUrl = "https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-ash3/601264_3903279919727_1220919926_n.jpg";
            }
        }

        private void updateEmployeDetails()
        {
            // Check Input Required            
            if (txtFullName.Text == "")
            {
                lblPersonDetailGuideLine.Visible = true;
                isUpdatePersonDetails = false;
                return;
            }
            // Update data to Employees Table
            string strTableName = Message.TableEmployee;
            string strCondition = "";
            //BirthDate
            string strBirtDate = Request.Form["txtBirthDate"].ToString().Trim();
            strBirtDate = "'" + strBirtDate + "'";
            strCondition = strCondition + "BirthDate = " + strBirtDate;
            //MaritalStatus
            string strMaritalStatus = "";
            if (rdbMaritalSingle.Checked == true) strMaritalStatus = "'S'";
            else strMaritalStatus = "'M'";
            strCondition = strCondition + " , MaritalStatus = " + strMaritalStatus;
            //Gender
            string strGender = "";
            if (rdbGenderMale.Checked == true) strGender = "'M'";
            else strGender = "'F'";
            strCondition = strCondition + " , Gender = " + strGender;
            //ModifiedDate
            string strModifiedDate = System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString();
            strModifiedDate = "'" + strModifiedDate + "'";
            strCondition = strCondition + " , ModifiedDate = " + strModifiedDate;            

            strCondition = strCondition + " where BusinessEntityId = " + strBusinessEntityId;
            _com.updateTable(strTableName, strCondition);

            // Check Table Person Exist
            strTableName = Message.TablePerson;
            DataTable dt = _com.getData(strTableName, "*", " where BusinessEntityId = " + strBusinessEntityId);
            // IF not Exist -> create new rows.
            if (dt.Rows.Count == 0)
            {
                string strColumn = "(BusinessEntityId,ModifiedDate,Name,Rank)";
                strCondition = strBusinessEntityId + " , " + strModifiedDate;
                //Name
                string strName = "'" + txtFullName.Text + "'";
                strCondition = strCondition + " , " + strName;
                //Rank
                if (ddlRank.SelectedIndex == 0) strCondition = strCondition + " , " + "'User'";
                else strCondition = strCondition + " , " + "'Admin'";
                // Insert into Table
                _com.insertIntoTable(strTableName, strColumn, strCondition, false);
            }

            // Update data to Peson Table                        
            strTableName = Message.TablePerson;
            strCondition = "";
            //Name
            string strFullName = "'" + txtFullName.Text + "'";
            strCondition = strCondition + " Name = " + strFullName;
            //Rank
            if (ddlRank.SelectedIndex == 0) strCondition = strCondition + " , Rank = 'User'";
            else strCondition = strCondition + " , Rank = 'Admin'";
            //SSNNumber
            string strSSNNumber = "'" + txtSSNNumber.Text + "'";
            strCondition = strCondition + " , SSNNumber = " + strSSNNumber;
            strCondition = strCondition + " where BusinessEntityId = " + strBusinessEntityId;
            _com.updateTable(strTableName, strCondition);
            isUpdatePersonDetails = true;
        }

        //Person Contact
        private void loadPersonContact()
        {
            string strCountry = "";
            string strColumn = "EmailAddress, HomePhone, Mobile, City, Country, AddressStreet";
            string strTable = "HumanResources.Person";
            string strCondition = " where (HumanResources.Person.BusinessEntityId = " + strBusinessEntityId + ")";
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

        private void loadControlStateOfPersonContactData(bool isStateLoad)
        {
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
            // Update data to Peson Table                        
            string strTableName = Message.TablePerson;
            string strCondition = "";
            //EmailAddress
            string strEmailAddress = "'" + txtEmail.Text + "'";
            strCondition = strCondition + "EmailAddress = " + strEmailAddress;
            //HomePhone
            string strHomePhone = "'" + txtHomePhone.Text + "'";
            strCondition = strCondition + " , HomePhone = " + strHomePhone;
            //Mobile
            string strMobile = "'" + txtMobile.Text + "'";
            strCondition = strCondition + " , Mobile = " + strMobile;
            //City
            string strCity = "'" + txtCity.Text + "'";
            strCondition = strCondition + " , City = " + strCity;
            //Country
            string strCountry = "'" + ddlCountry.SelectedValue + "'";
            strCondition = strCondition + " , Country = " + strCountry;
            //AddressStreet
            string strAddressStreet = "'" + txtAddressStreet.Text + "'";
            strCondition = strCondition + " , AddressStreet = " + strAddressStreet;
            //ModifiedDate
            string strModifiedDate = System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString();
            strModifiedDate = "'" + strModifiedDate + "'";
            strCondition = strCondition + " , ModifiedDate = " + strModifiedDate;

            strCondition = strCondition + " where BusinessEntityId = " + strBusinessEntityId;
            _com.updateTable(strTableName, strCondition);
        }

        protected void loadEmpState()
        {
            //Set data to Job Title dropdownlist
            string strColumn = "j.JobTitle";
            string strTable = " ( HumanResources.Employee e LEFT JOIN HumanResources.JobTitle j ON e.JobId = j.JobId) ";
            string strCondition = " Where (e.BusinessEntityId = " + strBusinessEntityId + ")";
            DataTable dtJobTitle = _com.getData(strTable, strColumn, strCondition);
            if (dtJobTitle.Rows.Count > 0)
            {
                string strJobTitle = dtJobTitle.Rows[0][0].ToString();
                _com.SetItemList(Message.JobTitleColumn, Message.TableJobTitle, ddlJobTitle, "", true, "-----");
                DropDownList ddlTemp = ddlJobTitle;
                if (strJobTitle != "") ddlJobTitle.SelectedValue = ddlTemp.Items.FindByText(strJobTitle).Value;
            }

            //Set data to Current Flag
            strColumn = "CAST(CurrentFlag AS VARCHAR(1))";
            strTable = " HumanResources.Employee ";
            strCondition = " Where (BusinessEntityId = " + strBusinessEntityId + ")";
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
                                    + Message.NameColumn + ",edh." + Message.StartDateColumn, " where edh." + Message.BusinessEntityIDColumn + "='" + strBusinessEntityId
                                    + "' and (edh." + Message.EndDateColumn + " is NULL or edh." + Message.EndDateColumn + "='')");
            if (dt.Rows.Count > 0)
            {
                txtDepartment.Text=dt.Rows[0][0].ToString();
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
                    isAdmin = true;
                    bntEmpListPage.Visible = true;
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
                    }
                    catch (Exception ex) { }
                }
                else
                {
                    bntEmpListPage.Visible = false;
                    isAdmin = false;
                    strBusinessEntityId = Session["AccountID"].ToString();
                    loadControlStateOfPersonDetailsData(true);
                    loadControlStateOfPersonContactData(true);
                    loadEmployeeImage();
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
                if (lblPersonDetailGuideLine.Visible == true)
                    lblPersonDetailGuideLine.Visible = false;
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
                        if (lblPersonDetailGuideLine.Visible == true)
                            lblPersonDetailGuideLine.Visible = false;
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
            lblPersonDetailGuideLine.Visible = false;
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
                    //Reload State of controls
                    btnEditContactDetails.Text = "Edit";
                    btnCancelEditContactDetails.Visible = false;
                    loadControlStateOfPersonContactData(true);
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
                    try
                    {
                        if ((fudEmployeePhoto.PostedFile.ContentType == "image/jpeg") || (fudEmployeePhoto.PostedFile.ContentType == "image/jpg") || (fudEmployeePhoto.PostedFile.ContentType == "image/pjpeg"))
                        {
                            if (fudEmployeePhoto.PostedFile.ContentLength < 102400000)
                            {
                                strImageURL = strBusinessEntityId + "_" + fudEmployeePhoto.FileName;
                                string strURL = Server.MapPath("/_layouts/Images/21_2_ob/") + strImageURL;
                                if (Directory.Exists(Server.MapPath("/_layouts/Images/21_2_ob/")) == false)
                                    Directory.CreateDirectory(Server.MapPath("/_layouts/Images/21_2_ob/"));
                                if (File.Exists(strURL)) File.Delete(strURL);
                                fudEmployeePhoto.SaveAs(strURL);
                                lblPhotoDetail.Text = "";
                                string strTableName = Message.TableEmployee;
                                string strCondition = " Image = '" + strImageURL + "' where BusinessEntityId = " + strBusinessEntityId;
                                _com.updateTable(strTableName, strCondition);
                                loadEmployeeImage();
                            }
                            else
                            {
                                return;
                            }
                        }
                        else
                        {
                            lblPhotoDetail.Text = "Upload status: Only JPEG files are accepted!";
                            return;
                        }
                    }
                    catch (Exception)
                    {
                        lblPhotoDetail.Text = "Upload status: The file could not be uploaded";
                        return;
                    }
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
            string strTableName = Message.TableEmployee;            
            string strCondition = "";
            //Job Title
            string strJobID = ddlJobTitle.SelectedItem.Value;
            if (strJobID != "") strCondition = strCondition + " JobID = " + strJobID;
            else strCondition = strCondition + " JobID = null";
            //Current Flag
            string strCurrentFlag = "";
            if (ddlCurrentFlag.SelectedValue == "Active") strCurrentFlag = "1";
            else strCurrentFlag = "0";
            strCondition = strCondition + " , CurrentFlag = " + strCurrentFlag;

            strCondition = strCondition + " where BusinessEntityId = " + strBusinessEntityId;

             //Update
            _com.updateTable(strTableName, strCondition);                         
        }

        protected void bntEmpListPage_Click(object sender, EventArgs e)
        {
            _com.closeConnection();
            Response.Redirect(Message.EmployeeListPage, true);
        }

        protected void lbtnDepartment_Click(object sender, EventArgs e)
        {
            DataTable dt = _com.getData(Message.TablePerson, Message.NameColumn, " where "
                + Message.BusinessEntityIDColumn + "='"+strBusinessEntityId+"'");
            Response.Redirect(Message.EditEmployeeDepartmentPage + "/?BusinessID=" + strBusinessEntityId
                + "&EmployeeName=" + dt.Rows[0][0].ToString());
        }
    }
}
