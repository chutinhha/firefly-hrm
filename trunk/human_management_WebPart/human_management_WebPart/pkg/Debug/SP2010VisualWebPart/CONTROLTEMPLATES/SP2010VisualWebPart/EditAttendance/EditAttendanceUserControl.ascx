<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditAttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.EditAttendance.EditAttendanceUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Edit Attendance</td></tr></table><br>
<span style="padding-left:5px;"></span><asp:Label ID="Label6" runat="server" Text="Employee Name" Width="150px"></asp:Label>
<asp:TextBox ID="TextBox7" runat="server" Enabled="False" Width="290px"></asp:TextBox>
<br />
<br />
<br />
<span style="padding-left:5px;"></span><asp:Label ID="Label1" runat="server" Text="Punch In" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server" Width="130px"></asp:TextBox>
<br />
<p>
    &nbsp;</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label2" runat="server" Text="Punch In Note"></asp:Label>
</p>
<p>
    <span style="padding-left:160px;"></span><asp:TextBox ID="TextBox3" runat="server" Height="100px" TextMode="MultiLine" 
        Width="290px"  ></asp:TextBox>
</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label3" runat="server" Text="Punch Out" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" Width="290px"></asp:TextBox>
    <span style="padding-left:20px;"></span>
</p>
<p>
    &nbsp;</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="Label4" runat="server" Text="Punch Out Note"></asp:Label>
</p>

<span style="padding-left:160px;"></span><asp:TextBox ID="TextBox6" runat="server" Height="100px" TextMode="MultiLine" 
    Width="290px"  ></asp:TextBox><br><br>
<div class="borderTop">
    <span style="padding-left:155px;"></span><asp:Button ID="Button1" 
        runat="server" Text="Save" Width="80px" onclick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" Width="80px" 
        onclick="Button2_Click" /></div>
</td></tr></table>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label5" runat="server" style="color:Red;"></asp:Label>
</p>



