<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewAttendanceUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.User.Performance.ReviewAttendance.ReviewAttendanceUserControl" %>
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
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnView" Width="100%">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">Review Attendance Records</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:RadioButton ID="rdoViewDate" runat="server" Checked="True" GroupName="ViewDateType"
                    OnCheckedChanged="rdoViewDate_CheckedChanged" Text="View a date" Width="120px" />
                <asp:RadioButton ID="rdoViewRange" runat="server" GroupName="ViewDateType" OnCheckedChanged="rdoViewRange_CheckedChanged"
                    Text="View range of date" Width="150px" />
                <asp:RadioButton ID="rdoViewAll" runat="server" GroupName="ViewDateType" OnCheckedChanged="rdoViewAll_CheckedChanged"
                    Text="View all" />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblDate" runat="server" Text="Date(*)" Width="150px"></asp:Label>
                <asp:Panel ID="pnlDateFrom" runat="server" Style="display: inline;">
                    <input type="text" id="txtDateFrom" name="txtDateFrom" style="width: 200px;" value="<%=this.startDate %>" />
                </asp:Panel>
                <span style="padding-left: 5px;"></span>
                <asp:Panel ID="pnlDateTo" runat="server" Style="display: inline;">
                    <input type="text" id="txtDateTo" name="txtDateTo" value="<%=this.endDate %>" style="width: 200px;" />
                </asp:Panel>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblDateDescription" runat="server" Height="20px" Text="(mm-dd-yyyy)"
                    Width="155px"></asp:Label>
                <asp:Label ID="lblDateFrom" runat="server" Text="From" Width="50px"></asp:Label>
                <span style="padding-left: 160px;"></span>
                <asp:Label ID="lblDateTo" runat="server" Text="To"></asp:Label>
                <br />
                <br />
                <div class="borderTop">
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnView" runat="server" Text="View" Width="80px" OnClick="btnView_Click"
                        CssClass="addButton" />
                </div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
<asp:Panel ID="pnlData" runat="server" Visible="False">
    <table class="fieldTitleDiv">
        <tr>
            <td>
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
</asp:Panel>
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label><br />
