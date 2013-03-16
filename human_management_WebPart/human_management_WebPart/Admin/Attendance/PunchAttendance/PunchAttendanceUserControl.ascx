<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PunchAttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.PunchAttendance.PunchAttendanceUserControl" %>
<asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnInOut" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><asp:Label ID="Label1" runat="server" Text="Punch In"></asp:Label></td></tr></table>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" Width="150px"></asp:Label>
    <asp:TextBox ID="txtEmployeeName" runat="server" ReadOnly="True" Width="200px" 
        Enabled="False"></asp:TextBox>
</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblDate" runat="server" Text="Date(*)" Width="150px"></asp:Label>
<asp:TextBox ID="txtDate" runat="server" Width="200px"></asp:TextBox>
<asp:Button ID="btnDate" runat="server" Text="..." onclick="btnDate_Click" 
        Width="26px" />
<p>
    <asp:Calendar ID="cldChooseDate" runat="server" align="center" 
        onselectionchanged="cldChooseDate_SelectionChanged" Visible="False"></asp:Calendar>
</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblTime" runat="server" Text="Time(*)" Width="150px"></asp:Label>
    <asp:TextBox ID="txtTime" runat="server" Width="200px"></asp:TextBox>
    <asp:Label ID="Label5" runat="server" Text="HH:MM"></asp:Label>
</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblNote" runat="server" Text="Note"></asp:Label>
</p>
<p>
    <span style="padding-left:160px;"></span><asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" 
        Width="300px"  ></asp:TextBox>
</p>
<p>
    <span style="padding-left:160px;"></span>
    <asp:Button ID="btnInOut" 
        runat="server" Text="In" Width="80px" onclick="btnInOut_Click" />
</p>
</td></tr></table></asp:Panel><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
<p>
    &nbsp;</p>


