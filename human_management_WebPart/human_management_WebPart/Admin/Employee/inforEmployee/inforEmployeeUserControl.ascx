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
<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="inforEmployeeUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Employee.inforEmployee.inforEmployeeUserControl" %>
<table width="100%">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblPageTitle" runat="server" Text="Employee Information"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblEmployeeImageTitle" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="imgEmployeeImage" runat="server" Width="200px" Height="200px"/>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPersonDetailsTitle" runat="server" Text="Person Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblBirthDate" runat="server" Text="Birth Date"></asp:Label>
                    </td>
                    <td>
                        <input type="text" id="<%= this.strBirtDateID %>" name="<%= this.strBirtDateID %>" value="<%= this.strBirthDateValue %>" <%= this.strBirtDateEditable %> />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSSNNumber" runat="server" Text="SSNNumber"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSSNNumber" runat="server"></asp:TextBox>
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
                        <asp:Button ID="btnEditPersonDetails" runat="server" Text="Edit" OnClick="btnEditPersonDetails_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnCancelPersonDetails" runat="server" Text="Cancel" 
                            onclick="btnCancelPersonDetails_Click" Visible="False" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblContactDetailTitle" runat="server" Text="Contact Title"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblHomePhone" runat="server" Text="Home Phone"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtHomePhone" runat="server"></asp:TextBox>
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
            <asp:Button ID="btnEditContactDetails" runat="server" Text="Edit" 
                onclick="btnEditContactDetails_Click" />
        </td>
        <td>
            &nbsp;
            <asp:Button ID="btnCancelEditContactDetails" runat="server" Text="Cancel" 
                onclick="btnCancelEditContactDetails_Click" Visible="False" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>
