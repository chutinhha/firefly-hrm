<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectReportUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Timesheet_Summary.ProjectReport.ProjectReportUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" type="text/javascript"></script>
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

<asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnView" Width="100%" >
<table class="fieldTitleDiv" cellpadding="0">
<tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Project Report</td></tr>
</table>
<br/>
    <span style="padding-left:5px"></span><asp:Label ID="lblProject" runat="server" Text="Project Name(*)" Width="120px"></asp:Label>
    <span style="padding-left:50px"></span>
    <asp:DropDownList ID="ddlProject" runat="server" Width="200px" Height="20px" onselectedindexchanged="ddlProject_SelectedIndexChanged">
    </asp:DropDownList>
    <br/>
    <span style="padding-left:5px"></span><asp:Label ID="lblProjectDateRange" runat="server" Text="Project Date Range" Width="120px"></asp:Label>
    <span style="padding-left:50px"></span>
    <asp:Label ID="lblDateFrom" runat="server" Text="From" Width="50px"></asp:Label>
    <asp:Panel ID="pnlDateFrom" runat="server" style="display:inline;"><input type="text" id="txtDateFrom" name="txtDateFrom" size="30" value="" onclick="return txtDateFrom_onclick()" /></asp:Panel>
    <span style="padding-left:5px;"></span>
    <asp:Label ID="lblDateTo" runat="server" Text="To" Width="50px"></asp:Label>
    <asp:Panel ID="pnlDateTo" runat="server" style="display:inline;"><input type="text" id="txtDateTo" name="txtDateTo" value="" size="30"/></asp:Panel>
    <br/>
    <span style="padding-left:5px"></span><asp:Label ID="lblHint" runat="server" Text="(mm-dd-yyy)" Width="120px"></asp:Label>
    <br/>
    <span style="padding-left:5px"></span><asp:Label ID="lblApproved" runat="server" Text="Only Included Approved Timesheet" Width="150px"></asp:Label>
    <span style="padding-left:20px"></span><asp:CheckBox ID="CheckBox1" runat="server" Checked="false"/>
    <div class="borderTop">
    <span style="padding-left:5px;"></span><asp:Button ID="btnView" runat="server" Text="View" Width="80px" 
        onclick="btnView_Click" class="addButton" />
    </div>
    </td></tr>
    </table>
    </asp:Panel>
    <br />
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label><br />