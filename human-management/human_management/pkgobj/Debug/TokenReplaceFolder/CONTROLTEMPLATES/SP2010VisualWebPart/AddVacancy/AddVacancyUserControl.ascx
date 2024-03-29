<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddVacancyUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.AddVacancy.AddVacancyUserControl" %>
<script type="text/javascript">
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
    function ValidateText(i) {
        if (i.value.length > 0) {
            i.value = i.value.replace(/[^\d]+/g, '');
        }
    }
</script>
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSave" Width="100%">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">Add Job Vacancy</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblJobTitle" runat="server" Text="Job Title(*)" Width="150px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlJobTitle" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblVacancy" runat="server" Text="Vacancy Name(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtVacancy" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblNoOfPosition" runat="server" Text="Number of Positions" Width="150px"></asp:Label>
                <asp:TextBox ID="txtNoOfPosition" onkeyup="ValidateText(this);" runat="server" Width="200px"></asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblDescription" runat="server" Text="Description" Width="150px"></asp:Label>
                <asp:FileUpload ID="fulVacancy" runat="server" />
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblActive" runat="server" Text="Active" Width="150px"></asp:Label>
                <asp:CheckBox ID="chkActive" runat="server" Checked="True" />
                <br />
                <br />
                &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
                <div class="borderTop">
                    <span style="padding-left: 150px;"></span>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Width="80px"
                        CssClass="addButton" OnClientClick="return ConfirmOnSave();" />
                    <asp:Button ID="btnCancel" CssClass="resetButton" runat="server" OnClick="btnCancel_Click"
                        Text="Cancel" Width="80px" />
                </div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label><br />
