<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimesheetSummaryUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.TimeSheet.TimesheetSummary.TimesheetSummaryUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
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
<br />
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Timesheet Summary</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" Width="150px"></asp:Label>
            <asp:TextBox ID="txtEmployeeName" runat="server" Width="200px">All</asp:TextBox>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblProjectName" runat="server" Text="Project Name" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlProjectName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblTaskName" runat="server" Text="Task Name" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlTaskName" runat="server">
                </asp:DropDownList>
            </div>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblFrom" runat="server" Text="From" Width="150px"></asp:Label>
            <input id="txtDateFrom" name="txtDateFrom" style="width: 200px;" type="text" value="" />
            <span style="padding-left: 50px;"></span>
            <asp:Label ID="lblTo" runat="server" Text="To" Width="50px"></asp:Label>
            <input id="txtDateTo" name="txtDateTo" style="width: 200px;" type="text" value="" />
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:CheckBox ID="chkApprove" runat="server" Text="Only include approved timesheet" />
            <p>
                &nbsp;</p>
            <div class="borderTop">
                <asp:Button ID="btnView" CssClass="addButton" runat="server" Text="View" Width="80px"
                    OnClick="btnView_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="80px" CssClass="resetButton"
                    OnClick="btnReset_Click" />
            </div>
            <asp:Panel ID="pnlData" runat="server" Visible="False">
                <br />
                <asp:Label ID="lblDetail" runat="server" Text=""></asp:Label><br />
                <br />
                <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
                </asp:GridView>
            </asp:Panel>
        </td>
    </tr>
</table>
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>