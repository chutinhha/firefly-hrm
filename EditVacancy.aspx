﻿<%@ Register tagprefix="EditVacancy" namespace="SP2010VisualWebPart.EditVacancy" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
		<table cellpadding="4" cellspacing="0" border="0" width="100%">
				<tr>
					<td id="_invisibleIfEmpty" name="_invisibleIfEmpty" valign="top" width="100%"> 
					<WebPartPages:WebPartZone runat="server" Title="loc:FullPage" ID="FullPage" FrameType="TitleBarOnly" __designer:Preview="&lt;Regions&gt;&lt;Region Name=&quot;0&quot; Editable=&quot;True&quot; Content=&quot;&quot; NamingContainer=&quot;True&quot; /&gt;&lt;/Regions&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; border=&quot;0&quot; id=&quot;FullPage&quot;&gt;
	&lt;tr&gt;
		&lt;td style=&quot;white-space:nowrap;&quot;&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;2&quot; border=&quot;0&quot; style=&quot;width:100%;&quot;&gt;
			&lt;tr&gt;
				&lt;td style=&quot;white-space:nowrap;&quot;&gt;Full Page&lt;/td&gt;
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><EditVacancy:EditVacancy runat="server" ID="g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a" Description="EditVacancy" ChromeType="None" Title="EditVacancy" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='EditVacancy' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a&quot;&gt;
	
&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;Edit Vancancy&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label1&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Title(*)&lt;/span&gt;
    &lt;select name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$DropDownList1&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_DropDownList1&quot; style=&quot;width:200px;&quot;&gt;

	&lt;/select&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label2&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Vacancy Name(*)&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$TextBox2&quot; type=&quot;text&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_TextBox2&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label3&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Hiring Manager&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$TextBox3&quot; type=&quot;text&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_TextBox3&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label4&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Number of Positions&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$TextBox4&quot; type=&quot;text&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_TextBox4&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label5&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Description&lt;/span&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;&lt;textarea name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$TextBox5&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_TextBox5&quot; style=&quot;height:100px;width:500px;&quot;&gt;&lt;/textarea&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label6&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Active&lt;/span&gt;
    &lt;input id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_CheckBox1&quot; type=&quot;checkbox&quot; name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$CheckBox1&quot; checked=&quot;checked&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;&lt;div class=&quot;borderTop&quot;&gt;
    &lt;span style=&quot;padding-left:155px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$Button1&quot; value=&quot;Save&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Button1&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$Button2&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Button2&quot; style=&quot;width:80px;&quot; /&gt;&lt;/div&gt;
    
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br /&gt;
    &lt;br /&gt;
    &lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Label7&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{1C4CC94C-B0B8-4E23-A9B1-0DBFC5356C7A}" WebPart="true" __designer:IsClosed="false"></EditVacancy:EditVacancy>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

							

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{67c04db0-486d-4f54-8e0e-8d146c532de4}" WebPart="true" __designer:IsClosed="false" id="g_67c04db0_486d_4f54_8e0e_8d146c532de4" __designer:Preview="&lt;div id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{67c04db0-486d-4f54-8e0e-8d146c532de4}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4_ctl00_LinkButton1&quot; Href=&quot;javascript:__doPostBack('g_67c04db0_486d_4f54_8e0e_8d146c532de4$ctl00$LinkButton1','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4_ctl00_LinkButton2&quot; Href=&quot;javascript:__doPostBack('g_67c04db0_486d_4f54_8e0e_8d146c532de4$ctl00$LinkButton2','')&quot;&gt;Change Passwod&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4_ctl00_LinkButton3&quot; Href=&quot;javascript:__doPostBack('g_67c04db0_486d_4f54_8e0e_8d146c532de4$ctl00$LinkButton3','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_67c04db0_486d_4f54_8e0e_8d146c532de4' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

							
						
</asp:Content>
<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderHorizontalNav">

                            
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
												<li><a href="AttendanceRecord.aspx">
												Employee Records</a></li>
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
&lt;div id=&quot;zz2_TopNavigationMenuV4&quot; class=&quot;s4-tn&quot;&gt;
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

