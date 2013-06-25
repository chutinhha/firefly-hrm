<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageFurnitureCategory.aspx.cs" Inherits="HotelManagement.ManageFurnitureCategory" %>
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
            <asp:Panel ID="pnlAdd" runat="server" Visible="False">
                <br />
                <asp:Label ID="lblName" runat="server" Text="Name of Category" Width="150"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Width="200"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="80" 
                    onclick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80" 
                    onclick="btnCancel_Click" />
            </asp:Panel>
            <asp:Panel ID="pnlList" runat="server" CssClass="table">
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="80" 
                    onclick="btnAdd_Click" />
                <br />
                <br />
                <div style="height: 300px; overflow: scroll;">
                    <asp:GridView ID="grdCategory" runat="server" Width="100%" OnRowDataBound="grdCategory_RowDataBound">
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
            <br />
            <asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
