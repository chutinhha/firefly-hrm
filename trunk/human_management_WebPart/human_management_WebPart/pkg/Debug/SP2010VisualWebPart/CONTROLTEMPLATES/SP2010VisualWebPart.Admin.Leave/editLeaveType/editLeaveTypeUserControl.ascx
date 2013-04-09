<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editLeaveTypeUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Leave.editLeaveType.editLeaveTypeUserControl" %>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Edit Leave Type</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span><asp:Label ID="lblLeaveName" runat="server" Text="Leave Name(*)" Width="150px"></asp:Label>
            <asp:TextBox ID="txtLeaveName" runat="server" Width="200px"></asp:TextBox>
            <br />
                <br />
            <span style="padding-left: 5px;"></span><asp:Label ID="lblLimited" runat="server" Text="Limited" Width="150px"></asp:Label>
            <asp:RadioButton ID="rdbLimitedYes" runat="server" GroupName="Limited" Text="Yes"
                OnCheckedChanged="rdbLimitedYes_CheckedChanged" AutoPostBack="true" />
            <asp:RadioButton ID="rdbLimitedNo" runat="server" GroupName="Limited" Text="No" Checked="true"
                AutoPostBack="true" OnCheckedChanged="rdbLimitedNo_CheckedChanged" />
            <br />
                <br />
            <asp:Panel ID="pnlLimitedYes" runat="server" Visible="false">
                <span style="padding-left: 5px;"></span><asp:Label ID="lblLimitDay" runat="server" Text="Limit Date(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtLimitDay" runat="server" Width="200px"></asp:TextBox>
                <br /><br />
            </asp:Panel>
            <span style="padding-left: 5px;"></span><asp:Label ID="lblNote" runat="server" Text="Note" Width="150px"></asp:Label><br>
            <span style="padding-left: 155px;"></span><asp:TextBox ID="txtNote" 
                runat="server" Height="100px" TextMode="MultiLine" Width="800px"></asp:TextBox>
            <br /><br />
            &nbsp<span style="color:Red;">(*): Required field</span><br>
            <asp:Label ID="lblUserGuide" runat="server" Text=""></asp:Label>
            <br />
            <div class="borderTop">
            <span style="padding-left: 155px;"></span><asp:Button ID="btnSave" 
                    CssClass="addButton" runat="server" Text="Save" OnClick="btnSave_Click" 
                    Width="80px" />
            <asp:Button ID="btnCancel" runat="server" CssClass="resetButton" Text="Cancel" 
                    OnClick="btnCancel_Click" Width="80px" />
            </div>
        </td>
    </tr>
</table>

