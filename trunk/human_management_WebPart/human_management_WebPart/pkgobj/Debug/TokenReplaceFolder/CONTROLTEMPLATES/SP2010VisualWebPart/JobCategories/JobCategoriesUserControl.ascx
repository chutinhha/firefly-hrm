<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobCategoriesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.JobCategories.JobCategoriesUserControl" %>
<asp:Panel ID="Panel1" runat="server"  
    Visible="False" DefaultButton="btnSave">
    <table class="fieldTitleDiv" cellpadding="0"><tr><td>
    <table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><asp:Label ID="lblTitle" runat="server" Text="Add Job Category"></asp:Label></td></tr></table>
    <br><span style="padding-left:10px;"></span><asp:Label ID="lblName" runat="server" Text="Name(*)" 
        Width="150px"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <div class="borderTop">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="80px" 
        onclick="btnSave_Click" OnClientClick="return confirm('Are you sure you want to save ?')" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" 
        onclick="btnCancel_Click" /></div><br></td></tr></table>
</asp:Panel><br>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Job Categories</td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Button ID="btnAdd" runat="server" Text="Add" Width="80px" 
        onclick="btnAdd_Click" />
    <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="80px" 
        onclick="btnEdit_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="80px" 
        onclick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete ?')" />
    <br />
    <br />
    <asp:GridView ID="grdData" runat="server" Width="100%">
        <Columns >

                        <asp:TemplateField>
                        <HeaderStyle Width="25" />
                        <HeaderTemplate >
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
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>


