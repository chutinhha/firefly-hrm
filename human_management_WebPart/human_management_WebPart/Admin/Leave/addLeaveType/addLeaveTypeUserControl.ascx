<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addLeaveTypeUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Leave.addLeaveType.addLeaveTypeUserControl" %>
<script type="text/javascript">
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
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
                        <span style="color: white;">Add Leave Type</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblLeaveName" runat="server" Text="Leave Name(*)" Width="150px"></asp:Label>
            <asp:TextBox ID="txtLeaveName" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblLimited" runat="server" Text="Limited" Width="150px"></asp:Label>
            <asp:RadioButton ID="rdbLimitedYes" runat="server" GroupName="Limited" Text="Yes"
                OnCheckedChanged="rdbLimitedYes_CheckedChanged" AutoPostBack="true" />
            <asp:RadioButton ID="rdbLimitedNo" runat="server" GroupName="Limited" Text="No" Checked="true"
                AutoPostBack="true" OnCheckedChanged="rdbLimitedNo_CheckedChanged" />
            <br />
            <br />
            <asp:Panel ID="pnlLimitedYes" runat="server" Visible="false">
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblLimitDay" runat="server" Text="Limit Date(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtLimitDay" onkeyup="ValidateText(this);" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
            </asp:Panel>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblNote" runat="server" Text="Note" Width="150px"></asp:Label><br />
            <span style="padding-left: 155px;"></span>
            <asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" Width="800px"></asp:TextBox>
            <br />
            <br />
            &nbsp<span style="color: Red;">(*): Required field</span><br />
            <asp:Label ID="lblUserGuide" runat="server" Text=""></asp:Label>
            <br />
            <div class="borderTop">
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSave" CssClass="addButton" runat="server" Text="Save" OnClick="btnSave_Click"
                    Width="80px" OnClientClick="return ConfirmOnSave();" />
                <asp:Button ID="btnCancel" runat="server" CssClass="resetButton" Text="Cancel" OnClick="btnCancel_Click"
                    Width="80px" />
            </div>
        </td>
    </tr>
</table>
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>