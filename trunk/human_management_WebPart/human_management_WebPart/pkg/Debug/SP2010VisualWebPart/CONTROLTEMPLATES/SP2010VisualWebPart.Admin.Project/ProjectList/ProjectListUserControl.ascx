<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectListUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Project.ProjectList.ProjectListUserControl" %>
<br>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <font color="white">Project List</font>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;">
                <asp:Label ID="lblShow" runat="server" Text="Show" Width="150px"></asp:Label>
                <div class="styled-selectLong">
                <asp:DropDownList ID="ddlType" runat="server" Height="16px" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem Selected="True">Current Project</asp:ListItem>
                    <asp:ListItem>Finished Project</asp:ListItem>
                    <asp:ListItem>On Schedule Project</asp:ListItem>
                </asp:DropDownList>
                </div>
                <br />
                <br />
                <div class="borderTop">
                    <asp:Button ID="btnAdd" class="addButton" runat="server" Text="Add" 
                        Width="80px" onclick="btnAdd_Click" />
                    <asp:Button ID="btnEdit" class="addButton" runat="server" Text="Edit" 
                        Width="80px" onclick="btnEdit_Click" />
                    <br />
                </div>
                <br>
                <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderStyle Width="25" />
                            <ItemTemplate>
                                &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </td>
    </tr>
</table>
<br>
<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
