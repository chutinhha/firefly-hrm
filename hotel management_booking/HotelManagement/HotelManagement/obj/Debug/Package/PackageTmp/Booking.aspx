<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="HotelManagement.Booking" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
    var xPos, yPos;
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        xPos = $get('scrollDiv').scrollLeft;
        yPos = $get('scrollDiv').scrollTop;
    }
    function EndRequestHandler(sender, args) {
        $get('scrollDiv').scrollLeft = xPos;
        $get('scrollDiv').scrollTop = yPos;
    }
    $(function () {
        $("#txtStart").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtEnd").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtEditStart").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtEditEnd").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" CssClass="table">
        
    <br />
        <div class="componentheading">Choose Building and Room</div>
        <br />
        <div style="height: 300px; overflow: scroll;" id="scrollDiv">
        <asp:GridView ID="grdBuilding" runat="server" Width="100%" OnRowDataBound="grdBuilding_RowDataBound">
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle Width="25" />
                    <ItemTemplate>
                        &nbsp;<asp:RadioButton AutoPostBack="True" OnCheckedChanged="rdoBuilding_CheckedChanged"
                            ID="rdoBuilding" runat="server" GroupName="rdoGroup"></asp:RadioButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
        <br />
        <div style="height: 300px; overflow: scroll;">
            <asp:GridView ID="grdRoom" runat="server" Width="100%" OnRowDataBound="grdRoom_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            &nbsp;<asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckUncheckAll"
                                AutoPostBack="true" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <br />
            <asp:Button ID="btnNext" runat="server" Text="Next" Width="80px" 
                onclick="btnNext_Click" /><br /><br />
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
        <asp:PostBackTrigger ControlID="btnNext" />
        </Triggers>
    </asp:UpdatePanel>
        <asp:Panel ID="Panel2" runat="server" Visible="False" CssClass="table">
        <br />
        <div class="componentheading">Booking Information</div>
        <br />
            <asp:Label CssClass="componentheading" ID="lblBuildingAddress" runat="server" Text=""></asp:Label>
            <br /><br />
            <asp:Label ID="lblCheckIn" style="font-weight:bold;" runat="server" Text="Check-In Date" Width="150px"></asp:Label>
            <input type="text" id="txtStart" style="width: 200px;" name="txtStart" value="<%=this.startDate %>" />
            <br /><br />
            <asp:Label ID="lblCheckOut" style="font-weight:bold;" runat="server" Text="Check-Out Date" Width="150px"></asp:Label>
            <input type="text" id="txtEnd" style="width: 200px;" name="txtEnd" value="<%=this.endDate %>" />
            <br /><br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
            <asp:GridView ID="grdRoomBook" runat="server" Width="100%" OnRowDataBound="grdRoomBook_RowDataBound">
            </asp:GridView>
            <br />
        <asp:Label ID="lblTotal" style="font-weight:bold;" runat="server" Text=""></asp:Label>
        <br /><br />
        <asp:Label ID="lblComment" style="font-weight:bold;" runat="server" Text="Comment"></asp:Label><br /><br />
        <ckeditor:ckeditorcontrol id="txtComment" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
    <br />
        <asp:Button ID="btnBack" runat="server" Text="Back" Width="80px" 
                onclick="btnBack_Click" />
        <asp:Button ID="btnBook" runat="server" Text="Confirm" Width="80px" /><br /><br />
            </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblError" runat="server" Text="" style="color:Red;"></asp:Label>
        <asp:Label ID="lblSuccess" runat="server" Text="" style="color:Green;"></asp:Label>
        </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
