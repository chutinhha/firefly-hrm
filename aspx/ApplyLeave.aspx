﻿<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="ApplyLeave" namespace="SP2010VisualWebPart.User.Leave.ApplyLeave" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_007214a1_d8f8_4395_958e_41612eeef9e9" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_007214a1_d8f8_4395_958e_41612eeef9e9' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_007214a1_d8f8_4395_958e_41612eeef9e9&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_007214a1_d8f8_4395_958e_41612eeef9e9&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{007214A1-D8F8-4395-958E-41612EEEF9E9}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<ApplyLeave:ApplyLeave runat="server" ID="g_bf9b5911_6a13_4fa7_886e_849b770e4900" Description="My Visual WebPart" ChromeType="None" Title="ApplyLeave" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='ApplyLeave' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_bf9b5911_6a13_4fa7_886e_849b770e4900' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900&quot;&gt;
	
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
&lt;div id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		
    &lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;table class=&quot;fieldTitleTable&quot;&gt;
                    &lt;tr&gt;
                        &lt;td class=&quot;fieldTitleTd&quot;&gt;
                            &lt;span style=&quot;color: white;&quot;&gt;Apply Leave&lt;/span&gt;
                        &lt;/td&gt;
                    &lt;/tr&gt;
                &lt;/table&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left:5px&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblLeave&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Leave Type(*)&lt;/span&gt;
        &lt;div class=&quot;styled-selectLong&quot;&gt;
&lt;select name=&quot;FullPage$g_bf9b5911_6a13_4fa7_886e_849b770e4900$ctl00$ddlLeave&quot; id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_ddlLeave&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
&lt;br /&gt;&lt;br /&gt;

            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblFrom&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;From(*)&lt;/span&gt;
            &lt;div id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_pnlDateFrom&quot; style=&quot;display: inline;&quot;&gt;
			
            &lt;input id=&quot;txtDateFrom&quot; name=&quot;txtDateFrom&quot; style=&quot;width: 200px;&quot; type=&quot;text&quot; value=&quot;&quot; /&gt;
            
		&lt;/div&gt;
            
            &lt;br /&gt;&lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblTo&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;To(*)&lt;/span&gt;
            &lt;div id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_pnlDateTo&quot; style=&quot;display: inline;&quot;&gt;
			
            &lt;input id=&quot;txtDateTo&quot; name=&quot;txtDateTo&quot; style=&quot;width: 200px;&quot; type=&quot;text&quot; value=&quot;&quot; /&gt;
            
		&lt;/div&gt;
            
            &lt;br /&gt;&lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblNote&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Note&lt;/span&gt;&lt;br /&gt;
            &lt;span style=&quot;padding-left: 160px;&quot;&gt;&lt;/span&gt;
                &lt;textarea name=&quot;FullPage$g_bf9b5911_6a13_4fa7_886e_849b770e4900$ctl00$TextArea1&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_TextArea1&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;&lt;br/&gt;
             &lt;br/&gt;
                    &amp;nbsp;&lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblRequire&quot; style=&quot;display:inline-block;width:150px;color:Red&quot;&gt;(*) is required field&lt;/span&gt;
                        &lt;br/&gt;&lt;br/&gt;
                        	&lt;div class=&quot;borderTop&quot;&gt;
&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_bf9b5911_6a13_4fa7_886e_849b770e4900$ctl00$btnApply&quot; value=&quot;Apply&quot; id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_btnApply&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
&lt;/div&gt;
                &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;

	&lt;/div&gt;
&lt;br /&gt;
&lt;br /&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_bf9b5911_6a13_4fa7_886e_849b770e4900_ctl00_lblSuccess&quot; style=&quot;color:Green;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{BF9B5911-6A13-4FA7-886E-849B770E4900}" WebPart="true" __designer:IsClosed="false"></ApplyLeave:ApplyLeave>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{366709bd-77d5-4a9c-9ce7-56e93330c8f5}" WebPart="true" __designer:IsClosed="false" id="g_366709bd_77d5_4a9c_9ce7_56e93330c8f5" __designer:Preview="&lt;div id=&quot;g_366709bd_77d5_4a9c_9ce7_56e93330c8f5&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{366709bd-77d5-4a9c-9ce7-56e93330c8f5}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_366709bd_77d5_4a9c_9ce7_56e93330c8f5' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

	
						
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{80e42ea9-9c12-48c6-8aee-9700ae0fea8e}" WebPart="true" __designer:IsClosed="false" id="g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e" __designer:Preview="&lt;div id=&quot;g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{80e42ea9-9c12-48c6-8aee-9700ae0fea8e}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_80e42ea9_9c12_48c6_8aee_9700ae0fea8e' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

	
						
</asp:Content>

