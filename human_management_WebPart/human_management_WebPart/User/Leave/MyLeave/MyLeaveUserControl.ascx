<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyLeaveUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.User.Leave.MyLeave.MyLeaveUserControl" %>
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
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">My Leave</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblStartDate" runat="server" Text="Start Date" Width="150px"></asp:Label>
            <asp:Panel ID="pnlDateFrom" runat="server" Style="display: inline;">
                <input id="txtDateFrom" name="txtDateFrom" style="width: 200px;" type="text" value="<%=this.startDate %>" />
            </asp:Panel>
            <span style="padding-left: 50px;"></span>
            <asp:Panel ID="pnlDateTo" runat="server" Style="display: inline;">
                <input id="txtDateTo" name="txtDateTo" style="width: 200px;" type="text" value="<%=this.endDate %>" />
            </asp:Panel>
            <br />
            <span style="padding-left: 160px;"></span>
            <asp:Label ID="lblFrom" runat="server" Text="From" Width="100px"></asp:Label>
            <span style="padding-left: 165px;"></span>
            <asp:Label ID="lblTo" runat="server" Text="To" Width="100px"></asp:Label>
            <br />
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblDayOff" runat="server" Text="Type of Days Off" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlDayOff">
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblStatus" runat="server" Text="Status" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlStatus">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Approved</asp:ListItem>
                    <asp:ListItem>Not Approve</asp:ListItem>
                    <asp:ListItem>Rejected</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 155px"></span>
                <asp:Button ID="btnSearch" CssClass="addButton" runat="server" Text="Search" Width="80px"
                    OnClick="btnSearch_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="80px" CssClass="resetButton"
                    OnClick="btnReset_Click" />
            </div>
            <asp:Panel ID="pnlData" runat="server" Visible="False">
                <asp:GridView ID="grdData" runat="server" EnableModelValidation="True" 
                    Width="100%" BorderStyle="None" BorderWidth="0px" OnRowDataBound="grdData_RowDataBound">
                </asp:GridView>
                <table>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>