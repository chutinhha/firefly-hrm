﻿<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="EditTimesheet" namespace="SP2010VisualWebPart.User.Timesheet.EditTimesheet" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../../_catalogs/masterpage/Member.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_4d1c8d22_6c8a_405c_a91e_69ac45be2793" Description="
            Login
          " Title="
          Login
        " __designer:Values="&lt;P N='Description' T='&amp;#xD;&amp;#xA;            Login&amp;#xD;&amp;#xA;          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='&amp;#xD;&amp;#xA;          Login&amp;#xD;&amp;#xA;        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_4d1c8d22_6c8a_405c_a91e_69ac45be2793' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
			&lt;tr class=&quot;ms-WPHeader&quot;&gt;
				&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;&lt;td title=&quot;
          Login
         - 
            Login
          &quot; id=&quot;WebPartTitleFullPage_g_4d1c8d22_6c8a_405c_a91e_69ac45be2793&quot; class=&quot;ms-WPHeaderTd&quot;&gt;&lt;div class=&quot;ms-WPTitle&quot;&gt;&lt;nobr&gt;&lt;span&gt;
          Login
        &lt;/span&gt;&lt;span id=&quot;WebPartCaptionFullPage_g_4d1c8d22_6c8a_405c_a91e_69ac45be2793&quot;&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;/div&gt;&lt;/td&gt;&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td class=&quot;&quot; valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_4d1c8d22_6c8a_405c_a91e_69ac45be2793&quot; width=&quot;100%&quot; class=&quot;ms-WPBody ms-wpContentDivSpace&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_4d1c8d22_6c8a_405c_a91e_69ac45be2793&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{4D1C8D22-6C8A-405C-A91E-69AC45BE2793}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<EditTimesheet:EditTimesheet runat="server" ID="g_89ff95dd_981c_45a8_9411_9833dc48e39a" Description="My Visual WebPart" Title="EditTimesheet" __designer:Values="&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='EditTimesheet' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_89ff95dd_981c_45a8_9411_9833dc48e39a' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
			&lt;tr class=&quot;ms-WPHeader&quot;&gt;
				&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;&lt;td title=&quot;EditTimesheet - My Visual WebPart&quot; id=&quot;WebPartTitleFullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a&quot; class=&quot;ms-WPHeaderTd&quot;&gt;&lt;div class=&quot;ms-WPTitle&quot;&gt;&lt;nobr&gt;&lt;span&gt;EditTimesheet&lt;/span&gt;&lt;span id=&quot;WebPartCaptionFullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a&quot;&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;/div&gt;&lt;/td&gt;&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td class=&quot;&quot; valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a&quot; width=&quot;100%&quot; class=&quot;ms-WPBody ms-wpContentDivSpace&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot;&gt;
    $(function () {
        $(&quot;#txtDateFrom&quot;).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
&lt;/script&gt;
&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;span style=&quot;color: white;&quot;&gt;
                            &lt;span id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_lblTitle&quot;&gt;&lt;/span&gt;&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left : 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_lblWorkDate&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;WorkDate&lt;/span&gt;
                        &lt;div id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_pnlDateTo&quot; style=&quot;display: inline;&quot;&gt;
		
            &lt;input id=&quot;txtDateFrom&quot; name=&quot;txtDateFrom&quot; style=&quot;width: 200px;&quot; type=&quot;text&quot; value=&quot;&quot; /&gt;
            
	&lt;/div&gt;
            &lt;br/&gt;
            &lt;br/&gt;
            &lt;span style=&quot;padding-left : 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_lblProject&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Project&lt;/span&gt;
                        &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_89ff95dd_981c_45a8_9411_9833dc48e39a$ctl00$ddlProject&quot; id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_ddlProject&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br/&gt;
                        &lt;span style=&quot;padding-left : 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_lblTask&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Task&lt;/span&gt;
                        &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_89ff95dd_981c_45a8_9411_9833dc48e39a$ctl00$ddlTask&quot; id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_ddlTask&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br/&gt;
                                    &lt;span style=&quot;padding-left : 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_lblTime&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Time&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_89ff95dd_981c_45a8_9411_9833dc48e39a$ctl00$txtTime&quot; type=&quot;text&quot; id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_txtTime&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;br/&gt; &lt;br/&gt;
                            &lt;div class=&quot;borderBottom&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_89ff95dd_981c_45a8_9411_9833dc48e39a$ctl00$btnSave&quot; value=&quot;Save&quot; id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_btnSave&quot; class=&quot;AddButton&quot; style=&quot;width:80px;&quot; /&gt;
                    &lt;/div&gt;
      &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br /&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_89ff95dd_981c_45a8_9411_9833dc48e39a_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{89FF95DD-981C-45A8-9411-9833DC48E39A}" WebPart="true" __designer:IsClosed="false"></EditTimesheet:EditTimesheet>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{5f381964-239d-446c-90fb-e01464f592e4}" WebPart="true" __designer:IsClosed="false" id="g_5f381964_239d_446c_90fb_e01464f592e4" __designer:Preview="&lt;div id=&quot;g_5f381964_239d_446c_90fb_e01464f592e4&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{5f381964-239d-446c-90fb-e01464f592e4}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_5f381964_239d_446c_90fb_e01464f592e4' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>


						
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{1d54b65b-7da2-41d3-9e68-7c7791de4144}" WebPart="true" __designer:IsClosed="false" id="g_1d54b65b_7da2_41d3_9e68_7c7791de4144" __designer:Preview="&lt;div id=&quot;g_1d54b65b_7da2_41d3_9e68_7c7791de4144&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{1d54b65b-7da2-41d3-9e68-7c7791de4144}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_1d54b65b_7da2_41d3_9e68_7c7791de4144_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_1d54b65b_7da2_41d3_9e68_7c7791de4144$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_1d54b65b_7da2_41d3_9e68_7c7791de4144_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_1d54b65b_7da2_41d3_9e68_7c7791de4144$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_1d54b65b_7da2_41d3_9e68_7c7791de4144_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_1d54b65b_7da2_41d3_9e68_7c7791de4144$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_1d54b65b_7da2_41d3_9e68_7c7791de4144' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>


						
</asp:Content>

