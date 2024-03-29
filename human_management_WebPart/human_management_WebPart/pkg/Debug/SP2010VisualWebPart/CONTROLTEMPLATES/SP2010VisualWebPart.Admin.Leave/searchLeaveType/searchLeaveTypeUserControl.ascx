<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
<script type="text/javascript">
    function ConfirmOnDelete() {
        if (confirm("<%=this.confirmDelete %>") == true)
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
                        <span style="color: white;">Leave Type</span>
                    </td>
                </tr>
            </table>
            <div class="borderBottom">
                <asp:Button ID="btnAdd" CssClass="addButton" runat="server" Text="Add" OnClick="btnAdd_Click"
                    Width="80px" />
                <asp:Button ID="btnDelete" CssClass="deleteButton" runat="server" Text="Delete" OnClick="btnDelete_Click"
                    Width="80px" OnClientClick="return ConfirmOnDelete();" />
            </div>
            <br />
            <asp:GridView ID="grdLeaveType" runat="server" EnableModelValidation="True"
                Width="100%" BorderStyle="None" BorderWidth="0px" OnRowDataBound="grdData_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            &nbsp;<asp:CheckBox ID="chkAll" runat="server" OnCheckedChanged="CheckUncheckAll"
                                AutoPostBack="true" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:CheckBox ID="chkItem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
