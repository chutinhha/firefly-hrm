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

<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Employee List</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" Width="150px"></asp:Label>
            <asp:TextBox ID="txtEmployeeName" runat="server" Width="200px"></asp:TextBox>
            <span style="padding-left: 100px;"></span>
            <asp:Label ID="lblCurrentFlag" runat="server" Text="Employment Status" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlCurrentFlag" runat="server">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblRank" runat="server" Text="Rank" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlRank" runat="server">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
            </div>
            <span style="padding-left: 100px;"></span>
            <asp:Label ID="lblLoginID" runat="server" Text="User Name" Width="150px"></asp:Label>
            <asp:TextBox ID="txtLoginID" runat="server" Width="200px"></asp:TextBox>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblJobTitle" runat="server" Text="JobTitle" Width="150px"></asp:Label>
            <div class="styled-selectLong">
            <asp:DropDownList ID="ddlJobTitle" runat="server">
            </asp:DropDownList>
            </div>
            <span style="padding-left: 100px;"></span>
            <asp:Label ID="lblDepartment" runat="server" Text="Department" Width="150px"></asp:Label>
            <div class="styled-selectLong">
            <asp:DropDownList ID="ddlDepartment" runat="server">
            </asp:DropDownList>
            </div><br /><br />
            <div class="borderTop">
                <span style="padding-left: 155px;"></span><asp:Button ID="btnSearch" CssClass="addButton" runat="server" Text="Search" OnClick="btnSearch_Click"
                    Width="80px" />
                <asp:Button ID="btnReset" CssClass="resetButton" runat="server" Text="Reset" OnClick="btnReset_Click"
                    Width="80px" />
            </div>
        </td>
    </tr>
</table>
<br />
<table class="fieldTitleDiv">
    <tr>
        <td>
            
            <asp:GridView ID="grdEmployee" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
            </asp:GridView>
            <table>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
