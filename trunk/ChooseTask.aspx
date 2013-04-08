<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="DayOff" namespace="SP2010VisualWebPart.Admin.AssignDayOff.DayOff" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="PersonProject" namespace="SP2010VisualWebPart.Admin.Person_Project.PersonProject" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../_catalogs/masterpage/Admin.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><PersonProject:PersonProject runat="server" ID="g_70fe8c44_08f7_4984_a83a_ef9d8452b799" Description="My Visual WebPart" ChromeType="None" Title="PersonProject" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='PersonProject' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_70fe8c44_08f7_4984_a83a_ef9d8452b799' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799&quot;&gt;
	
&lt;br&gt;
&lt;table class=&quot;fieldTitleDiv&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;font color=&quot;white&quot;&gt;Project Personnel&lt;/font&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br&gt;
            &lt;span style=&quot;padding-left: 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_lblProject&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;Project&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_70fe8c44_08f7_4984_a83a_ef9d8452b799$ctl00$ddlProject&quot; id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_ddlProject&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;span style=&quot;padding-left: 100px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_lblTask&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;Task&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_70fe8c44_08f7_4984_a83a_ef9d8452b799$ctl00$ddlTask&quot; id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_ddlTask&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 105px&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_70fe8c44_08f7_4984_a83a_ef9d8452b799$ctl00$btnAdd&quot; value=&quot;Add&quot; id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_btnAdd&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_70fe8c44_08f7_4984_a83a_ef9d8452b799$ctl00$btnDelete&quot; value=&quot;Delete&quot; id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_btnDelete&quot; class=&quot;deleteButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
            
            &lt;table&gt;
                &lt;tr&gt;
                    &lt;td&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br&gt;
&lt;br&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_70fe8c44_08f7_4984_a83a_ef9d8452b799_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{70FE8C44-08F7-4984-A83A-EF9D8452B799}" WebPart="true" __designer:IsClosed="false"></PersonProject:PersonProject>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

	
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{1a3f4eeb-7c10-441a-8d97-f3b3faadfe38}" WebPart="true" __designer:IsClosed="false" id="g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38" __designer:Preview="&lt;div id=&quot;g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{1a3f4eeb-7c10-441a-8d97-f3b3faadfe38}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_1a3f4eeb_7c10_441a_8d97_f3b3faadfe38' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

	
						
<NotifyEmployee:NotifyEmployee ChromeStyle="None" runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{54827a47-2be7-41c1-9f3b-fa8e096c7b3e}" WebPart="true" __designer:IsClosed="false" id="g_54827a47_2be7_41c1_9f3b_fa8e096c7b3e" __designer:Preview="&lt;div id=&quot;g_54827a47_2be7_41c1_9f3b_fa8e096c7b3e&quot; ChromeStyle=&quot;None&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{54827a47-2be7-41c1-9f3b-fa8e096c7b3e}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_54827a47_2be7_41c1_9f3b_fa8e096c7b3e' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

	
						
</asp:Content>

