<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplyLeaveUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.User.Leave.ApplyLeave.ApplyLeaveUserControl" %>
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
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnApply" Width="100%">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">Apply Leave</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px"></span>
                <asp:Label ID="lblLeave" runat="server" Text="Leave Type(*)" Width="150px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList runat="server" ID="ddlLeave" OnSelectedIndexChanged="ddlLeave_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <asp:Panel ID="pnlLimit" runat="server" Style="display: inline;" Visible="false">
                    <span style="padding-left: 5px"></span>
                    <asp:Label ID="lblLimit" runat="server" Text="Limit Date" Width="150px"></asp:Label>
                    <asp:Label ID="lblLimitDate" runat="server" Text="" Width="150px"></asp:Label>
                    <br />
                    <br />
                </asp:Panel>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblFrom" runat="server" Text="From(*)" Width="150px"></asp:Label>
                <asp:Panel ID="pnlDateFrom" runat="server" Style="display: inline;">
                    <input id="txtDateFrom" name="txtDateFrom" style="width: 200px;" type="text" value="<%=this.startDate %>" />
                </asp:Panel>
                <asp:Panel ID="pnlFrom" runat="server" Style="display: inline;" Visible="false">
                    <asp:Label ID="lblDateFrom" runat="server" Width="200px"></asp:Label>
                </asp:Panel>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblTo" runat="server" Text="To(*)" Width="150px"></asp:Label>
                <asp:Panel ID="pnlDateTo" runat="server" Style="display: inline;">
                    <input id="txtDateTo" name="txtDateTo" style="width: 200px;" type="text" value="<%=this.endDate %>" />
                </asp:Panel>
                <asp:Panel ID="pnlTo" runat="server" Style="display: inline;" Visible="false">
                    <asp:Label ID="lblDateTo" runat="server" Width="200px"></asp:Label>
                </asp:Panel>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblNote" runat="server" Text="Note" Width="150px"></asp:Label><br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="TextArea1" runat="server" Width="800" Height="100" TextMode="MultiLine"></asp:TextBox><br />
                <br />
                &nbsp;<asp:Label ID="lblRequire" runat="server" Style="color: Red" Text="(*) is required field"
                    Width="150px"></asp:Label>
                <br />
                <br />
                <div class="borderTop">
                    <asp:Button ID="btnApply" runat="server" CssClass="addButton" Text="Apply" Width="80px"
                        OnClick="btnApply_Click" />
                </div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
&nbsp;<asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label>