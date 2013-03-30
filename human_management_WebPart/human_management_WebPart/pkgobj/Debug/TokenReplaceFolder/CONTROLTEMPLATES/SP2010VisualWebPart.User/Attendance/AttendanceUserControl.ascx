<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.User.Attendance.AttendanceUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txtDateFrom").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtDateTo").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<br><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Daily Attendance</font></td></tr></table>
    <br />
    <span style="padding-left:5px;"><asp:Label ID="lblNote" runat="server" 
        Text="Note" Width="150px"></asp:Label>
<br />
<br />
<span style="padding-left:155px;"><asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" 
    Width="500px"></asp:TextBox>
<br />
<br />
<div class="borderTop">
<span style="padding-left:155px;"><asp:Button class="addButton" ID="btnInOut" runat="server" Text="In" Width="80px" 
    onclick="btnInOut_Click" /></div></td></tr></table>
<p>
    &nbsp;</p>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>

<asp:Label ID="lblSuccess" runat="server" style="color:Green;"></asp:Label>


