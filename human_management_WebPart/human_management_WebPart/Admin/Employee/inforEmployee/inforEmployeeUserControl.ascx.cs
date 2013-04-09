using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Employee.inforEmployee
{
    public partial class inforEmployeeUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        private string strBusinessEntityId = "";
        protected string strBirthDateValue { get; set; }
        protected string strBirtDateEditable { get; set; }
        protected string strBirtDateID { get; set; }


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
            }
        }

        private void loadPersonDetailsData()
        {
            string strColumn = "Name, BirthDate, SSNNumber, Gender, MaritalStatus";
            string strTable = "HumanResources.Employee, HumanResources.Person";
            string strCondition = " where (HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId) AND (HumanResources.Employee.BusinessEntityId = " + strBusinessEntityId + ")";
            DataTable dt = _com.getData(strTable, strColumn, strCondition);
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

        private void loadEmployeeImage()
        {
            string strColumn = "Name, Image";
            string strTable = "HumanResources.Employee, HumanResources.Person";
            string strCondition = " where (HumanResources.Employee.BusinessEntityId = HumanResources.Person.BusinessEntityId) AND (HumanResources.Employee.BusinessEntityId = " + strBusinessEntityId + ")";
            DataTable dt = _com.getData(strTable, strColumn, strCondition);
            lblEmployeeImageTitle.Text = dt.Rows[0][0].ToString();
            //imgEmployeeImage.ImageUrl = Server.MapPath("~/image/" + dt.Rows[0][1].ToString());
            imgEmployeeImage.ImageUrl = "https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-ash3/601264_3903279919727_1220919926_n.jpg";
        }

        private void updateEmployeDetails()
        {
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

            // Update data to Peson Table                        
            strTableName = Message.TablePerson;
            strCondition = "";
            //Name
            string strName = "'" + txtFullName.Text + "'";
            strCondition = strCondition + " Name = " + strName;
            //SSNNumber
            string strSSNNumber = "'" + txtSSNNumber.Text + "'";
            strCondition = strCondition + " , SSNNumber = " + strSSNNumber;
            strCondition = strCondition + " where BusinessEntityId = " + strBusinessEntityId;
            _com.updateTable(strTableName, strCondition);

        }

        private void loadPersonContact()
        {
            string strColumn = "EmailAddress, HomePhone, Mobile, City, Country, AddressStreet";
            string strTable = "HumanResources.Person";
            string strCondition = " where (HumanResources.Person.BusinessEntityId = " + strBusinessEntityId + ")";
            DataTable dt = _com.getData(strTable, strColumn, strCondition);
            txtEmail.Text = dt.Rows[0][0].ToString();
            txtHomePhone.Text = dt.Rows[0][1].ToString();
            txtMobile.Text = dt.Rows[0][2].ToString();
            txtCity.Text = dt.Rows[0][3].ToString();
            txtCountry.Text = dt.Rows[0][4].ToString();
            txtAddressStreet.Text = dt.Rows[0][5].ToString();
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
                txtCountry.Enabled = false;
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
                txtCountry.Enabled = true;
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
            string strCountry = "'" + txtCountry.Text + "'";
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
                            loadEmployeeImage();
                        }
                    }
                    catch (Exception ex) { }
                }
                else
                {
                    strBusinessEntityId = Session["AccountID"].ToString();
                    loadControlStateOfPersonDetailsData(true);
                    loadControlStateOfPersonContactData(true);
                    loadEmployeeImage();
                }
            }
        }


        protected void btnEditPersonDetails_Click(object sender, EventArgs e)
        {
            if (btnEditPersonDetails.Text == "Edit")
            {
                //Reload State of controls
                loadControlStateOfPersonDetailsData(false);
                btnCancelPersonDetails.Visible = true;
                btnEditPersonDetails.Text = "Save";
            }
            else
                if (btnEditPersonDetails.Text == "Save")
                {
                    //Update data to table
                    updateEmployeDetails();
                    //Reload State of controls
                    loadControlStateOfPersonDetailsData(true);
                    btnCancelPersonDetails.Visible = false;
                    btnEditPersonDetails.Text = "Edit";
                }
        }

        protected void btnCancelPersonDetails_Click(object sender, EventArgs e)
        {
            loadControlStateOfPersonDetailsData(true);
            btnCancelPersonDetails.Visible = false;
            btnEditPersonDetails.Text = "Edit";
        }

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
    }
}
