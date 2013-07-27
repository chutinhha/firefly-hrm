<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ManageAccount.aspx.cs" Inherits="HotelManagement.ManageAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlList" runat="server" CssClass="table">
                <br />
                <div class="sitemap">
                <ul>
                    <li class="home"><a href="Home.aspx">Trang chủ</a></li>
                    <li class="current"><a href="ManageAccount.aspx">Quản lý tài khoản</a></li>
                </ul>
            </div>
            <br />
                <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="80" 
                    onclick="btnAdd_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Xóa" Width="80" 
                    onclick="btnDelete_Click" OnClientClick="return ConfirmOnDelete();" />
                <br />
                <br />
                <div style="height: 300px; overflow: scroll;">
                    <asp:GridView ID="grdAccount" runat="server" Width="100%" OnRowDataBound="grdAccount_RowDataBound">
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
                    Width="45px" onclick="btnExport_Click" ToolTip="Click để xuất toàn bộ dữ liệu ra excel" />
            </asp:Panel>
            <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
