<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListBuilding.aspx.cs" Inherits="HotelManagement.ListBuilding" %>
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
                lblError.Text = "Only accept jpg,jpeg,png,bmp,gif,tif and dib file type!";
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
                <asp:Label ID="lblBuildingType" style="font-weight:bold;" runat="server" Text="Type" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBuildingType" runat="server" Width="215" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlBuildingType_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblAddress" style="font-weight:bold;" runat="server" Text="Address" Width="150"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Width="200"></asp:TextBox>&nbsp;&nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Label ID="lblDistrict" style="font-weight:bold;" runat="server" Text="District" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlDistrict" runat="server" Width="215px">
                    <asp:ListItem Selected="True" Value="Please select">Please select</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Dong Da">Dong Da</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Hoan Kiem">Hoan Kiem</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Tay Ho">Tay Ho</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Hai Ba Trung">Hai Ba Trung</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Cau Giay">Cau Giay</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Hoang Mai">Hoang Mai</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Ba Dinh">Ba Dinh</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<span style="color: Red">(*)</span>
                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server">
                
                <asp:Label ID="lblPrice" style="font-weight:bold;" runat="server" Text="Price" Width="150"></asp:Label>
                <asp:TextBox ID="txtPrice" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 150px;"></span>
                <asp:CheckBox ID="chkGarage" runat="server" Text="Garage" />
                <span style="padding-left: 25px;"></span>
                <asp:CheckBox ID="chkPool" runat="server" Text="Pool" />
                <span style="padding-left: 25px;"></span>
                <asp:CheckBox ID="chkGarden" runat="server" Text="Garden" />
                <br />
                <br />
                <asp:Label ID="lblBedRoom" style="font-weight:bold;" runat="server" Text="Bed Room" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBedRoom" runat="server" Width="215px">
                    <asp:ListItem Selected="True">Please select</asp:ListItem>
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
                <asp:Label ID="lblBathRoom" style="font-weight:bold;" runat="server" Text="Bath Room" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlBathRoom" runat="server" Width="215px">
                    <asp:ListItem Selected="True">Please select</asp:ListItem>
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
                <asp:Label ID="lblArea" style="font-weight:bold;" runat="server" Text="Area" Width="150"></asp:Label>
                <asp:TextBox ID="txtArea" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblNumberFloor" style="font-weight:bold;" runat="server" Text="Number of Floor" Width="150"></asp:Label>
                <asp:TextBox ID="txtNumberFloor" onkeyup="ValidateText(this);" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPicture" style="font-weight:bold;" runat="server" Text="Picture" Width="150"></asp:Label>
                <CuteWebUI:Uploader id="fulPicture" runat="server" MultipleFilesUpload="true" OnFileUploaded="Uploader_FileUploaded" InsertText="Choose pictures" /> 
                <br />
                <br />
                <asp:Label ID="lblDescription" style="font-weight:bold;" runat="server" Text="Description"></asp:Label>
                <br />
                <span style="padding-left: 155px;"></span>
                <ckeditor:ckeditorcontrol id="txtDescription" basepath="/ckeditor/" runat="server">
    </ckeditor:ckeditorcontrol>
                <br />
                <br />
                <a style="color:Blue;" href="https://maps.google.com/?q=Ha%20Noi">Google Maps (Use middle mouse please!)</a>
                <br /><br />
                <asp:Label ID="lblLat" style="font-weight:bold;" runat="server" Text="Latitude" Width="150"></asp:Label>
                <asp:TextBox ID="txtLat" runat="server" Width="200"></asp:TextBox>
                </asp:Panel>
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
                <asp:Label ID="lblChooseType" style="font-weight:bold;" runat="server" Text="Type" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseType" runat="server" Width="215" 
                    AutoPostBack="True" onselectedindexchanged="ddlChooseType_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblChooseDistrict" style="font-weight:bold;" runat="server" Text="District" Width="150"></asp:Label>
                <asp:DropDownList ID="ddlChooseDistrict" runat="server" Width="215" 
                    AutoPostBack="True" 
                    onselectedindexchanged="ddlChooseDistrict_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="All">All</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Dong Da">Dong Da</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Hoan Kiem">Hoan Kiem</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Tay Ho">Tay Ho</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Hai Ba Trung">Hai Ba Trung</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Cau Giay">Cau Giay</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Hoang Mai">Hoang Mai</asp:ListItem>
                    <asp:ListItem Selected="False" Value="Ba Dinh">Ba Dinh</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="80" OnClick="btnAdd_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Remove" Width="80" OnClick="btnDelete_Click" OnClientClick="return ConfirmOnDelete();"/>
                <br />
                <br />
                <div style="height: 300px; overflow: scroll;">
                    <asp:GridView ID="grdBuilding" runat="server" Width="100%" OnRowDataBound="grdBuilding_RowDataBound">
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
            </asp:Panel>
            <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
