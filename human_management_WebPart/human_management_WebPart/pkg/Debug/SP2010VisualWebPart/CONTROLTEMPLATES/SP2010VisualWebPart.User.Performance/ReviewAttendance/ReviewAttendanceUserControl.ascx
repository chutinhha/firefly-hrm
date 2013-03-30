<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewAttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.User.Performance.ReviewAttendance.ReviewAttendanceUserControl" %>
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
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnView" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Review Attendance Records</font></td></tr></table>
    <br />
        <span style="padding-left:155px;"></span>
        <asp:RadioButton ID="rdoViewDate" runat="server" Checked="True" 
            GroupName="ViewDateType" oncheckedchanged="rdoViewDate_CheckedChanged" 
            Text="View a date" Width="120px" />
        <asp:RadioButton ID="rdoViewRange" runat="server" GroupName="ViewDateType" 
            oncheckedchanged="rdoViewRange_CheckedChanged" Text="View range of date" 
            Width="150px" />
        <asp:RadioButton ID="rdoViewAll" runat="server" GroupName="ViewDateType" 
            oncheckedchanged="rdoViewAll_CheckedChanged" Text="View all" />
        <br />
        <span style="padding-left:5px;"></span><asp:Label ID="lblDate" runat="server" 
            Text="Date" Width="150px"></asp:Label>
        <asp:Panel ID="pnlDateFrom" runat="server" style="display:inline;">
            <input type="text" id="txtDateFrom" name="txtDateFrom" size="30" value=""/>
        </asp:Panel>
        <span style="padding-left:5px;"></span>
        <asp:Panel ID="pnlDateTo" runat="server" style="display:inline;">
            <input type="text" id="txtDateTo" name="txtDateTo" value="" size="30"/>
        </asp:Panel>
    <br />
    <span style="padding-left:5px;"></span>
        <asp:Label ID="lblDateDescription" runat="server" Height="20px" 
            Text="(mm-dd-yyyy)" Width="155px"></asp:Label>
        <asp:Label ID="lblDateFrom" runat="server" Text="From" Width="50px"></asp:Label>
    <span style="padding-left:160px;"></span><asp:Label ID="lblDateTo" runat="server" 
            Text="To"></asp:Label>
    <div class="borderTop">
    <span style="padding-left:155px;"></span><asp:Button ID="btnView" runat="server" Text="View" Width="80px" 
        onclick="btnView_Click" class="addButton" />
    </div>
    

</td></tr></table></asp:Panel>
<br><asp:Panel ID="pnlData" runat="server" Visible="False">
<table class="fieldTitleDiv"><tr><td>
    <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
    </asp:GridView><table><tr><td></td></tr></table>
    </td></tr></table></asp:Panel>
    <br />
    <br />
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
