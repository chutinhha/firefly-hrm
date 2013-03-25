<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddVacancyUserControl.ascx.cs" Inherits="SP2010VisualWebPart.AddVacancy.AddVacancyUserControl" %>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnSave" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Add Job Vacancy</font></td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblJobTitle" runat="server" Text="Job Title(*)" Width="150px"></asp:Label>
    <div class="styled-selectLong"><asp:DropDownList ID="ddlJobTitle" runat="server">
    </asp:DropDownList></div>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblVacancy" runat="server" Text="Vacancy Name(*)" Width="150px"></asp:Label>
    <asp:TextBox ID="txtVacancy" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblHiringManager" runat="server" Text="Hiring Manager" Width="150px"></asp:Label>
    <asp:TextBox ID="txtHiringManager" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblNoOfPosition" runat="server" Text="Number of Positions" Width="150px"></asp:Label>
    <asp:TextBox ID="txtNoOfPosition" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblDescription" runat="server" Text="Description" Width="150px"></asp:Label>
    <br />
    <span style="padding-left:160px;"></span><asp:TextBox ID="txtDescription" 
        runat="server" Height="100px" Width="500px" TextMode="MultiLine"  ></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblActive" runat="server" Text="Active" Width="150px"></asp:Label>
    <asp:CheckBox ID="chkActive" runat="server" Checked="True" />
    <br />
    <br />
    <div class="borderTop">
    <span style="padding-left:150px;"></span><asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" 
        Width="80px" class="addButton" OnClientClick="return confirm('Are you sure you want to save ?')" />
    <asp:Button ID="btnCancel" class="resetButton" runat="server" onclick="btnCancel_Click" Text="Cancel" 
        Width="80px" />
    </div>
</td></tr></table></asp:Panel>
    <br />
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>