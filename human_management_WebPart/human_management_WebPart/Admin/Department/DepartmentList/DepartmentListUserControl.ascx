<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DepartmentListUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Department.DepartmentList.DepartmentListUserControl" %>
<script type="text/javascript">
    function ConfirmOnDelete() {
        if (confirm("<%=this.confirmDelete %>") == true)
            return true;
        else
            return false;
    }
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
</script>
<asp:Panel ID="Panel1" runat="server" Visible="False" DefaultButton="btnSave">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">
                                <asp:Label ID="lblTitle" runat="server" Text="Add Department"></asp:Label></span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 10px;"></span>
                <asp:Label ID="lblName" runat="server" Text="Name(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
                &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
                <div class="borderTop">
                    <asp:Button ID="btnSave" CssClass="addButton" runat="server" Text="Save" Width="80px"
                        OnClick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
                    <asp:Button ID="btnCancel" CssClass="resetButton" runat="server" Text="Cancel" Width="80px"
                        OnClick="btnCancel_Click" /></div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Department List</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Button ID="btnAdd" CssClass="addButton" runat="server" Text="Add" Width="80px"
                OnClick="btnAdd_Click" />
            <asp:Button ID="btnEdit" CssClass="addButton" runat="server" Text="Edit" Width="80px"
                OnClick="btnEdit_Click" />
            <asp:Button ID="btnDelete" CssClass="deleteButton" runat="server" Text="Delete" Width="80px"
                OnClick="btnDelete_Click" OnClientClick="return ConfirmOnDelete();" />
            <br />
            <br />
            <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            &nbsp;<asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckUncheckAll"
                                AutoPostBack="true" />
                        </HeaderTemplate>
                        <ItemStyle />
                        <ItemTemplate>
                            &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
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

&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<br />