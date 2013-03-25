<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EvaluateEmployeeUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Checkpoint.EvaluateEmployee.EvaluateEmployeeUserControl" %>
<br><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white"><asp:Label ID="lblTitle" runat="server" Text="Search employee"></asp:Label></font></td></tr></table>
<asp:Panel ID="pnlSearch" runat="server"><br><span style="padding-left:5px;"></span><asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" 
    Width="150px"></asp:Label>
<asp:TextBox ID="txtEmployeeName" runat="server" Width="200px"></asp:TextBox><br><br>
        <div class="borderTop">
            <span style="padding-left:155px;"></span>
            <asp:Button ID="btnSearch" class="addButton" runat="server" onclick="btnSearch_Click" 
                Text="Search" Width="80px" />
        </div>
    </asp:Panel><asp:Panel ID="pnlData" runat="server" Visible="False">
    <div class="borderBottom">
    <asp:Button ID="btnEvaluate" class="addButton" OnClick="btnEvaluate_Click" runat="server" Text="Evaluate" Width="80px" />
        <asp:Button ID="btnCancel" class="resetButton" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click"/>
        </div>
    <asp:GridView ID="grdData" runat="server" Width="100%" onrowdatabound="grdData_RowDataBound">
    <Columns>

                        <asp:TemplateField>
                        <HeaderStyle Width="25" />
                            <ItemTemplate>
                                <asp:RadioButton OnCheckedChanged="rdoEmployee_CheckedChanged" ID="rdoEmployee" runat="server" GroupName="rdoGroup" AutoPostBack="true">
                                </asp:RadioButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                  </Columns>
    </asp:GridView><table><tr><td></td></tr></table></asp:Panel>

    
    <asp:Panel ID="pnlEvaluate" runat="server" Visible="False">
        <br><span style="padding-left:5px;"></span><asp:Label ID="lblName" runat="server"></asp:Label>
        <br />
        <asp:Panel ID="pnlGenerate" runat="server" Visible="False">
        </asp:Panel>
        <div class="borderTop" align="center">
        <asp:Button ID="btnSave" class="addButton" runat="server" Text="Save" Width="80px" 
                onclick="btnSave_Click" OnClientClick="return confirm('Are you sure you want to save ?')"/>
        <asp:Button ID="btnCancel1" class="resetButton" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click" /></div>
    </asp:Panel>

    </td></tr></table>
<p>
    <asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>
</p>

