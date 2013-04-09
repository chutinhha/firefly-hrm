<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserListUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.User.UserList.UserListUserControl" %>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Manage User</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblEmployee" runat="server" Text="Employee" Width="100px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Have LoginID</asp:ListItem>
                    <asp:ListItem>Not Have LoginID</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblRank" runat="server" Text="Rank" Width="100px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlRankUser" runat="server" OnSelectedIndexChanged="ddlRankUser_SelectedIndexChanged">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div class="borderTop" style="padding-bottom: 0px;">
                <asp:Button ID="btnSave" runat="server" CssClass="addButton" Text="Save" Width="80px"
                    OnClick="btnSave_Click" />
            </div>
            <br />
            <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
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
<br />
<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label><br />
