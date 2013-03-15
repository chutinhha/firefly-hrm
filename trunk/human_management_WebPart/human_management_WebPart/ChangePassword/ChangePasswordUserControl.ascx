<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswordUserControl.ascx.cs" Inherits="SP2010VisualWebPart.ChangePassword.ChangePasswordUserControl" %>
<table cellpadding="0" class="fieldTitleDiv">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        Change Password</td>
                </tr>
            </table>
            <br>
            <span style="padding-left:5px;"></span><asp:Label ID="Label1" runat="server" Text="Old Password" Width="150px"></asp:Label>
            

            <asp:TextBox ID="TextBox1" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <span style="padding-left:5px;"></span><asp:Label ID="Label2" runat="server" Text="New Password" Width="150px"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <span style="padding-left:5px;"></span><asp:Label ID="Label3" runat="server" Text="Confirm Password" Width="150px"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <span style="padding-left:155px;"></span><asp:Button ID="Button1" 
                runat="server" Text="Change Password" Width="150px" onclick="Button1_Click" />
            <br><br>

            
            

        </td>
    </tr>
</table>
            <br /><br>
            <asp:Label ID="Label4" runat="server" style="color:Red;"></asp:Label>

