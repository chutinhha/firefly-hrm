﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddNews.aspx.cs" Inherits="HotelManagement.AddNews" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br><span style="font-weight:bold;">Tên bài:</span><br/>
    <asp:TextBox ID="txtTitle" runat="server" Width="98%"></asp:TextBox><br><br>
    <ckeditor:ckeditorcontrol id="CKEditor1" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
    <br/>
    <center><asp:Button ID="btnSave" runat="server" Text="Lưu" onclick="Button1_Click" 
        Width="80px" />
    <asp:Button ID="btnCancel" runat="server" Text="Hủy" 
        onclick="btnCancel_Click" Width="80px" /></center><br/>
</asp:Content>