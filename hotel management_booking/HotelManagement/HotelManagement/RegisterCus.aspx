<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterCus.aspx.cs" Inherits="HotelManagement.RegisterCus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ValidateText(i) {
            if (i.value.length > 0) {
                i.value = i.value.replace(/[^\d]+/g, '');
            }
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <br />
    <div class="sitemap">
                <ul>
                    <li class="home"><a href="Home.aspx">Home</a></li>
                    <li class="current"><a href="RegisterCus.aspx">Register</a></li>
                </ul>
            </div>
            <br />
        <asp:Label ID="lblTitle" runat="server" Text="Title" Width="150"></asp:Label>
        <asp:DropDownList ID="ddlTitle" runat="server" Width="215">
            <asp:ListItem Selected="True">Please select</asp:ListItem>
            <asp:ListItem>Mr</asp:ListItem>
            <asp:ListItem>Ms</asp:ListItem>
        </asp:DropDownList>&nbsp;<span style="color: Red">(*)</span>
        <br /><br />
        <asp:Label ID="lblFName" runat="server" Text="First Name" Width="150"></asp:Label>
        <asp:TextBox ID="txtFName" runat="server" Width="200"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
        <br /><br />
        <asp:Label ID="lblMName" runat="server" Text="Middle Name" Width="150"></asp:Label>
        <asp:TextBox ID="txtMName" runat="server" Width="200"></asp:TextBox>
        <br /><br />
        <asp:Label ID="lblLName" runat="server" Text="Last Name" Width="150"></asp:Label>
        <asp:TextBox ID="txtLName" runat="server" Width="200"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
        <br /><br />
        <asp:Label ID="lblEmail" runat="server" Text="Email" Width="150"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" Width="200" TextMode="Email"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
        <br /><br />
        <asp:Label ID="lblPhone" runat="server" Text="Phone" Width="150"></asp:Label>
        <asp:TextBox ID="txtPhone" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
        <br /><br />
        <asp:Label ID="lblPassword" runat="server" Text="Password" Width="150"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
        <br /><br />
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Re-type password" Width="150"></asp:Label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
        <br /><br />
        <span style="color: Red">(*): Required</span>
            <br />
            <br />
        <span style="padding-left:155px;"></span><asp:Button ID="btnRegister" runat="server" Text="Register" Width="80" 
            onclick="btnRegister_Click" />
        <br />
            <br />
            &nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
