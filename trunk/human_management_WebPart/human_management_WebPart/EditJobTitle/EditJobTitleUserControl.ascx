<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditJobTitleUserControl.ascx.cs" Inherits="SP2010VisualWebPart.EditJobTitle.EditJobTitleUserControl" %>
<asp:Label ID="Label1" runat="server" Text="Job Title(*)" Width="150px"></asp:Label>
<asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label4" runat="server" Text="Job Category" Width="150px"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px">
    </asp:DropDownList>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label2" runat="server" Text="Job Description" Width="150px"></asp:Label>
</p>
<p>
    <span style="padding-left:150px;"></span><asp:TextBox ID="TextBox2" 
        runat="server" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label3" runat="server" Text="Note" Width="150px"></asp:Label>
</p>
<p>
    <span style="padding-left:150px;"></span><asp:TextBox ID="TextBox3" runat="server" Height="100px" TextMode="MultiLine" 
        Width="400px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
    Width="80px" />
<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" 
    Width="80px" />
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label5" runat="server" style="color:Red;"></asp:Label>
</p>



