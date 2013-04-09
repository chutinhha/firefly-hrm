﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditTimesheetUserControl.ascx.cs" Inherits="SP2010VisualWebPart.User.Timesheet.EditTimesheet.EditTimesheetUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
    $(function () {
        $("#txtDateFrom").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">
                            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left : 5px"></span>
            <asp:Label ID="lblWorkDate" runat="server" Text="WorkDate" Width="150px"></asp:Label>
                        <asp:Panel ID="pnlDateTo" runat="server" Style="display: inline;">
            <input id="txtDateFrom" name="txtDateFrom" style="width: 200px;" type="text" value="<%=this.startDate %>" />
            </asp:Panel>
            <br/>
            <br/>
            <span style="padding-left : 5px"></span>
            <asp:Label ID="lblProject" runat="server" Text="Project" Width="150px"></asp:Label>
                        <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlProject" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <br/>
                        <span style="padding-left : 5px"></span>
            <asp:Label ID="lblTask" runat="server" Text="Task" Width="150px"></asp:Label>
                        <div class="styled-selectLong">
                <asp:DropDownList runat="server" ID="ddlTask" OnSelectedIndexChanged="ddlTask_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <br/>
                                    <span style="padding-left : 5px"></span>
            <asp:Label ID="lblTime" runat="server" Text="Time" Width="150px"></asp:Label>
            <asp:TextBox ID="txtTime" runat="server" Width="200px" 
                ontextchanged="txtTime_TextChanged"></asp:TextBox>
                <br/> <br/>
                            <div class="borderBottom">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="80px" CssClass="AddButton"
                    OnClick="btnSave_Click" />
                    </div>
      </td>
    </tr>
</table>
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>