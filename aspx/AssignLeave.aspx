<%@ Register tagprefix="AssignLeave" namespace="SP2010VisualWebPart.Admin.AssignDayOff.AssignLeave" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../../_catalogs/masterpage/Admin.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_99a5db66_cf77_4236_ad11_a9ea02bf5bf6" Description="
            Login
          " Title="
          Login
        " __designer:Values="&lt;P N='Description' T='&amp;#xA;            Login&amp;#xA;          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='&amp;#xA;          Login&amp;#xA;        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_99a5db66_cf77_4236_ad11_a9ea02bf5bf6' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
			&lt;tr class=&quot;ms-WPHeader&quot;&gt;
				&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;&lt;td title=&quot;
          Login
         - 
            Login
          &quot; id=&quot;WebPartTitleFullPage_g_99a5db66_cf77_4236_ad11_a9ea02bf5bf6&quot; class=&quot;ms-WPHeaderTd&quot;&gt;&lt;div class=&quot;ms-WPTitle&quot;&gt;&lt;nobr&gt;&lt;span&gt;
          Login
        &lt;/span&gt;&lt;span id=&quot;WebPartCaptionFullPage_g_99a5db66_cf77_4236_ad11_a9ea02bf5bf6&quot;&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;/div&gt;&lt;/td&gt;&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td class=&quot;&quot; valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_99a5db66_cf77_4236_ad11_a9ea02bf5bf6&quot; width=&quot;100%&quot; class=&quot;ms-WPBody ms-wpContentDivSpace&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_99a5db66_cf77_4236_ad11_a9ea02bf5bf6&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{99A5DB66-CF77-4236-AD11-A9EA02BF5BF6}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<AssignLeave:AssignLeave runat="server" ID="g_03a55aa1_f006_431f_a6e2_2b50c456e6b5" Description="My Visual WebPart" Title="AssignLeave" __designer:Values="&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='AssignLeave' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_03a55aa1_f006_431f_a6e2_2b50c456e6b5' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
			&lt;tr class=&quot;ms-WPHeader&quot;&gt;
				&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;&lt;td title=&quot;AssignLeave - My Visual WebPart&quot; id=&quot;WebPartTitleFullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5&quot; class=&quot;ms-WPHeaderTd&quot;&gt;&lt;div class=&quot;ms-WPTitle&quot;&gt;&lt;nobr&gt;&lt;span&gt;AssignLeave&lt;/span&gt;&lt;span id=&quot;WebPartCaptionFullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5&quot;&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;/div&gt;&lt;/td&gt;&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td class=&quot;&quot; valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5&quot; width=&quot;100%&quot; class=&quot;ms-WPBody ms-wpContentDivSpace&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5&quot;&gt;
	

&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;font color=&quot;white&quot;&gt;Search Employee&lt;/font&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br&gt;
            &lt;span style=&quot;padding-left: 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_lblEmployee&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employee&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_03a55aa1_f006_431f_a6e2_2b50c456e6b5$ctl00$txtEmployee&quot; type=&quot;text&quot; id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_txtEmployee&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style= &quot;padding-left:50px&quot;&gt;
            
            &lt;br&gt;
            &lt;br&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_03a55aa1_f006_431f_a6e2_2b50c456e6b5$ctl00$btnSearch&quot; value=&quot;Search&quot; id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_btnSearch&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br&gt;
&lt;table class=&quot;fieldTitleDiv&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;br&gt;
            &lt;span style=&quot;padding-left: 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_lblDayOff&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Type of Days Off&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_03a55aa1_f006_431f_a6e2_2b50c456e6b5$ctl00$txtDayOff&quot; type=&quot;text&quot; readonly=&quot;readonly&quot; id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_txtDayOff&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;br /&gt;
            &lt;br&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_03a55aa1_f006_431f_a6e2_2b50c456e6b5$ctl00$btnAssign&quot; value=&quot;Assign&quot; id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_btnAssign&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
            
    &lt;/tr&gt;
    &lt;/td&gt;&lt;/table&gt;
&lt;br&gt;

&amp;nbsp;&lt;span id=&quot;FullPage_g_03a55aa1_f006_431f_a6e2_2b50c456e6b5_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;&lt;br&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{03A55AA1-F006-431F-A6E2-2B50C456E6B5}" WebPart="true" __designer:IsClosed="false"></AssignLeave:AssignLeave>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{7d1da9fc-2db1-49ee-abee-6dfd3ba99fba}" WebPart="true" __designer:IsClosed="false" id="g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba" __designer:Preview="&lt;div id=&quot;g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{7d1da9fc-2db1-49ee-abee-6dfd3ba99fba}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_7d1da9fc_2db1_49ee_abee_6dfd3ba99fba' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

								
								
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{f4139b13-9389-4927-bfa4-093c70ae19cf}" WebPart="true" __designer:IsClosed="false" id="g_f4139b13_9389_4927_bfa4_093c70ae19cf" __designer:Preview="&lt;div id=&quot;g_f4139b13_9389_4927_bfa4_093c70ae19cf&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{f4139b13-9389-4927-bfa4-093c70ae19cf}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_f4139b13_9389_4927_bfa4_093c70ae19cf' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

								
								
</asp:Content>
