<%@ Register tagprefix="Candidates" namespace="SP2010VisualWebPart.Candidates" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Candidates:Candidates runat="server" ID="g_c8ee8a1f_38c0_4237_bc1b_698665619ea9" Description="Candidates" ChromeType="None" Title="Candidates" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='Candidates' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_c8ee8a1f_38c0_4237_bc1b_698665619ea9' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
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
&lt;br&gt;&lt;div id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Candidates&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
							&lt;br /&gt;
							&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:145px;&quot;&gt;Job Title&lt;/span&gt;
							&lt;div class=&quot;styled-selectShort&quot;&gt;&lt;select name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$ddlJobTitle&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_ddlJobTitle&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
							&lt;span style=&quot;padding-left:70px;&quot;&gt;&lt;/span&gt;
							&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblVacancy&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Vacancy&lt;/span&gt;
							&lt;div class=&quot;styled-selectShort&quot;&gt;&lt;select name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$ddlVacancy&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_ddlVacancy&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
							&lt;span style=&quot;padding-left:80px;&quot;&gt;&lt;/span&gt;
							&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblHiringManager&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Hiring Manager&lt;/span&gt;
							&lt;input name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$txtHiringManager&quot; type=&quot;text&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_txtHiringManager&quot; style=&quot;width:145px;&quot; /&gt;
							&lt;br /&gt;
							&lt;br /&gt;
							&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblCandidateName&quot; style=&quot;display:inline-block;width:145px;&quot;&gt;Candidate Name&lt;/span&gt;
							&lt;input name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$txtCandidateName&quot; type=&quot;text&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_txtCandidateName&quot; style=&quot;width:115px;&quot; /&gt;
							&lt;span style=&quot;padding-left:70px;&quot;&gt;&lt;/span&gt;
							&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblKeyword&quot; style=&quot;display:inline-block;width:118px;&quot;&gt;Keywords&lt;/span&gt;
							&lt;input name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$txtKeyword&quot; type=&quot;text&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_txtKeyword&quot; style=&quot;width:115px;&quot; /&gt;
							&lt;span style=&quot;padding-left:80px;&quot;&gt;&lt;/span&gt;
							&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblStatus&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Status&lt;/span&gt;
							&lt;div class=&quot;styled-selectMedium&quot;&gt;&lt;select name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$ddlStatus&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_ddlStatus&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
							    &lt;br /&gt;
                                &lt;br /&gt;
							&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblApplyMethod&quot; style=&quot;display:inline-block;width:145px;&quot;&gt;Method of Application&lt;/span&gt;
							&lt;div class=&quot;styled-selectShort&quot;&gt;&lt;select name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$ddlApplyMethod&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_ddlApplyMethod&quot;&gt;
			&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
			&lt;option value=&quot;Online&quot;&gt;Online&lt;/option&gt;
			&lt;option value=&quot;Manual&quot;&gt;Manual&lt;/option&gt;

		&lt;/select&gt;&lt;/div&gt;
							&lt;span style=&quot;padding-left:70px;&quot;&gt;&lt;/span&gt;
							&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblApplyDate&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Apply Date&lt;/span&gt;
							&lt;div id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_pnlDateFrom&quot; style=&quot;display:inline;&quot;&gt;
			&lt;input type=&quot;text&quot; id=&quot;txtDateFrom&quot; name=&quot;txtDateFrom&quot; style=&quot;width:115px;&quot; value=&quot;&quot;/&gt;
		&lt;/div&gt;
                                &lt;span style=&quot;padding-left:40px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;text&quot; id=&quot;txtDateTo&quot; name=&quot;txtDateTo&quot; style=&quot;width:115px;&quot; value=&quot;&quot;/&gt;
	&lt;/div&gt;
                                &lt;br /&gt;
                                &lt;span style=&quot;padding-left:480px;&quot;&gt;&lt;/span&gt;
&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblDateFrom&quot; style=&quot;display:inline-block;height:20px;width:170px;&quot;&gt;From&lt;/span&gt;
							    &lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblDateTo&quot;&gt;To&lt;/span&gt;
							    &lt;br /&gt;
                                &lt;div class=&quot;borderTop&quot;&gt;
                                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$btnSearch&quot; value=&quot;Search&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_btnSearch&quot; class=&quot;addButton&quot; style=&quot;width:70px;&quot; /&gt;
                                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$btnReset&quot; value=&quot;Reset&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_btnReset&quot; class=&quot;resetButton&quot; style=&quot;width:70px;&quot; /&gt;
                                    &lt;/div&gt;
							&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/asp:Panel&gt;

&lt;p&gt;
    &amp;nbsp;&lt;/p&gt;
&lt;table class=&quot;fieldTitleDiv&quot;&gt;&lt;tr&gt;&lt;td&gt;
	&lt;div class=&quot;borderBottom&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$btnAdd&quot; value=&quot;Add&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_btnAdd&quot; class=&quot;addButton&quot; style=&quot;width:70px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$btnEdit&quot; value=&quot;Edit&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_btnEdit&quot; class=&quot;addButton&quot; style=&quot;width:70px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_c8ee8a1f_38c0_4237_bc1b_698665619ea9$ctl00$btnDelete&quot; value=&quot;Delete&quot; onclick=&quot;return confirm('Are you sure you want to delete ?');&quot; id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_btnDelete&quot; class=&quot;deleteButton&quot; style=&quot;width:70px;&quot; /&gt;
    &lt;/div&gt;
    &lt;br /&gt;
    &lt;table&gt;&lt;tr&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br&gt;&lt;br&gt;
&lt;span id=&quot;FullPage_g_c8ee8a1f_38c0_4237_bc1b_698665619ea9_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;


&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{C8EE8A1F-38C0-4237-BC1B-698665619EA9}" WebPart="true" __designer:IsClosed="false"></Candidates:Candidates>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{708914a5-c601-4aa3-a311-765994290dec}" WebPart="true" __designer:IsClosed="false" id="g_708914a5_c601_4aa3_a311_765994290dec" __designer:Preview="&lt;div id=&quot;g_708914a5_c601_4aa3_a311_765994290dec&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{708914a5-c601-4aa3-a311-765994290dec}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_708914a5_c601_4aa3_a311_765994290dec_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_708914a5_c601_4aa3_a311_765994290dec$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_708914a5_c601_4aa3_a311_765994290dec_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_708914a5_c601_4aa3_a311_765994290dec$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_708914a5_c601_4aa3_a311_765994290dec_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_708914a5_c601_4aa3_a311_765994290dec$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_708914a5_c601_4aa3_a311_765994290dec' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>
						
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{6876ab51-c8a5-40b1-9163-b8b2f82456cf}" WebPart="true" __designer:IsClosed="false" id="g_6876ab51_c8a5_40b1_9163_b8b2f82456cf" __designer:Preview="&lt;div id=&quot;g_6876ab51_c8a5_40b1_9163_b8b2f82456cf&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{6876ab51-c8a5-40b1-9163-b8b2f82456cf}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_6876ab51_c8a5_40b1_9163_b8b2f82456cf_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_6876ab51_c8a5_40b1_9163_b8b2f82456cf' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
						
</asp:Content>


