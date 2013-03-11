<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CandidatesUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Candidates.CandidatesUserControl" %>
<div>
							<fieldset name="Group1">
							<legend width="100%" style="background-color: #FF6600; color: #FFFF00;">
							Candidates</legend>
							<br />
							<asp:Label runat="server" Text="Job Title" id="Label1" Width="145px"></asp:Label>
							<asp:DropDownList runat="server" id="DropDownList1" Width="120px" Height="20px" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
							</asp:DropDownList>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Vacancy" id="Label2" Width="120px">
							</asp:Label>
							<asp:DropDownList runat="server" id="DropDownList2" Width="120px" Height="20px">
							</asp:DropDownList>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Hiring Manager" id="Label3" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="TextBox1" Width="145px" 
                                    ontextchanged="TextBox1_TextChanged"></asp:TextBox>
							<br />
							<br />
							<asp:Label runat="server" Text="Candidate Name" id="Label4" Width="145px"></asp:Label>
							<asp:TextBox runat="server" id="TextBox2" Width="115px"></asp:TextBox>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Keywords" id="Label5" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="TextBox3" Width="115px"></asp:TextBox>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Status" id="Label6" Width="120px">
							</asp:Label>
							<asp:DropDownList runat="server" id="DropDownList3" Width="150px" Height="20px">
							</asp:DropDownList>
							    <br />
                                <br />
							<asp:Label runat="server" Text="Method of Application" id="Label7" Width="145px"></asp:Label>
							<asp:DropDownList runat="server" id="DropDownList4" Width="120px" Height="20px">
								<asp:ListItem Selected="True">All</asp:ListItem>
								<asp:ListItem>Online</asp:ListItem>
								<asp:ListItem>Manual</asp:ListItem>
							</asp:DropDownList>
							<span style="padding-left:80px;"></span>
							<asp:Label runat="server" Text="Date of Application" id="Label8" Width="120px">
							</asp:Label>
							<asp:TextBox runat="server" id="TextBox4" Width="115px" 
                                    ontextchanged="TextBox4_TextChanged"></asp:TextBox>
							    <asp:Button ID="Button5" runat="server" Text="..." Width="25px" 
                                    onclick="Button5_Click" style="height: 26px" />
                                <span style="padding-left:50px;"></span><asp:TextBox ID="TextBox5" 
                                    runat="server" Width="120px"></asp:TextBox>
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="..." 
                                    Width="25px" />
                                <br />
                                <span style="padding-left:480px;"></span><asp:Label ID="Label9" runat="server" 
                                    Text="From" Width="195px"></asp:Label>
							    <asp:Label ID="Label10" runat="server" Text="To"></asp:Label>
							    <br />
                                <asp:Calendar align="center" ID="Calendar1" runat="server" 
                                    onselectionchanged="Calendar1_SelectionChanged1" Visible="False"></asp:Calendar>
                                <asp:Calendar align="center" ID="Calendar2" runat="server" Visible="False" 
                                    onselectionchanged="Calendar2_SelectionChanged"></asp:Calendar>
                                <asp:Button ID="Button3" runat="server" Text="Search" Width="70px" 
                                    onclick="Button3_Click" />
                                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Reset" 
                                    Width="70px" />
                                <br />
							</fieldset></div>

<p>
    &nbsp;</p>
<div>
<fieldset name="Group2">
	
    <asp:Button ID="Button6" runat="server" Text="Add" Width="70px" 
        onclick="Button6_Click" />
    <asp:Button ID="Button7" runat="server" Text="Edit" Width="70px" 
        onclick="Button7_Click" />
    <asp:Button ID="Button8" runat="server" Text="Delete" Width="70px" 
        onclick="Button8_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" align="right" runat="server" EnableModelValidation="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        Width="100%">
    <Columns>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                  </Columns>
    </asp:GridView>
	
</fieldset>
</div>
