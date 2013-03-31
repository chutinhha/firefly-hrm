<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewProjectReportUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Timesheet_Summary.ViewProjectReport.ViewProjectReportUserControl" %>
<br/>
<table class="fieldTitleDiv" cellpadding="0">
<tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Project Report</td></tr>
</table>
<br/>
    <span style="padding-left:5px"></span><asp:Label ID="lblProject" runat="server" Text="Project" Width="120px"></asp:Label>
    <span style="padding-left:50px"></span>
    <asp:Label ID="lblProjectText" runat="server" Width="150px"></asp:Label>
    <br/>
    <asp:GridView ID="grdData" align="right" runat="server" EnableModelValidation="True" 
        onselectedindexchanged="grdData_SelectedIndexChanged" 
        Width="100%" BorderStyle="None" BorderWidth="0px">
    </asp:GridView>
</td></tr>
</table>
    <br />
    <br />
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>