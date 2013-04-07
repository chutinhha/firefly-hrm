<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalarySummaryUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Salary.SalarySummary.SalarySummaryUserControl" %>
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
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Manage Employee Salary</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblSort" runat="server" Text="Sort by" Width="100px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlSort" runat="server" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Name</asp:ListItem>
                    <asp:ListItem>Highest Salary</asp:ListItem>
                    <asp:ListItem>Lowest Salary</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div class="borderBottom">
                <span style="padding-left: 105px"></span>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="addButton" Width="80px"
                    OnClick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
            </div>
            <br />
            <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
            </asp:GridView>
            <br />
            <asp:GridView ID="grdTotal" runat="server" Width="100%" OnRowDataBound="grdTotal_RowDataBound">
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
    &nbsp;</p>
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label>
