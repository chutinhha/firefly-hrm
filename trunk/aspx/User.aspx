<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="/_catalogs/masterpage/MasterPage/Member.master" meta:progid="SharePoint.WebPartPage.Document"       %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="QuickLaunch" namespace="SP2010VisualWebPart.Admin.DashBoard.QuickLaunch" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
	<SharePoint:UIVersionedContent runat="server" UIVersion="3" Id="PlaceHolderWebDescription" __designer:Preview="" __designer:Values="&lt;P N='InDesign' T='False' /&gt;&lt;P N='ID' ID='1' T='PlaceHolderWebDescription' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;">
		<ContentTemplate>
			<div class="ms-webpartpagedescription"><SharePoint:ProjectProperty Property="Description" runat="server"/></div>
		</ContentTemplate>
	</SharePoint:UIVersionedContent>
	<asp:UpdatePanel
		   id="updatePanel"
		   runat="server"
		   UpdateMode="Conditional"
		   ChildrenAsTriggers="false">
		<ContentTemplate>
			<SharePoint:VersionedPlaceHolder UIVersion="4" runat="server" __designer:Preview="&lt;Regions&gt;&lt;Region Name=&quot;0&quot; Editable=&quot;True&quot; Content=&quot;&amp;#xD;&amp;#xA;				&amp;lt;SharePoint:SPRibbonButton&amp;#xD;&amp;#xA;					id=&amp;quot;btnWikiEdit&amp;quot;&amp;#xD;&amp;#xA;					RibbonCommand=&amp;quot;Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit&amp;quot;&amp;#xD;&amp;#xA;					runat=&amp;quot;server&amp;quot;&amp;#xD;&amp;#xA;				    Text=&amp;quot;edit&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;div style='display:none'&amp;amp;gt;&amp;amp;lt;input type=&amp;amp;quot;submit&amp;amp;quot; name=&amp;amp;quot;btnWikiEdit&amp;amp;quot; value=&amp;amp;quot;edit&amp;amp;quot; id=&amp;amp;quot;btnWikiEdit&amp;amp;quot; /&amp;amp;gt;&amp;amp;lt;/div&amp;amp;gt;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N='ID' ID='1' T='btnWikiEdit' /&amp;amp;gt;&amp;amp;lt;P N='RibbonCommand' T='Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit' /&amp;amp;gt;&amp;amp;lt;P N='Text' T='edit' /&amp;amp;gt;&amp;amp;lt;P N='Page' ID='2' /&amp;amp;gt;&amp;amp;lt;P N='TemplateControl' R='2' /&amp;amp;gt;&amp;amp;lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;				&amp;lt;SharePoint:SPRibbonButton&amp;#xD;&amp;#xA;					id=&amp;quot;btnWikiSave&amp;quot;&amp;#xD;&amp;#xA;					RibbonCommand=&amp;quot;Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop&amp;quot;&amp;#xD;&amp;#xA;					runat=&amp;quot;server&amp;quot;&amp;#xD;&amp;#xA;				    Text=&amp;quot;edit&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;div style='display:none'&amp;amp;gt;&amp;amp;lt;input type=&amp;amp;quot;submit&amp;amp;quot; name=&amp;amp;quot;btnWikiSave&amp;amp;quot; value=&amp;amp;quot;edit&amp;amp;quot; id=&amp;amp;quot;btnWikiSave&amp;amp;quot; /&amp;amp;gt;&amp;amp;lt;/div&amp;amp;gt;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N='ID' ID='1' T='btnWikiSave' /&amp;amp;gt;&amp;amp;lt;P N='RibbonCommand' T='Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop' /&amp;amp;gt;&amp;amp;lt;P N='Text' T='edit' /&amp;amp;gt;&amp;amp;lt;P N='Page' ID='2' /&amp;amp;gt;&amp;amp;lt;P N='TemplateControl' R='2' /&amp;amp;gt;&amp;amp;lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;				&amp;lt;SharePoint:SPRibbonButton&amp;#xD;&amp;#xA;					id=&amp;quot;btnWikiRevert&amp;quot;&amp;#xD;&amp;#xA;					RibbonCommand=&amp;quot;Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert&amp;quot;&amp;#xD;&amp;#xA;				    runat=&amp;quot;server&amp;quot;&amp;#xD;&amp;#xA;					Text=&amp;quot;Revert&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;div style='display:none'&amp;amp;gt;&amp;amp;lt;input type=&amp;amp;quot;submit&amp;amp;quot; name=&amp;amp;quot;btnWikiRevert&amp;amp;quot; value=&amp;amp;quot;Revert&amp;amp;quot; id=&amp;amp;quot;btnWikiRevert&amp;amp;quot; /&amp;amp;gt;&amp;amp;lt;/div&amp;amp;gt;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N='ID' ID='1' T='btnWikiRevert' /&amp;amp;gt;&amp;amp;lt;P N='RibbonCommand' T='Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert' /&amp;amp;gt;&amp;amp;lt;P N='Text' T='Revert' /&amp;amp;gt;&amp;amp;lt;P N='Page' ID='2' /&amp;amp;gt;&amp;amp;lt;P N='TemplateControl' R='2' /&amp;amp;gt;&amp;amp;lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;			&quot; /&gt;&lt;/Regions&gt;&lt;div height=&quot;&quot; width=&quot;&quot; style=&quot;&quot; _designerRegion=0&gt;&lt;/div&gt;" __designer:Values="&lt;P N='UIVersion' T='4' /&gt;&lt;P N='Visible' T='True' /&gt;&lt;P N='ID' ID='1' T='ctl00' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;">
				<SharePoint:SPRibbonButton
					id="btnWikiEdit"
					RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit"
					runat="server"
				    Text="edit"/>
				<SharePoint:SPRibbonButton
					id="btnWikiSave"
					RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop"
					runat="server"
				    Text="edit"/>
				<SharePoint:SPRibbonButton
					id="btnWikiRevert"
					RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert"
				    runat="server"
					Text="Revert"/>
			</SharePoint:VersionedPlaceHolder>
			<SharePoint:EmbeddedFormField id="WikiField" FieldName="WikiField" ControlMode="Display" runat="server"></SharePoint:EmbeddedFormField>
			<WebPartPages:WebPartZone runat="server" ID="Bottom" Title="loc:Bottom" __designer:Preview="&lt;Regions&gt;&lt;Region Name=&quot;0&quot; Editable=&quot;True&quot; Content=&quot;&quot; NamingContainer=&quot;True&quot; /&gt;&lt;/Regions&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; border=&quot;0&quot; id=&quot;Bottom&quot;&gt;
	&lt;tr&gt;
		&lt;td style=&quot;white-space:nowrap;&quot;&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;2&quot; border=&quot;0&quot; style=&quot;width:100%;&quot;&gt;
			&lt;tr&gt;
				&lt;td style=&quot;white-space:nowrap;&quot;&gt;Bottom&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td style=&quot;height:100%;&quot;&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;2&quot; border=&quot;0&quot; style=&quot;border-color:Gray;border-width:1px;border-style:Solid;width:100%;height:100%;&quot;&gt;
			&lt;tr valign=&quot;top&quot;&gt;
				&lt;td _designerRegion=&quot;0&quot;&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;2&quot; border=&quot;0&quot; style=&quot;width:100%;&quot;&gt;
					&lt;tr&gt;
						&lt;td style=&quot;height:100%;&quot;&gt;&lt;/td&gt;
					&lt;/tr&gt;
				&lt;/table&gt;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='Bottom' /&gt;&lt;P N='HeaderText' T='loc:Bottom' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_642fb576_b43f_41a1_bfb0_dd9c1294faf0" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_642fb576_b43f_41a1_bfb0_dd9c1294faf0' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartBottom_g_642fb576_b43f_41a1_bfb0_dd9c1294faf0&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;Bottom_g_642fb576_b43f_41a1_bfb0_dd9c1294faf0&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{642FB576-B43F-41A1-BFB0-DD9C1294FAF0}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<QuickLaunch:QuickLaunch runat="server" ID="g_74de977e_903d_4fa4_a730_ce7ab230184a" Description="QuickLaunch" ChromeType="None" Title="QuickLaunch" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='QuickLaunch' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_74de977e_903d_4fa4_a730_ce7ab230184a' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartBottom_g_74de977e_903d_4fa4_a730_ce7ab230184a&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a&quot;&gt;
	
&lt;script language=&quot;javascript&quot; type=&quot;text/javascript&quot; src=&quot;/_layouts/STYLES/human_management/jquery.js&quot;&gt;&lt;/script&gt;
&lt;script language=&quot;javascript&quot; type=&quot;text/javascript&quot; src=&quot;/_layouts/STYLES/human_management/jquery.flot.js&quot;&gt;&lt;/script&gt;
&lt;script language=&quot;javascript&quot; type=&quot;text/javascript&quot; src=&quot;/_layouts/STYLES/human_management/jquery.flot.pie.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot;&gt;
    $(function () {
        var data = [];
        var average = &quot;&quot;.split(&quot;;&quot;);
        var title = &quot;&quot;.split(&quot;;&quot;);
        for (var i = 0; i &lt; title.length; i++) {
            data[i] = { label: title[i], data: parseInt(average[i]) }
        }
        // GRAPH 1
        $.plot($(&quot;#graph2&quot;), data,
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
&lt;/script&gt;
&lt;div class=&quot;box&quot;&gt;
    &lt;div class=&quot;head&quot;&gt;
        &lt;h1&gt;
            Dashboard&lt;/h1&gt;
    &lt;/div&gt;
    &lt;div class=&quot;inner&quot;&gt;
        &lt;fieldset id=&quot;panel_resizable_0_6&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;height: 90.8px;
            width: 0px;&quot;&gt;
            &lt;legend&gt;Quick Launch&lt;/legend&gt;
            &lt;div id=&quot;dashboard-quick-launch-panel-container&quot;&gt;
                &lt;div id=&quot;dashboard-quick-launch-panel-menu_holder&quot;&gt;
                    &lt;table class=&quot;quickLaungeContainer&quot;&gt;
                        &lt;tr&gt;
                            &lt;td&gt;
                                &lt;div class=&quot;quickLaunge&quot;&gt;
                                    &lt;a href=&quot;&quot; target=&quot;_self&quot;&gt;
                                        &lt;img alt=&quot;Apply Leave&quot; src=&quot;/_layouts/Images/21_2_ob/ApplyLeave.png&quot; /&gt;
                                        &lt;span class=&quot;quickLinkText&quot;&gt;
                                            &lt;span id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_lblAssignLeave&quot;&gt;Assign Leave&lt;/span&gt;&lt;/span&gt;
                                    &lt;/a&gt;
                                &lt;/div&gt;
                            &lt;/td&gt;
                            &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlLeaveList&quot;&gt;
		
                                &lt;td&gt;
                                    &lt;div class=&quot;quickLaunge&quot;&gt;
                                        &lt;a href=&quot;&quot; target=&quot;_self&quot;&gt;
                                            &lt;img alt=&quot;My Leave&quot; src=&quot;/_layouts/Images/21_2_ob/MyLeave.png&quot; /&gt;
                                            &lt;span class=&quot;quickLinkText&quot;&gt;
                                                &lt;span id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_lblLeaveList&quot;&gt;Leave List&lt;/span&gt;&lt;/span&gt;
                                        &lt;/a&gt;
                                    &lt;/div&gt;
                                &lt;/td&gt;
                            
	&lt;/div&gt;
                            &lt;td&gt;
                                &lt;div class=&quot;quickLaunge&quot;&gt;
                                    &lt;a href=&quot;&quot; target=&quot;_self&quot;&gt;
                                        &lt;img alt=&quot;My Timesheet&quot; src=&quot;/_layouts/Images/21_2_ob/MyTimesheet.png&quot; /&gt;
                                        &lt;span class=&quot;quickLinkText&quot;&gt;
                                            &lt;span id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_lblTimesheet&quot;&gt;Timesheets&lt;/span&gt;&lt;/span&gt;
                                    &lt;/a&gt;
                                &lt;/div&gt;
                            &lt;/td&gt;
                            &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlAttendance&quot;&gt;
		
                                &lt;td&gt;
                                    &lt;div class=&quot;quickLaunge&quot;&gt;
                                        &lt;a href=&quot;&quot; target=&quot;_self&quot;&gt;
                                            &lt;img alt=&quot;Hour Glass&quot; src=&quot;/_layouts/Images/21_2_ob/HourGlass.png&quot; /&gt;
                                            &lt;span class=&quot;quickLinkText&quot;&gt;
                                                &lt;span id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_lblAttendance&quot;&gt;Attendance&lt;/span&gt;&lt;/span&gt;
                                        &lt;/a&gt;
                                    &lt;/div&gt;
                                &lt;/td&gt;
                            
	&lt;/div&gt;
                        &lt;/tr&gt;
                    &lt;/table&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/fieldset&gt;
        &lt;br /&gt;
        &lt;br /&gt;
        &lt;div class=&quot;outerbox no-border&quot;&gt;
            &lt;div class=&quot;maincontent group-wrapper&quot; id=&quot;Div1&quot;&gt;
                &lt;div class=&quot;panel_wrapper&quot; id=&quot;Div2&quot;&gt;
                    &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlCheckPoint&quot;&gt;
		
                        &lt;div style=&quot;left: 0px;&quot; class=&quot;panel_draggable panel-preview&quot; id=&quot;Div3&quot;&gt;
                            &lt;fieldset id=&quot;Fieldset2&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;width: 400px;&quot;&gt;
                                &lt;legend&gt;Checkpoint&lt;span id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_lblQuarter&quot;&gt;&lt;/span&gt;&lt;/legend&gt;
                                &lt;div id=&quot;graph2&quot; class=&quot;graph&quot; &gt;
                                &lt;/div&gt;
                                &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_graph1&quot; class=&quot;graph&quot; style=&quot;height: 100%;&quot;&gt;
			
                                
		&lt;/div&gt;
                            &lt;/fieldset&gt;
                        &lt;/div&gt;
                    
	&lt;/div&gt;
                    &lt;div style=&quot;left: 0px;&quot; class=&quot;panel_draggable panel-preview&quot;
                        id=&quot;Div4&quot;&gt;
                        &lt;fieldset id=&quot;Fieldset1&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;width: 510px;
                            height: 315px;&quot;&gt;
                            &lt;legend&gt;Upcoming Deadline Task&lt;/legend&gt;
                            &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlUpcoming&quot; style=&quot;height: 100%;&quot;&gt;
		
                            
	&lt;/div&gt;
                        &lt;/fieldset&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;br /&gt;
        &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlUser&quot;&gt;
		
            &lt;div class=&quot;outerbox no-border&quot;&gt;
                &lt;div class=&quot;maincontent group-wrapper&quot; id=&quot;group_2&quot;&gt;
                    &lt;div style=&quot;height: 280px;&quot; class=&quot;panel_wrapper&quot; id=&quot;panel_wrapper_2&quot;&gt;
                        &lt;div style=&quot;top: 13px; left: 0px;&quot; class=&quot;panel_draggable panel-preview&quot; id=&quot;panel_draggable_2_1&quot;&gt;
                            &lt;fieldset style=&quot;width: 300px; height: 238px;&quot; class=&quot;panel_resizable panel-preview&quot;
                                id=&quot;panel_resizable_2_1&quot;&gt;
                                &lt;legend&gt;Pending Leave Requests&lt;/legend&gt;
                                &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlLeave&quot; style=&quot;height: 100%;&quot;&gt;
			
                                
		&lt;/div&gt;
                            &lt;/fieldset&gt;
                        &lt;/div&gt;
                        &lt;div id=&quot;panel_draggable_2_2&quot; class=&quot;panel_draggable panel-preview&quot; style=&quot;top: 13px;
                            left: 6px;&quot;&gt;
                            &lt;fieldset id=&quot;panel_resizable_2_2&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;width: 300px;
                                height: 237.8px;&quot;&gt;
                                &lt;legend&gt;Pending Timesheets&lt;/legend&gt;
                                &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlTime&quot; style=&quot;height: 100%;&quot;&gt;
			
                                
		&lt;/div&gt;
                            &lt;/fieldset&gt;
                        &lt;/div&gt;
                        &lt;div id=&quot;panel_draggable_2_3&quot; class=&quot;panel_draggable panel-preview&quot; style=&quot;top: 13px;
                            left: 12px;&quot;&gt;
                            &lt;fieldset id=&quot;panel_resizable_2_3&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;width: 300px;
                                height: 238px;&quot;&gt;
                                &lt;legend&gt;Scheduled Interviews&lt;/legend&gt;
                                &lt;div id=&quot;Bottom_g_74de977e_903d_4fa4_a730_ce7ab230184a_ctl00_pnlInterview&quot; style=&quot;height: 100%;&quot;&gt;
			
                                
		&lt;/div&gt;
                            &lt;/fieldset&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        
	&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{74DE977E-903D-4FA4-A730-CE7AB230184A}" WebPart="true" __designer:IsClosed="false"></QuickLaunch:QuickLaunch>

</ZoneTemplate></WebPartPages:WebPartZone>
	</ContentTemplate>
	<Triggers>
	    <asp:PostBackTrigger ControlID="WikiField" />
	    <asp:PostBackTrigger ControlID="btnWikiRevert" />
	    <asp:PostBackTrigger ControlID="btnWikiSave" />
	</Triggers>
 </asp:UpdatePanel>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{be49f9de-5754-4e7c-a807-83576d4b69a8}" WebPart="true" __designer:IsClosed="false" id="g_be49f9de_5754_4e7c_a807_83576d4b69a8" __designer:Preview="&lt;div id=&quot;g_be49f9de_5754_4e7c_a807_83576d4b69a8&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{be49f9de-5754-4e7c-a807-83576d4b69a8}&quot; WebPart=&quot;true&quot;&gt;
	&lt;link id=&quot;CssRegistration0&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;/_layouts/STYLES/human_management/menuStyles.css&quot;/&gt;

&lt;script language=&quot;javascript&quot; type=&quot;text/javascript&quot;&gt;
    ExecuteOrDelayUntilScriptLoaded(showNotif, 'sp.js');
    var statusID;
    function showNotif() {
        var value = &quot;&quot;.split(&quot;;&quot;);
        for (i = 0; i &lt; value.length; i++) {
            if (value[i] != &quot;&quot;) {
                SP.UI.Notify.addNotification(value[i], true);
            }
        }
    }
&lt;/script&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_be49f9de_5754_4e7c_a807_83576d4b69a8' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{c413c245-16aa-496f-9682-e86e48c8146b}" WebPart="true" __designer:IsClosed="false" id="g_c413c245_16aa_496f_9682_e86e48c8146b" __designer:Preview="&lt;div id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{c413c245-16aa-496f-9682-e86e48c8146b}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_c413c245_16aa_496f_9682_e86e48c8146b$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_c413c245_16aa_496f_9682_e86e48c8146b$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_c413c245_16aa_496f_9682_e86e48c8146b$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_c413c245_16aa_496f_9682_e86e48c8146b' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

											
</asp:Content>


