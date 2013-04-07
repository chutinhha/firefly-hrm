<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewQuestionUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Checkpoint.AddNewQuestion.AddNewQuestionUserControl" %>
<script type="text/javascript">
    function ConfirmOnDelete() {
        if (confirm("<%=this.confirmDelete %>") == true)
            return true;
        else
            return false;
    }
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
</script>
<br />
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Add Checkpoint Question</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblQuestion" runat="server" Text="Question(*)" Width="150px"></asp:Label>
            <br />
            <span style="padding-left: 155px;"></span>
            <asp:TextBox ID="txtQuestion" runat="server" Height="100px" TextMode="MultiLine"
                Width="800px"></asp:TextBox>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblAnserType" runat="server" Text="Answer type" Width="143px"></asp:Label>
            <asp:RadioButton ID="rdoYesNo" runat="server" GroupName="rdoGroup" Text="Yes/No"
                Width="100px" Checked="True" OnCheckedChanged="rdoYesNo_CheckedChanged" />
            <asp:RadioButton ID="rdoNote" runat="server" GroupName="rdoGroup" Text="Write note"
                Width="100px" OnCheckedChanged="rdoNote_CheckedChanged" />
            <asp:RadioButton ID="rdoLevel" runat="server" GroupName="rdoGroup" Text="Choose level"
                OnCheckedChanged="rdoLevel_CheckedChanged" />
            <p>
                &nbsp;</p>
            <asp:Panel ID="pnlChooseLevel" runat="server" Visible="False">
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblPerfect" runat="server" Text="Perfect level" Width="143px"></asp:Label>
                <asp:TextBox ID="txtPerfect" runat="server" Width="200px">Perfect</asp:TextBox>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblGreat" runat="server" Text="Great level" Width="143px"></asp:Label>
                <asp:TextBox ID="txtGreat" runat="server" Width="200px">Great</asp:TextBox>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblNormal" runat="server" Text="Normal level" Width="143px"></asp:Label>
                <asp:TextBox ID="txtNormal" runat="server" Width="200px">OK</asp:TextBox>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblBad" runat="server" Text="Bad level" Width="143px"></asp:Label>
                <asp:TextBox ID="txtBad" runat="server" Width="200px">Bad</asp:TextBox>
                <p>
                    &nbsp;</p>
                <p>
                    <span style="padding-left: 5px;"></span>
                    <asp:Label ID="lblVeryBad" runat="server" Text="Very bad level" Width="143px"></asp:Label>
                    <asp:TextBox ID="txtVeryBad" runat="server" Width="200px">Very bad</asp:TextBox>
                </p>
                <br />
            </asp:Panel>
            &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
            <div class="borderTop">
                <span style="padding-left: 150px;"></span>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="addButton" Width="80px"
                    OnClick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
                <asp:Button ID="btnCancel" CssClass="resetButton" runat="server" OnClick="btnCancel_Click"
                    Text="Cancel" Width="80px" />
            </div>
        </td>
    </tr>
</table>
<p>
    &nbsp;</p>
<p>
    &nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
</p>
