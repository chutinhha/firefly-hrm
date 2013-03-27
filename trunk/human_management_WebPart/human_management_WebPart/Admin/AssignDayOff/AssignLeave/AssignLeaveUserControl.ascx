<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignLeaveUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.AssignDayOff.AssignLeave.AssignLeaveUserControl" %>
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
    <asp:Panel ID="pnlDateFrom" runat="server" style="display:inline;"><input type="text" id="txtDateFrom" name="txtDateFrom" style="width:115px;" value="" onclick="return txtDateFrom_onclick()" /></asp:Panel>
    <span style="padding-left: 50px"></span>
    <asp:Label ID="lblDateTo" runat="server" Text="To" Width="100px"></asp:Label>
    <span style="padding-left: 50px"></span>
    <asp:Panel ID="pnlDateTo" runat="server" style="display:inline;"><input type="text" id="txtDateTo" name="txtDateTo" style="width:115px;" value=""/></asp:Panel>
    <br>
    <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" onclick="btnSearch_Click" />
    <asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" Text="Reset" Width="70px" />
</td></tr></table>
<br>
<table class="fieldTitleDiv"><tr><td>    
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblDayOff" runat="server" Text="Type of Days Off" Width="120px"></asp:Label>
<span style="padding-left:50px"></span>
    <asp:TextBox ID="txtDayOff" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
<br/>
<asp:Button ID="btnAssign" runat="server" Text="Assign" Width="70px" onclick="btnAssign_Click" />
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