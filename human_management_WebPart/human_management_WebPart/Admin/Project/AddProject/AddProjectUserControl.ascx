<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddProjectUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.Project.AddProject.AddProjectUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
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
    $(function () {
        $("#txtStartDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtEndDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<br />
<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Add New Project</span>
                    </td>
                </tr>
            </table>
            <br />
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblProjectName" runat="server" Text="Project Name(*)" Width="150px"></asp:Label>
            <asp:TextBox ID="txtProjectName" runat="server" Width="200px"></asp:TextBox>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblNote" runat="server" Text="Note" Width="150px"></asp:Label>
            <p>
                <span style="padding-left: 160px;">
                    <asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" Width="800px"></asp:TextBox>
            </p>
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblStartDate" runat="server" Text="Start Date" Width="155px"></asp:Label><input
                type="text" id="txtStartDate" name="txtStartDate" style="width: 200px;" value="<%=this.startDate %>" />
            <p>
                &nbsp;</p>
            <span style="padding-left: 5px;"></span>
            <asp:Label ID="lblEndDate" runat="server" Text="End Date" Width="150px"></asp:Label>
            <input type="text" id="txtEndDate" name="txtEndDate" style="width: 200px;" value="<%=this.endDate %>" />
            <p>
                &nbsp;</p>
                &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
            <div class="borderTop">
                <span style="padding-left: 155px;"></span>
                <asp:Button ID="btnSave" CssClass="addButton" runat="server" Text="Save" Width="80px"
                    OnClick="btnSave_Click" OnClientClick="return ConfirmOnSave();" />
                <asp:Button ID="btnCancel" CssClass="resetButton" runat="server" Text="Cancel" Width="80px"
                    OnClick="btnCancel_Click" /></div>
        </td>
    </tr>
</table>
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Text="" Style="color: Red;"></asp:Label>