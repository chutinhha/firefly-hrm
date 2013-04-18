<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyTimesheetUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.User.Timesheet.MyTimesheet.MyTimesheetUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
    function ConfirmOnDelete() {
        if (confirm("<%=this.confirmDelete %>") == true)
            return true;
        else
            return false;
    }
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
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">My Timesheet</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblFrom" runat="server" Text="From" Width="150px"></asp:Label>
            <asp:Panel ID="pnlDateFrom" runat="server" Style="display: inline;">
                <input id="txtDateFrom" name="txtDateFrom" style="width: 200px;" type="text" value="<%=this.startDate %>" />
            </asp:Panel>
            <br />
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblTo" runat="server" Text="To" Width="150px"></asp:Label>
            <asp:Panel ID="pnlDateTo" runat="server" Style="display: inline;">
                <input id="txtDateTo" name="txtDateTo" style="width: 200px;" type="text" value="<%=this.endDate %>" />
            </asp:Panel>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSearch" CssClass="addButton" runat="server" Text="Search" Width="80px"
                    OnClick="btnSearch_Click" />
            </div>
        </td>
    </tr>
</table>
<br />
<table class="fieldTitleDiv">
    <tr>
        <td>
            <div class="borderBottom">
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="80px" CssClass="addButton"
                    OnClick="btnAdd_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="80px" CssClass="addButton"
                    OnClick="btnEdit_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="80px" CssClass="deleteButton"
                    OnClick="btnDelete_Click" OnClientClick="return ConfirmOnDelete();" />
            </div>
            <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound"
                OnSelectedIndexChanged="grdData_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            &nbsp;<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckUncheckAll" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label><br />
