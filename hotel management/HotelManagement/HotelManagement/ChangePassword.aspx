<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="HotelManagement.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <br />
        <div class="sitemap">
                <ul>
                    <li class="home"><a href="Home.aspx">Home</a></li>
                    <li class="current"><a href="ChangePassword.aspx">Change Password</a></li>
                </ul>
            </div>
            <br />
    <asp:Label ID="lblOld" runat="server" Text="Old Password" Width="150"></asp:Label>
    <asp:TextBox ID="txtOld" runat="server" Width="200" TextMode="Password"></asp:TextBox>
    <br /><br />
    <asp:Label ID="lblNew" runat="server" Text="New Password" Width="150"></asp:Label>
    <asp:TextBox ID="txtNew" runat="server" Width="200" TextMode="Password"></asp:TextBox>
    <br /><br />
    <asp:Label ID="lblConfirm" runat="server" Text="Confirm Password" Width="150"></asp:Label>
    <asp:TextBox ID="txtConfirm" runat="server" Width="200" TextMode="Password"></asp:TextBox>
    <br /><br />
    <span style="padding-left:150px;"></span>
    <asp:Button ID="btnChange" runat="server" Text="Change Password" 
        onclick="btnChange_Click" />
    <br /><br />
    <asp:Label ID="lblError" runat="server" Text="" style="color:Red;"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="" style="color:Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
