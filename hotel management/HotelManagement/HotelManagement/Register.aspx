<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="HotelManagement.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ValidateText(i) {
            if (i.value.length > 0) {
                i.value = i.value.replace(/[^\d]+/g, '');
            }
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <br />
            <br />
            <asp:Label ID="lblUserName" style="font-weight:bold;" runat="server" Text="User Name:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
            &nbsp;<span style="color: Red">(*)</span>
            <br />
            <br />
            <asp:Label ID="lblPassword" style="font-weight:bold;" runat="server" Text="Password:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            &nbsp;<span style="color: Red">(*)</span>
            <br />
            <br />
            <asp:Label ID="lblAccountType" style="font-weight:bold;" runat="server" Text="Account Type:" Width="150px"></asp:Label>
            <asp:DropDownList Width="214px" ID="ddlAccountType" runat="server" AutoPostBack="true"
                OnSelectedIndexChanged="ddlAccountType_SelectedIndexChanged">
                <asp:ListItem Selected="True">Please select</asp:ListItem>
                <asp:ListItem>Website Manager</asp:ListItem>
                <asp:ListItem>Building Manager</asp:ListItem>
                <asp:ListItem>Administrator</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<span style="color: Red">(*)</span>
            <asp:Panel ID="pnlRoom" runat="server" CssClass="table" Style="overflow: scroll;
                height: 300px;">
                <br />
                <br />
                <span style="color: Red">(*) </span>
                <asp:Label ID="lblBuilding" style="font-weight:bold;" runat="server" Text="Please select at least 1 building"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="grdRoom" runat="server" Width="100%" 
                    OnRowDataBound="grdRoom_RowDataBound" >
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                &nbsp;<asp:CheckBox ViewStateMode=Enabled ID="myCheckBox" runat="server" OnCheckedChanged="myCheckBox_OnCheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <br />
            <br />
            <asp:Label ID="lblName" style="font-weight:bold;" Width="150px" runat="server" Text="Full name:"></asp:Label>
            <asp:TextBox ID="txtName" Width="200px" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblPhone" style="font-weight:bold;" Width="150px" runat="server" Text="Phone:"></asp:Label>
            <asp:TextBox ID="txtPhone" Width="200px" runat="server" onkeyup="ValidateText(this);"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblAddress" style="font-weight:bold;" Width="150px" runat="server" Text="Address:"></asp:Label>
            <asp:TextBox ID="txtAddress" Width="200px" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblEmail" style="font-weight:bold;" Width="150px" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtMail" Width="200px" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            <span style="color: Red">(*): Required</span>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="" Width="150px"></asp:Label>
            <asp:Button ID="btnRegister" runat="server" Text="Register" Style="background-color: #034569;
                color: white; border: none; height: 25px;" OnClick="btnRegister_Click" />
            <br />
            <br />
            &nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Text="" Style="color: Green;"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
