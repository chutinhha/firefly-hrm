<%@ Register tagprefix="AttendanceRecord" namespace="SP2010VisualWebPart.AttendanceRecord" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><AttendanceRecord:AttendanceRecord runat="server" ID="g_fc90b503_bb67_4ed8_8713_7a4e2823e414" Description="AttendanceRecord" ChromeType="None" Title="AttendanceRecord" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='AttendanceRecord' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_fc90b503_bb67_4ed8_8713_7a4e2823e414' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;/resources/demos/style.css&quot; /&gt;
&lt;script&gt;
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
&lt;br&gt;&lt;div id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;View Attendance Records&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
    &lt;br /&gt;

    

    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_lblEmployeeName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employee Name(*)&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_fc90b503_bb67_4ed8_8713_7a4e2823e414$ctl00$txtEmployeeName&quot; type=&quot;text&quot; id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_txtEmployeeName&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:155px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;display:inline-block;width:120px;&quot;&gt;&lt;input id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_rdoViewDate&quot; type=&quot;radio&quot; name=&quot;FullPage$g_fc90b503_bb67_4ed8_8713_7a4e2823e414$ctl00$ViewDateType&quot; value=&quot;rdoViewDate&quot; checked=&quot;checked&quot; /&gt;&lt;label for=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_rdoViewDate&quot;&gt;View a date&lt;/label&gt;&lt;/span&gt;
    &lt;span style=&quot;display:inline-block;width:150px;&quot;&gt;&lt;input id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_rdoViewRange&quot; type=&quot;radio&quot; name=&quot;FullPage$g_fc90b503_bb67_4ed8_8713_7a4e2823e414$ctl00$ViewDateType&quot; value=&quot;rdoViewRange&quot; /&gt;&lt;label for=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_rdoViewRange&quot;&gt;View range of date&lt;/label&gt;&lt;/span&gt;
    &lt;input id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_rdoViewAll&quot; type=&quot;radio&quot; name=&quot;FullPage$g_fc90b503_bb67_4ed8_8713_7a4e2823e414$ctl00$ViewDateType&quot; value=&quot;rdoViewAll&quot; /&gt;&lt;label for=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_rdoViewAll&quot;&gt;View all&lt;/label&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_lblDate&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Date&lt;/span&gt;
    &lt;div id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_pnlDateFrom&quot; style=&quot;display:inline;&quot;&gt;
			&lt;input type=&quot;text&quot; id=&quot;txtDateFrom&quot; name=&quot;txtDateFrom&quot; size=&quot;30&quot; value=&quot;&quot;/&gt;
		&lt;/div&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
    &lt;div id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_pnlDateTo&quot; style=&quot;display:inline;&quot;&gt;
			&lt;input type=&quot;text&quot; id=&quot;txtDateTo&quot; name=&quot;txtDateTo&quot; value=&quot;&quot; size=&quot;30&quot;/&gt;
		&lt;/div&gt;

    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_lblDateDescription&quot; style=&quot;display:inline-block;height:20px;width:155px;&quot;&gt;(mm-dd-yyyy)&lt;/span&gt;&lt;span id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_lblDateFrom&quot; style=&quot;display:inline-block;width:50px;&quot;&gt;From&lt;/span&gt;

    &lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_lblDateTo&quot;&gt;To&lt;/span&gt;
    &lt;div class=&quot;borderTop&quot;&gt;
    &lt;span style=&quot;padding-left:155px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_fc90b503_bb67_4ed8_8713_7a4e2823e414$ctl00$btnView&quot; value=&quot;View&quot; id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_btnView&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;/div&gt;
    

&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
	&lt;/div&gt;
&lt;br&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span id=&quot;FullPage_g_fc90b503_bb67_4ed8_8713_7a4e2823e414_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;



&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{FC90B503-BB67-4ED8-8713-7A4E2823E414}" WebPart="true" __designer:IsClosed="false"></AttendanceRecord:AttendanceRecord>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{d0968965-7be5-4c72-8786-af5d355a1164}" WebPart="true" __designer:IsClosed="false" id="g_d0968965_7be5_4c72_8786_af5d355a1164" __designer:Preview="&lt;div id=&quot;g_d0968965_7be5_4c72_8786_af5d355a1164&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{d0968965-7be5-4c72-8786-af5d355a1164}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_d0968965_7be5_4c72_8786_af5d355a1164_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_d0968965_7be5_4c72_8786_af5d355a1164' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{bbf784eb-7103-4089-9a62-705e69909468}" WebPart="true" __designer:IsClosed="false" id="g_bbf784eb_7103_4089_9a62_705e69909468" __designer:Preview="&lt;div id=&quot;g_bbf784eb_7103_4089_9a62_705e69909468&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{bbf784eb-7103-4089-9a62-705e69909468}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_bbf784eb_7103_4089_9a62_705e69909468_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_bbf784eb_7103_4089_9a62_705e69909468$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_bbf784eb_7103_4089_9a62_705e69909468_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_bbf784eb_7103_4089_9a62_705e69909468$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_bbf784eb_7103_4089_9a62_705e69909468_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_bbf784eb_7103_4089_9a62_705e69909468$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_bbf784eb_7103_4089_9a62_705e69909468' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

						
</asp:Content>


