<%@ Assembly Name="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLaunchUserControl.ascx.cs"
    Inherits="SP2010VisualWebPart.Admin.DashBoard.QuickLaunch.QuickLaunchUserControl" %>
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
        $.plot($("#graph2"), data,
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
<div class="box">
    <div class="head">
        <h1>
            Dashboard</h1>
    </div>
    <div class="inner">
        <fieldset id="panel_resizable_0_6" class="panel_resizable panel-preview" style="height: 90.8px;
            width: <%= this.quickLaunchWidth %>px;">
            <legend>Quick Launch</legend>
            <div id="dashboard-quick-launch-panel-container">
                <div id="dashboard-quick-launch-panel-menu_holder">
                    <table class="quickLaungeContainer">
                        <tr>
                            <td>
                                <div class="quickLaunge">
                                    <a href="<%= this.assignLeave %>" target="_self">
                                        <img alt="Apply Leave" src="/_layouts/Images/21_2_ob/ApplyLeave.png" />
                                        <span class="quickLinkText">
                                            <asp:Label ID="lblAssignLeave" runat="server" Text="Assign Leave"></asp:Label></span>
                                    </a>
                                </div>
                            </td>
                            <asp:Panel ID="pnlLeaveList" runat="server">
                                <td>
                                    <div class="quickLaunge">
                                        <a href="<%= this.leaveList %>" target="_self">
                                            <img alt="My Leave" src="/_layouts/Images/21_2_ob/MyLeave.png" />
                                            <span class="quickLinkText">
                                                <asp:Label ID="lblLeaveList" runat="server" Text="Leave List"></asp:Label></span>
                                        </a>
                                    </div>
                                </td>
                            </asp:Panel>
                            <td>
                                <div class="quickLaunge">
                                    <a href="<%= this.timeSheet %>" target="_self">
                                        <img alt="My Timesheet" src="/_layouts/Images/21_2_ob/MyTimesheet.png" />
                                        <span class="quickLinkText">
                                            <asp:Label ID="lblTimesheet" runat="server" Text="Timesheets"></asp:Label></span>
                                    </a>
                                </div>
                            </td>
                            <asp:Panel ID="pnlAttendance" runat="server">
                                <td>
                                    <div class="quickLaunge">
                                        <asp:ImageButton ID="btnInOut" Style="height: 50px; width: 50px;" runat="server"
                                            ImageUrl="/_layouts/Images/21_2_ob/HourGlass.png" OnClick="btnInOut_Click" />
                                        <span class="quickLinkText">
                                            <asp:Label ID="lblAttendance" runat="server" Text="Attendance"></asp:Label></span>
                                    </div>
                                </td>
                            </asp:Panel>
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
                    <asp:Panel ID="pnlCheckPoint" runat="server" Visible="True">
                        <div style="left: 0px;" class="panel_draggable panel-preview" id="Div3">
                            <fieldset id="Fieldset2" class="panel_resizable panel-preview" style="width: 400px;">
                                <legend>Checkpoint<asp:Label ID="lblQuarter" runat="server" Text=""></asp:Label></legend>
                                <div id="graph2" class="graph" <%=this.displayValue %>>
                                </div>
                                <asp:Panel ID="graph1" CssClass="graph" runat="server" Style="height: 100%;">
                                </asp:Panel>
                            </fieldset>
                        </div>
                    </asp:Panel>
                    <div style="left: <%= this.leftWidth %>px;" class="panel_draggable panel-preview"
                        id="Div4">
                        <fieldset id="Fieldset1" class="panel_resizable panel-preview" style="width: 510px;
                            height: 315px;">
                            <legend>Upcoming Deadline Task</legend>
                            <asp:Panel ID="pnlUpcoming" runat="server" Style="height: 100%;">
                            </asp:Panel>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <asp:Panel ID="pnlUser" runat="server" Visible="True">
            <div class="outerbox no-border">
                <div class="maincontent group-wrapper" id="group_2">
                    <div style="height: 280px;" class="panel_wrapper" id="panel_wrapper_2">
                        <div style="top: 13px; left: 0px;" class="panel_draggable panel-preview" id="panel_draggable_2_1">
                            <fieldset style="width: 300px; height: 238px;" class="panel_resizable panel-preview"
                                id="panel_resizable_2_1">
                                <legend>Pending Leave Requests</legend>
                                <asp:Panel ID="pnlLeave" runat="server" Style="height: 100%;">
                                </asp:Panel>
                            </fieldset>
                        </div>
                        <div id="panel_draggable_2_2" class="panel_draggable panel-preview" style="top: 13px;
                            left: 6px;">
                            <fieldset id="panel_resizable_2_2" class="panel_resizable panel-preview" style="width: 300px;
                                height: 237.8px;">
                                <legend>Pending Timesheets</legend>
                                <asp:Panel ID="pnlTime" runat="server" Style="height: 100%;">
                                </asp:Panel>
                            </fieldset>
                        </div>
                        <div id="panel_draggable_2_3" class="panel_draggable panel-preview" style="top: 13px;
                            left: 12px;">
                            <fieldset id="panel_resizable_2_3" class="panel_resizable panel-preview" style="width: 300px;
                                height: 238px;">
                                <legend>Scheduled Interviews</legend>
                                <asp:Panel ID="pnlInterview" runat="server" Style="height: 100%;">
                                </asp:Panel>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</div>
