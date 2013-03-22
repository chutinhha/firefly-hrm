<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignEmployeeUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Assign_Project.AssignEmployee.AssignEmployeeUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
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
<table class="fieldTitleDiv" cellpadding="0">
<tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Search Employees By Free Time</td></tr>
</table>
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblFrom" runat="server" Text="From" Width="100px"></asp:Label>
<span style="padding-left:50px"></span>
    <asp:Panel ID="pnlDateFrom" runat="server" style="display:inline;"><input type="text" id="txtDateFrom" name="txtDateFrom" style="width:115px;" value=""/></asp:Panel>
    <span style="padding-left: 50px"></span>
    <asp:Label ID="lblDateTo" runat="server" Text="To" Width="100px"></asp:Label>
    <span style="padding-left: 50px"></span>
    <asp:Panel ID="pnlDateTo" runat="server" style="display:inline;"><input type="text" id="txtDateTo" name="txtDateTo" style="width:115px;" value=""/></asp:Panel>
    <br>
    <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" onclick="btnSearch_Click" />
    <asp:Button ID="btnReset" runat="server" Text="Reset" Width="70px" />
</td></tr></table>
<br>
<table class="fieldTitleDiv"><tr><td>    
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblProject" runat="server" Text="Project" Width="100px"></asp:Label>
<span style="padding-left:50px"></span>
<asp:DropDownList runat="server" id="ddlProject" Width="120px" Height="20px" 
onselectedindexchanged="ddlProject_SelectedIndexChanged">
</asp:DropDownList>
<span style="padding-left:50px"></span></span><asp:Label ID="lblTask" runat="server" Text="Task" Width="100px"></asp:Label>
<span style="padding-left:50px"></span>
<asp:DropDownList runat="server" id="ddlTask" Width="120px" Height="20px" 
onselectedindexchanged="ddlTask_SelectedIndexChanged">
</asp:DropDownList>

<br>
    <asp:GridView ID="grdData" align="right" runat="server" EnableModelValidation="True" 
        onselectedindexchanged="grdData_SelectedIndexChanged" 
        Width="100%" BorderStyle="None" BorderWidth="0px">
    <Columns>

                        <asp:TemplateField>
                        <HeaderStyle Width="25" />
                            <HeaderTemplate>
            <asp:CheckBox 
                ID="CheckBox2" 
                runat="server"
                OnCheckedChanged="CheckUncheckAll"
                AutoPostBack="true" 
                />
        </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                  </Columns>
    </asp:GridView>
    </tr></td></table>
<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
