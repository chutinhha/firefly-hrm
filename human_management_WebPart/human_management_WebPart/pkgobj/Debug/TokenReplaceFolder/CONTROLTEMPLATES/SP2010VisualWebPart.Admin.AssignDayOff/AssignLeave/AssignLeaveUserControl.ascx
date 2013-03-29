<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
<br><table class="fieldTitleDiv" cellpadding="0">
<tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Search Employees By Free Time</font></td></tr>
</table>
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblFrom" runat="server" 
        Text="From" Width="70px"></asp:Label>
    <asp:Panel ID="pnlDateFrom" runat="server" style="display:inline;">
        <input type="text" id="txtDateFrom" name="txtDateFrom" style="width:200px;" value="" onclick="return txtDateFrom_onclick()" /></asp:Panel>
    <span style="padding-left: 50px"></span>
    <asp:Label ID="lblDateTo" runat="server" Text="To" Width="70px"></asp:Label>
    <asp:Panel ID="pnlDateTo" runat="server" style="display:inline;"><input type="text" id="txtDateTo" name="txtDateTo" style="width:200px;" value=""/></asp:Panel>
    <br><br>
    <div class="borderTop">
    <asp:Button ID="btnSearch" class="addButton" runat="server" Text="Search" Width="80px" onclick="btnSearch_Click" />
    <asp:Button ID="btnReset" runat="server" class="resetButton" onclick="btnReset_Click" Text="Reset" Width="80px" />
    </div>
</td></tr></table>
<br>
<table class="fieldTitleDiv"><tr><td>    
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblDayOff" runat="server" 
        Text="Type of Days Off" Width="150px"></asp:Label>
    <asp:TextBox ID="txtDayOff" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
<br/><br>
<div class="borderTop">
<asp:Button ID="btnAssign" runat="server" Text="Assign" Width="80px" class="addButton" onclick="btnAssign_Click" />
</div>
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
