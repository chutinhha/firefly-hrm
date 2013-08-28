<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="HotelManagement.News" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="sitemap">
                <ul>
                    <li class="home"><a href="Home.aspx">Home</a></li>
                    <li ><a href="About.aspx">About Us</a></li>
                    <li class="current"><a href="News.aspx">News</a></li>
                </ul>
            </div>
    <asp:Panel ID="pnlAllNews" runat="server">
    </asp:Panel>
    <asp:Panel ID="pnlNew" runat="server">
    
    <br />
    <asp:Label ID="NewsTitle" runat="server" Text="" Style="color: #1D8A0D; font-weight: bold;
        font-size: 14pt;"></asp:Label>
    <br />
    <asp:Label ID="Date" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:Label ID="NewsContent" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="Poster" runat="server" Text="" Style="font-weight: bold; float: right;
        font-style: italic; padding-right: 5%;"></asp:Label>
    <br />
    <asp:LinkButton style="color:Blue;text-decoration:underline;" ID="btnEdit" runat="server" onclick="LinkButton1_Click">Edit</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server" Visible="false">
    <br><span style="font-weight:bold;">Tiêu đề:</span><br/>
    <asp:TextBox ID="txtTitle" runat="server" Width="98%"></asp:TextBox><br><br>
        <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
        <br />
        <center>
            <asp:Button ID="btnSave" onclick="btnSave_Click" runat="server" Text="Lưu" Width="80px" />
            <asp:Button ID="btnCancel" runat="server" Text="Hủy" Width="80px" 
                onclick="btnCancel_Click" />
        </center>
        <br />
    </asp:Panel>
    <br/>
    <a href="News.aspx" style="color:Blue;">Read more News...</a>
</asp:Content>
