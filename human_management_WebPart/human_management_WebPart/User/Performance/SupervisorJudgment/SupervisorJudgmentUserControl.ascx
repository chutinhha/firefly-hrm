<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupervisorJudgmentUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.User.Performance.SupervisorJudgment.SupervisorJudgmentUserControl" %>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">
                            <asp:Label ID="lblTitle" runat="server" Text="Supervisor Judgment"></asp:Label></span>
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;<asp:Label ID="lblDetail" runat="server" Text="" Style="color: Green; font-size: 15px;
                font-weight: bold;"></asp:Label>
            <asp:Panel ID="pnlGenerate" runat="server" Visible="True" Enabled="False">
                <br />
            </asp:Panel>
            &nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
            <br />
        </td>
    </tr>
</table>
