<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseFurniture.aspx.cs" Inherits="HotelManagement.ChooseFurniture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <br />
        <asp:Panel ID="pnlAll" runat="server">
        </asp:Panel><br/>
        <asp:Label ID="lblComment" style="color:#1D8A0D;font-size:14pt;" runat="server" Text="Comment"></asp:Label>
        <br /><br />
        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="100%" Height="150"></asp:TextBox>
        <br /><br /><asp:Button ID="btnSend" runat="server" Text="Send Request" 
            onclick="btnSend_Click" /><br /><br />
        <asp:Label ID="lblSuccess" runat="server" Text="" style="color:Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
