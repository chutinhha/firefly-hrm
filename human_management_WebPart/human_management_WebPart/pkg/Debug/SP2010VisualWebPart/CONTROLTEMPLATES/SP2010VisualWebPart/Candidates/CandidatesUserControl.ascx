<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CandidatesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Candidates.CandidatesUserControl" %>
<table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd">Candidates</td></tr></table>
							<br />
							<span style="padding-left:5px;"></span><asp:Label runat="server" Text="Job Title" id="lblJobTitle" Width="145px"></asp:Label>
							<asp:DropDownList runat="server" id="ddlJobTitle" Width="120px" Height="20px" 
                                    onselectedindexchanged="ddlJobTitle_SelectedIndexChanged">
							</asp:DropDownList>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Vacancy" id="lblVacancy" Width="120px">
							</asp:Label>
							<asp:DropDownList runat="server" id="ddlVacancy" Width="120px" Height="20px">
							</asp:DropDownList>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Hiring Manager" id="lblHiringManager" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="txtHiringManager" Width="145px" 
                                    ontextchanged="txtHiringManager_TextChanged"></asp:TextBox>
							<br />
							<br />
							<span style="padding-left:5px;"></span><asp:Label runat="server" Text="Candidate Name" id="lblCandidateName" Width="145px"></asp:Label>
							<asp:TextBox runat="server" id="txtCandidateName" Width="115px"></asp:TextBox>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Keywords" id="lblKeyword" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="txtKeyword" Width="115px"></asp:TextBox>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Status" id="lblStatus" Width="120px">
							</asp:Label>
							<asp:DropDownList runat="server" id="ddlStatus" Width="150px" Height="20px">
							</asp:DropDownList>
							    <br />
                                <br />
							<span style="padding-left:5px;"></span><asp:Label runat="server" Text="Method of Application" id="lblApplyMethod" Width="145px"></asp:Label>
							<asp:DropDownList runat="server" id="ddlApplyMethod" Width="120px" Height="20px">
								<asp:ListItem Selected="True">All</asp:ListItem>
								<asp:ListItem>Online</asp:ListItem>
								<asp:ListItem>Manual</asp:ListItem>
							</asp:DropDownList>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Date of Application" id="lblApplyDate" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="txtDateFrom" Width="115px" 
                                    ontextchanged="txtDateFrom_TextChanged"></asp:TextBox>
							    <asp:Button ID="btnDateFrom" runat="server" Text="..." Width="25px" 
                                    onclick="btnDateFrom_Click" style="height: 26px" />
                                <span style="padding-left:50px;"></span><asp:TextBox ID="txtDateTo" 
                                    runat="server" Width="120px"></asp:TextBox>
                                <asp:Button ID="btnDateTo" runat="server" onclick="btnDateTo_Click" Text="..." 
                                    Width="25px" />
                                <br />
                                <span style="padding-left:480px;"></span><asp:Label ID="lblDateFrom" runat="server" 
                                    Text="From" Width="200px" Height="20px"></asp:Label>
							    <asp:Label ID="lblDateTo" runat="server" Text="To"></asp:Label>
							    <br />
                                <asp:Calendar align="center" ID="cldData" runat="server" 
                                    onselectionchanged="cldData_SelectionChanged1" Visible="False"></asp:Calendar>
                                <asp:Calendar align="center" ID="cldData1" runat="server" Visible="False" 
                                    onselectionchanged="cldData1_SelectionChanged"></asp:Calendar>
                                <div class="borderTop">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" 
                                    onclick="btnSearch_Click" />
                                <asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" Text="Reset" 
                                    Width="70px" />
                                    </div>
							</td></tr></table>

<p>
    &nbsp;</p>
<table class="fieldTitleDiv"><tr><td>
	<div class="borderBottom">
    <asp:Button ID="btnAdd" runat="server" Text="Add" Width="70px" 
        onclick="btnAdd_Click" />
    <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="70px" 
        onclick="btnEdit_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="70px" 
        onclick="btnDelete_Click" />
    </div>
    <br />
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
</td></tr></table>
<br><br>
<asp:Label ID="lblError" runat="server" style="color:Red;"></asp:Label>

