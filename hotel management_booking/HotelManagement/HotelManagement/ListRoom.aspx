<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListRoom.aspx.cs" Inherits="HotelManagement.ListRoom" %>
<%@ Register TagPrefix="CuteWebUI" Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" %>
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
        function ConfirmOnDelete() {
            if (confirm("<%=this.confirmDelete %>") == true)
                return true;
            else
                return false;
        }
        function ValidateText(i) {
            if (i.value.length > 0) {
                i.value = i.value.replace(/[^\d]+/g, '');
            }
        }
    </script>
    <script runat="server">
        void Uploader_FileUploaded(object sender, UploaderEventArgs args)
        {
            if (!args.FileName.Contains(".jpg") &&
                !args.FileName.Contains(".jpeg") &&
                !args.FileName.Contains(".bmp") &&
                !args.FileName.Contains(".png") &&
                !args.FileName.Contains(".gif") &&
                !args.FileName.Contains(".tif") &&
                !args.FileName.Contains(".dib"))
            {
                lblError.Text = "Hệ thống chỉ chấp nhận các loại file ảnh jpg,jpeg,png,bmp,gif,tif và dib!";
            }
            else
            {
                //Copies the uploaded file to a new location.
                args.CopyTo(HttpContext.Current.Server.MapPath("~/Images/") + args.FileName);
                
                if (Session["Image"] == null)
                {
                    Session["Image"] = args.FileName + "|";
                }
                else
                {
                    Session["Image"] = Session["Image"] + args.FileName + "|";
                }
            }
        }
   </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlAdd" runat="server" Visible="False">
                <br />
                <asp:Label ID="lblCustomer" Style="font-weight: bold;" runat="server" Text="Khách hàng" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlCustomer" runat="server" Width="215px">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblBuilding" Style="font-weight: bold;" runat="server" Text="Tòa nhà"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBuilding" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:TextBox ID="txtBuilding" runat="server" Width="200" Enabled="False" Visible="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblFloor" Style="font-weight: bold;" runat="server" Text="Tầng" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlFloor" runat="server" Width="215px">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblRoomNo" Style="font-weight: bold;" runat="server" Text="Phòng số"
                    Width="150"></asp:Label>
                <asp:TextBox ID="txtRoomNo" runat="server" Width="200"></asp:TextBox>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <span style="padding-left: 150px;"></span>
                <asp:CheckBox ID="chkWareHouse" runat="server" Text="Phòng kho" 
                    AutoPostBack="True" oncheckedchanged="chkWareHouse_CheckedChanged" />
                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server">
                
                <asp:Label ID="lblPrice" Style="font-weight: bold;" runat="server" Text="Giá thuê"
                    Width="150"></asp:Label>
                <asp:TextBox ID="txtPrice" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblBedRoom" style="font-weight:bold;" runat="server" Text="Phòng ngủ" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBedRoom" runat="server" Width="215px">
                    <asp:ListItem Selected="True">Xin hãy chọn</asp:ListItem>
                    <asp:ListItem Selected="False" Value="1">1</asp:ListItem>
                    <asp:ListItem Selected="False" Value="2">2</asp:ListItem>
                    <asp:ListItem Selected="False" Value="3">3</asp:ListItem>
                    <asp:ListItem Selected="False" Value="4">4</asp:ListItem>
                    <asp:ListItem Selected="False" Value="5">5</asp:ListItem>
                    <asp:ListItem Selected="False" Value="6">6</asp:ListItem>
                    <asp:ListItem Selected="False" Value="7">7</asp:ListItem>
                    <asp:ListItem Selected="False" Value="8">8</asp:ListItem>
                    <asp:ListItem Selected="False" Value="9">9</asp:ListItem>
                    <asp:ListItem Selected="False" Value="10">10</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblBathRoom" style="font-weight:bold;" runat="server" Text="Phòng tắm" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBathRoom" runat="server" Width="215px">
                    <asp:ListItem Selected="True">Xin hãy chọn</asp:ListItem>
                    <asp:ListItem Selected="False" Value="1">1</asp:ListItem>
                    <asp:ListItem Selected="False" Value="2">2</asp:ListItem>
                    <asp:ListItem Selected="False" Value="3">3</asp:ListItem>
                    <asp:ListItem Selected="False" Value="4">4</asp:ListItem>
                    <asp:ListItem Selected="False" Value="5">5</asp:ListItem>
                    <asp:ListItem Selected="False" Value="6">6</asp:ListItem>
                    <asp:ListItem Selected="False" Value="7">7</asp:ListItem>
                    <asp:ListItem Selected="False" Value="8">8</asp:ListItem>
                    <asp:ListItem Selected="False" Value="9">9</asp:ListItem>
                    <asp:ListItem Selected="False" Value="10">10</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblArea" style="font-weight:bold;" runat="server" Text="Diện tích" Width="150"></asp:Label>
                <asp:TextBox ID="txtArea" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPicture" style="font-weight:bold;" runat="server" Text="Ảnh" Width="150"></asp:Label>
                <CuteWebUI:Uploader id="fulPicture" runat="server" MultipleFilesUpload="true" OnFileUploaded="Uploader_FileUploaded" InsertText="Choose pictures" /> 
                <br />
                <br />
                <asp:Label ID="lblDescription" style="font-weight:bold;" runat="server" Text="Mô tả"></asp:Label>
                <br />
                
                <span style="padding-left: 155px;"></span>
                <ckeditor:ckeditorcontrol id="txtDescription" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                <br />
                <br />
                </asp:Panel>
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSave" runat="server" Text="Lưu" OnClientClick="return ConfirmOnSave();"
                    Width="80px" OnClick="btnSave_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="80px" OnClick="btnReset_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Hủy" Width="80px" OnClick="btnCancel_Click" />
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="pnlList" runat="server" CssClass="table">
                <br />
                <asp:Label ID="lblChooseBuilding" Style="font-weight: bold;" runat="server" Text="Tòa nhà"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseBuilding" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlChooseBuilding_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblRoomType" Style="font-weight: bold;" runat="server" Text="Kiểu phòng"
                    Width="150"></asp:Label>
                <asp:DropDownList ID="ddlRoomType" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlRoomType_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Tất cả</asp:ListItem>
                    <asp:ListItem>Phòng cho thuê</asp:ListItem>
                    <asp:ListItem>Phòng kho</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="80" OnClick="btnAdd_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Xóa" Width="80"
                    OnClick="btnDelete_Click" />
                <br />
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
                <asp:ImageButton ImageUrl="Images/export_excel.jpg" ID="btnExport" runat="server" 
                    Width="45px" onclick="btnExport_Click" ToolTip="Xuất dữ liệu ra excel" />

                <ckeditor:ckeditorcontrol id="txtReason" basepath="/ckeditor/" runat="server" 
                    Visible="False"></ckeditor:ckeditorcontrol><br>
                <center>
                    <asp:Button ID="btnRequest" runat="server" Text="Gửi Email Yêu Cầu" 
                    Width="150px" Visible="False" onclick="btnRequest_Click" />&nbsp;<asp:Button ID="btnCancelRequest" 
                    runat="server" Text="Hủy" Width="80" Visible="False" 
                        onclick="btnCancelRequest_Click" /></center><br><br>
            </asp:Panel>
            <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
