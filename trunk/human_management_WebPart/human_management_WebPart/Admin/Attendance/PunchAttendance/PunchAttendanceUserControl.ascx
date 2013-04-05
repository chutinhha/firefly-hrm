<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PunchAttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.PunchAttendance.PunchAttendanceUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
    $(function () {
        $("#txtDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnInOut" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white"><asp:Label ID="Label1" runat="server" Text="Punch In"></asp:Label></font></td></tr></table>
<br>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" Width="150px"></asp:Label>
    <asp:TextBox ID="txtEmployeeName" runat="server" ReadOnly="True" Width="200px" 
        Enabled="False"></asp:TextBox>
</p>
<br><span style="padding-left:5px;"></span><asp:Label ID="lblDate" runat="server" Text="Date(*)" Width="150px"></asp:Label>
<asp:Panel ID="pnlDate" runat="server" style="display:inline;"><input type="text" <%= this.readOnly %> id="<%= this.inputID %>" name="txtDate" style="width:200px;" value="<%= this.inputValue %>"/></asp:Panel>
<br><br>
    <span style="padding-left:5px;"></span><asp:Label ID="lblTime" runat="server" Text="Time(*)" Width="150px"></asp:Label>
            <div class="styled-selectShort" style="width:50px;">
            <asp:DropDownList ID="ddlHourIn" runat="server">
            </asp:DropDownList></div>
            <div class="styled-selectShort" style="width:50px;">
            <asp:DropDownList ID="ddlMinutesIn" runat="server">
            </asp:DropDownList></div>
            <p>
            </p>
            <br>
            <p>
                <span style="padding-left:5px;"></span>
                <asp:Label ID="lblNote" runat="server" Text="Note"></asp:Label>
            </p>
            <p>
                <span style="padding-left:160px;"></span>
                <asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" 
                    Width="410px"></asp:TextBox>
            </p><br>
            &nbsp;<font color="Red">(*) is required</font><br><br>
            <div class="borderTop">
                <span style="padding-left:160px;"></span>
                <asp:Button ID="btnInOut" runat="server" class="addButton" 
                    onclick="btnInOut_Click" Text="In" Width="80px" />
            </div>
            

</td></tr></table></asp:Panel><br>
&nbsp;<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>


