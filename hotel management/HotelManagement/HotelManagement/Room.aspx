<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="HotelManagement.Room" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="sitemap">
                <ul>
                    <li class="home"><a href="Home.aspx">Home</a></li>
                    <li class="current"><a href="Room.aspx">Room</a></li>
                </ul>
            </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="pnlContent" runat="server">
    
    </asp:Panel>
    <asp:Panel ID="pnlContent2" runat="server" CssClass="table">
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
