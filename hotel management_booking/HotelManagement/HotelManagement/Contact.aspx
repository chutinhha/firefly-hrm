<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="HotelManagement.Contact" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel ID="pnlNew" runat="server">
    
    <br />
    <asp:Label ID="NewsContent" runat="server" Text=""></asp:Label>
    <br />
    <asp:LinkButton style="color:Blue;text-decoration:underline;" ID="btnEdit" 
        runat="server" onclick="btnEdit_Click">Edit</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server" Visible="false">
        <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
        <br />
        <center>
            <asp:Button ID="btnSave" onclick="btnSave_Click" runat="server" Text="Lưu" Width="80px" />
            <asp:Button ID="btnCancel" runat="server" Text="Hủy" Width="80px" 
                onclick="btnCancel_Click" />
        </center>
        <br /><br /><br />
    </asp:Panel>
    &nbsp;<span style="font-weight:bold;">Enter your Name: </span><br/>
    <asp:TextBox ID="txtName" runat="server" Width="400px"></asp:TextBox><br/>
    &nbsp;<span style="font-weight:bold;">E-mail address: </span><br/>
    <asp:TextBox ID="txtEmail" runat="server" Width="400px" TextMode="Email"></asp:TextBox><br/>
    &nbsp;<span style="font-weight:bold;">Message Subject:</span><br/>
    <asp:TextBox ID="txtSubject" runat="server" Width="400px"></asp:TextBox>
    <br/>
    &nbsp;<span style="font-weight:bold;">Enter your Message:</span><br/>  
    <ckeditor:ckeditorcontrol id="txtMessage" basepath="/ckeditor/" runat="server"></ckeditor:ckeditorcontrol>
    <br/>
    &nbsp;<asp:CheckBox ID="chkEmail" runat="server" Text="E-mail a copy of this message to your own address." />
    <br/><br/>
    <asp:Button ID="btnSend" runat="server" Text="Send" 
        style="background-color:#034569;color:white;border:none;height:25px;" 
        onclick="btnSend_Click"/><br/><br/>
    <asp:Label ID="lblError" runat="server" Text="" style="color:Red;"></asp:Label><asp:Label ID="lblSuccess"
        runat="server" Text="" style="color:Green;"></asp:Label>
</asp:Content>
