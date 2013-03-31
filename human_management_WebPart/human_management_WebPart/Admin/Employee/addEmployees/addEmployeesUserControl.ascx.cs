using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;

namespace SP2010VisualWebPart.Admin.Employee.addEmployees
{
    public partial class addEmployeesUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                lblFullName.ForeColor = System.Drawing.Color.Black;
                lblMail.ForeColor = System.Drawing.Color.Black;
                lblSSNNumber.ForeColor = System.Drawing.Color.Black;
                lblUserGuide.ForeColor = System.Drawing.Color.Black;
                lblUserGuide.Text = "";
                lblPhotoDetail.ForeColor = System.Drawing.Color.Black;
                lblPhotoDetail.Text = "Accepts jpg, .png, .gif up to 1MB. Recommended dimensions: 200px X 200px";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Check input
            bool isTestInput = true;
            if (txtFullName.Text == "")
            {
                lblFullName.ForeColor = System.Drawing.Color.Red;
                isTestInput = false;
            }
            if (txtMail.Text == "")
            {
                lblMail.ForeColor = System.Drawing.Color.Red;
                isTestInput = false;
            }
            if (txtSSNNumber.Text == "")
            {
                lblSSNNumber.ForeColor = System.Drawing.Color.Red;
                isTestInput = false;
            }
            if (isTestInput == false)
            {
                lblUserGuide.Text = "* Required field";
                lblUserGuide.ForeColor = System.Drawing.Color.Red;
                return;
            }

            //Update Image to server
            string strImageURL = "";
            if (fucPhotograph.HasFile)
            {
                try
                {
                    if ((fucPhotograph.PostedFile.ContentType == "image/jpeg") || (fucPhotograph.PostedFile.ContentType == "image/jpg") || (fucPhotograph.PostedFile.ContentType == "image/pjpeg"))
                    {
                        if (fucPhotograph.PostedFile.ContentLength < 102400000)
                        {
                            string filename = fucPhotograph.FileName;
                            strImageURL = Server.MapPath("~/") + filename;
                            fucPhotograph.SaveAs(strImageURL);                            
                        }
                        else
                        {
                            lblPhotoDetail.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                    }
                    else
                    {
                        lblPhotoDetail.Text = "Upload status: Only JPEG files are accepted!";
                        lblPhotoDetail.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                catch (Exception ex)
                {
                    lblPhotoDetail.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    lblPhotoDetail.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            //Insert Database
            bool isIDENTITY_INSERT = false;

            //Insert Database to Employee Table
            string strTableName = Message.TableEmployee;
            string strColumName = @"(BirthDate,MaritalStatus,Gender,CurrentFlag,ModifiedDate,Image)";            
            //BirthDate
            string strBirtDate = cldBirthDate.SelectedDate.ToShortDateString();            
            strBirtDate = "'" + strBirtDate + "'";
            //MaritalStatus
            string strMaritalStatus = "";
            if (rdbMaritalSingle.Checked == true) strMaritalStatus = "'S'";
            else strMaritalStatus = "'M'";
            //Gender
            string strGender = "";
            if (rdbGenderMale.Checked == true) strGender = "'M'";
            else strGender = "'F'";
            //CurrentFlag
            string strCurrentFlag = "";
            if (ddlCurrentFlag.SelectedIndex == 0) strCurrentFlag = "1";
            else strCurrentFlag = "0";
            //ModifiedDate
            string strModifiedDate = System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString();
            strModifiedDate = "'" + strModifiedDate + "'";
            //ImageURL
            strImageURL = strImageURL.Replace("\\\\", "\\");
            strImageURL = "'" + strImageURL + "'";
            // Create Condition
            string strCondition = strBirtDate + "," + strMaritalStatus +","+strGender+","+strCurrentFlag+","+strModifiedDate+","+strImageURL;            
            _com.insertIntoTable(strTableName, strColumName, strCondition, isIDENTITY_INSERT);

            //Insert Database to Person Table
            strTableName = Message.TablePerson;
            strColumName = @"(BusinessEntityId,Rank,Name,EmailAddress,HomePhone,Mobile,SSNNumber,City,Country,AddressStreet,ModifiedDate)";   
            //Name
            string strName = "'" + txtFullName.Text + "'";
            //EmailAddress
            string strEmailAddress = "'" + txtMail.Text + "'";
            //HomePhone
            string strHomePhone = "'" + txtHomeMobile.Text + "'";
            //Mobile
            string strMobile = "'" + txtMobile.Text + "'";
            //SSNNumber
            string strSSNNumber = "'" + txtSSNNumber.Text + "'";
            //City
            string strCity = "'" + txtCity.Text + "'";
            //Country
            string strCountry = "'" + txtCountry.Text + "'";
            //AddressStreet
            string strAddressStreet = "'" + txtAddressStreet.Text + "'";
            //BusinessEntityId
            DataTable dt = _com.getTopID(Message.TableEmployee);
            string strBusinessEntityId = dt.Rows[0][0].ToString();
            //Rank
            string strRank = "";
            if (ddlRank.SelectedIndex == 0) strRank = "Admin";
            else strRank = "User";
            strRank = "'" + strRank + "'";
            // Create Condition
            strCondition = strBusinessEntityId + "," + strRank + "," + strName + "," + strEmailAddress + "," + strHomePhone + "," + strMobile + "," + strSSNNumber + "," + strCity + "," + strCountry + "," + strAddressStreet + "," + strModifiedDate;
            _com.insertIntoTable(strTableName, strColumName, strCondition, isIDENTITY_INSERT);           
        }
    }
}
