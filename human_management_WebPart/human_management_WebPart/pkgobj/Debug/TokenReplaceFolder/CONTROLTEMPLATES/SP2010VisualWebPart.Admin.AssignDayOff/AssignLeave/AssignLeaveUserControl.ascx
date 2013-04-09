<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignLeaveUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.AssignDayOff.AssignLeave.AssignLeaveUserControl" %>

<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <font color="white">Search Employee</font>
                    </td>
                </tr>
            </table>
            <br>
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblEmployee" runat="server" Text="Employee" Width="150px"></asp:Label>
            <asp:TextBox ID="txtEmployee" runat="server" Width="200px"></asp:TextBox>
            <span style= "padding-left:50px">
            
            <br>
            <br>
            <div class="borderTop">
                <asp:Button ID="btnSearch" class="addButton" runat="server" Text="Search" Width="80px"
                    OnClick="btnSearch_Click" />
            </div>
        </td>
    </tr>
</table>
<br>
<table class="fieldTitleDiv">
    <tr>
        <td>
            <br>
            <span style="padding-left: 5px"></span>
            <asp:Label ID="lblDayOff" runat="server" Text="Type of Days Off" Width="150px"></asp:Label>
            <asp:TextBox ID="txtDayOff" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
            <br />
            <br>
            <div class="borderTop">
                <asp:Button ID="btnAssign" runat="server" Text="Assign" Width="80px" class="addButton"
                    OnClick="btnAssign_Click" />
            </div>
            <asp:GridView ID="grdData" align="right" runat="server" EnableModelValidation="True"
                OnSelectedIndexChanged="grdData_SelectedIndexChanged" Width="100%" BorderStyle="None"
                BorderWidth="0px">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckUncheckAll" AutoPostBack="true" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="myCheckBox" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </tr>
    </td></table>
<br>

&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label><br>