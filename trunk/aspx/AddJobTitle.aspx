<%@ Register tagprefix="AddJobtitle" namespace="SP2010VisualWebPart.AddJobtitle" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="/_catalogs/masterpage/MasterPage/Admin.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_00178df3_5571_44ba_8442_e44fb81f0755" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_00178df3_5571_44ba_8442_e44fb81f0755' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_00178df3_5571_44ba_8442_e44fb81f0755&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_00178df3_5571_44ba_8442_e44fb81f0755&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{00178DF3-5571-44BA-8442-E44FB81F0755}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<AddJobtitle:AddJobtitle runat="server" ID="g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4" Description="AddJobtitle" ChromeType="None" Title="AddJobtitle" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='AddJobtitle' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4&quot;&gt;
	
&lt;script type=&quot;text/javascript&quot;&gt;
    function ConfirmOnDelete() {
        if (confirm(&quot;&quot;) == true)
            return true;
        else
            return false;
    }
    function ConfirmOnSave() {
        if (confirm(&quot;&quot;) == true)
            return true;
        else
            return false;
    }
&lt;/script&gt;

&lt;div id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		
    &lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;table class=&quot;fieldTitleTable&quot;&gt;
                    &lt;tr&gt;
                        &lt;td class=&quot;fieldTitleTd&quot;&gt;
                            &lt;span style=&quot;color: white;&quot;&gt;Add Job Title&lt;/span&gt;
                        &lt;/td&gt;
                    &lt;/tr&gt;
                &lt;/table&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Title(*)&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4$ctl00$txtJobTitle&quot; type=&quot;text&quot; id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_txtJobTitle&quot; style=&quot;width:400px;&quot; /&gt;
                &lt;p&gt;
                    &amp;nbsp;&lt;/p&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_lblJobCategory&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Category&lt;/span&gt;
                &lt;div class=&quot;styled-selectLong&quot;&gt;
                    &lt;select name=&quot;FullPage$g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4$ctl00$ddlJobCategory&quot; id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_ddlJobCategory&quot;&gt;

		&lt;/select&gt;
                &lt;/div&gt;
                &lt;p&gt;
                    &amp;nbsp;&lt;/p&gt;
                &lt;p&gt;
                    &lt;br /&gt;
                    &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                    &lt;span id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_lblJobDescription&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Description&lt;/span&gt;
                &lt;/p&gt;
                &lt;p&gt;
                    &lt;span style=&quot;padding-left: 160px;&quot;&gt;&lt;/span&gt;
                    &lt;textarea name=&quot;FullPage$g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4$ctl00$txtJobDescription&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_txtJobDescription&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;
                &lt;/p&gt;
                &lt;p&gt;
                    &amp;nbsp;&lt;/p&gt;
                &lt;p&gt;
                    &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                    &lt;span id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_lblNote&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Note&lt;/span&gt;
                &lt;/p&gt;
                &lt;p&gt;
                    &lt;span style=&quot;padding-left: 160px;&quot;&gt;&lt;/span&gt;
                    &lt;textarea name=&quot;FullPage$g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4$ctl00$txtNote&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_txtNote&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;
                &lt;/p&gt;
                &lt;p&gt;
                    &amp;nbsp;&lt;/p&gt;
                    &amp;nbsp;&lt;span style=&quot;color: Red;&quot;&gt;(*) is required&lt;/span&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;div class=&quot;borderTop&quot;&gt;
                    &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;
                    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return ConfirmOnSave();&quot; id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;

	&lt;/div&gt;
&lt;br /&gt;
    &amp;nbsp;&lt;span id=&quot;FullPage_g_a915f6cb_10ee_4f4f_ab81_39a914fcd8f4_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;
&lt;br /&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{A915F6CB-10EE-4F4F-AB81-39A914FCD8F4}" WebPart="true" __designer:IsClosed="false"></AddJobtitle:AddJobtitle>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{20d7710d-8c9b-47e2-a4d8-a55fb26ea0bd}" WebPart="true" __designer:IsClosed="false" id="g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd" __designer:Preview="&lt;div id=&quot;g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{20d7710d-8c9b-47e2-a4d8-a55fb26ea0bd}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_20d7710d_8c9b_47e2_a4d8_a55fb26ea0bd' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>
						
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{b8ee656d-1ac8-4316-98fc-a27a69467753}" WebPart="true" __designer:IsClosed="false" id="g_b8ee656d_1ac8_4316_98fc_a27a69467753" __designer:Preview="&lt;div id=&quot;g_b8ee656d_1ac8_4316_98fc_a27a69467753&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{b8ee656d-1ac8-4316-98fc-a27a69467753}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_b8ee656d_1ac8_4316_98fc_a27a69467753' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
						
					
</asp:Content>


