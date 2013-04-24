<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignEmployeeUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Person_Project.AssignEmployee.AssignEmployeeUserControl" %>
<script type="text/javascript">
    function ConfirmOnAssign() {
        if (confirm("<%=this.confirmAssign %>") == true)
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
                        <span style="color: white;">Search Employee</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblEmployee" runat="server" Text="Employee" Width="100px"></asp:Label>
            <asp:TextBox ID="txtEmployee" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 105px"></span>
                <asp:Button ID="btnSearch" runat="server" CssClass="addButton" Text="Search" Width="70px"
                    OnClick="btnSearch_Click" />
            </div>
        </td>
    </tr>
</table>
<br />
<table class="fieldTitleDiv">
    <tr>
        <td>
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblProject" runat="server" Text="Project" Width="100px"></asp:Label>
            <asp:TextBox ID="txtProject" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
            <span style="padding-left: 100px"></span><asp:Label ID="lblTask" runat="server"
                Text="Task" Width="100px"></asp:Label>
            <asp:TextBox ID="txtTask" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 105px"></span>
                <asp:Button CssClass="addButton" ID="btnAssign" runat="server" Text="Assign" Width="70px"
                    OnClick="btnAssign_Click" OnClientClick="return ConfirmOnAssign();" />
                <asp:Button CssClass="addButton" ID="btnCancel" runat="server" Text="Cancel" Width="70px"
                    OnClick="btnCancel_Click"/>
            </div>
            <asp:GridView ID="grdData" runat="server" EnableModelValidation="True"
                 Width="100%" BorderStyle="None"
                BorderWidth="0px" OnRowDataBound="grdData_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            &nbsp;<asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckUncheckAll"
                                AutoPostBack="true" />
                        </HeaderTemplate>
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
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label><br />
