<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCandidateUserControl.ascx.cs" Inherits="SP2010VisualWebPart.AddCandidate.AddCandidateUserControl" %>
<asp:Label ID="Label1" runat="server" Text="Full Name(*)" Width="120px"></asp:Label>
<asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
<span style="padding-left:100px;"></span><asp:Label ID="Label2" runat="server" 
    Text="Address Street" Width="120px"></asp:Label>

<asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label3" runat="server" Text="City" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
    <span style="padding-left:100px;"></span><asp:Label ID="Label4" runat="server" 
        Text="State" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label5" runat="server" Text="Zip Code" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
    <span style="padding-left:100px;"></span><asp:Label ID="Label6" runat="server" Text="Country" Width="120px"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="210px">
    </asp:DropDownList>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label7" runat="server" Text="Home Phone" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
    <span style="padding-left:100px;"></span><asp:Label ID="Label8" runat="server" 
        Text="Mobile" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox7" runat="server" Width="200px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label9" runat="server" Text="Work Phone" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox8" runat="server" Width="200px"></asp:TextBox>
    <span style="padding-left:100px;"></span><asp:Label ID="Label10" runat="server" 
        Text="Email(*)" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label11" runat="server" Text="Job Vacancy" Width="120px"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" Width="200px">
    </asp:DropDownList>
    <span style="padding-left:100px;"></span><asp:Label ID="Label12" runat="server" Text="Keywords" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox10" runat="server" Width="200px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label13" runat="server" Text="Job Title" Width="120px"></asp:Label>
    <asp:DropDownList ID="DropDownList3" runat="server" Width="200px">
    </asp:DropDownList>
    <span style="padding-left:100px;"></span><asp:Label ID="Label14" runat="server" Text="Hiring Manager" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox11" runat="server" Width="200px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label15" runat="server" Text="Status" Width="120px"></asp:Label>
    <asp:DropDownList ID="DropDownList4" runat="server" Width="200px">
    </asp:DropDownList>
    <span style="padding-left:100px;"></span><asp:Label ID="Label16" runat="server" 
        Text="Apply Method" Width="120px"></asp:Label>
    <asp:DropDownList ID="DropDownList5" runat="server" Width="200px">
        <asp:ListItem Selected="True">Online</asp:ListItem>
        <asp:ListItem>Manual</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label17" runat="server" Text="Apply Date" Width="120px"></asp:Label>
    <asp:TextBox ID="TextBox12" runat="server" Width="200px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="..." onclick="Button1_Click" />
</p>


<asp:Calendar ID="Calendar1" runat="server" Visible="False" 
    onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
<p>
<asp:Label ID="Label18" runat="server" Text="Comment" Width="120px" valign="top"></asp:Label>
</p>
<asp:TextBox ID="TextBox13" runat="server" Height="100px" Width="100%" 
    TextMode="MultiLine"></asp:TextBox>



<p>
    <asp:Label ID="Label19" runat="server" style="text-color:red;"></asp:Label>
</p>
<p align="center">
    <asp:Button ID="Button2" runat="server" Text="Save" Width="80px" 
        onclick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Cancel" Width="80px" 
        onclick="Button3_Click" />
</p>





