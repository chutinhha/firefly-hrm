<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addLeaveTypeUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Leave.addLeaveType.addLeaveTypeUserControl" %>
<table width="100%">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblPageTitle" runat="server" Text="Add Leave Type"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblLeaveName" runat="server" Text="Leave Name*"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLeaveName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblNote" runat="server" Text="Note"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtNote" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblLimited" runat="server" Text="Limited"></asp:Label>
        </td>
        <td>
            <asp:RadioButton ID="rdbLimitedNo" runat="server" GroupName="Limited" Text="No"
                Checked="true" AutoPostBack="true" 
                oncheckedchanged="rdbLimitedNo_CheckedChanged"/>
            <asp:RadioButton ID="rdbLimitedYes" runat="server" GroupName="Limited" 
                Text="Yes" oncheckedchanged="rdbLimitedYes_CheckedChanged" AutoPostBack="true" />
        </td>
    </tr>    
    <asp:Panel ID="pnlLimitedYes" runat="server" Visible="false">
        <tr>
            <td>
                <asp:Label ID="lblLimitDay" runat="server" Text="Limit Date*"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLimitDay" runat="server"></asp:TextBox>
            </td>
        </tr>
    </asp:Panel>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblUserGuide" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </td>
        <td>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </td>
    </tr>
</table>
