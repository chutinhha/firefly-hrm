<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonProjectUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.Person_Project.PersonProject.PersonProjectUserControl" %>
<table class="fieldTitleDiv"><tr><td>  
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Project Personnel</td></tr>
</table>  
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblProject" runat="server" Text="Project" Width="100px"></asp:Label>
<span style="padding-left:50px"></span>
<asp:DropDownList runat="server" id="ddlProject" Width="120px" Height="20px" 
onselectedindexchanged="ddlProject_SelectedIndexChanged">
</asp:DropDownList>
<span style="padding-left:50px"></span></span><asp:Label ID="lblTask" runat="server" Text="Task" Width="100px"></asp:Label>
<span style="padding-left:50px"></span>
<asp:DropDownList runat="server" id="ddlTask" Width="120px" Height="20px" 
onselectedindexchanged="ddlTask_SelectedIndexChanged">
</asp:DropDownList>
<br/>
<asp:Button ID="btnAdd" runat="server" Text="Add" Width="70px" onclick="btnAdd_Click" />
<asp:Button ID="btnDelete" runat="server" Text="Delete" Width="70px" onclick="btnDelete_Click" />
<br>
    <asp:GridView ID="grdData" align="right" runat="server" EnableModelValidation="True" 
        onselectedindexchanged="grdData_SelectedIndexChanged" 
        Width="100%" BorderStyle="None" BorderWidth="0px">
    <Columns>

                        <asp:TemplateField>
                        <HeaderStyle Width="25" />
                            <HeaderTemplate>
            <asp:CheckBox 
                ID="CheckBox2" 
                runat="server"
                OnCheckedChanged="CheckUncheckAll"
                AutoPostBack="true" 
                />
        </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                  </Columns>
    </asp:GridView>
    </tr></td></table>
<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>