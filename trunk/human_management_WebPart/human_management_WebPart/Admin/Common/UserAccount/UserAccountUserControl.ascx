<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAccountUserControl.ascx.cs" Inherits="SP2010VisualWebPart.UserAccount.UserAccountUserControl" %>
&nbsp;<asp:LinkButton ID="lbtnUserName" runat="server" 
    onclick="lbtnUserName_Click"></asp:LinkButton>
&nbsp;|
<asp:LinkButton ID="lbtnChangePassword" runat="server" onclick="lbtnChangePassword_Click">Change Passwod</asp:LinkButton>
&nbsp;|
<asp:LinkButton ID="lbtnLogOut" runat="server" onclick="lbtnLogOut_Click">Logout</asp:LinkButton>

