<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rental.aspx.cs" Inherits="HotelManagement.Rental" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel ID="pnlNew" runat="server">
    
    <br />
    <asp:Label ID="NewsContent" runat="server" Text=""></asp:Label>
    <br />
    <asp:LinkButton style="color:Blue;text-decoration:underline;" ID="btnEdit" 
        runat="server" onclick="btnEdit_Click">Sửa</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server" Visible="false">
        <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
        <br />
        <center>
            <asp:Button ID="btnSave" onclick="btnSave_Click" runat="server" Text="Lưu" Width="80px" />
            <asp:Button ID="btnCancel" runat="server" Text="Hủy" Width="80px" 
                onclick="btnCancel_Click" />
        </center>
        <br />
    </asp:Panel>
</asp:Content>
