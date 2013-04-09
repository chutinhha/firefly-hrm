<%@ Register tagprefix="ChangePassword" namespace="SP2010VisualWebPart.ChangePassword" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_3df40a67_8aa2_4577_99a8_f6c136fea34a" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_3df40a67_8aa2_4577_99a8_f6c136fea34a' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_3df40a67_8aa2_4577_99a8_f6c136fea34a&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_3df40a67_8aa2_4577_99a8_f6c136fea34a&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{3DF40A67-8AA2-4577-99A8-F6C136FEA34A}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<ChangePassword:ChangePassword runat="server" ID="g_aa802551_1524_4ebb_9346_3f92ee585fb9" Description="ChangePassword" ChromeType="None" Title="ChangePassword" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='ChangePassword' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_aa802551_1524_4ebb_9346_3f92ee585fb9' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9&quot;&gt;
	
&lt;script type=&quot;text/javascript&quot;&gt;
    function ConfirmOnChangePassword() {
        if (confirm(&quot;&quot;) == true)
            return true;
        else
            return false;
    }
&lt;/script&gt;

&lt;div id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		
    &lt;table cellpadding=&quot;0&quot; class=&quot;fieldTitleDiv&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;table class=&quot;fieldTitleTable&quot;&gt;
                    &lt;tr&gt;
                        &lt;td class=&quot;fieldTitleTd&quot;&gt;
                            &lt;span style=&quot;color: white;&quot;&gt;Change Password&lt;/span&gt;
                        &lt;/td&gt;
                    &lt;/tr&gt;
                &lt;/table&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_lblOldPassword&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Old Password(*)&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_aa802551_1524_4ebb_9346_3f92ee585fb9$ctl00$txtOldPassword&quot; type=&quot;password&quot; id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_txtOldPassword&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_lblNewPassword&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;New Password(*)&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_aa802551_1524_4ebb_9346_3f92ee585fb9$ctl00$txtNewPassword&quot; type=&quot;password&quot; id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_txtNewPassword&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_lblConfirmPassword&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Confirm Password(*)&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_aa802551_1524_4ebb_9346_3f92ee585fb9$ctl00$txtConfirmPassword&quot; type=&quot;password&quot; id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_txtConfirmPassword&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &amp;nbsp;&lt;span style=&quot;color: Red;&quot;&gt;(*) is required&lt;/span&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_aa802551_1524_4ebb_9346_3f92ee585fb9$ctl00$btnChangePassword&quot; value=&quot;Change Password&quot; onclick=&quot;return ConfirmOnChangePassword();&quot; id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_btnChangePassword&quot; class=&quot;addButton&quot; style=&quot;width:150px;&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;

	&lt;/div&gt;
&lt;br /&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;
&lt;span id=&quot;FullPage_g_aa802551_1524_4ebb_9346_3f92ee585fb9_ctl00_lblSuccess&quot; style=&quot;color: Green;&quot;&gt;&lt;/span&gt;
&lt;br /&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{AA802551-1524-4EBB-9346-3F92EE585FB9}" WebPart="true" __designer:IsClosed="false"></ChangePassword:ChangePassword>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{eb1da1e7-2682-4809-8433-d647a9a9725b}" WebPart="true" __designer:IsClosed="false" id="g_eb1da1e7_2682_4809_8433_d647a9a9725b" __designer:Preview="&lt;div id=&quot;g_eb1da1e7_2682_4809_8433_d647a9a9725b&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{eb1da1e7-2682-4809-8433-d647a9a9725b}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_eb1da1e7_2682_4809_8433_d647a9a9725b_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_eb1da1e7_2682_4809_8433_d647a9a9725b$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_eb1da1e7_2682_4809_8433_d647a9a9725b_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_eb1da1e7_2682_4809_8433_d647a9a9725b$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_eb1da1e7_2682_4809_8433_d647a9a9725b_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_eb1da1e7_2682_4809_8433_d647a9a9725b$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_eb1da1e7_2682_4809_8433_d647a9a9725b' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>
						
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{15c58851-1cce-4b2b-9fad-dbd4b97f90d1}" WebPart="true" __designer:IsClosed="false" id="g_15c58851_1cce_4b2b_9fad_dbd4b97f90d1" __designer:Preview="&lt;div id=&quot;g_15c58851_1cce_4b2b_9fad_dbd4b97f90d1&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{15c58851-1cce-4b2b-9fad-dbd4b97f90d1}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_15c58851_1cce_4b2b_9fad_dbd4b97f90d1' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
						
</asp:Content>




