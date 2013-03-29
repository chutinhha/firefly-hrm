<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DayOffUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.AssignDayOff.DayOff.DayOffUserControl" %>
<br><table class="fieldTitleDiv"><tr><td>  
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Days Off</font></td></tr>
</table>  
<br>
<span style="padding-left:5px"></span><asp:Label ID="lblDayOff" runat="server" 
        Text="Type of Days Off" Width="150px"></asp:Label>
        <div class="styled-selectLong">
<asp:DropDownList runat="server" id="ddlDayOff" 
onselectedindexchanged="ddlDayOff_SelectedIndexChanged">
</asp:DropDownList></div>
<br/><br>
<div class="borderTop">
<asp:Button ID="btnAdd" class="addButton" runat="server" Text="Add" Width="80px" onclick="btnAdd_Click" />
<asp:Button ID="btnDelete" runat="server" class="deleteButton" Text="Delete" Width="80px" onclick="btnDelete_Click" />
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
