<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditJobTitleUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.EditJobTitle.EditJobTitleUserControl" %>
<script type="text/javascript">
    function ConfirmOnSave() {
        if (confirm("<%=this.confirmSave %>") == true)
            return true;
        else
            return false;
    }
</script>
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSave" Width="100%">
    <table class="fieldTitleDiv" cellpadding="0">
        <tr>
            <td>
                <table class="fieldTitleTable">
                    <tr>
                        <td class="fieldTitleTd">
                            <span style="color: white;">Edit Job Title</span>
                        </td>
                    </tr>
                </table>
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblJobTitle" runat="server" Text="Job Title(*)" Width="150px"></asp:Label>
                <asp:TextBox ID="txtJobTitle" runat="server" Width="200px"></asp:TextBox>
                <p>
                    &nbsp;</p>
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblJobCategory" runat="server" Text="Job Category" Width="150px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlJobCategory" runat="server">
                    </asp:DropDownList>
                </div>
                <p>
                    &nbsp;</p>
                <p>
                    <span style="padding-left: 5px;"></span>
                    <asp:Label ID="lblJobDescription" runat="server" Text="Job Description" Width="150px"></asp:Label>
                    <a href="<%=this.document %>">
                    <asp:Image ID="imgDocument" runat="server" 
                        ImageUrl="/_layouts/Images/21_2_ob/word-icon.jpg" Width="50px" />
                        </a>
                    <asp:FileUpload ID="fulJobDescription" runat="server" Visible="False" />
                    <asp:Button ID="btnChange" CssClass="addButton" runat="server" Text="Change" 
                        Width="80px" onclick="btnChange_Click" />
                </p>
                <p>
                    &nbsp;</p>
                <p><br />
                    <span style="padding-left: 5px;"></span>
                    <asp:Label ID="lblNote" runat="server" Text="Note" Width="150px"></asp:Label>
                </p>
                <p>
                    <span style="padding-left: 160px;"></span>
                    <asp:TextBox ID="txtNote" runat="server" Height="100px" TextMode="MultiLine" Width="800px"></asp:TextBox>
                </p>
                <p>
                    &nbsp;</p>
                &nbsp;<span style="color: Red;">(*) is required</span>
                <br />
                <br />
                <div class="borderTop">
                    <span style="padding-left: 155px;"></span>
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
&nbsp;<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<br />
