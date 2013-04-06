<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchEmployeeUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Person_Project.SearchEmployee.SearchEmployeeUserControl" %>
<br><table class="fieldTitleDiv" cellpadding="0">
<tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Search Employee</font></td></tr>
</table>
<br>
<span style="padding-left:5px"></span>
    
    <asp:Label ID="lblEmployee" runat="server" 
        Text="Employee" Width="150px"></asp:Label>
       <span style="padding-left:50px"></span>
    <asp:TextBox ID="txtEmployee" runat="server" Width="200px"></asp:TextBox>
    <br><br>
    <div class="borderTop">
    <asp:Button ID="btnSearch" runat="server" class="addButton" Text="Search" Width="70px" onclick="btnSearch_Click" />
    </div>
</td></tr></table>
<br>
<table class="fieldTitleDiv"><tr><td>    
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblProject" runat="server" 
        Text="Project" Width="70px"></asp:Label>
    <asp:TextBox ID="txtProject" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
<span style="padding-left:50px"></span></span><asp:Label ID="lblTask" 
        runat="server" Text="Task" Width="70px"></asp:Label>
    <asp:TextBox ID="txtTask" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
<br/><br>
<div class="borderTop">
<asp:Button class="addButton" ID="btnAssign" runat="server" Text="Assign" Width="70px" onclick="btnAssign_Click" />
</div>

    <asp:GridView ID="grdData" align="right" runat="server" EnableModelValidation="True" 
        onselectedindexchanged="grdData_SelectedIndexChanged" 
        Width="100%" BorderStyle="None" BorderWidth="0px">
    <Columns>

                        <asp:TemplateField>
                        <HeaderStyle Width="25" />
                            <HeaderTemplate>
            &nbsp;<asp:CheckBox 
                ID="CheckBox2" 
                runat="server"
                OnCheckedChanged="CheckUncheckAll"
                AutoPostBack="true" 
                />
        </HeaderTemplate>
                            <ItemTemplate>
                                &nbsp;<asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                  </Columns>
    </asp:GridView>
    </tr></td></table>
<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>