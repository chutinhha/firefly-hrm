<%@ Register tagprefix="SalarySummary" namespace="SP2010VisualWebPart.Admin.Salary.SalarySummary" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../_catalogs/masterpage/212ob.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><SalarySummary:SalarySummary runat="server" ID="g_f52e8f17_c211_4baa_95b8_6c47487a2da0" Description="SalarySummary" ChromeType="None" Title="SalarySummary" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='SalarySummary' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_f52e8f17_c211_4baa_95b8_6c47487a2da0' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0&quot;&gt;
	
&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;Manage Employee Salary&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
    &lt;br /&gt;
&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
&lt;span id=&quot;FullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0_ctl00_lblSort&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;Sort by&lt;/span&gt;
&lt;select name=&quot;FullPage$g_f52e8f17_c211_4baa_95b8_6c47487a2da0$ctl00$ddlSort&quot; id=&quot;FullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0_ctl00_ddlSort&quot; style=&quot;width:200px;&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;Name&quot;&gt;Name&lt;/option&gt;
		&lt;option value=&quot;Highest Salary&quot;&gt;Highest Salary&lt;/option&gt;
		&lt;option value=&quot;Lowest Salary&quot;&gt;Lowest Salary&lt;/option&gt;

	&lt;/select&gt;&lt;br&gt;&lt;br&gt;

	&lt;div class=&quot;borderBottom&quot;&gt;
&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_f52e8f17_c211_4baa_95b8_6c47487a2da0$ctl00$btnSave&quot; value=&quot;Save&quot; id=&quot;FullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0_ctl00_btnSave&quot; style=&quot;width:80px;&quot; /&gt;
&lt;/div&gt;&lt;br&gt;
    
    &lt;br /&gt;
    
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;p&gt;
    &amp;nbsp;&lt;/p&gt;
&lt;span id=&quot;FullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;


&lt;span id=&quot;FullPage_g_f52e8f17_c211_4baa_95b8_6c47487a2da0_ctl00_lblSuccess&quot; style=&quot;color:Green;&quot;&gt;&lt;/span&gt;




&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{F52E8F17-C211-4BAA-95B8-6C47487A2DA0}" WebPart="true" __designer:IsClosed="false"></SalarySummary:SalarySummary>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
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
                                        <li><a href="JobCategories.aspx">Job</a>
                                            <ul>
                                                <li><a href="JobCategories.aspx">
												Job Categories</a></li>
                                                <li><a href="JobTitles.aspx">
												Position</a></li>
                                                <li><a href="SalarySummary.aspx">
												Salary Summary</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="">Employees</a>
                                            <ul>
                                                <li><a href="ImportEmployee.aspx">
												Import From CSV</a></li>
                                                <li><a href="">Employees List</a></li>
                                                <li><a href="">Add Employee</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="ManageUser.aspx">Users</a>
                                            <ul>
                                                <li><a href="ManageUser.aspx">
												Manage Users</a></li>
                                                <li><a href="">Assign User To 
												
												Project</a></li>
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
												<li><a href="">Timesheets Summary</a></li>
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
												<li><a href="AttendanceSummary.aspx">
												Attendance Summary</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><span class="qmdivider qmdividery" ></span></li>
								<li class="menuNav"><a class="qmparent" href="Candidates.aspx" style="padding-left:8px; padding-right:8px;">
								RECRUITMENT</a>
									<ul>
										<li><a href="Candidates.aspx">Candidates</a></li>
										<li><a href="Vacancies.aspx">Vacancies</a></li>
									</ul>
								</li>
								<li><span class="qmdivider qmdividery" ></span></li>
								<li class="menuNav"><a class="qmparent" href="EvaluateEmployee.aspx"" style="padding-left:8px; padding-right:8px;">
								CHECKPOINT</a>
									<ul>
										<li><a href="QuestionList.aspx">Evaluate 
										Employees</a>
											<ul>
												<li><a href="QuestionList.aspx">
												Checkpoint Question List</a></li>
												<li><a href="EvaluateEmployee.aspx">
												Evaluate An Employee</a></li>
											</ul>
										</li>
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

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">


<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{d0d61d65-d9cf-4baf-bae4-199ddc61a28e}" WebPart="true" __designer:IsClosed="false" id="g_d0d61d65_d9cf_4baf_bae4_199ddc61a28e" __designer:Preview="&lt;div id=&quot;g_d0d61d65_d9cf_4baf_bae4_199ddc61a28e&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{d0d61d65-d9cf-4baf-bae4-199ddc61a28e}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_d0d61d65_d9cf_4baf_bae4_199ddc61a28e_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_d0d61d65_d9cf_4baf_bae4_199ddc61a28e' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{2868f2c7-7e2a-4078-a7ac-c836d06dee6a}" WebPart="true" __designer:IsClosed="false" id="g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a" __designer:Preview="&lt;div id=&quot;g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{2868f2c7-7e2a-4078-a7ac-c836d06dee6a}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_2868f2c7_7e2a_4078_a7ac_c836d06dee6a' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>


						
</asp:Content>


