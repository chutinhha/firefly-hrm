<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobTitlesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.JobTitles.JobTitlesUserControl" %>
<br><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Job Titles</font></td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Button ID="btnAdd" class="addButton" runat="server" Text="Add" Width="80px" 
        onclick="btnAdd_Click" />
    <asp:Button ID="btnEdit" runat="server" Text="Edit" class="addButton" Width="80px" 
        onclick="btnEdit_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" class="deleteButton" Width="80px" 
        onclick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete ?')" />
    <br />
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
    <br />
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
