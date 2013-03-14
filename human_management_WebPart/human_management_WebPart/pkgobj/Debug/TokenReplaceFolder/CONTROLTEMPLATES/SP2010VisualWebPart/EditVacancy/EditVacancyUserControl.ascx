<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditVacancyUserControl.ascx.cs" Inherits="SP2010VisualWebPart.EditVacancy.EditVacancyUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Edit Vancancy</td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label1" runat="server" Text="Job Title(*)" Width="150px"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px">
    </asp:DropDownList>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label2" runat="server" Text="Vacancy Name(*)" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label3" runat="server" Text="Hiring Manager" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label4" runat="server" Text="Number of Positions" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label5" runat="server" Text="Description" Width="150px"></asp:Label>
    <br />
    <span style="padding-left:160px;"></span><asp:TextBox ID="TextBox5" 
        runat="server" Height="100px" Width="500px" TextMode="MultiLine"  ></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label6" runat="server" Text="Active" Width="150px"></asp:Label>
    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
    <br />
    <br /><div class="borderTop">
    <span style="padding-left:155px;"></span><asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
        Width="80px" />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" 
        Width="80px" /></div>
    
</td></tr></table>
<br />
    <br />
    <asp:Label ID="Label7" runat="server" style="color:Red;"></asp:Label>
