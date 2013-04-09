﻿<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
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
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Edit Employee Information</span>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td style="width: 425px;">
                        <br>
                        <span style="padding-left: 10px;"></span>
                        <asp:Label ID="lblEmployeeImageTitle" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <br>
                        <div style="background-color: rgb(44, 166, 205); height: 30px; color: white; font-weight: bold;
                            line-height: 30px; border-radius: 5px 5px 5px 5px; padding-left: 5px;width:99.5%">
                            Personal Detail</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="padding-left: 10px;"></span>
                        <asp:Image ID="imgEmployeeImage" runat="server" Width="200px" Height="200px" />
                    <td>
                        <br>
                        <asp:Label ID="lblFullName" runat="server" Text="Full Name" Width="150px"></asp:Label>
                        <asp:TextBox ID="txtFullName" runat="server" Width="200px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblBirthDate" runat="server" Text="Birth Date" Width="150px"></asp:Label>
                        <input type="text" size="30" id="<%= this.strBirtDateID %>" name="<%= this.strBirtDateID %>"
                            value="<%= this.strBirthDateValue %>" <%= this.strBirtDateEditable %> />
                        <br />
                        <br />
                        <asp:Label ID="lblSSNNumber" runat="server" Text="SSNNumber" Width="150px"></asp:Label>
                        <asp:TextBox ID="txtSSNNumber" runat="server" Width="200px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblGender" runat="server" Text="Sex" Width="150px"></asp:Label>
                        <asp:RadioButton ID="rdbGenderMale" runat="server" Text="Male" GroupName="Gender"
                            Checked="true" />
                        <asp:RadioButton ID="rdbGenderFemale" runat="server" Text="Female" GroupName="Gender" />
                        <br />
                        <br />
                        <asp:Label ID="lblMeritalStatus" runat="server" Text="Marital Status" Width="150px"></asp:Label>
                        <asp:RadioButton ID="rdbMaritalSingle" runat="server" Text="Single" GroupName="MaritalStatus"
                            Checked="true" />
                        <asp:RadioButton ID="rdbMaritalMerried" runat="server" Text="Married" GroupName="MaritalStatus" />
                        <br />
                        <br />
                        <div class="borderTop" style="padding-left: 0px;">
                            <asp:Button ID="btnEditPersonDetails" CssClass="addButton" runat="server" Text="Edit"
                                OnClick="btnEditPersonDetails_Click" Width="80px" />
                            <asp:Button ID="btnCancelPersonDetails" runat="server" CssClass="resetButton" Text="Cancel"
                                OnClick="btnCancelPersonDetails_Click" Visible="False" Width="80px" />
                        </div>
                    </td>
                </tr>
            </table>
            <div style="background-color: rgb(44, 166, 205); height: 30px; color: white; font-weight: bold;
                line-height: 30px; border-radius: 5px 5px 5px 5px; padding-left: 5px;">
                Contact Title</div>
            <br />
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblEmail" runat="server" Text="Email" Width="150px"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            <span style="padding-left: 50px;"></span>
            <asp:Label ID="lblHomePhone" runat="server" Text="Home Phone" Width="150px"></asp:Label>
            <asp:TextBox ID="txtHomePhone" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblMobile" runat="server" Text="Mobile" Width="150px"></asp:Label>
            <asp:TextBox ID="txtMobile" runat="server" Width="200px"></asp:TextBox>
            <span style="padding-left: 50px;"></span>
            <asp:Label ID="lblCountry" runat="server" Text="Country" Width="150px"></asp:Label>
            <asp:TextBox ID="txtCountry" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblCity" runat="server" Text="City" Width="150px"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox>
            <span style="padding-left: 50px;"></span>
            <asp:Label ID="lblAddressStreet" runat="server" Text="Address Street" Width="150px"></asp:Label>
            <asp:TextBox ID="txtAddressStreet" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnEditContactDetails" CssClass="addButton" runat="server" Text="Edit"
                    OnClick="btnEditContactDetails_Click" Width="80px" />
                <asp:Button ID="btnCancelEditContactDetails" runat="server" CssClass="resetButton"
                    Text="Cancel" OnClick="btnCancelEditContactDetails_Click" Visible="False" Width="80px" />
            </div>
        </td>
    </tr>
</table>
