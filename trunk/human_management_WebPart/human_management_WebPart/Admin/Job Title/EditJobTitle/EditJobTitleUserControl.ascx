﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditJobTitleUserControl.ascx.cs" Inherits="SP2010VisualWebPart.EditJobTitle.EditJobTitleUserControl" %>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnSave" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Candidates</font></td></tr></table>
							<br />
<span style="padding-left:5px;"></span><asp:Label ID="lblJobTitle" runat="server" Text="Job Title(*)" Width="150px"></asp:Label>
<asp:TextBox ID="txtJobTitle" runat="server" Width="400px"></asp:TextBox>
<p>
    &nbsp;</p>

    <span style="padding-left:5px;"></span><asp:Label ID="lblJobCategory" runat="server" Text="Job Category" Width="150px"></asp:Label>
    <div class="styled-selectLong"><asp:DropDownList ID="ddlJobCategory" runat="server">
    </asp:DropDownList></div>
    <p>
        &nbsp;</p>
    <p>
        <span style="padding-left:5px;"></span>
        <asp:Label ID="lblJobDescription" runat="server" Text="Job Description" 
            Width="150px"></asp:Label>
    </p>
    <p>
        <span style="padding-left:160px;"></span>
        <asp:TextBox ID="txtJobDescription" runat="server" Height="100px" 
            TextMode="MultiLine" Width="410px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <span style="padding-left:5px;"></span>
        <asp:Label ID="lblNote" runat="server" Text="Note" Width="150px"></asp:Label>
    </p>
    <p>
        <span style="padding-left:160px;"></span>
        <asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" 
            Width="410px"></asp:TextBox>
    </p>
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
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
</p>



