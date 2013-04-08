<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="searchEmployeeUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Employee.searchEmployee.searchEmployeeUserControl" %>
<p>
    Employee Information</p>
<table>
    <tr>
        <td>
            <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblCurrentFlag" runat="server" Text="Employment Status"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblRank" runat="server" Text="Rank"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>            
        </td>
        <td>
            <asp:DropDownList ID="ddlCurrentFlag" runat="server">
                <asp:ListItem Selected="True">--Select</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:DropDownList ID="ddlRank" runat="server">
                <asp:ListItem Selected="True">--Select</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>User</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblAddressStreet" runat="server" Text="Address Street"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="txtAddressStreet" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                onclick="btnSearch_Click" />
        </td>
        <td>
            <asp:Button ID="btnReset" runat="server" Text="Reset" 
                onclick="btnReset_Click" />
        </td>
        <td>
        </td>
    </tr>
</table>
<p>
</p>
<table>
    <tr>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="grdEmployee" runat="server" Width="100%">                
            </asp:GridView>
        </td>
    </tr>
</table>
