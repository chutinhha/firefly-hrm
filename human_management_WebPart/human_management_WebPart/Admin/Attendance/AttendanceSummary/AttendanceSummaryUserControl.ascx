<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSummaryUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Attendance.AttendanceSummary.AttendanceSummaryUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
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
<tr><td class="fieldTitleTd"><font color="white">Attendance Total Summary Report</font></td></tr></table>
    <br />
<span style="padding-left:5px;"></span><asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name(*)" 
    Width="150px"></asp:Label>
<asp:TextBox ID="txtEmployeeName" runat="server" Width="200px">All</asp:TextBox>
<p>
    &nbsp;</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblJobTitle" runat="server" Text="Job Title" Width="150px"></asp:Label>
<div class="styled-selectLong"><asp:DropDownList ID="ddlJobTitle" runat="server">
</asp:DropDownList></div>
<p>
    &nbsp;</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblFrom" runat="server" Text="From" Width="150px"></asp:Label>
    <input id="txtDateFrom" name="txtDateFrom" style="width:200px;" type="text" value="" />
<p>
    &nbsp;</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblTo" runat="server" 
        Text="To" Width="155px"></asp:Label><input type="text" id="txtDateTo" name="txtDateTo" value="" style="width:200px;"/>
<br />
<br />
<span style="color:Red;">&nbsp;(*): Required field</span><br />
<br />
<div class="borderTop">

<asp:Button ID="btnView" class="addButton" runat="server" Text="View" Width="80px" 
        onclick="btnView_Click" /></div>
</td></tr></table>
<p>
    &nbsp;</p>
    <asp:Panel ID="pnlData" runat="server" Visible="False">
    <asp:Label ID="lblDate" runat="server" style="color:Green"></asp:Label>
        <br /><br>
    <table class="fieldTitleDiv" cellpadding="0"><tr><td>
        
<asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
</asp:GridView><table><tr><td></td></tr></table>
</td></tr></table></asp:Panel>
<p>
    &nbsp;</p>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>

