<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionListUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Checkpoint.QuestionList.QuestionListUserControl" %>
<br />
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Checkpoint Question List</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblAnswerType" runat="server" Text="Type of answer" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlAnswerType" runat="server">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Yes/No</asp:ListItem>
                    <asp:ListItem>Note</asp:ListItem>
                    <asp:ListItem>Choose level</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSearch" CssClass="addButton" runat="server" Text="Search" Width="80px"
                    OnClick="btnSearch_Click" /></div>
        </td>
    </tr>
</table>
<p>
    &nbsp;</p>
<table class="fieldTitleDiv">
    <tr>
        <td>
            <div class="borderBottom">
                <asp:Button ID="btnAdd" runat="server" CssClass="addButton" Text="Add" Width="80px"
                    OnClick="btnAdd_Click" />
                <asp:Button ID="btnEdit" runat="server" CssClass="addButton" Text="Edit" Width="80px"
                    OnClick="btnEdit_Click" />
                <asp:Button ID="btnDelete" CssClass="deleteButton" runat="server" Text="Delete" Width="80px"
                    OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete ?')" />
            </div>
            <br />
            <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            &nbsp;<asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckUncheckAll"
                                AutoPostBack="true" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
<p>
    <br />
    &nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
</p>
