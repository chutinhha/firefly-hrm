<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditTimesheetUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.User.Timesheet.EditTimesheet.EditTimesheetUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
    $(function () {
        $("#txtDateFrom").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
    function ValidateText(i) {
        if (i.value.length > 0) {
            i.value = i.value.replace(/[^\d]+/g, '');
        }
    }
</script>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">
                            <asp:Label ID="lblTitle" runat="server" Text="New Timesheet"></asp:Label></span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblWorkDate" runat="server" Text="WorkDate" Width="150px"></asp:Label>
            <asp:Panel ID="pnlDateTo" runat="server" Style="display: inline;">
                <input id="txtDateFrom" name="txtDateFrom" style="width: 200px;" type="text" value="<%=this.startDate %>" />
            </asp:Panel>
            <br />
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblProject" runat="server" Text="Project" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlProject" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"
                    AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblTask" runat="server" Text="Task" Width="150px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlTask">
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblTime" runat="server" Text="Time(Hours)" Width="150px"></asp:Label>
            <asp:TextBox ID="txtTime" onkeyup="ValidateText(this);" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <div class="borderBottom">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="80px" CssClass="addButton"
                    OnClick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
            </div>
        </td>
    </tr>
</table>
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>