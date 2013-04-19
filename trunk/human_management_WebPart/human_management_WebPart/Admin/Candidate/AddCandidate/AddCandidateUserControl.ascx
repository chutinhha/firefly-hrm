<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCandidateUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.AddCandidate.AddCandidateUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
    $(function () {
        $("#txtApplyDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtInterviewDate").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
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
                            <span style="color: white;">Add Candidate</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblFullName" runat="server" Text="Full Name(*)" Width="120px"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" Width="200px"></asp:TextBox>
                <span style="padding-left: 100px;"></span>
                <asp:Label ID="lblAddress" runat="server" Text="Address Street" Width="120px"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblCountry" runat="server" Text="Country" Width="120px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlCountry" runat="server">
                    </asp:DropDownList>
                </div>
                <span style="padding-left: 100px;"></span>
                <asp:Label ID="lblCity" runat="server" Text="City" Width="120px"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox>
                <p>
                    &nbsp;</p>
                <p>
                    <span style="padding-left: 5px;"></span>
                    <asp:Label ID="lblHomePhone" runat="server" Text="Home Phone" Width="120px"></asp:Label>
                    <asp:TextBox ID="txtHomePhone" onkeyup="ValidateText(this);" runat="server" Width="200px"></asp:TextBox>
                    <span style="padding-left: 100px;"></span>
                    <asp:Label ID="lblMobile" runat="server" Text="Mobile" Width="120px"></asp:Label>
                    <asp:TextBox ID="txtMobile" onkeyup="ValidateText(this);" runat="server" Width="200px"></asp:TextBox>
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    <span style="padding-left: 5px;"></span>
                    <asp:Label ID="lblWorkPhone" runat="server" Text="Work Phone" Width="120px"></asp:Label>
                    <asp:TextBox ID="txtWorkPhone" onkeyup="ValidateText(this);" runat="server" Width="200px"></asp:TextBox>
                    <span style="padding-left: 100px;"></span>
                    <asp:Label ID="lblEmail" runat="server" Text="Email(*)" Width="120px"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                </p>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblVacancy" runat="server" Text="Job Vacancy" Width="120px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlVacancy" runat="server">
                    </asp:DropDownList>
                </div>
                <span style="padding-left: 100px;"></span>
                <asp:Label ID="lblJobTitle" runat="server" Text="Job Title" Width="120px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlJobTitle" runat="server">
                    </asp:DropDownList>
                </div>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblStatus" runat="server" Text="Status" Width="120px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlStatus" runat="server">
                    </asp:DropDownList>
                </div>
                <span style="padding-left: 100px;"></span>
                <asp:Label ID="lblApplyMethod" runat="server" Text="Apply Method" Width="120px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlApplyMethod" runat="server">
                        <asp:ListItem Selected="True">Online</asp:ListItem>
                        <asp:ListItem>Manual</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <p>
                </p>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblApplyDate" runat="server" Text="Apply Date" Width="120px"></asp:Label>
                <asp:Panel ID="pnlApplyDate" runat="server" Style="display: inline;">
                    <input type="text" id="txtApplyDate" style="width: 200px;" name="txtApplyDate" value="<%=this.applyDate %>" />
                </asp:Panel>
                &nbsp;<p>
                </p>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblInterviewDate" runat="server" Text="Interview Date" Width="120px"></asp:Label>
                <asp:Panel ID="pnlInterview" runat="server" Style="display: inline;">
                    <input type="text" id="txtInterviewDate" style="width: 200px;" name="txtInterviewDate"
                        value="<%=this.interviewDate %>" />
                </asp:Panel>
                <span style="padding-left: 100px;"></span>
                <asp:Label ID="lblInterviewTime" runat="server" Text="Time" Width="120px"></asp:Label>
                <div class="styled-selectShort" style="width: 50px;">
                    <asp:DropDownList ID="ddlHour" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="styled-selectShort" style="width: 50px;">
                    <asp:DropDownList ID="ddlMinutes" runat="server">
                    </asp:DropDownList>
                </div>
                <p>
                    <br />
                    <span style="padding-left: 5px;"></span>
                    <asp:Label ID="lblComment" runat="server" Text="Comment" Width="120px"></asp:Label>
                </p>
                <span style="padding-left: 130px;"></span>
                <asp:TextBox ID="txtComment" runat="server" Width="650px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
                <div class="borderTop">
                    <span style="padding-left: 130px;"></span>
                    <asp:Button ID="btnSave" runat="server" CssClass="addButton" OnClick="btnSave_Click"
                        OnClientClick="return ConfirmOnSave();" Text="Save" Width="80px" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="resetButton" OnClick="btnCancel_Click"
                        Text="Cancel" Width="80px" />
                </div>
            </td>
        </tr>
    </table>
</asp:Panel>
<br />
<br />
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: red;"></asp:Label>
<br />
