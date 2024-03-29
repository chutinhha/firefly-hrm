<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDepartmentUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Department.EditDepartment.EditDepartmentUserControl" %>
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
        $("#txtStartDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<asp:Panel ID="pnlPage" runat="server">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd" align="left">
                            <span style="color: white;">
                                <asp:Label ID="lblTitle" runat="server" Text="Edit Employee Department"></asp:Label></span>
                        </td>
                        <td class="fieldTitleTd" align="right">
                            <asp:Button ID="btnEmpListPage" CssClass="addButton" runat="server" Text="Back To Employees List Page"
                            Width="230px" OnClick="btnEmpListPage_Click" Style="background: #2CA6CD; box-shadow: none;
                            text-decoration: underline; border: none;" />
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" Width="150px"></asp:Label>
                <asp:TextBox ID="txtEmployeeName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="txtDepartment" runat="server" Text="Department" Width="150px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlDepartment" runat="server">
                    </asp:DropDownList>
                </div>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" Width="150"></asp:Label>
                <input type="text" <%=this.readOnly %> id="<%=this.startDateID %>" name="txtStartDate"
                    style="width: 200px;" value="<%=this.startDate %>" />
                <p>
                    &nbsp;</p>
                <div class="borderTop">
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnSave" CssClass="addButton" runat="server" Text="Save" Width="80px"
                        OnClick="btnSave_Click" /></div>
                <p>
                    &nbsp;</p>
                &nbsp;<asp:Label ID="lblDepartmentHistory" runat="server" Text="Department History"></asp:Label>
                <p>
                    &nbsp;</p>
                <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
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
    <p>
        &nbsp;</p>
    <span style="padding-left: 5px;"></span>
    <asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label>
</asp:Panel>
