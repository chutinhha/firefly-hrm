<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditAttendanceUserControl.ascx.cs" Inherits="SP2010VisualWebPart.EditAttendance.EditAttendanceUserControl" %>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnSave" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Edit Attendance</font></td></tr></table><br>
<span style="padding-left:5px;"></span><asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" Width="150px"></asp:Label>
<asp:TextBox ID="txtEmployeeName" runat="server" Enabled="False" Width="255px"></asp:TextBox>
<br />
<br />
<br />
<span style="padding-left:5px;"></span><asp:Label ID="lblPunchIn" runat="server" Text="Punch In" Width="150px"></asp:Label>
    <asp:TextBox ID="txtPunchInDate" runat="server" Width="140px" ReadOnly=true></asp:TextBox>
    <div class="styled-selectShort" style="width:50px;">
        <asp:DropDownList ID="ddlHourIn" runat="server">
        </asp:DropDownList></div>
        <div class="styled-selectShort" style="width:50px;">
        <asp:DropDownList ID="ddlMinutesIn" runat="server">
        </asp:DropDownList></div>
        <br />
        <p>
            &nbsp;</p>
        <p>
            <br><span style="padding-left:5px;"></span>
            <asp:Label ID="lblPunchInNote" runat="server" Text="Punch In Note"></asp:Label>
        </p>
            <span style="padding-left:160px;"></span>
            <asp:TextBox ID="txtPunchInNote" runat="server" Height="100px" 
                TextMode="MultiLine" Width="800px"></asp:TextBox>
        <br>
            <br><span style="padding-left:5px;"></span>
            <asp:Label ID="lblPunchOut" runat="server" Text="Punch Out" Width="150px"></asp:Label>
            <div class="styled-selectShort" style="width:50px;">
        <asp:DropDownList ID="ddlHourOut" runat="server">
        </asp:DropDownList></div>
        <div class="styled-selectShort" style="width:50px;">
        <asp:DropDownList ID="ddlMinutesOut" runat="server" AutoPostBack="True">
        </asp:DropDownList></div>
            <br></br>
            <p>
            </p>
            <p>
                &nbsp;</p>
            <p>
                <span style="padding-left:5px;"></span>
                <asp:Label ID="lblPunchOutNote" runat="server" Text="Punch Out Note"></asp:Label>
            </p>
            <span style="padding-left:160px;"></span>
            <asp:TextBox ID="txtPunchOutNote" runat="server" Height="100px" 
                TextMode="MultiLine" Width="800px"></asp:TextBox>
            <br />
            <br>
            <div class="borderTop">
                <span style="padding-left:155px;"></span>
                <asp:Button ID="btnSave" runat="server" class="addButton" 
                    onclick="btnSave_Click" 
                    OnClientClick="return confirm('Are you sure you want to save ?')" Text="Save" 
                    Width="80px" />
                <asp:Button ID="btnCancel" runat="server" class="resetButton" 
                    onclick="btnCancel_Click" Text="Cancel" Width="80px" />
            </div>
        
        </td></tr></table></asp:Panel>
<p>
    &nbsp;</p>
<p>
    &nbsp;<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
</p>



