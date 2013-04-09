<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportEmployeesUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.CSV.ImportEmployees.ImportEmployeesUserControl" %>

<table class="fieldTitleDiv" cellpadding="0">
    <tr>
        <td>
            <table class="fieldTitleTable">
                <tr>
                    <td class="fieldTitleTd">
                        <span style="color: white;">Import Employee Data From CSV</span>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <span style="padding-left: 5px;"></span>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="280px" Size="30" />
                <asp:Button ID="btnUpload" CssClass="addButton" runat="server" Text="Upload" OnClick="btnUpload_Click"
                    Width="80px" />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblMessage" runat="server" Text="" />
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="False">
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblFileName" runat="server" Text="" />
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblSelectSheet" runat="server" Text="Select Sheet" Width="150px" />
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlSheets" runat="server" AppendDataBoundItems="true">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:Button ID="btnShow" runat="server" Text="Show custom info" CssClass="addButton"
                    OnClick="btnShow_Click" Width="150px" />
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="False">
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblStartRow" runat="server" Text="Start row" Width="150px"></asp:Label>
                <asp:TextBox ID="txtStartRow" runat="server" Width="200px">1</asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="lblStartColumn" runat="server" Text="Start column" Width="150px"></asp:Label>
                <asp:TextBox ID="txtStartColumn" runat="server" Width="200px">1</asp:TextBox>
                <br />
                <br />
                <span style="padding-left: 5px;"></span>
                <asp:Label ID="Label1" runat="server" Text="Map column" Width="150px"></asp:Label>
                <asp:Label ID="lblColumnName" runat="server" Text="Column name" Width="210px"></asp:Label>
                <span style="padding-left: 25px;"></span>
                <asp:Label ID="lblColumnNumber" runat="server" Text="Column number in excel"></asp:Label>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtLoginID" runat="server" Enabled="False" Style="margin-top: 1px"
                    Width="200px">Login ID</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlLoginID" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtJobID" runat="server" Enabled="False" Width="200px">Job ID</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlJobID" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtBirthDate" runat="server" Width="200px" Enabled="False">Birth Date</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlBirthDate" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtMaritalStatus" runat="server" Enabled="False" Width="200px">Marital Status</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlMaritalStatus" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtGender" runat="server" Enabled="False" Width="200px">Gender</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlGender" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtHireDate" runat="server" Width="200px" Enabled="False">Hire Date</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlHireDate" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtSalaryFlag" runat="server" Enabled="False" Width="200px">Salary Flag</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlSalaryFlag" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtVacationHours" runat="server" Enabled="False" Width="200px">Vacation Hours</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlVacationHours" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtSickLeaveHours" runat="server" Enabled="False" Width="200px">Sick Leave Hours</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlSickLeaveHours" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtCurrentFlag" runat="server" Enabled="False" Width="200px">Current Flag</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlCurrentFlag" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <span style="padding-left: 160px;"></span>
                <asp:TextBox ID="txtModifyDate" runat="server" Enabled="False" Width="200px">Modify Date</asp:TextBox>
                <span style="padding-left: 20px;"></span>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlModifyDate" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <asp:Label ID="lblNote" Style="color: Red;" runat="server" Text="You can select value 0 for columns that excel file not contain. "></asp:Label>
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Visible="False">
                <div class="borderTop">
                    <span style="padding-left: 155px;"></span>
                    <asp:Button ID="btnSave" runat="server" Text="Import" OnClick="btnSave_Click" CssClass="addButton"
                        Width="80px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                        CssClass="resetButton" Width="80px" />
                </div>
            </asp:Panel>
        </td>
    </tr>
</table>
<br />
<asp:Label ID="lblError" runat="server" Style="color: Red;"></asp:Label>
<asp:Label ID="lblSuccess" runat="server" Style="color: Green;"></asp:Label>
<br />
