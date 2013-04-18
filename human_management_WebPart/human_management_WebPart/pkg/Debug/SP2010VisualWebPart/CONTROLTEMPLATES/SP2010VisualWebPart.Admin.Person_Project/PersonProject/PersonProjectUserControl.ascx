<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonProjectUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Person_Project.PersonProject.PersonProjectUserControl" %>
<script type="text/javascript">
    function ConfirmOnDelete() {
        if (confirm("<%=this.confirmDelete %>") == true)
            return true;
        else
            return false;
    }
</script>
<table class="fieldTitleDiv">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <font color="white">Project Personnel</font>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblProject" runat="server" Text="Project" Width="100px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlProject" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <span style="padding-left: 100px"></span>
            <asp:Label ID="lblTask" runat="server" Text="Task" Width="100px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlTask" OnSelectedIndexChanged="ddlTask_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div class="borderTop">
                <span style="padding-left: 105px"></span>
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="80px" class="addButton"
                    OnClick="btnAdd_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="80px" class="deleteButton"
                    OnClick="btnDelete_Click" OnClientClick="return ConfirmOnDelete();" />
            </div>
            <asp:GridView ID="grdData" align="right" runat="server" EnableModelValidation="True"
                OnSelectedIndexChanged="grdData_SelectedIndexChanged" Width="100%" BorderStyle="None"
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
