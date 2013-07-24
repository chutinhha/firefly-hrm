<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApproveRemove.aspx.cs" Inherits="HotelManagement.Approve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblShow" runat="server" style="font-weight:bold;" Text="Hiển thị" Width="150"></asp:Label>
        <asp:DropDownList ID="ddlShow" runat="server" AutoPostBack="True" Width="215px" 
            onselectedindexchanged="ddlShow_SelectedIndexChanged">
            <asp:ListItem Selected="True">Tất cả</asp:ListItem>
            <asp:ListItem>Chờ xác nhận</asp:ListItem>
            <asp:ListItem>Đã từ chối</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <div class="table">
        <asp:GridView ID="grdData" runat="server" Width="100%" OnRowDataBound="grdData_RowDataBound">
        </asp:GridView>
        </div>
        <br />
        <asp:Label ID="lblMove" runat="server" Text="Chuyển đến" Width="150px"></asp:Label>
        <asp:DropDownList ID="ddlMove" runat="server">
        </asp:DropDownList>
        <br /><br />
        <asp:Button ID="btnSave" runat="server" Text="Lưu" Width="80" 
            onclick="btnSave_Click" />
        <br /><br />
        <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
        <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
