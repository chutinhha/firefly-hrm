<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="MyLeave" namespace="SP2010VisualWebPart.User.Leave.MyLeave" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="/_catalogs/masterpage/MasterPage/Member.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_8e0a898c_b052_4f0f_90be_3be363f94473" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_8e0a898c_b052_4f0f_90be_3be363f94473' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_8e0a898c_b052_4f0f_90be_3be363f94473&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_8e0a898c_b052_4f0f_90be_3be363f94473&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{8E0A898C-B052-4F0F-90BE-3BE363F94473}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<MyLeave:MyLeave runat="server" ID="g_3515a4de_0021_4b9a_b548_5ad97fb0914d" Description="My Visual WebPart" ChromeType="None" Title="MyLeave" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='MyLeave' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_3515a4de_0021_4b9a_b548_5ad97fb0914d' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot;&gt;
    $(function () {
        $(&quot;#txtDateFrom&quot;).datepicker({
            changeMonth: true,
            changeYear: true
        });
        $(&quot;#txtDateTo&quot;).datepicker({
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
                        &lt;span style=&quot;color: white;&quot;&gt;My Leave&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_lblStartDate&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Start Date&lt;/span&gt;
            &lt;div id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_pnlDateFrom&quot; style=&quot;display: inline;&quot;&gt;
		
                &lt;input id=&quot;txtDateFrom&quot; name=&quot;txtDateFrom&quot; style=&quot;width: 200px;&quot; type=&quot;text&quot; value=&quot;&quot; /&gt;
            
	&lt;/div&gt;
            &lt;span style=&quot;padding-left: 50px;&quot;&gt;&lt;/span&gt;
            
            &lt;div id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_pnlDateTo&quot; style=&quot;display: inline;&quot;&gt;
		
                &lt;input id=&quot;txtDateTo&quot; name=&quot;txtDateTo&quot; style=&quot;width: 200px;&quot; type=&quot;text&quot; value=&quot;&quot; /&gt;
            
	&lt;/div&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 160px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_lblFrom&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;From&lt;/span&gt;
            &lt;span style=&quot;padding-left: 165px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_lblTo&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;To&lt;/span&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_lblDayOff&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Type of Days Off&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_3515a4de_0021_4b9a_b548_5ad97fb0914d$ctl00$ddlDayOff&quot; id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_ddlDayOff&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_lblStatus&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Status&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_3515a4de_0021_4b9a_b548_5ad97fb0914d$ctl00$ddlStatus&quot; id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_ddlStatus&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
		&lt;option value=&quot;Approved&quot;&gt;Approved&lt;/option&gt;
		&lt;option value=&quot;Not Approve&quot;&gt;Not Approve&lt;/option&gt;
		&lt;option value=&quot;Rejected&quot;&gt;Rejected&lt;/option&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 155px&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_3515a4de_0021_4b9a_b548_5ad97fb0914d$ctl00$btnSearch&quot; value=&quot;Search&quot; id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_btnSearch&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_3515a4de_0021_4b9a_b548_5ad97fb0914d$ctl00$btnReset&quot; value=&quot;Reset&quot; id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_btnReset&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
            
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br /&gt;
&lt;br /&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_3515a4de_0021_4b9a_b548_5ad97fb0914d_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{3515A4DE-0021-4B9A-B548-5AD97FB0914D}" WebPart="true" __designer:IsClosed="false"></MyLeave:MyLeave>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{6f421e1e-25c5-45c7-b0f9-587382ee9ee7}" WebPart="true" __designer:IsClosed="false" id="g_6f421e1e_25c5_45c7_b0f9_587382ee9ee7" __designer:Preview="&lt;div id=&quot;g_6f421e1e_25c5_45c7_b0f9_587382ee9ee7&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{6f421e1e-25c5-45c7-b0f9-587382ee9ee7}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_6f421e1e_25c5_45c7_b0f9_587382ee9ee7' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

						
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{c5d2931c-a36b-422c-be48-fb9eeef0782e}" WebPart="true" __designer:IsClosed="false" id="g_c5d2931c_a36b_422c_be48_fb9eeef0782e" __designer:Preview="&lt;div id=&quot;g_c5d2931c_a36b_422c_be48_fb9eeef0782e&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{c5d2931c-a36b-422c-be48-fb9eeef0782e}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_c5d2931c_a36b_422c_be48_fb9eeef0782e_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_c5d2931c_a36b_422c_be48_fb9eeef0782e$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_c5d2931c_a36b_422c_be48_fb9eeef0782e_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_c5d2931c_a36b_422c_be48_fb9eeef0782e$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_c5d2931c_a36b_422c_be48_fb9eeef0782e_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_c5d2931c_a36b_422c_be48_fb9eeef0782e$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_c5d2931c_a36b_422c_be48_fb9eeef0782e' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

						
</asp:Content>

