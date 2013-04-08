<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DayOffUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.AssignDayOff.DayOff.DayOffUserControl" %>
<br><table class="fieldTitleDiv"><tr><td>  
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Days Off</font></td></tr>
</table>  
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblDayOff" runat="server" 
        Text="Type of Days Off" Width="150px"></asp:Label>
        <div class="styled-selectLong">
<asp:DropDownList runat="server" id="ddlDayOff" 
onselectedindexchanged="ddlDayOff_SelectedIndexChanged">
</asp:DropDownList></div>
<span style="padding-left:5px"></span><asp:Label ID="lblStatus" runat="server" Text="Leave Status" Width="150px"></asp:Label>
<div class="styled-selectLong">
    <asp:DropDownList ID="ddlShow" runat="server" 
        onselectedindexchanged="ddlShow_SelectedIndexChanged">
    <asp:ListItem>All</asp:ListItem>
    <asp:ListItem Selected="True">Approve</asp:ListItem>
    <asp:ListItem>Not Approved</asp:ListItem>
    <asp:ListItem>Reject</asp:ListItem>
</asp:DropDownList></div>
<br>
<div class="borderTop">
<asp:Button ID="btnSearch" class="addButton" runat="server" Text="Search" Width="80px" onclick="btnSearch_Click" />
<asp:Button ID="btnAssign" class="addButton" runat="server" Text="Assign" Width="80px" onclick="btnAssign_Click"  Visible = "false" />
</div>

    <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
     
    </asp:GridView>
        <br />

	<div class="borderTop">
<asp:Button ID="btnSave" runat="server" CssClass="addButton" Text="Save" Width="80px" 
            onclick="btnSave_Click" />
</div>
    </tr></td></table>
<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
&nbsp;<asp:Label ID="lblSuccess" runat="server" style="color:Green;"></asp:Label>