<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VacanciesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Vacancies.VacanciesUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Vacancies</td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label1" runat="server" Text="Job Title" Width="80px"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="110px">
    </asp:DropDownList>
    <span style="padding-left:40px;"></span>
    <asp:Label ID="Label2" runat="server" 
        Text="Vacancy" Width="80px"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" Width="110px">
    </asp:DropDownList>
    <span style="padding-left:40px;"></span><asp:Label ID="Label3" runat="server" 
        Text="Hiring Manager" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="110px"></asp:TextBox>
    <span style="padding-left:40px;"></span>
    <asp:Label ID="Label4" runat="server" 
        Text="Status" Width="80px"></asp:Label>
    <asp:DropDownList ID="DropDownList3" runat="server" Width="110px">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Closed</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <div class="borderTop">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" 
        Width="80px" />
    <asp:Button ID="Button2" runat="server" Text="Reset" Width="80px" 
        onclick="Button2_Click" />
        </div>
</td></tr></table>
<br><br><br>
<table class="fieldTitleDiv"><tr><td>
    <div class="borderBottom">
    <asp:Button ID="Button3" runat="server" Text="Add" Width="80px" 
        onclick="Button3_Click" />
    <asp:Button ID="Button4" runat="server" Text="Edit" Width="80px" 
        onclick="Button4_Click" />
    <asp:Button ID="Button5" runat="server" Text="Delete" Width="80px" 
        onclick="Button5_Click" />
        </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%">
        <Columns>
            <asp:TemplateField>
            <HeaderStyle Width="25" />
                            <HeaderTemplate>
            <asp:CheckBox 
                ID="CheckBox2" 
                runat="server"
                OnCheckedChanged="CheckUncheckAll"
                AutoPostBack="true" 
                />
        </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="myCheckBox" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</td></tr></table>

<br><br>
<asp:Label ID="Label5" runat="server" style="color:Red;"></asp:Label>
<br>
