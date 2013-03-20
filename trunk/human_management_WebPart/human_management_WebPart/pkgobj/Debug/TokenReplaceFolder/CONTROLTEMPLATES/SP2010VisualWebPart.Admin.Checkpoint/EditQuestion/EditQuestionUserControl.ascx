<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditQuestionUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Checkpoint.EditQuestion.EditQuestionUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Edit Checkpoint Question</td></tr></table>
    <br />
    <span style="padding-left:5px;"></span><asp:Label ID="lblQuestion" runat="server" Text="Question" Width="150px"></asp:Label>
<br />
    <span style="padding-left:155px;"></span><asp:TextBox ID="txtQuestion" runat="server" Height="100px" 
    TextMode="MultiLine" Width="500px"></asp:TextBox>

<p>
    &nbsp;</p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblAnserType" runat="server" 
        Text="Answer type" Width="150px"></asp:Label>
<asp:RadioButton ID="rdoYesNo" runat="server" GroupName="rdoGroup" 
    Text="Yes/No" Width="100px" Checked="True" 
    oncheckedchanged="rdoYesNo_CheckedChanged" />
<asp:RadioButton ID="rdoNote" runat="server" GroupName="rdoGroup" 
    Text="Write note" Width="100px" 
    oncheckedchanged="rdoNote_CheckedChanged" />
<asp:RadioButton ID="rdoLevel" runat="server" GroupName="rdoGroup" 
    Text="Choose level" Width="100px" 
    oncheckedchanged="rdoLevel_CheckedChanged" />
<p>
    &nbsp;</p>
<asp:Panel ID="pnlChooseLevel" runat="server" Visible="False">
<span style="padding-left:5px;"></span><asp:Label ID="lblPerfect" runat="server" Text="Perfect level" Width="150px"></asp:Label>
<asp:TextBox ID="txtPerfect" runat="server" Width="200px">Perfect</asp:TextBox>
<p>
    &nbsp;</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblGreat" runat="server" Text="Great level" Width="150px"></asp:Label>
<asp:TextBox ID="txtGreat" runat="server" Width="200px">Great</asp:TextBox>
<p>
    &nbsp;</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblNormal" runat="server" Text="Normal level" Width="150px"></asp:Label>
<asp:TextBox ID="txtNormal" runat="server" Width="200px">OK</asp:TextBox>
<p>
    &nbsp;</p>
<span style="padding-left:5px;"></span><asp:Label ID="lblBad" runat="server" Text="Bad level" Width="150px"></asp:Label>
<asp:TextBox ID="txtBad" runat="server" Width="200px">Bad</asp:TextBox>
<p>
    &nbsp;</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblVeryBad" runat="server" Text="Very bad level" Width="150px"></asp:Label>
    <asp:TextBox ID="txtVeryBad" runat="server" Width="200px">Very bad</asp:TextBox>
</p>
</asp:Panel>
<div class="borderTop">
    <span style="padding-left:155px;"></span><asp:Button ID="btnSave" 
        runat="server" Text="Save" Width="80px" onclick="btnSave_Click" OnClientClick="return confirm('Are you sure you want to save ?')"/>
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click"/>
    </div>
</td></tr></table>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
</p>
