<script type="text/javascript" language="javascript">

    function ValidateText(i) {
        if (i.value.length > 0) {
            i.value = i.value.replace(/[^\d]+/g, '');
        }
    }
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txtBirthDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addEmployeesUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Employee.addEmployees.addEmployeesUserControl" %>
<h1 style="margin: 0px; padding: 9px 15px; border: 1px solid rgb(222, 222, 222);
    font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal;
    font-variant: normal; font-weight: inherit; line-height: 20px; vertical-align: baseline;
    background-image: url(http://demo.orangehrmlive.com/symfony/web/webres_514a9984881014.42284015/themes/default/images/h1-bg.png);
    background-color: rgb(243, 243, 243); color: rgb(93, 93, 93); border-top-left-radius: 3px;
    border-top-right-radius: 3px; letter-spacing: normal; orphans: auto; text-align: start;
    text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;
    -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-position: 0% 100%;
    background-repeat: repeat no-repeat;">
    Add Employee</h1>
<table>
    <tr>
        <td>
            <span>
                <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label></span>
        </td>
        <td>
            <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <span>
                <asp:Label ID="lblRank" runat="server" Text="Rank"></asp:Label></span>
        </td>
        <td>
            <asp:DropDownList ID="ddlRank" runat="server">
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                <asp:ListItem Value="User">User</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblHomeMobile" runat="server" Text="Home Mobile"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtHomeMobile" runat="server" onkeyup="ValidateText(this);"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ID="valNumbersOnly" ControlToValidate="txtHomeMobile"
                Display="Dynamic" ErrorMessage="Please enter a numbers only in text box." ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblSSNNumber" runat="server" Text="SSN Number"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSSNNumber" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMail" runat="server" Text="Mail"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblBirthDate" runat="server" Text="Birth Date"></asp:Label>
        </td>
        <td>
            <input type="text" id="txtBirthDate" name="txtBirthDate">
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMeritalStatus" runat="server" Text="Marital Status"></asp:Label>
        </td>
        <td>
            <asp:RadioButton ID="rdbMaritalSingle" runat="server" Text="Single" GroupName="MaritalStatus"
                Checked="true" />
            <asp:RadioButton ID="rdbMaritalMerried" runat="server" Text="Married" GroupName="MaritalStatus" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblGender" runat="server" Text="Sex"></asp:Label>
        </td>
        <td>
            <asp:RadioButton ID="rdbGenderMale" runat="server" Text="Male" GroupName="Gender"
                Checked="true" />
            <asp:RadioButton ID="rdbGenderFemale" runat="server" Text="Female" GroupName="Gender" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCurrentFlag" runat="server" Text="Current Flag"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlCurrentFlag" runat="server">
                <asp:ListItem Value="1">Active</asp:ListItem>
                <asp:ListItem Value="0">Inactive</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddressStreet" runat="server" Text="Address Street"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAddressStreet" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPhotograph" runat="server" Text="Photograph"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:Panel ID="pnlChoosePhoto" runat="server">
                            <asp:FileUpload ID="fucPhotograph" runat="server" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPhotoDetail" runat="server" Text="Accepts jpg, .png, .gif up to 1MB. Recommended dimensions: 200px X 200px"
                            BackColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<p>
    <asp:Label ID="lblUserGuide" runat="server" Text=""></asp:Label>
    <table>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
