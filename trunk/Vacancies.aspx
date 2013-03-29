<%@ Register tagprefix="Vacancies" namespace="SP2010VisualWebPart.Vacancies" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../_catalogs/masterpage/Admin.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Vacancies:Vacancies runat="server" ID="g_223b737b_8d58_4a24_929d_736a75ae012c" Description="Vacancies" ChromeType="None" Title="Vacancies" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='Vacancies' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_223b737b_8d58_4a24_929d_736a75ae012c' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_223b737b_8d58_4a24_929d_736a75ae012c&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c&quot;&gt;
	
&lt;br&gt;&lt;div id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Vacancies&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:80px;&quot;&gt;Job Title&lt;/span&gt;
    &lt;div class=&quot;styled-selectShort&quot;&gt;&lt;select name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$ddlJobTitle&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_ddlJobTitle&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
    &lt;span style=&quot;padding-left:30px;&quot;&gt;&lt;/span&gt;
    &lt;span id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_lblVacancy&quot; style=&quot;display:inline-block;width:80px;&quot;&gt;Vacancy&lt;/span&gt;
    &lt;div class=&quot;styled-selectShort&quot;&gt;&lt;select name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$ddlVacancy&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_ddlVacancy&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
    &lt;span style=&quot;padding-left:30px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_lblHiringManager&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Hiring Manager&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$txtHiringManager&quot; type=&quot;text&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_txtHiringManager&quot; style=&quot;width:110px;&quot; /&gt;
    &lt;span style=&quot;padding-left:30px;&quot;&gt;&lt;/span&gt;
    &lt;span id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_lblStatus&quot; style=&quot;display:inline-block;width:65px;&quot;&gt;Status&lt;/span&gt;
    &lt;div class=&quot;styled-selectShort&quot;&gt;&lt;select name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$ddlStatus&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_ddlStatus&quot;&gt;
			&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
			&lt;option value=&quot;Active&quot;&gt;Active&lt;/option&gt;
			&lt;option value=&quot;Closed&quot;&gt;Closed&lt;/option&gt;

		&lt;/select&gt;&lt;/div&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;div class=&quot;borderTop&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$btnSearch&quot; value=&quot;Search&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_btnSearch&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$btnReset&quot; value=&quot;Reset&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_btnReset&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
        &lt;/div&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
	&lt;/div&gt;
&lt;br&gt;
&lt;table class=&quot;fieldTitleDiv&quot;&gt;&lt;tr&gt;&lt;td&gt;
    &lt;div class=&quot;borderBottom&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$btnAdd&quot; value=&quot;Add&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_btnAdd&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$btnEdit&quot; value=&quot;Edit&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_btnEdit&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_223b737b_8d58_4a24_929d_736a75ae012c$ctl00$btnDelete&quot; value=&quot;Delete&quot; onclick=&quot;return confirm('Are you sure you want to delete ?');&quot; id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_btnDelete&quot; class=&quot;deleteButton&quot; style=&quot;width:80px;&quot; /&gt;
        &lt;/div&gt;
    &lt;br /&gt;
    &lt;table&gt;&lt;tr&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

&lt;br&gt;&lt;br&gt;
&lt;span id=&quot;FullPage_g_223b737b_8d58_4a24_929d_736a75ae012c_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;
&lt;br&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{223B737B-8D58-4A24-929D-736A75AE012C}" WebPart="true" __designer:IsClosed="false"></Vacancies:Vacancies>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{9d9dcf94-2023-49b9-b882-8c5fcd3fc4c8}" WebPart="true" __designer:IsClosed="false" id="g_9d9dcf94_2023_49b9_b882_8c5fcd3fc4c8" __designer:Preview="&lt;div id=&quot;g_9d9dcf94_2023_49b9_b882_8c5fcd3fc4c8&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{9d9dcf94-2023-49b9-b882-8c5fcd3fc4c8}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_9d9dcf94_2023_49b9_b882_8c5fcd3fc4c8_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_9d9dcf94_2023_49b9_b882_8c5fcd3fc4c8' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{83d8b943-4703-4cf6-afa0-41b81ca52d3c}" WebPart="true" __designer:IsClosed="false" id="g_83d8b943_4703_4cf6_afa0_41b81ca52d3c" __designer:Preview="&lt;div id=&quot;g_83d8b943_4703_4cf6_afa0_41b81ca52d3c&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{83d8b943-4703-4cf6-afa0-41b81ca52d3c}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_83d8b943_4703_4cf6_afa0_41b81ca52d3c_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_83d8b943_4703_4cf6_afa0_41b81ca52d3c$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_83d8b943_4703_4cf6_afa0_41b81ca52d3c_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_83d8b943_4703_4cf6_afa0_41b81ca52d3c$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_83d8b943_4703_4cf6_afa0_41b81ca52d3c_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_83d8b943_4703_4cf6_afa0_41b81ca52d3c$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_83d8b943_4703_4cf6_afa0_41b81ca52d3c' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

					
</asp:Content>


