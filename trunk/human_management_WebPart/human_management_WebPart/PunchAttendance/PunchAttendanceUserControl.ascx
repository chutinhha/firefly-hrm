﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PunchAttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.PunchAttendance.PunchAttendanceUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><asp:Label ID="Label1" runat="server" Text="Punch In"></asp:Label></td></tr></table>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label2" runat="server" Text="Employee Name" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Width="200px" 
        Enabled="False"></asp:TextBox>
</p>
<span style="padding-left:5px;"></span><asp:Label ID="Label3" runat="server" Text="Date(*)" Width="150px"></asp:Label>
<asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="..." onclick="Button1_Click" 
        Width="26px" />
<p>
    <asp:Calendar ID="Calendar1" runat="server" align="center" 
        onselectionchanged="Calendar1_SelectionChanged" Visible="False"></asp:Calendar>
</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label4" runat="server" Text="Time(*)" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
    <asp:Label ID="Label5" runat="server" Text="HH:MM"></asp:Label>
</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label7" runat="server" Text="Note"></asp:Label>
</p>
<p>
    <span style="padding-left:160px;"></span><asp:TextBox ID="TextBox4" runat="server" Height="100px" TextMode="MultiLine" 
        Width="300px"  ></asp:TextBox>
</p>
<p>
    <span style="padding-left:160px;"></span>
    <asp:Button ID="Button2" 
        runat="server" Text="In" Width="80px" onclick="Button2_Click" />
</p>
</td></tr></table><br>
<asp:Label ID="Label8" runat="server" style="color:Red;"></asp:Label>
<p>
    &nbsp;</p>


