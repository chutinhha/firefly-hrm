<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Login.LoginUserControl" %>
<span style="padding-left:5px;"></span><asp:Label ID="Label1" runat="server" Text="User" Width="120px"></asp:Label>
<asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
<br /><br />
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label3" runat="server" Text="Password" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" ontextchanged="TextBox2_TextChanged" 
        TextMode="Password" Width="200px"></asp:TextBox>
</p>
<span style="padding-left:128px;"></span>
<asp:Button ID="Button1" runat="server" 
    Text="Login" onclick="Button1_Click1" Width="80px" />
<p>
    <asp:Label ID="Label2" runat="server" style="color:Red;"></asp:Label>
</p>
