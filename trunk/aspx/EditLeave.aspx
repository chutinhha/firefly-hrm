<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="editLeaveType" namespace="SP2010VisualWebPart.Admin.Leave.editLeaveType" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_71fa5978_d3b4_4afa_9897_192293a7e756" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_71fa5978_d3b4_4afa_9897_192293a7e756' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_71fa5978_d3b4_4afa_9897_192293a7e756&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_71fa5978_d3b4_4afa_9897_192293a7e756&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{71FA5978-D3B4-4AFA-9897-192293A7E756}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<editLeaveType:editLeaveType runat="server" ID="g_841435d2_1c4f_447e_9e5e_b553f6e46061" Description="My Visual WebPart" ChromeType="None" Title="editLeaveType" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='editLeaveType' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_841435d2_1c4f_447e_9e5e_b553f6e46061' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061&quot;&gt;
	
&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;span style=&quot;color: white;&quot;&gt;Edit Leave Type&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_lblLeaveName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Leave Name(*)&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$txtLeaveName&quot; type=&quot;text&quot; id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_txtLeaveName&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;br /&gt;
                &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_lblLimited&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Limited&lt;/span&gt;
            &lt;input id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_rdbLimitedYes&quot; type=&quot;radio&quot; name=&quot;FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$Limited&quot; value=&quot;rdbLimitedYes&quot; onclick=&quot;javascript:__doPostBack('FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$rdbLimitedYes','')&quot; /&gt;&lt;label for=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_rdbLimitedYes&quot;&gt;Yes&lt;/label&gt;
            &lt;input id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_rdbLimitedNo&quot; type=&quot;radio&quot; name=&quot;FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$Limited&quot; value=&quot;rdbLimitedNo&quot; checked=&quot;checked&quot; /&gt;&lt;label for=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_rdbLimitedNo&quot;&gt;No&lt;/label&gt;
            &lt;br /&gt;
                &lt;br /&gt;
            
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_lblNote&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Note&lt;/span&gt;&lt;br&gt;
            &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;&lt;textarea name=&quot;FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$txtNote&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_txtNote&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;
            &lt;br /&gt;&lt;br /&gt;
            &amp;nbsp&lt;span style=&quot;color:Red;&quot;&gt;(*): Required field&lt;/span&gt;&lt;br&gt;
            &lt;span id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_lblUserGuide&quot;&gt;&lt;/span&gt;
            &lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
            &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$btnSave&quot; value=&quot;Save&quot; id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_841435d2_1c4f_447e_9e5e_b553f6e46061$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_841435d2_1c4f_447e_9e5e_b553f6e46061_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;


&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{841435D2-1C4F-447E-9E5E-B553F6E46061}" WebPart="true" __designer:IsClosed="false"></editLeaveType:editLeaveType>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{47fad9ad-53f4-4889-9556-d3ceab586cbd}" WebPart="true" __designer:IsClosed="false" id="g_47fad9ad_53f4_4889_9556_d3ceab586cbd" __designer:Preview="&lt;div id=&quot;g_47fad9ad_53f4_4889_9556_d3ceab586cbd&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{47fad9ad-53f4-4889-9556-d3ceab586cbd}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_47fad9ad_53f4_4889_9556_d3ceab586cbd' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

								
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{f18f1a01-5267-4e12-9dfa-6a17909ac8eb}" WebPart="true" __designer:IsClosed="false" id="g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb" __designer:Preview="&lt;div id=&quot;g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{f18f1a01-5267-4e12-9dfa-6a17909ac8eb}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_f18f1a01_5267_4e12_9dfa_6a17909ac8eb' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

								
</asp:Content>

