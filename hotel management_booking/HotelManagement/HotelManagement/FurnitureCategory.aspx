<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FurnitureCategory.aspx.cs" Inherits="HotelManagement.FurnitureCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
</asp:Content>
