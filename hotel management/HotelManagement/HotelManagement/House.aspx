﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="House.aspx.cs" Inherits="HotelManagement.House" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="pnlContent" runat="server">
    
    </asp:Panel>
    <asp:LinkButton ID="btnDetail" runat="server" style="color:Blue;" 
        onclick="btnDetail_Click">See details</asp:LinkButton>
    <asp:Panel ID="pnlContent2" runat="server" CssClass="table">
    </asp:Panel>
    <br/><br/>
        <asp:Button ID="btnChooseFur" runat="server" Text="Choose Furniture" 
            onclick="btnChooseFur_Click" />
    <div>
    <asp:LinkButton ID="btnEdit" runat="server" style="color:Blue;float:left;">Edit</asp:LinkButton>
    <asp:LinkButton ID="btnBack" runat="server" CssClass="readon float-left" 
            style="float:right;" onclick="btnBack_Click">Back</asp:LinkButton>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
