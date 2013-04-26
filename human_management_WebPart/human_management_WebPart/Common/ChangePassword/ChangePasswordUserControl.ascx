<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswordUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.ChangePassword.ChangePasswordUserControl" %>
<script type="text/javascript">
    function ConfirmOnChangePassword() {
        if (confirm("<%=this.confirmChangePassword %>") == true)
            return true;
        else
            return false;
    }
</script>
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnChangePassword" Width="100%">
    <table cellpadding="0" class="fieldTitleDiv">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">Change Password</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblOldPassword" runat="server" Text="Old Password(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtOldPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblNewPassword" runat="server" Text="New Password(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtNewPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
                <div class="borderTop">
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="addButton"
                    Width="150px" OnClick="btnChangePassword_Click" OnClientClick="return ConfirmOnChangePassword();" />
                    </div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label>
<br />
