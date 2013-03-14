<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendanceRecordUserControl.ascx.cs" Inherits="SP2010VisualWebPart.AttendanceRecord.AttendanceRecordUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">View Attendance Records</td></tr></table>
    <br />

    

    <span style="padding-left:5px;"></span><asp:Label ID="Label1" runat="server" Text="Employee Name(*)" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="200px" 
        ontextchanged="TextBox1_TextChanged"></asp:TextBox>
    <br />
    <br />
    <span style="padding-left:155px;"></span><asp:RadioButton ID="RadioButton1" 
        runat="server" Checked="True" 
        GroupName="ViewDateType" Text="View a date" Width="120px" 
        oncheckedchanged="RadioButton1_CheckedChanged" />
    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="ViewDateType" 
        Text="View range of date" oncheckedchanged="RadioButton2_CheckedChanged" 
        Width="150px" />
    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="ViewDateType" 
        oncheckedchanged="RadioButton3_CheckedChanged" Text="View all" />
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label2" runat="server" Text="Date" Width="150px"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="..." Width="30px" 
        onclick="Button1_Click" />
    <span style="padding-left:80px;"></span>
    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="..." onclick="Button2_Click" />

    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="Label6" runat="server" 
        Text="(mm-dd-yyyy)" Width="155px" Height="20px"></asp:Label><asp:Label ID="Label3" runat="server" 
        Text="From" Width="50px"></asp:Label>

    <span style="padding-left:265px;"></span><asp:Label ID="Label4" runat="server" Text="To"></asp:Label>
    <asp:Calendar ID="Calendar1" runat="server" align="center" 
        onselectionchanged="Calendar1_SelectionChanged" Visible="False"></asp:Calendar>
    <div class="borderTop">
    <span style="padding-left:155px;"></span><asp:Button ID="Button3" runat="server" Text="View" Width="80px" 
        onclick="Button3_Click" />
    </div>
    

</td></tr></table>
<br><br>
<br /><asp:Panel ID="Panel1" runat="server" Visible="False">
<table class="fieldTitleDiv"><tr><td>
	<div class="borderBottom">
<asp:Button ID="Button4" runat="server" Text="Add" Width="80px" 
    onclick="Button4_Click" />
<asp:Button ID="Button5" runat="server" Text="Edit" Width="80px" 
    onclick="Button5_Click" />
<asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Delete" 
    Width="80px" />
    </div>
<br />
    <asp:GridView ID="GridView1" runat="server" Width="100%">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle Width="25" />
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" 
                        OnCheckedChanged="CheckUncheckAll" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="myCheckBox" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </td></tr></table></asp:Panel>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" style="color:Red;"></asp:Label>


