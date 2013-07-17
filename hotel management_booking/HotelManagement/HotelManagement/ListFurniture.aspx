<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListFurniture.aspx.cs" Inherits="HotelManagement.ListFurniture" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
    <asp:Panel ID="pnlAdd" runat="server" Visible="False">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <asp:Label ID="lblName" Style="font-weight: bold;" runat="server" Text="Tên vật tư"
                    Width="150"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Width="200"></asp:TextBox>&nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblType" Style="font-weight: bold;" runat="server" Text="Kiểu vật tư" Width="150px"></asp:Label>
                <asp:DropDownList ID="ddlType" runat="server" Width="215px">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblBuilding" Style="font-weight: bold;" runat="server" Text="Tòa nhà"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBuilding" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblRoom" Style="font-weight: bold;" runat="server" Text="Phòng" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlRoom" runat="server" Width="215">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblPrice" Style="font-weight: bold;" runat="server" Text="Giá thành" Width="150"></asp:Label>
                <asp:TextBox ID="txtPrice" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblMade" Style="font-weight: bold;" runat="server" Text="Xuất từ"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlCountry" runat="server" Width="215">
                </asp:DropDownList>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="lblStart" Style="font-weight: bold;" runat="server" Text="Bắt đầu BH"
            Width="150"></asp:Label>
        <input type="text" id="txtStart" style="width: 200px;" name="txtStart" value="<%=this.startDate %>" />
        <br />
        <br />
        <asp:Label ID="lblEnd" Style="font-weight: bold;" runat="server" Text="Kết thúc BH"
            Width="150"></asp:Label>
        <input type="text" id="txtEnd" style="width: 200px;" name="txtEnd" value="<%=this.endDate %>" />
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblPicture" Style="font-weight: bold;" runat="server" Text="Ảnh"
                    Width="150"></asp:Label>
                <asp:FileUpload ID="fulPicture" runat="server" />
                <br />
                <br />
                <asp:Label ID="lblDes" Style="font-weight: bold;" runat="server" Text="Mô tả"></asp:Label>
                <br />
                <span style="padding-left: 155px;"></span>
                <ckeditor:ckeditorcontrol id="txtDes" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                <br />
                <span style="color: Red">(*): Bắt buộc</span>
                <br />
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSave" runat="server" Text="Lưu" OnClientClick="return ConfirmOnSave();"
                    Width="80px" OnClick="btnSave_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="80px" OnClick="btnReset_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Hủy" Width="80px" OnClick="btnCancel_Click" />
                <br />
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnCancel" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlList" runat="server" CssClass="table">
                <br />
                <asp:Label ID="lblChooseBuilding" Style="font-weight: bold;" runat="server" Text="Tòa nhà"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseBuilding" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseBuilding_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblChooseRoom" Style="font-weight: bold;" runat="server" Text="Phòng"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseRoom" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseRoom_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblChooseType" Style="font-weight: bold;" runat="server" Text="Kiểu vật tư"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseType" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseType_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblInWarraty" Style="font-weight: bold;" runat="server" Text="Trong thời gian BH"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlInWarraty" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlInWarraty_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Tất cả</asp:ListItem>
                    <asp:ListItem>Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblPosition" Style="font-weight: bold;" runat="server" Text="Vị trí"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlPosition" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Tất cả</asp:ListItem>
                    <asp:ListItem>Trong phòng cho thuê</asp:ListItem>
                    <asp:ListItem>Trong kho</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="80" OnClick="btnAdd_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Xóa" Width="80" OnClick="btnDelete_Click" />
                <asp:Button ID="btnMove" runat="server" Text="Di chuyển" Width="80" OnClick="btnMove_Click" />
                <asp:Button ID="btnRequest" runat="server" Text="Yêu cầu vật tư" 
                    Width="120px" onclick="btnRequest_Click"/>
                <br />
                <asp:Panel ID="Panel1" runat="server">
                
                <br />
                <asp:LinkButton ID="lblCategory" runat="server" style="color:Blue;" 
                    onclick="lblCategory_Click">Ẩn thống kê vật tư</asp:LinkButton>
                <br /><br />
                <asp:GridView ID="grdCategory" OnRowDataBound="grdCategory_RowDataBound" Width="100%" runat="server" Visible="False">
                </asp:GridView>
                
                
                </asp:Panel>
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
                    <asp:Label ID="lblTargetBuilding" Style="font-weight: bold;" runat="server" Text="Tòa nhà đích"
                        Width="150px"></asp:Label>
                    <asp:DropDownList ID="ddlTargetBuilding" runat="server" Width="215px" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlTargetBuilding_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblTargetRoom" Style="font-weight: bold;" runat="server" Text="Phòng đích"
                        Width="150px"></asp:Label>
                    <asp:DropDownList ID="ddlTargetRoom" runat="server" Width="215px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblMoveReason" Style="font-weight: bold;" runat="server" Text="Lý do chuyển"
                        Width="150px"></asp:Label>
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <ckeditor:ckeditorcontrol id="txtMoveReason" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                    <br />
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnConfirmMove" runat="server" Text="Gửi Email Yêu Cầu" Width="150px"
                        OnClick="btnConfirmMove_Click" />
                    <asp:Button ID="btnMoveCancel" runat="server" Text="Hủy" OnClick="btnMoveCancel_Click"
                        Width="80px" />
                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlDelete" runat="server" Visible="False">
                    <asp:Label ID="lblReason" Style="font-weight: bold;" runat="server" Text="Lý do xóa"
                        Width="150px"></asp:Label>
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <ckeditor:ckeditorcontrol id="txtReason" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                    <br />
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnConfirmDelete" runat="server" Text="Gửi Email Yêu Cầu" Width="150px"
                        OnClick="btnConfirmDelete_Click" />
                    <asp:Button ID="btnConfirmCancel" runat="server" Text="Hủy" Width="80px" OnClick="btnConfirmCancel_Click" />
                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlRequest" runat="server" Visible="False">
                    <asp:Label ID="lblComment" Style="font-weight: bold;" runat="server" Text="Comment"
                        Width="150px"></asp:Label>
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <ckeditor:ckeditorcontrol id="txtComment" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                    <br />
                    <br />
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnRequestFurniture" runat="server" Text="Gửi Email Yêu Cầu" 
                        Width="150px" onclick="btnRequestFurniture_Click"
                        />
                    <asp:Button ID="btnRequestCancel" runat="server" Text="Hủy" Width="80px" OnClick="btnConfirmCancel_Click" />
                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="btnAdd" />
            <asp:PostBackTrigger ControlID="btnEditSave" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Panel ID="pnlEdit" runat="server" Visible="False">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <br />
                <asp:Label ID="lblEditName" Style="font-weight: bold;" runat="server" Text="Tên vật tư"
                    Width="150"></asp:Label>
                <asp:TextBox ID="txtEditName" runat="server" Width="200"></asp:TextBox>&nbsp;<span
                    style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblEditPrice" Style="font-weight: bold;" runat="server" Text="Giá thành"
                    Width="150"></asp:Label>
                <asp:TextBox ID="txtEditPrice" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblStatus" Style="font-weight: bold;" runat="server" Text="Trạng thái"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlStatus" runat="server" Width="215px">
                    <asp:ListItem Selected="True">Bình thường</asp:ListItem>
                    <asp:ListItem>Hỏng</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblEditMade" Style="font-weight: bold;" runat="server" Text="Xuất xứ"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlEditCountry" runat="server" Width="215">
                </asp:DropDownList>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="lblEditStart" Style="font-weight: bold;" runat="server" Text="Bắt đầu BH"
            Width="150"></asp:Label>
        <input type="text" id="txtEditStart" style="width: 200px;" name="txtEditStart" value="<%=this.startDate %>" />
        <br />
        <br />
        <asp:Label ID="lblEditEnd" Style="font-weight: bold;" runat="server" Text="Kết thúc BH"
            Width="150"></asp:Label>
        <input type="text" id="txtEditEnd" style="width: 200px;" name="txtEditEnd" value="<%=this.endDate %>" />
        <br />
        <br />
        <asp:Label ID="lblEditPicture" Style="font-weight: bold;" runat="server" Text="Ảnh"
            Width="150"></asp:Label>
        <asp:FileUpload ID="fulEditPicture" runat="server" />
        <asp:Image ID="imgPicture" Width="50px" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <br />
                <br />
                <asp:Label ID="lblEditDes" Style="font-weight: bold;" runat="server" Text="Mô tả"></asp:Label>
                <br />
                <span style="padding-left: 155px;"></span>
                <ckeditor:ckeditorcontrol id="txtEditDes" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                <br />
                <br />
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnEditSave" runat="server" Text="Lưu" OnClientClick="return ConfirmOnSave();"
                    Width="80px" OnClick="btnEditSave_Click" />
                <asp:Button ID="btnEditReset" runat="server" Text="Reset" Width="80px" OnClick="btnEditReset_Click" />
                <asp:Button ID="btnEditCancel" runat="server" Text="Hủy" Width="80px" OnClick="btnEditCancel_Click" />
                <br />
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnEditCancel" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
    <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
