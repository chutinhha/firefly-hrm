<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VacanciesUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Vacancies.VacanciesUserControl" %>
<script type="text/javascript">
    function ConfirmOnDelete() {
        if (confirm("<%=this.confirmDelete %>") == true)
            return true;
        else
            return false;
    }
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
</script>
<br />
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch" Width="100%">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">Vacancies</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblJobTitle" runat="server" Text="Job Title" Width="120px"></asp:Label>
                <div class="styled-selectMedium">
                    <asp:DropDownList ID="ddlJobTitle" runat="server">
                    </asp:DropDownList>
                </div>
                <span style="padding-left: 30px;"></span>
                <asp:Label ID="lblVacancy" runat="server" Text="Vacancy" Width="120px"></asp:Label>
                <div class="styled-selectMedium">
                    <asp:DropDownList ID="ddlVacancy" runat="server">
                    </asp:DropDownList>
                </div>
                <span style="padding-left: 30px;"></span><span style="padding-left: 30px;"></span>
                <asp:Label ID="lblStatus" runat="server" Text="Status" Width="120px"></asp:Label>
                <div class="styled-selectMedium">
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Closed</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <div class="borderTop">
                    <asp:Button ID="btnSearch" CssClass="addButton" runat="server" OnClick="btnSearch_Click"
                        Text="Search" Width="80px" />
                    <asp:Button ID="btnReset" CssClass="resetButton" runat="server" Text="Reset" Width="80px"
                        OnClick="btnReset_Click" />
                </div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
<table class="fieldTitleDiv">
    <tr>
        <td>
            <div class="borderBottom">
                <asp:Button ID="btnAdd" CssClass="addButton" runat="server" Text="Add" Width="80px"
                    OnClick="btnAdd_Click" />
                <asp:Button ID="btnEdit" CssClass="addButton" runat="server" Text="Edit" Width="80px"
                    OnClick="btnEdit_Click" />
                <asp:Button ID="btnDelete" CssClass="deleteButton" runat="server" Text="Delete" Width="80px"
                    OnClick="btnDelete_Click" OnClientClick="return ConfirmOnDelete();" />
            </div>
            <br />
            <asp:GridView ID="grdData" runat="server" Width="100%">
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
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<br />
