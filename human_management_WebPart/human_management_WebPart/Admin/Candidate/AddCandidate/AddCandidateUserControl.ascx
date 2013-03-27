<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCandidateUserControl.ascx.cs" Inherits="SP2010VisualWebPart.AddCandidate.AddCandidateUserControl" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
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
</script>
<br><asp:Panel ID="Panel1" runat="server" 
       DefaultButton="btnSave" Width="100%" ><table class="fieldTitleDiv" cellpadding="0"><tr><td>
<table class="fieldTitleTable">
<tr><td class="fieldTitleTd"><font color="white">Add Candidate</font></td></tr></table><br>
<span style="padding-left:5px;"></span><asp:Label ID="lblFullName" runat="server" Text="Full Name(*)" Width="120px"></asp:Label>
<asp:TextBox ID="txtFullName" runat="server" Width="200px"></asp:TextBox>
<span style="padding-left:100px;"></span><asp:Label ID="lblAddress" runat="server" 
    Text="Address Street" Width="120px"></asp:Label>

<asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
<p>
    &nbsp;</p>
<p>
    <span style="padding-left:5px;"></span><asp:Label ID="lblCity" runat="server" Text="City" Width="120px"></asp:Label>
    <asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox>
    <span style="padding-left:100px;"></span><asp:Label ID="lblState" runat="server" 
        Text="State" Width="120px"></asp:Label>
    <asp:TextBox ID="txtState" runat="server" Width="200px"></asp:TextBox>
</p>
<p>
    &nbsp;</p>

    <span style="padding-left:5px;"></span><asp:Label ID="lblZipCode" runat="server" Text="Zip Code" Width="120px"></asp:Label>
    <asp:TextBox ID="txtZipCode" runat="server" Width="200px"></asp:TextBox>
    <span style="padding-left:100px;"></span><asp:Label ID="lblCountry" runat="server" Text="Country" Width="120px"></asp:Label>
    <div class="styled-selectLong">
        <asp:DropDownList ID="ddlCountry" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList></div>
    <p>
        &nbsp;</p>
    <p>
        <span style="padding-left:5px;"></span>
        <asp:Label ID="lblHomePhone" runat="server" Text="Home Phone" Width="120px"></asp:Label>
        <asp:TextBox ID="txtHomePhone" runat="server" Width="200px"></asp:TextBox>
        <span style="padding-left:100px;"></span>
        <asp:Label ID="lblMobile" runat="server" Text="Mobile" Width="120px"></asp:Label>
        <asp:TextBox ID="txtMobile" runat="server" Width="200px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <span style="padding-left:5px;"></span>
        <asp:Label ID="lblWorkPhone" runat="server" Text="Work Phone" Width="120px"></asp:Label>
        <asp:TextBox ID="txtWorkPhone" runat="server" Width="200px"></asp:TextBox>
        <span style="padding-left:100px;"></span>
        <asp:Label ID="lblEmail" runat="server" Text="Email(*)" Width="120px"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
        <span style="padding-left:5px;"></span>
        <asp:Label ID="lblVacancy" runat="server" Text="Job Vacancy" Width="120px"></asp:Label>
        <div class="styled-selectLong">
            <asp:DropDownList ID="ddlVacancy" runat="server">
            </asp:DropDownList>
        </div>
        <span style="padding-left:100px;"></span>
        <asp:Label ID="lblKeyword" runat="server" Text="Keywords" Width="120px"></asp:Label>
        <asp:TextBox ID="txtKeyword" runat="server" Width="200px"></asp:TextBox>
        <p>
            &nbsp;</p>
    
            <span style="padding-left:5px;"></span>
            <asp:Label ID="lblJobTitle" runat="server" Text="Job Title" Width="120px"></asp:Label>
            <div class="styled-selectLong">
                <asp:DropDownList ID="ddlJobTitle" runat="server">
                </asp:DropDownList>
            </div>
            <span style="padding-left:100px;"></span>
            <asp:Label ID="lblHiringManager" runat="server" Text="Hiring Manager" 
                Width="120px"></asp:Label>
            <asp:TextBox ID="txtHiringManager" runat="server" Width="200px"></asp:TextBox>
            <p>
                &nbsp;</p>
        
                <span style="padding-left:5px;"></span>
                <asp:Label ID="lblStatus" runat="server" Text="Status" Width="120px"></asp:Label>
                <div class="styled-selectLong">
                    <asp:DropDownList ID="ddlStatus" runat="server">
                    </asp:DropDownList>
                </div>
                <span style="padding-left:100px;"></span>
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
                <span style="padding-left:5px;"></span>
                <asp:Label ID="lblApplyDate" runat="server" Text="Apply Date" Width="120px"></asp:Label>
                <asp:Panel ID="pnlApplyDate" runat="server" style="display:inline;">
                    <input type="text" id="txtApplyDate" name="txtApplyDate" size="30" value=""/>
                </asp:Panel>
                &nbsp;<p>
                </p>
                <br>
                    <span style="padding-left:5px;"></span><asp:Label ID="lblInterviewDate" runat="server" Text="Interview Date" 
                        Width="120px"></asp:Label>
                    <asp:Panel ID="pnlInterview" runat="server" style="display:inline;">
                    <input type="text" id="txtInterviewDate" name="txtInterviewDate" size="30" value=""/>
                </asp:Panel>
                <span style="padding-left:100px;"></span>
                <asp:Label ID="lblInterviewTime" runat="server" Text="Time" 
            Width="120px"></asp:Label>
        <asp:TextBox ID="txtInterviewTime" runat="server" Width="200px"></asp:TextBox>
        <p>
            &nbsp;</p>
        <p>
            <br><span style="padding-left:5px;"></span>
            <asp:Label ID="lblComment" runat="server" Text="Comment" valign="top" 
                Width="120px"></asp:Label>
            <br></br>
            </br>
        </p>
        <span style="padding-left:130px;"></span>
        <asp:TextBox ID="txtComment" runat="server" Height="100px" TextMode="MultiLine" 
            Width="650px"></asp:TextBox>
                <br>
                <br>
                <div class="borderTop">
                    <span style="padding-left:130px;"></span>
                    <asp:Button ID="btnSave" runat="server" class="addButton" 
                        onclick="btnSave_Click" 
                        OnClientClick="return confirm('Are you sure you want to save ?')" Text="Save" 
                        Width="80px" />
                    <asp:Button ID="btnCancel" runat="server" class="resetButton" 
                        onclick="btnCancel_Click" Text="Cancel" Width="80px" />
                </div>
                
        </td></tr></table></asp:Panel>
<p>
    <asp:Label ID="lblError" runat="server" style="color:red;"></asp:Label>
</p>




