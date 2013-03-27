<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLaunchUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.DashBoard.QuickLaunch.QuickLaunchUserControl" %>

    <script language="javascript" type="text/javascript" src="/_layouts/STYLES/human_management/jquery.js"></script>
	<script language="javascript" type="text/javascript" src="/_layouts/STYLES/human_management/jquery.flot.js"></script>
    <script language="javascript" type="text/javascript" src="/_layouts/STYLES/human_management/jquery.flot.pie.js"></script>
<script type="text/javascript">
    $(function () {
        var data = [];
        var average = "<%= this.inputValue %>".split(";");
        var title = "<%= this.inputTitle %>".split(";");
        for (var i = 0; i < title.length; i++) {
            data[i] = { label: title[i], data: parseInt(average[i]) }
        }
        // GRAPH 1
        $.plot($("#graph1"), data,
	{
	    series: {
	        pie: {
	            show: true
	        }
	    },
	    legend: {
	        show: false
	    }
	});

    });
</script>
	<style type="text/css">
		div.graph
		{
			width: 400px;
			height: 300px;
			float: left;
		}
    .panel_resizable
    {
        border: 2px solid #378DE5;
        margin: 0;
        overflow: hidden !important; 
    }
    .panel-preview
    {
        cursor: auto !important;
    }
    fieldset.panel_resizable legend
    {
        color: forestgreen;
            font-size: 14px;
    font-weight: bold;
    margin-left: 10px;
    }
    .quickLinkText{
        display: block;
        text-align: center;
        color: black;
        font-weight:bold;
        font-size: 12px;
    }
    a:active{
        text-decoration: none;
    }
    a:link{
        text-decoration: none;
    }
    a:visited{
        text-decoration: none;
    }
    a:hover{
        text-decoration: none;
    }
    div.quickLaunge{
        width: 100px;
        height: 80px;
        vertical-align:middle; 
        text-align:center
    }
    div.quickLaunge img{
        width: 50px;
        height: 50px;
    }
    table.quickLaungeContainer{
        width: auto;
    }
    
.box {
    margin: 20px;
    position: relative;
}

.box .head {
    position: relative;
}
.box .inner
{
        -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: none repeat scroll 0 0 #F7F6F6;
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
    border-color: -moz-use-text-color #DEDEDE #DEDEDE;
    border-image: none;
    border-right: 1px solid #DEDEDE;
    border-style: none solid solid;
    border-width: medium 1px 1px;
    margin-bottom: 19px;
    overflow: hidden;
    padding: 15px;
    
      border-bottom-color:#DEDEDE;
  border-bottom-width:1px;
  border-left-color:#DEDEDE;
  border-left-width:1px;
  border-right-color:#DEDEDE;
  border-right-width:1px;
}
.box .head h1
{
        background: url("/_layouts/Images/21_2_ob/h1-bg.png") repeat-x scroll left bottom #F3F3F3;
    border: 1px solid #DEDEDE;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    color: #5D5D5D;
    font-size: 15px;
    line-height: 20px;
    padding: 9px 15px;
}
.no-border .maincontent
{
    border: medium none !important;
}
.panel_wrapper
{
    overflow: hidden !important;
}
.panel_draggable
{
        cursor: move;
    display: block;
    float: left;
    margin: 0;
    padding: 0;
    position: relative !important;
}
.panel-preview
{
    cursor: auto !important;
}
table.table
{
        border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
}
table tbody tr.odd td
{
    background-color: #EAEAEA;
}
table.table td
{
        background: none repeat scroll 0 0 #FFFFFF;
    line-height: 20px;
    padding: 7px;
}
table tbody tr.total td
{
        background-color: #555657;
    color: #FFFFFF;
}

    table.quickLaungeContainer{
        width: auto;
    }
    div.quickLaunge{
        width: 100px;
        height: 80px;
        vertical-align:middle; 
        text-align:center
    }
    a:link{
        text-decoration: none;
    }
    div.quickLaunge img{
        width: 50px;
        height: 50px;
    }
    .quickLinkText{
        display: block;
        text-align: center;
        color: black;
        font-weight:bold;
    }
    </style>


    <div class="box">
    <div class="head">
        <h1>Dashboard</h1>
    </div>
    <div class="inner">
<fieldset id="panel_resizable_0_6" class="panel_resizable panel-preview" 
    style="width:autopx; height:90.8px;width:300px; ">
    <legend>Quick Launch</legend>
    <div id="dashboard-quick-launch-panel-container">
        <div id="dashboard-quick-launch-panel-menu_holder">
            <table class="quickLaungeContainer">
                <tr>
                    <td>
                        <div class="quickLaunge">
                            <a href="" target="_self">
                            <img src="/_layouts/Images/21_2_ob/ApplyLeave.png" />
                            <span class="quickLinkText">Assign Leave</span> </a>
                        </div>
                    </td>
                    <td>
                        <div class="quickLaunge">
                            <a href="" target="_self">
                            <img src="/_layouts/Images/21_2_ob/MyLeave.png" />
                            <span class="quickLinkText">Leave List</span> </a>
                        </div>
                    </td>
                    <td>
                        <div class="quickLaunge">
                            <a href="" 
                                target="_self">
                            <img src="/_layouts/Images/21_2_ob/MyTimesheet.png" />
                            <span class="quickLinkText">Timesheets</span> </a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</fieldset>
        <br />
        <br />
        <div class="outerbox no-border">
<div class="maincontent group-wrapper" id="Div1">
<div class="panel_wrapper" id="Div2">
    <div style="left:0px; 2px; 2px;" class="panel_draggable panel-preview" id="Div3">
        <fieldset id="Fieldset2" class="panel_resizable panel-preview" 
    style="width:autopx;width:400px; ">
    <legend>Checkpoint<asp:Label ID="lblQuarter" runat="server" Text=""></asp:Label></legend>
<div id="graph1" class="graph"></div>
</fieldset>
    </div>
    <div style="left:6px; 2px; 2px;" class="panel_draggable panel-preview" id="Div4">
        <fieldset id="Fieldset1" class="panel_resizable panel-preview" 
    style="width:autopx;width:510px;height: 315px; ">
    <legend>Upcoming Deadline Task</legend>
    <asp:Panel ID="pnlUpcoming" runat="server" style="height:100%;">
        </asp:Panel>
</fieldset>
    </div>
</div></div></div>
<br>
<div class="outerbox no-border">
<div class="maincontent group-wrapper" id="group_2">
<div style="height:280px;" class="panel_wrapper" id="panel_wrapper_2">
    <div style="top:13px; left:0px; 2px; 2px;" class="panel_draggable panel-preview" id="panel_draggable_2_1">
        <fieldset style="width:300px; height:238px; " class="panel_resizable panel-preview" id="panel_resizable_2_1">
              <legend>Pending Leave Requests</legend>
        <asp:Panel ID="pnlLeave" runat="server" style="height:100%;">
        </asp:Panel>
    </fieldset>
    </div>
    <div id="panel_draggable_2_2" class="panel_draggable panel-preview" style="top:13px; left:6px; 2px; 2px;">
        <fieldset id="panel_resizable_2_2" class="panel_resizable panel-preview" style="width:300px; height:237.8px; ">
            <legend>Pending Timesheets</legend>
        <asp:Panel ID="pnlTime" runat="server" style="height:100%;">
        </asp:Panel>
    </fieldset>
    </div>
    <div id="panel_draggable_2_3" class="panel_draggable panel-preview" style="top:13px; left:12px; 2px; 2px;">
                                <fieldset id="panel_resizable_2_3" class="panel_resizable panel-preview" style="width:300px; height:238px; ">
                                    <legend>Scheduled Interviews</legend>
                                    <asp:Panel ID="pnlInterview" runat="server" style="height:100%;">
        </asp:Panel>
    </fieldset>
    </div>
</div></div></div>
