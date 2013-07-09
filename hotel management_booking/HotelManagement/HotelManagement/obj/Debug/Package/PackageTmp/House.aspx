<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="House.aspx.cs" Inherits="HotelManagement.House" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script>
    function initialize() {
        var myLatlng = new google.maps.LatLng(<%=this.Lat %>, <%=this.Long %>);
        var myOptions = {
            zoom: 8,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    }

    function loadScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://maps.google.com/maps/api/js?sensor=false&callback=initialize";
        document.body.appendChild(script);
    }

    window.onload = loadScript;


</script>
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
