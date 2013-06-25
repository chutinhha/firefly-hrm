﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListNew.aspx.cs" Inherits="HotelManagement.ListNew" %>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlAdd" runat="server" Visible="False">
                <br>
                <span style="font-weight: bold;">Title:</span><br />
                <asp:TextBox ID="txtTitle" runat="server" Width="98%"></asp:TextBox><br>
                <br>
                <ckeditor:ckeditorcontrol id="CKEditor1" basepath="/ckeditor/" runat="server"></ckeditor:ckeditorcontrol>
                <br />
                <center>
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="80px" 
                        onclick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                        Width="80px" onclick="btnCancel_Click" /></center>
                <br />
            </asp:Panel>
            <asp:Panel ID="pnlList" runat="server" CssClass="table">
                <br />
                <asp:Label ID="lblTime" style="font-weight:bold;" runat="server" Text="Show News In" Width="150"></asp:Label>
                <asp:RadioButton ID="rdoAll" runat="server" Text="All Time" GroupName="Time" 
                    Checked="True" AutoPostBack="True" oncheckedchanged="rdoAll_CheckedChanged" />
                <asp:RadioButton ID="rdoYear" runat="server" Text="This Year" GroupName="Time" 
                    AutoPostBack="True" oncheckedchanged="rdoYear_CheckedChanged"/>
                <asp:RadioButton ID="rdoMonth" runat="server" Text="This Month" 
                    GroupName="Time" AutoPostBack="True" 
                    oncheckedchanged="rdoMonth_CheckedChanged"/>
                <br />
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="80" 
                    onclick="btnAdd_Click"/>
                <asp:Button ID="btnDelete" runat="server" Text="Remove" Width="80" 
                    OnClientClick="return ConfirmOnDelete();" onclick="btnDelete_Click"
                    />
                <br />
                <br />
                <div style="height: 300px; overflow: scroll;">
                    <asp:GridView ID="grdNew" runat="server" Width="100%" OnRowDataBound="grdNew_RowDataBound">
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
    </asp:UpdatePanel>
</asp:Content>