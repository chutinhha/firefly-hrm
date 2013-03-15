<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="~masterurl/default.master" meta:progid="SharePoint.WebPartPage.Document"       %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>

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

                            
							<!-- menu -->
							<div id="ctl00_theMainNav_homeNav">
					
							<div style="float:left;">
							<ul id="qm0" class="qmmc" style="line-height:15px;width:100%">
								<li class="menuNav"><a class="qmparent" href="" style="padding-left:8px; padding-right:8px;">
								ADMIN</a>
                                    <ul>
                                        <li><a href="">Organization</a>
                                            <ul>
                                                <li><a href="">General 
												Information</a></li>
                                                <li><a href="">Location</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="">Job</a>
                                            <ul>
                                                <li><a href="JobCategories.aspx">
												Job Categories</a></li>
                                                <li><a href="JobTitles.aspx">
												Position</a></li>
                                                <li><a href="">Pay Grades</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="">Employees</a>
                                            <ul>
                                                <li><a href="">Import From CSV</a></li>
                                                <li><a href="">Employees List</a></li>
                                                <li><a href="">Add Employee</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="">Users</a>
                                            <ul>
                                                <li><a href="">Users List</a></li>
                                                <li><a href="">Create User</a></li>
                                                <li><a href="">Assign User To 
												Project</a></li>
                                                <li><a href="">Notice Workflow</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
								<li><span class="qmdivider qmdividery" ></span></li>
								<li class="menuNav"><a class="qmparent" href="" style="padding-left:8px; padding-right:8px;">
								TIME</a>
									<ul>
										<li><a href="">Timesheets</a>
											<ul>
												<li><a href="">Employee 
												Timesheets</a>
												<li><a href="">Timesheets Report</a></li>
											</ul>
										</li>
										<li><a href="">Configure Leave</a>
											<ul>
												<li><a href="">Leave Period</a></li>
												<li><a href="">Leave Types</a></li>
												<li><a href="">Work Week</a></li>
												<li><a href="">Holidays</a></li>
											</ul>
										</li>
										<li><a href="">Assign Leave</a></li>
										<li><a href="">Attendance</a>
											<ul>
												<li><a href="AttendanceRecord.aspx">Employee Records</a></li>
												<li><a href="">Attendance 
												Summary</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><span class="qmdivider qmdividery" ></span></li>
								<li class="menuNav"><a class="qmparent" href="" style="padding-left:8px; padding-right:8px;">
								RECRUITMENT</a>
									<ul>
										<li><a href="Candidates.aspx">Candidates</a></li>
										<li><a href="Vacancies.aspx">Vacancies</a></li>
									</ul>
								</li>
								<li><span class="qmdivider qmdividery" ></span></li>
								<li class="menuNav"><a class="qmparent" href="" style="padding-left:8px; padding-right:8px;">
								CHECKPOINT</a>
									<ul>
										<li><a href="">Timesheets Summary</a></li>
										<li><a href="">Attendace Summary</a></li>
										<li><a href="">Evaluate Employees</a></li>
									</ul>
								</li>
							</ul>
							</div>
							
				            </div>
							
							
							
							
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

							<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{d7d58236-9aa9-4cce-8261-1f71b21eb269}" WebPart="true" __designer:IsClosed="false" id="g_d7d58236_9aa9_4cce_8261_1f71b21eb269" __designer:Preview="&lt;div id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{d7d58236-9aa9-4cce-8261-1f71b21eb269}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269_ctl00_LinkButton1&quot; Href=&quot;javascript:__doPostBack('g_d7d58236_9aa9_4cce_8261_1f71b21eb269$ctl00$LinkButton1','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269_ctl00_LinkButton2&quot; Href=&quot;javascript:__doPostBack('g_d7d58236_9aa9_4cce_8261_1f71b21eb269$ctl00$LinkButton2','')&quot;&gt;Change Passwod&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_d7d58236_9aa9_4cce_8261_1f71b21eb269_ctl00_LinkButton3&quot; Href=&quot;javascript:__doPostBack('g_d7d58236_9aa9_4cce_8261_1f71b21eb269$ctl00$LinkButton3','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_d7d58236_9aa9_4cce_8261_1f71b21eb269' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>						
</asp:Content>


