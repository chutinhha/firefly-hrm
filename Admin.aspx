﻿<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="../_catalogs/masterpage/Admin.master" meta:progid="SharePoint.WebPartPage.Document"       %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>

<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>

<%@ Register tagprefix="QuickLaunch" namespace="SP2010VisualWebPart.Admin.DashBoard.QuickLaunch" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>

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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='Bottom' /&gt;&lt;P N='HeaderText' T='loc:Bottom' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><QuickLaunch:QuickLaunch runat="server" ID="g_7460fb27_1f61_4aba_97fe_9c8e818e522c" Description="QuickLaunch" ChromeType="None" Title="QuickLaunch" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='QuickLaunch' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_7460fb27_1f61_4aba_97fe_9c8e818e522c' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartBottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;Bottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c&quot;&gt;
	

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
        $.plot($(&quot;#graph1&quot;), data,
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
	&lt;style type=&quot;text/css&quot;&gt;
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
        background: url(&quot;/_layouts/Images/21_2_ob/h1-bg.png&quot;) repeat-x scroll left bottom #F3F3F3;
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
    &lt;/style&gt;


    &lt;div class=&quot;box&quot;&gt;
    &lt;div class=&quot;head&quot;&gt;
        &lt;h1&gt;Dashboard&lt;/h1&gt;
    &lt;/div&gt;
    &lt;div class=&quot;inner&quot;&gt;
&lt;fieldset id=&quot;panel_resizable_0_6&quot; class=&quot;panel_resizable panel-preview&quot; 
    style=&quot;width:autopx; height:90.8px;width:300px; &quot;&gt;
    &lt;legend&gt;Quick Launch&lt;/legend&gt;
    &lt;div id=&quot;dashboard-quick-launch-panel-container&quot;&gt;
        &lt;div id=&quot;dashboard-quick-launch-panel-menu_holder&quot;&gt;
            &lt;table class=&quot;quickLaungeContainer&quot;&gt;
                &lt;tr&gt;
                    &lt;td&gt;
                        &lt;div class=&quot;quickLaunge&quot;&gt;
                            &lt;a href=&quot;&quot; target=&quot;_self&quot;&gt;
                            &lt;img src=&quot;/_layouts/Images/21_2_ob/ApplyLeave.png&quot; /&gt;
                            &lt;span class=&quot;quickLinkText&quot;&gt;Assign Leave&lt;/span&gt; &lt;/a&gt;
                        &lt;/div&gt;
                    &lt;/td&gt;
                    &lt;td&gt;
                        &lt;div class=&quot;quickLaunge&quot;&gt;
                            &lt;a href=&quot;&quot; target=&quot;_self&quot;&gt;
                            &lt;img src=&quot;/_layouts/Images/21_2_ob/MyLeave.png&quot; /&gt;
                            &lt;span class=&quot;quickLinkText&quot;&gt;Leave List&lt;/span&gt; &lt;/a&gt;
                        &lt;/div&gt;
                    &lt;/td&gt;
                    &lt;td&gt;
                        &lt;div class=&quot;quickLaunge&quot;&gt;
                            &lt;a href=&quot;&quot; 
                                target=&quot;_self&quot;&gt;
                            &lt;img src=&quot;/_layouts/Images/21_2_ob/MyTimesheet.png&quot; /&gt;
                            &lt;span class=&quot;quickLinkText&quot;&gt;Timesheets&lt;/span&gt; &lt;/a&gt;
                        &lt;/div&gt;
                    &lt;/td&gt;
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
    &lt;div style=&quot;left:0px; 2px; 2px;&quot; class=&quot;panel_draggable panel-preview&quot; id=&quot;Div3&quot;&gt;
        &lt;fieldset id=&quot;Fieldset2&quot; class=&quot;panel_resizable panel-preview&quot; 
    style=&quot;width:autopx;width:400px; &quot;&gt;
    &lt;legend&gt;Checkpoint&lt;span id=&quot;Bottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c_ctl00_lblQuarter&quot;&gt;&lt;/span&gt;&lt;/legend&gt;
&lt;div id=&quot;graph1&quot; class=&quot;graph&quot;&gt;&lt;/div&gt;
&lt;/fieldset&gt;
    &lt;/div&gt;
    &lt;div style=&quot;left:6px; 2px; 2px;&quot; class=&quot;panel_draggable panel-preview&quot; id=&quot;Div4&quot;&gt;
        &lt;fieldset id=&quot;Fieldset1&quot; class=&quot;panel_resizable panel-preview&quot; 
    style=&quot;width:autopx;width:510px;height: 315px; &quot;&gt;
    &lt;legend&gt;Upcoming Deadline Task&lt;/legend&gt;
    &lt;div id=&quot;Bottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c_ctl00_pnlUpcoming&quot; style=&quot;height:100%;&quot;&gt;
		
        
	&lt;/div&gt;
&lt;/fieldset&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;
&lt;br&gt;
&lt;div class=&quot;outerbox no-border&quot;&gt;
&lt;div class=&quot;maincontent group-wrapper&quot; id=&quot;group_2&quot;&gt;
&lt;div style=&quot;height:280px;&quot; class=&quot;panel_wrapper&quot; id=&quot;panel_wrapper_2&quot;&gt;
    &lt;div style=&quot;top:13px; left:0px; 2px; 2px;&quot; class=&quot;panel_draggable panel-preview&quot; id=&quot;panel_draggable_2_1&quot;&gt;
        &lt;fieldset style=&quot;width:300px; height:238px; &quot; class=&quot;panel_resizable panel-preview&quot; id=&quot;panel_resizable_2_1&quot;&gt;
              &lt;legend&gt;Pending Leave Requests&lt;/legend&gt;
        &lt;div id=&quot;Bottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c_ctl00_pnlLeave&quot; style=&quot;height:100%;&quot;&gt;
		
        
	&lt;/div&gt;
    &lt;/fieldset&gt;
    &lt;/div&gt;
    &lt;div id=&quot;panel_draggable_2_2&quot; class=&quot;panel_draggable panel-preview&quot; style=&quot;top:13px; left:6px; 2px; 2px;&quot;&gt;
        &lt;fieldset id=&quot;panel_resizable_2_2&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;width:300px; height:237.8px; &quot;&gt;
            &lt;legend&gt;Pending Timesheets&lt;/legend&gt;
        &lt;div id=&quot;Bottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c_ctl00_pnlTime&quot; style=&quot;height:100%;&quot;&gt;
		
        
	&lt;/div&gt;
    &lt;/fieldset&gt;
    &lt;/div&gt;
    &lt;div id=&quot;panel_draggable_2_3&quot; class=&quot;panel_draggable panel-preview&quot; style=&quot;top:13px; left:12px; 2px; 2px;&quot;&gt;
                                &lt;fieldset id=&quot;panel_resizable_2_3&quot; class=&quot;panel_resizable panel-preview&quot; style=&quot;width:300px; height:238px; &quot;&gt;
                                    &lt;legend&gt;Scheduled Interviews&lt;/legend&gt;
                                    &lt;div id=&quot;Bottom_g_7460fb27_1f61_4aba_97fe_9c8e818e522c_ctl00_pnlInterview&quot; style=&quot;height:100%;&quot;&gt;
		
        
	&lt;/div&gt;
    &lt;/fieldset&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{7460FB27-1F61-4ABA-97FE-9C8E818E522C}" WebPart="true" __designer:IsClosed="false"></QuickLaunch:QuickLaunch>

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

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{2475d79b-4513-4fc8-a285-026e2b1d00a4}" WebPart="true" __designer:IsClosed="false" id="g_2475d79b_4513_4fc8_a285_026e2b1d00a4" __designer:Preview="&lt;div id=&quot;g_2475d79b_4513_4fc8_a285_026e2b1d00a4&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{2475d79b-4513-4fc8-a285-026e2b1d00a4}&quot; WebPart=&quot;true&quot;&gt;
	&lt;link id=&quot;CssRegistration0&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;/_layouts/STYLES/human_management/menuStyles.css&quot;/&gt;

&lt;script language=&quot;javascript&quot; type=&quot;text/javascript&quot;&gt;
	var statusID;
	function showNotif() {
	    var value = &quot;&quot;.split(&quot;;&quot;);
        for(i=0;i&lt;value.length;i++){
	        if (value[i] != &quot;&quot;) {
	            SP.UI.Notify.addNotification(value[i], true);
	        }
        }
	}
&lt;/script&gt;
&lt;span id=&quot;g_2475d79b_4513_4fc8_a285_026e2b1d00a4_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_2475d79b_4513_4fc8_a285_026e2b1d00a4' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
							<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{d7d58236-9aa9-4cce-8261-1f71b21eb269}" WebPart="true" __designer:IsClosed="false" id="g_d7d58236_9aa9_4cce_8261_1f71b21eb269" __designer:Preview="&lt;div id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{d7d58236-9aa9-4cce-8261-1f71b21eb269}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_d7d58236_9aa9_4cce_8261_1f71b21eb269$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_d7d58236_9aa9_4cce_8261_1f71b21eb269$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_d7d58236_9aa9_4cce_8261_1f71b21eb269$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_d7d58236_9aa9_4cce_8261_1f71b21eb269' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>						
</asp:Content>

