<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CandidatesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Candidates.CandidatesUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txtDateFrom").datepicker({
            changeMonth: true,
            changeYear: true
        });
        $("#txtDateTo").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnSearch" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Candidates</font></td></tr></table>
							<br />
							<span style="padding-left:5px;"></span><asp:Label runat="server" Text="Job Title" id="lblJobTitle" Width="145px"></asp:Label>
							<div class="styled-selectShort"><asp:DropDownList runat="server" id="ddlJobTitle" 
                                    onselectedindexchanged="ddlJobTitle_SelectedIndexChanged">
							</asp:DropDownList></div>
							<span style="padding-left:70px;"></span>
							<asp:Label runat="server" Text="Vacancy" id="lblVacancy" Width="120px">
							</asp:Label>
							<div class="styled-selectShort"><asp:DropDownList runat="server" id="ddlVacancy">
							</asp:DropDownList></div>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Hiring Manager" id="lblHiringManager" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="txtHiringManager" Width="145px" 
                                    ontextchanged="txtHiringManager_TextChanged"></asp:TextBox>
							<br />
							<br />
							<span style="padding-left:5px;"></span><asp:Label runat="server" Text="Candidate Name" id="lblCandidateName" Width="145px"></asp:Label>
							<asp:TextBox runat="server" id="txtCandidateName" Width="115px"></asp:TextBox>
							<span style="padding-left:70px;"></span>
							<asp:Label runat="server" Text="Keywords" id="lblKeyword" 
            Width="118px"></asp:Label>
							<asp:TextBox runat="server" id="txtKeyword" Width="115px"></asp:TextBox>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Status" id="lblStatus" Width="120px">
							</asp:Label>
							<div class="styled-selectMedium"><asp:DropDownList runat="server" id="ddlStatus">
							</asp:DropDownList></div>
							    <br />
                                <br />
							<span style="padding-left:5px;"></span><asp:Label runat="server" Text="Method of Application" id="lblApplyMethod" Width="145px"></asp:Label>
							<div class="styled-selectShort"><asp:DropDownList runat="server" id="ddlApplyMethod">
								<asp:ListItem Selected="True">All</asp:ListItem>
								<asp:ListItem>Online</asp:ListItem>
								<asp:ListItem>Manual</asp:ListItem>
							</asp:DropDownList></div>
							<span style="padding-left:70px;"></span>
							<asp:Label runat="server" Text="Apply Date" 
            id="lblApplyDate" Width="120px"></asp:Label>
							<asp:Panel ID="pnlDateFrom" runat="server" style="display:inline;"><input type="text" id="txtDateFrom" name="txtDateFrom" style="width:115px;" value=""/></asp:Panel>
                                <span style="padding-left:40px;"></span><input type="text" id="txtDateTo" name="txtDateTo" style="width:115px;" value=""/></asp:Panel>
                                <br />
                                <span style="padding-left:480px;"></span>
<asp:Label ID="lblDateFrom" runat="server" 
                                    Text="From" Width="170px" Height="20px"></asp:Label>
							    <asp:Label ID="lblDateTo" runat="server" Text="To"></asp:Label>
							    <br />
                                <div class="borderTop">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" 
                                    onclick="btnSearch_Click" class="addButton" />
                                <asp:Button ID="btnReset" class="resetButton" runat="server" onclick="btnReset_Click" Text="Reset" 
                                    Width="70px" />
                                    </div>
							</td></tr></table></asp:Panel>

<p>
    &nbsp;</p>
<table class="fieldTitleDiv"><tr><td>
	<div class="borderBottom">
    <asp:Button ID="btnAdd" runat="server" class="addButton" Text="Add" Width="70px" 
        onclick="btnAdd_Click" />
    <asp:Button ID="btnEdit" class="addButton" runat="server" Text="Edit" Width="70px" 
        onclick="btnEdit_Click" />
    <asp:Button ID="btnDelete" class="deleteButton" runat="server" Text="Delete" Width="70px" 
        onclick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete ?')"/>
    </div>
    <br />
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
    </asp:GridView><table><tr><td></td></tr></table>
</td></tr></table>
<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>

