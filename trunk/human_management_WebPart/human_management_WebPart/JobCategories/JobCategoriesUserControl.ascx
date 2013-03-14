<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobCategoriesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.JobCategories.JobCategoriesUserControl" %>
<asp:Panel ID="Panel1" runat="server"  
    Visible="False">
    <table class="fieldTitleDiv" cellpadding="0"><tr><td>
    <table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Add Job Category</td></tr></table>
    <br><span style="padding-left:10px;"></span><asp:Label ID="Label2" runat="server" Text="Name(*)" 
        Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <div class="borderTop">
    <asp:Button ID="Button4" runat="server" Text="Save" Width="80px" 
        onclick="Button4_Click" />
    <asp:Button ID="Button5" runat="server" Text="Cancel" Width="80px" 
        onclick="Button5_Click" /></div><br></td></tr></table>
</asp:Panel><br>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Job Categories</td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Button ID="Button1" runat="server" Text="Add" Width="80px" 
        onclick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Edit" Width="80px" 
        onclick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Delete" Width="80px" 
        onclick="Button3_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%">
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
<asp:Label ID="Label1" runat="server" style="color:Red;"></asp:Label>
<br>
<p>
    &nbsp;</p>
