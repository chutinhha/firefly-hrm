<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="searchLeaveTypeUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Leave.searchLeaveType.searchLeaveTypeUserControl" %>
<table>
    <tr>
        <td>
            <asp:Label ID="lbl" runat="server" Text="Leave Types"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
        </td>
        <td>
            <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                onclick="btnDelete_Click" Visible="False" />
        </td>
    </tr>
</table>
<p>
</p>
<asp:GridView ID="grdLeaveType" align="right" runat="server" EnableModelValidation="True"
     Width="100%" BorderStyle="None"
    BorderWidth="0px">
    <Columns>
        <asp:TemplateField>
            <HeaderStyle Width="25" />
            <HeaderTemplate>
                &nbsp;<asp:CheckBox ID="chkAll" runat="server" OnCheckedChanged="chkAll_CheckedChanged"
                    AutoPostBack="true" />
            </HeaderTemplate>
            <ItemTemplate>
                &nbsp;<asp:CheckBox ID="chkItem" runat="server" OnCheckedChanged="chkItem_CheckedChanged" AutoPostBack="true"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
