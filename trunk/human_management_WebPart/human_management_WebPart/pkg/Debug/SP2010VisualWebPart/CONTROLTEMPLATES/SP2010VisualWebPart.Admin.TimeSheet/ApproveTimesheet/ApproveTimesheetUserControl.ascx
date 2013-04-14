<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApproveTimesheetUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.TimeSheet.ApproveTimesheet.ApproveTimesheetUserControl" %>
<script type="text/javascript">
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
</script>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Approve Timesheet</span>
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;<asp:Label ID="lblShow" runat="server" Text="Show timesheet" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlShow" runat="server" OnSelectedIndexChanged="ddlShow_SelectedIndexChanged">
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem Selected="True">Not Approve</asp:ListItem>
                    <asp:ListItem>Approved</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div class="borderTop" style="border-bottom: 1px solid #2CA6CD;">
                <asp:Button ID="btnSave" runat="server" CssClass="addButton" Text="Save" Width="80px"
                    OnClick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
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
&nbsp;<asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label>
<br />
