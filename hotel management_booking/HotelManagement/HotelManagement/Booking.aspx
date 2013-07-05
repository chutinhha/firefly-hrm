<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="HotelManagement.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
</script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" CssClass="table">
        
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
        </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
