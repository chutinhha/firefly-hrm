﻿<%@ Register tagprefix="searchEmployee" namespace="SP2010VisualWebPart.Admin.Employee.searchEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_3b5946ff_f0d6_40af_995a_1365648553c6" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_3b5946ff_f0d6_40af_995a_1365648553c6' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_3b5946ff_f0d6_40af_995a_1365648553c6&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_3b5946ff_f0d6_40af_995a_1365648553c6&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{3B5946FF-F0D6-40AF-995A-1365648553C6}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<searchEmployee:searchEmployee runat="server" ID="g_461848ac_b8dc_4056_b6ae_c336b49b6112" Description="My Visual WebPart" ChromeType="None" Title="searchEmployee" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='searchEmployee' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_461848ac_b8dc_4056_b6ae_c336b49b6112' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112&quot;&gt;
	

&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;span style=&quot;color: white;&quot;&gt;Employee List&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_lblEmployeeName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employee Name&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$txtEmployeeName&quot; type=&quot;text&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_txtEmployeeName&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left: 100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_lblCurrentFlag&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employment Status&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$ddlCurrentFlag&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_ddlCurrentFlag&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
		&lt;option value=&quot;Active&quot;&gt;Active&lt;/option&gt;
		&lt;option value=&quot;Inactive&quot;&gt;Inactive&lt;/option&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_lblRank&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Rank&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$ddlRank&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_ddlRank&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
		&lt;option value=&quot;Admin&quot;&gt;Admin&lt;/option&gt;
		&lt;option value=&quot;User&quot;&gt;User&lt;/option&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;span style=&quot;padding-left: 100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_lblCountry&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Country&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
            &lt;select name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$ddlCountry&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_ddlCountry&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_lblCity&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;City&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$txtCity&quot; type=&quot;text&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_txtCity&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left: 100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_lblAddressStreet&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Address Street&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$txtAddressStreet&quot; type=&quot;text&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_txtAddressStreet&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$btnSearch&quot; value=&quot;Search&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_btnSearch&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$btnReset&quot; value=&quot;Reset&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_btnReset&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br /&gt;
&lt;table class=&quot;fieldTitleDiv&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;div class=&quot;borderBottom&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_461848ac_b8dc_4056_b6ae_c336b49b6112$ctl00$btnEdit&quot; value=&quot;Edit&quot; id=&quot;FullPage_g_461848ac_b8dc_4056_b6ae_c336b49b6112_ctl00_btnEdit&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
            &lt;br /&gt;
            
            &lt;table&gt;
                &lt;tr&gt;
                    &lt;td&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{461848AC-B8DC-4056-B6AE-C336B49B6112}" WebPart="true" __designer:IsClosed="false"></searchEmployee:searchEmployee>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{6e5d2181-9a8b-40ca-a998-aeaf5da7df0c}" WebPart="true" __designer:IsClosed="false" id="g_6e5d2181_9a8b_40ca_a998_aeaf5da7df0c" __designer:Preview="&lt;div id=&quot;g_6e5d2181_9a8b_40ca_a998_aeaf5da7df0c&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{6e5d2181-9a8b-40ca-a998-aeaf5da7df0c}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_6e5d2181_9a8b_40ca_a998_aeaf5da7df0c' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

						
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{318c5569-12cb-4b36-b76c-00b71565c9f5}" WebPart="true" __designer:IsClosed="false" id="g_318c5569_12cb_4b36_b76c_00b71565c9f5" __designer:Preview="&lt;div id=&quot;g_318c5569_12cb_4b36_b76c_00b71565c9f5&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{318c5569-12cb-4b36-b76c-00b71565c9f5}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_318c5569_12cb_4b36_b76c_00b71565c9f5_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_318c5569_12cb_4b36_b76c_00b71565c9f5$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_318c5569_12cb_4b36_b76c_00b71565c9f5_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_318c5569_12cb_4b36_b76c_00b71565c9f5$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_318c5569_12cb_4b36_b76c_00b71565c9f5_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_318c5569_12cb_4b36_b76c_00b71565c9f5$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_318c5569_12cb_4b36_b76c_00b71565c9f5' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

						
</asp:Content>

