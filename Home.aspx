<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="../_catalogs/masterpage/212ob.master" meta:progid="SharePoint.WebPartPage.Document"       %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
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
			<SharePoint:EmbeddedFormField id="WikiField" FieldName="WikiField" ControlMode="Display" runat="server"><div class="ExternalClassA6E2B85F942E4A7E978B1AD11185906D">
                <table id="layoutsTable" style="width:100%"><tbody><tr style="vertical-align:top"><td style="width:66.6%"><div class="ms-rte-layoutszone-outer" style="width:100%"><div class="ms-rte-layoutszone-inner">
<Login:Login runat="server" ID="g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7" Description="            This Web Part has a User Control to render the UI.          " ChromeType="None" Title="Login" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            This Web Part has a User Control to render the UI.          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='Login' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' ID='2' T='g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;div id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7&quot;&gt;
	&lt;div id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		
&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_lblUser&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;User&lt;/span&gt;
&lt;input name=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7$ctl00$txtUser&quot; type=&quot;text&quot; id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_txtUser&quot; style=&quot;width:200px;&quot; /&gt;
&lt;br /&gt;&lt;br /&gt;
&lt;p&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_lblPassword&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Password&lt;/span&gt;
    &lt;input name=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7$ctl00$txtPassword&quot; type=&quot;password&quot; id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_txtPassword&quot; style=&quot;width:200px;&quot; /&gt;
&lt;/p&gt;
&lt;span style=&quot;padding-left:128px;&quot;&gt;&lt;/span&gt;
&lt;input type=&quot;submit&quot; name=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7$ctl00$btnLogin&quot; value=&quot;Login&quot; id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_btnLogin&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    
	&lt;/div&gt;
    &lt;br&gt;&lt;br&gt;
&lt;p&gt;
    &lt;span id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;
&lt;/p&gt;

&lt;/div&gt;" __MarkupType="vsattributemarkup" __WebPartId="{1179F2C7-EE84-4A3E-98BD-E827E2D708E7}" WebPart="true" __designer:IsClosed="false"></Login:Login>












































            <p> </p>
          </div></div></td>
<td style="width:33.3%"><div class="ms-rte-layoutszone-outer" style="width:100%"><div class="ms-rte-layoutszone-inner">
                                        <p class="ms-rteThemeForeColor-5-5" style="text-align:left;font-size:10pt">
                                            <img alt="People collaborating" src="/_layouts/images/homepageSamplePhoto.jpg" style="margin:5px" />
                                        </p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
          </div></div></td></tr></tbody></table>
            <span id="layoutsData" style="display:none">false,false,2</span></div></SharePoint:EmbeddedFormField>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='Bottom' /&gt;&lt;P N='HeaderText' T='loc:Bottom' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
	</ContentTemplate>
	<Triggers>
	    <asp:PostBackTrigger ControlID="WikiField" />
	    <asp:PostBackTrigger ControlID="btnWikiRevert" />
	    <asp:PostBackTrigger ControlID="btnWikiSave" />
	</Triggers>
 </asp:UpdatePanel>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderHorizontalNav">
<table style="background-color:#E2E2E2;"><tbody><tr><td>
			<ul id="nav">
	<li>
		<a href="Home.aspx">HOME</a>	
	</li>
	<li>
		<a href="">WHO WE ARE</a>
		<div class="dropdown">
			<ul>
				<li><a href="">About ORBIS International</a></li>
				<li><a href="">History</a></li>
				<li><a href="">What Makes Us Different</a></li>
				<li><a href="">Global Leadership</a></li>
				<li><a href="">Financial Information</a></li>
				<li><a href="">Corporate Sponsors</a></li>
				<li><a href="">Contact Us</a></li>
				<li style="background:none;"><a href="">Employment</a></li>
			</ul>
			<div class="bottom"></div>
		</div>
	</li>
	<li>
		<a href="">WHAT WE DO</a>
		<div class="dropdown">
			<ul>
				<li><a href="">Where We Work</a></li>
				<li><a href="">Flying Eye Hospital</a></li>
				<li><a href="">Capacity Building</a></li>
				<li><a href="">Training</a></li>
				<li><a href="">Diseases We Treat</a></li>
				<li><a href="">Cyber-Sight®</a></li>
				<li><a href="">Success Stories</a></li>
				<li style="background:none;"><a href="">Videos: Eye Reports</a></li>
			</ul>
			<div class="bottom"></div>
		</div>
	</li>
	<li>
		<a href="">FLYING EYE HOSPITAL</a>
		<div class="dropdown">
			<ul>
				<li><a href="">Flying Eye Hospital</a></li>
				<li><a href="">MD-10: The New Plane</a></li>
				<li><a href="">Who&#39;s On Board?</a></li>
				<li><a href="">Itinerary</a></li>
				<li style="background:none;"><a href="">Employment</a></li>
			</ul>
			<div class="bottom"></div>
		</div>
	</li>
	<li>
		<a href="">GET INVOLVED</a>
		<div class="dropdown">
			<ul>
				<li><a href="">In Your Community: Advocates for Sight</a></li>
				<li><a href="">Medical Volunteers</a></li>
				<li><a href="">Volunteer Pilots</a></li>
				<li><a href="">Corporate Opportunities</a></li>
				<li><a href="">Publications</a></li>
				<li style="background:none;"><a href="">Volunteer Opportunities</a></li>
			</ul>
			<div class="bottom"></div>
		</div>
	</li>
	<li>
		<a href="">DONATE NOW</a>
		<div class="dropdown">
			<ul>
				<li><a href="">Make a Donation</a></li>
				<li><a href="">Donate Frequent Flyer Miles</a></li>
				<li style="background:none;"><a href="">Other Ways of Giving</a></li>
			</ul>
			<div class="bottom"></div>
		</div>
	</li>
	<li style="background:none;">
		<a href="">NEWSROOM</a>
		<div class="dropdown">
			<ul>
				<li><a href="">Media contacts</a></li>
				<li><a href="">Fact Sheet</a></li>
				<li><a href="">Press Releases</a></li>
				<li><a href="">What&#39;s New</a></li>
				<li><a href="">Video Gallery</a></li>
				<li style="background:none;"><a href="">Blog</a></li>
			</ul>
			<div class="bottom"></div>
		</div>
	</li>
</ul>                            
	</td></tr></table>						
							
							
							
							<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
							<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
											  
							
                            		
								
							
						

    
    <!-- menu cua share point               
	<SharePoint:AspMenu
	  ID="TopNavigationMenuV4"
	  Runat="server"
	  EnableViewState="false"
	  DataSourceID="topSiteMap"
	  AccessKey="<%$Resources:wss,navigation_accesskey%>"
	  UseSimpleRendering="true"
	  UseSeparateCss="false"
	  Orientation="Horizontal"
	  StaticDisplayLevels="2"
	  MaximumDynamicDisplayLevels="1"
	  SkipLinkText=""
	  CssClass="s4-tn" __designer:Preview="&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;/_layouts/1033/styles/menu-21.css&quot;/&gt;
&lt;div id=&quot;zz3_TopNavigationMenuV4&quot; class=&quot;s4-tn&quot;&gt;
	&lt;div class=&quot;menu horizontal menu-horizontal&quot;&gt;
		&lt;ul class=&quot;root static&quot;&gt;
			&lt;li class=&quot;static&quot;&gt;&lt;a class=&quot;static menu-item&quot; href=&quot;/hr/SitePages/Home.aspx&quot; accesskey=&quot;1&quot;&gt;&lt;span class=&quot;additional-background&quot;&gt;&lt;span class=&quot;menu-item-text&quot;&gt;hr&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
		&lt;/ul&gt;
	&lt;/div&gt;
&lt;/div&gt;" __designer:Values="&lt;P N='ID' ID='1' T='TopNavigationMenuV4' /&gt;&lt;P N='UseSimpleRendering' T='True' /&gt;&lt;P N='MaximumDynamicDisplayLevels' T='1' /&gt;&lt;P N='Orientation' E='0' /&gt;&lt;P N='SkipLinkText' R='-1' /&gt;&lt;P N='StaticDisplayLevels' T='2' /&gt;&lt;P N='DataSourceID' T='topSiteMap' /&gt;&lt;P N='AccessKey' Bound='True' T='Resources:wss,navigation_accesskey' /&gt;&lt;P N='CssClass' T='s4-tn' /&gt;&lt;P N='EnableViewState' T='False' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;Item Templates&quot;&gt;&lt;Template Name=&quot;StaticItemTemplate&quot; Flags=&quot;D&quot; Content=&quot;&quot; /&gt;&lt;Template Name=&quot;DynamicItemTemplate&quot; Flags=&quot;D&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"/>
      -->

      


    
	<SharePoint:DelegateControl runat="server" ControlId="TopNavigationDataSource" Id="topNavigationDelegate" __designer:Preview="&lt;span style=&quot;display:none&quot;&gt;&lt;table cellpadding=4 cellspacing=0 style=&quot;font:messagebox;color:buttontext;background-color:buttonface;border: solid 1px;border-top-color:buttonhighlight;border-left-color:buttonhighlight;border-bottom-color:buttonshadow;border-right-color:buttonshadow&quot;&gt;
              &lt;tr&gt;&lt;td nowrap&gt;&lt;span style=&quot;font-weight:bold&quot;&gt;PortalSiteMapDataSourceSwitch&lt;/span&gt; - topSiteMap&lt;/td&gt;&lt;/tr&gt;
              &lt;tr&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;
            &lt;/table&gt;&lt;/span&gt;" __designer:Values="&lt;P N='ControlId' T='TopNavigationDataSource' /&gt;&lt;P N='ID' ID='1' T='topNavigationDelegate' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;">
		<Template_Controls>
			<asp:SiteMapDataSource
			  ShowStartingNode="False"
			  SiteMapProvider="SPNavigationProvider"
			  id="topSiteMap"
			  runat="server"
			  StartingNodeUrl="sid:1002"/>
		</Template_Controls>
	
    
    </SharePoint:DelegateControl>
								
</asp:Content>



<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">
</asp:Content>




