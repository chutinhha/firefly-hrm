<%@ Register tagprefix="PunchAttendance" namespace="SP2010VisualWebPart.PunchAttendance" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><PunchAttendance:PunchAttendance runat="server" ID="g_436571a1_c83c_4219_bec9_938aa0b9eca2" Description="PunchAttendance" ChromeType="None" Title="PunchAttendance" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='PunchAttendance' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_436571a1_c83c_4219_bec9_938aa0b9eca2' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;/resources/demos/style.css&quot; /&gt;
&lt;script&gt;
    $(function () {
        $(&quot;#txtDate&quot;).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
&lt;/script&gt;
&lt;br&gt;&lt;div id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;&lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_Label1&quot;&gt;Punch In&lt;/span&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br&gt;
&lt;p&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_lblEmployeeName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employee Name&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_436571a1_c83c_4219_bec9_938aa0b9eca2$ctl00$txtEmployeeName&quot; type=&quot;text&quot; readonly=&quot;readonly&quot; id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_txtEmployeeName&quot; disabled=&quot;disabled&quot; style=&quot;width:200px;&quot; /&gt;
&lt;/p&gt;
&lt;br&gt;&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_lblDate&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Date(*)&lt;/span&gt;
&lt;div id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_pnlDate&quot; style=&quot;display:inline;&quot;&gt;
			&lt;input type=&quot;text&quot; id=&quot;&quot; name=&quot;txtDate&quot; size=&quot;30&quot; value=&quot;&quot;/&gt;
		&lt;/div&gt;
&lt;br&gt;&lt;br&gt;&lt;p&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_lblTime&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Time(*)&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_436571a1_c83c_4219_bec9_938aa0b9eca2$ctl00$txtTime&quot; type=&quot;text&quot; id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_txtTime&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_Label5&quot;&gt;HH:MM&lt;/span&gt;
&lt;/p&gt;
&lt;br&gt;&lt;p&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_lblNote&quot;&gt;Note&lt;/span&gt;
&lt;/p&gt;
&lt;p&gt;
    &lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;&lt;textarea name=&quot;FullPage$g_436571a1_c83c_4219_bec9_938aa0b9eca2$ctl00$txtNote&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_txtNote&quot; style=&quot;height:100px;width:410px;&quot;&gt;&lt;/textarea&gt;
&lt;/p&gt;
&lt;div class=&quot;borderTop&quot;&gt;
    &lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_436571a1_c83c_4219_bec9_938aa0b9eca2$ctl00$btnInOut&quot; value=&quot;In&quot; id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_btnInOut&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
        &lt;/div&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
	&lt;/div&gt;&lt;br&gt;
&lt;span id=&quot;FullPage_g_436571a1_c83c_4219_bec9_938aa0b9eca2_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;



&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{436571A1-C83C-4219-BEC9-938AA0B9ECA2}" WebPart="true" __designer:IsClosed="false"></PunchAttendance:PunchAttendance>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">
						
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{c49a7be3-a962-4e75-a841-1e85033f3dfc}" WebPart="true" __designer:IsClosed="false" id="g_c49a7be3_a962_4e75_a841_1e85033f3dfc" __designer:Preview="&lt;div id=&quot;g_c49a7be3_a962_4e75_a841_1e85033f3dfc&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{c49a7be3-a962-4e75-a841-1e85033f3dfc}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_c49a7be3_a962_4e75_a841_1e85033f3dfc_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_c49a7be3_a962_4e75_a841_1e85033f3dfc' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{989f8c2b-5c5d-4f77-9389-6ee3961c3607}" WebPart="true" __designer:IsClosed="false" id="g_989f8c2b_5c5d_4f77_9389_6ee3961c3607" __designer:Preview="&lt;div id=&quot;g_989f8c2b_5c5d_4f77_9389_6ee3961c3607&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{989f8c2b-5c5d-4f77-9389-6ee3961c3607}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_989f8c2b_5c5d_4f77_9389_6ee3961c3607_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_989f8c2b_5c5d_4f77_9389_6ee3961c3607$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_989f8c2b_5c5d_4f77_9389_6ee3961c3607_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_989f8c2b_5c5d_4f77_9389_6ee3961c3607$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_989f8c2b_5c5d_4f77_9389_6ee3961c3607_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_989f8c2b_5c5d_4f77_9389_6ee3961c3607$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_989f8c2b_5c5d_4f77_9389_6ee3961c3607' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>
						
</asp:Content>

