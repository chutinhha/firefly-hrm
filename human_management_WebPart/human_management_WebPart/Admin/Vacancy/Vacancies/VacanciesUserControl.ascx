<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VacanciesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Vacancies.VacanciesUserControl" %>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnSearch" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Vacancies</font></td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblJobTitle" runat="server" Text="Job Title" Width="80px"></asp:Label>
    <div class="styled-selectShort"><asp:DropDownList ID="ddlJobTitle" runat="server">
    </asp:DropDownList></div>
    <span style="padding-left:30px;"></span>
    <asp:Label ID="lblVacancy" runat="server" 
        Text="Vacancy" Width="80px"></asp:Label>
    <div class="styled-selectShort"><asp:DropDownList ID="ddlVacancy" runat="server">
    </asp:DropDownList></div>
    <span style="padding-left:30px;"></span><asp:Label ID="lblHiringManager" runat="server" 
        Text="Hiring Manager" Width="120px"></asp:Label>
    <asp:TextBox ID="txtHiringManager" runat="server" Width="110px"></asp:TextBox>
    <span style="padding-left:30px;"></span>
    <asp:Label ID="lblStatus" runat="server" 
        Text="Status" Width="65px"></asp:Label>
    <div class="styled-selectShort"><asp:DropDownList ID="ddlStatus" runat="server">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Closed</asp:ListItem>
    </asp:DropDownList></div>
    <br />
    <br />
    <div class="borderTop">
    <asp:Button ID="btnSearch" class="addButton" runat="server" onclick="btnSearch_Click" Text="Search" 
        Width="80px" />
    <asp:Button ID="btnReset" class="resetButton" runat="server" Text="Reset" Width="80px" 
        onclick="btnReset_Click" />
        </div>
</td></tr></table></asp:Panel>
<br>
<table class="fieldTitleDiv"><tr><td>
    <div class="borderBottom">
    <asp:Button ID="btnAdd" class="addButton" runat="server" Text="Add" Width="80px" 
        onclick="btnAdd_Click" />
    <asp:Button ID="btnEdit" class="addButton" runat="server" Text="Edit" Width="80px" 
        onclick="btnEdit_Click" />
    <asp:Button ID="btnDelete" class="deleteButton" runat="server" Text="Delete" Width="80px" 
        onclick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete ?')" />
        </div>
    <br />
    <asp:GridView ID="grdData" runat="server" Width="100%">
        <Columns>
            <asp:TemplateField>
            <HeaderStyle Width="25" />
                            <HeaderTemplate>
           &nbsp;<asp:CheckBox 
                ID="CheckBox2" 
                runat="server"
                OnCheckedChanged="CheckUncheckAll"
                AutoPostBack="true" 
                />
        </HeaderTemplate>
                <ItemTemplate>
                    &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView><table><tr><td></td></tr></table>
</td></tr></table>

<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
<br>