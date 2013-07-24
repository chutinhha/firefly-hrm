<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecieveFurniture.aspx.cs" Inherits="HotelManagement.RecieveFurniture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="table">
        <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
        </asp:GridView>
        </div>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Lưu" Width="80" onclick="btnSave_Click" 
            />
        <br /><br />
        <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
        <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
