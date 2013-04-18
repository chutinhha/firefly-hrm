<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccessDeniedUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Common.AccessDenied.AccessDeniedUserControl" %>
<table width="100%" cellspacing="0" cellpadding="0" height="637px">
    <tr>
        <td width="20%" style="background-image: url('/_layouts/Images/21_2_ob/Access-Denied-LeftRight.jpg');">
        </td>
        <td width="60%" style="background-color:#646464;vertical-align: top;">
        <br /><br /><br /><br /><br /><br />
        <center>
        <table width="70%" cellspacing="0" cellpadding="0" style="border-radius:10px;">
        <tr>
        <td>
        <div style="background:url('/_layouts/Images/21_2_ob/Access-Denied.jpg') no-repeat;width:100%;height:89px;border-top-left-radius: 10px;border-top-right-radius: 10px;"></div>
        </td></tr><tr>
        <td style="background-color:White;height:200px;border-bottom-right-radius: 10px;border-bottom-left-radius: 10px;vertical-align: top;text-align:center;">
            <div style="padding:5px;"><asp:Label ID="lblLink" runat="server" Text=""></asp:Label></div>
        </td>
        </tr>
        </table>
        </center>
        </td>
        <td width="20%" style="background-image: url('/_layouts/Images/21_2_ob/Access-Denied-LeftRight.jpg');">
        </td>
    </tr>
</table>
