<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalarySummaryUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Salary.SalarySummary.SalarySummaryUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Manage Employee Salary</td></tr></table>
    <br />
<span style="padding-left:5px;"></span>
<asp:Label ID="lblSort" runat="server" Text="Sort by" Width="100px"></asp:Label>
<asp:DropDownList ID="ddlSort" runat="server" Width="200px" 
        onselectedindexchanged="ddlSort_SelectedIndexChanged">
    <asp:ListItem Selected="True">Name</asp:ListItem>
    <asp:ListItem>Highest Salary</asp:ListItem>
    <asp:ListItem>Lowest Salary</asp:ListItem>
</asp:DropDownList><br><br>

	<div class="borderBottom">
<asp:Button ID="btnSave" runat="server" Text="Save" Width="80px" 
            onclick="btnSave_Click" />
</div><br>
    <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
     
    </asp:GridView>
    <br />
    <asp:GridView ID="grdTotal" runat="server" Width="100%">
    </asp:GridView>
</td></tr></table>
<p>
    &nbsp;</p>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>


<asp:Label ID="lblSuccess" runat="server" style="color:Green;"></asp:Label>



