<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListFurniture.aspx.cs" Inherits="HotelManagement.ListFurniture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript">
        function ConfirmOnSave() {
            if (confirm("<%=this.confirmSave %>") == true)
                return true;
            else
                return false;
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
            <asp:Panel ID="pnlAdd" runat="server" Visible="False">
                <br />
                <asp:Label ID="lblName" runat="server" Text="Name" Width="150"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Width="200"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblType" runat="server" Text="Type" Width="150px"></asp:Label>
                <asp:DropDownList ID="ddlType" runat="server" Width="215px">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblBuilding" runat="server" Text="Building" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBuilding" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblRoom" runat="server" Text="Room" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlRoom" runat="server" Width="215">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblPrice" runat="server" Text="Price" Width="150"></asp:Label>
                <asp:TextBox ID="txtPrice" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblMade" runat="server" Text="Made In" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlCountry" runat="server" Width="215">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblStart" runat="server" Text="Start Warranty" Width="150"></asp:Label>
                <input type="text" id="txtStart" style="width: 200px;" name="txtStart" value="<%=this.startDate %>" />
                <br />
                <br />
                <asp:Label ID="lblEnd" runat="server" Text="End Warranty" Width="150"></asp:Label>
                <input type="text" id="txtEnd" style="width: 200px;" name="txtEnd" value="<%=this.endDate %>" />
                <br />
                <br />
                <asp:Label ID="lblPicture" runat="server" Text="Picture" Width="150"></asp:Label>
                <asp:FileUpload ID="fulPicture" runat="server" />
                <br />
                <br />
                <asp:Label ID="lblDes" runat="server" Text="Description"></asp:Label>
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine" Width="500" Height="100"></asp:TextBox>
                <br />
                <span style="color: Red">(*): Required</span>
                <br />
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClientClick="return ConfirmOnSave();"
                    Width="80px" OnClick="btnSave_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="80px" OnClick="btnReset_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click" />
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="pnlList" runat="server" CssClass="table">
                <br />
                <asp:Label ID="lblChooseBuilding" runat="server" Text="Building" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseBuilding" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseBuilding_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblChooseRoom" runat="server" Text="Room" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseRoom" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseRoom_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblChooseType" runat="server" Text="Type" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseType" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseType_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblInWarraty" runat="server" Text="In Warranty Time" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlInWarraty" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlInWarraty_SelectedIndexChanged">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblPosition" runat="server" Text="Position" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlPosition" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>In Room</asp:ListItem>
                    <asp:ListItem>In Warehouse</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="80" OnClick="btnAdd_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="80" OnClick="btnEdit_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Remove" Width="80" OnClick="btnDelete_Click" />
                <asp:Button ID="btnMove" runat="server" Text="Move" Width="80" OnClick="btnMove_Click" />
                <br />
                <br />
                <div style="height: 300px; overflow: scroll;">
                    <asp:GridView ID="grdFurniture" runat="server" Width="100%" OnRowDataBound="grdFurniture_RowDataBound">
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
                <asp:Panel ID="pnlMove" runat="server" Visible="False">
                    <asp:Label ID="lblTargetBuilding" runat="server" Text="Target Building" Width="150px"></asp:Label>
                    <asp:DropDownList ID="ddlTargetBuilding" runat="server" Width="215px" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlTargetBuilding_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblTargetRoom" runat="server" Text="Target Room" Width="150px"></asp:Label>
                    <asp:DropDownList ID="ddlTargetRoom" runat="server" Width="215px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblMoveReason" runat="server" Text="Reason for moving" Width="150px"></asp:Label>
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:TextBox ID="txtMoveReason" runat="server" TextMode="MultiLine" Width="500" Height="100"></asp:TextBox>
                    <br />
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnConfirmMove" runat="server" Text="Send Request Email" 
                        Width="150px" onclick="btnConfirmMove_Click" />
                    <asp:Button ID="btnMoveCancel" runat="server" Text="Cancel" OnClick="btnMoveCancel_Click"
                        Width="80px" />
                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlDelete" runat="server" Visible="False">
                    <asp:Label ID="lblReason" runat="server" Text="Reason for delete" Width="150px"></asp:Label>
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Width="500" Height="100"></asp:TextBox>
                    <br />
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnConfirmDelete" runat="server" Text="Send Request Email" Width="150px"
                        OnClick="btnConfirmDelete_Click" />
                    <asp:Button ID="btnConfirmCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnConfirmCancel_Click" />
                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnlEdit" runat="server" Visible="False">
                <br />
                <asp:Label ID="lblEditName" runat="server" Text="Name" Width="150"></asp:Label>
                <asp:TextBox ID="txtEditName" runat="server" Width="200"></asp:TextBox>&nbsp;<span
                    style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblEditPrice" runat="server" Text="Price" Width="150"></asp:Label>
                <asp:TextBox ID="txtEditPrice" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblStatus" runat="server" Text="Status" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlStatus" runat="server" Width="215px">
                    <asp:ListItem Selected="True">Normal</asp:ListItem>
                    <asp:ListItem>Broke</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblEditMade" runat="server" Text="Made In" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlEditCountry" runat="server" Width="215">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblEditStart" runat="server" Text="Start Warranty" Width="150"></asp:Label>
                <input type="text" id="txtEditStart" style="width: 200px;" name="txtEditStart" value="<%=this.startDate %>" />
                <br />
                <br />
                <asp:Label ID="lblEditEnd" runat="server" Text="End Warranty" Width="150"></asp:Label>
                <input type="text" id="txtEditEnd" style="width: 200px;" name="txtEditEnd" value="<%=this.endDate %>" />
                <br />
                <br />
                <asp:Label ID="lblEditPicture" runat="server" Text="Picture" Width="150"></asp:Label>
                <asp:FileUpload ID="fulEditPicture" runat="server" />
                <asp:Image ID="imgPicture" Width="50px" runat="server" />
                <br />
                <br />
                <asp:Label ID="lblEditDes" runat="server" Text="Description"></asp:Label>
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:TextBox ID="txtEditDes" runat="server" TextMode="MultiLine" Width="500" Height="100"></asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnEditSave" runat="server" Text="Save" OnClientClick="return ConfirmOnSave();"
                    Width="80px" OnClick="btnEditSave_Click" />
                <asp:Button ID="btnEditReset" runat="server" Text="Reset" Width="80px" OnClick="btnEditReset_Click" />
                <asp:Button ID="btnEditCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnEditCancel_Click" />
                <br />
                <br />
            </asp:Panel>
            <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="btnEditSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
