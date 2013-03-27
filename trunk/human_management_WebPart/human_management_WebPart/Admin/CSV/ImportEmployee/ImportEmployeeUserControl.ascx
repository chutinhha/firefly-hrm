﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportEmployeeUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.CSV.ImportEmployee.ImportEmployeeUserControl" %>


<span style="padding-left:5px;"></span>
<asp:Label ID="lblCSV" runat="server" 
    Text="CSV/Excel File" Width="150px"></asp:Label>

<asp:FileUpload ID="fulCSV" runat="server" style="margin-bottom: 0px" 
    Width="280px" />
<br />
<p>
    <span style="padding-left:155px;"></span><asp:Button ID="btnImport" 
        runat="server" Text="Import" Enabled="False" onclick="btnImport_Click" />
</p>


<p>
    &nbsp;</p>
<asp:Label ID="lblError" runat="server" style="color:Green;"></asp:Label>


