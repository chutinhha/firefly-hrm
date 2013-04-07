<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAccountUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.UserAccount.UserAccountUserControl" %>
&nbsp;<asp:LinkButton ID="lbtnUserName" runat="server" OnClick="lbtnUserName_Click"></asp:LinkButton>
&nbsp;|
<asp:LinkButton ID="lbtnChangePassword" runat="server" OnClick="lbtnChangePassword_Click">Change Password</asp:LinkButton>
&nbsp;|
<asp:LinkButton ID="lbtnLogOut" runat="server" OnClick="lbtnLogOut_Click" OnClientClick="return confirm('Are you sure you want to log out ?')">Logout</asp:LinkButton>
