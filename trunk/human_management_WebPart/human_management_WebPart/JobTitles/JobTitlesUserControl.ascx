<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobTitlesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.JobTitles.JobTitlesUserControl" %>
<fieldset name="Group1">
    <legend style="background-color: #FF6600; color: #FFFF00;">Job Titles</legend>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add" Width="80px" 
        onclick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Edit" Width="80px" 
        onclick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Delete" Width="80px" 
        onclick="Button3_Click" />
    <br />
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" Text="All" 
        oncheckedchanged="CheckBox1_CheckedChanged" />
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="500px">
    <Columns>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                  </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server" style="color:Red;"></asp:Label>
</fieldset>
