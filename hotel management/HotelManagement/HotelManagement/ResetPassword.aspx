<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="HotelManagement.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <br />
    <div class="sitemap">
                <ul>
                    <li class="home"><a href="Home.aspx">Home</a></li>
                    <li class="current"><a href="ResetPassword.aspx">Reset Password</a></li>
                </ul>
            </div>
            <br />
        <asp:Label ID="lblEmail" runat="server" Text="Email" Width="150"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" Width="200" TextMode="Email"></asp:TextBox>
        <br /><br />
        <span style="padding-left:155px;"></span>
        <asp:Button ID="btnReset" runat="server" Text="Reset Password" 
            onclick="btnReset_Click" />
        <br /><br />
        <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
