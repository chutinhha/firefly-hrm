<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="History.aspx.cs" Inherits="HotelManagement.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#txtStart").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("#txtEnd").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
        function ValidateText(i) {
            if (i.value.length > 0) {
                i.value = i.value.replace(/[^\d]+/g, '');
            }
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
            <asp:Label ID="lblBuilding" Style="font-weight: bold;" runat="server" Text="Tòa nhà"
                Width="150"></asp:Label>
            <asp:DropDownList ID="ddlBuilding" runat="server" Width="215" AutoPostBack="True"
                OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblRoom" Style="font-weight: bold;" runat="server" Text="Phòng" Width="150"></asp:Label>
            <asp:DropDownList ID="ddlRoom" runat="server" Width="215">
            </asp:DropDownList>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblStart" Style="font-weight: bold;" runat="server" Text="Ngày bắt đầu"
        Width="150"></asp:Label>
    <input type="text" id="txtStart" style="width: 200px;" name="txtStart" value="<%=this.startDate %>" />
    <br />
    <br />
    <asp:Label ID="lblEnd" Style="font-weight: bold;" runat="server" Text="Ngày kết thúc"
        Width="150"></asp:Label>
    <input type="text" id="txtEnd" style="width: 200px;" name="txtEnd" value="<%=this.endDate %>" />
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" CssClass="table">
                <asp:Button ID="btnUpdate" runat="server" Text="Tìm kiếm" Width="120" OnClick="btnUpdate_Click" /><br />
                <br />
                <div style="height: 300px; overflow: scroll;">
                    <asp:GridView ID="grdFurniture" runat="server" Width="100%" OnRowDataBound="grdFurniture_RowDataBound">
                    </asp:GridView>
                </div>
            </asp:Panel>
            <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
