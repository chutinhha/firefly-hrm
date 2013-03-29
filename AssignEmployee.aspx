<%@ Register tagprefix="SearchEmployee" namespace="SP2010VisualWebPart.Admin.Person_Project.SearchEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><SearchEmployee:SearchEmployee runat="server" ID="g_99b6c35a_45f5_419e_9de8_9035b5e39779" Description="My Visual WebPart" ChromeType="None" Title="SearchEmployee" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='SearchEmployee' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_99b6c35a_45f5_419e_9de8_9035b5e39779' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;
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
&lt;br&gt;&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Search Employees By Free Time&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;
&lt;/table&gt;
&lt;br&gt;
&lt;span style=&quot;padding-left:5px&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_lblFrom&quot; style=&quot;display:inline-block;width:70px;&quot;&gt;From&lt;/span&gt;
    &lt;div id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_pnlDateFrom&quot; style=&quot;display:inline;&quot;&gt;
		
        &lt;input type=&quot;text&quot; id=&quot;txtDateFrom&quot; name=&quot;txtDateFrom&quot; style=&quot;width:200px;&quot; value=&quot;&quot; onclick=&quot;return txtDateFrom_onclick()&quot; /&gt;
	&lt;/div&gt;
    &lt;span style=&quot;padding-left: 50px&quot;&gt;&lt;/span&gt;
    &lt;span id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_lblDateTo&quot; style=&quot;display:inline-block;width:70px;&quot;&gt;To&lt;/span&gt;
    &lt;div id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_pnlDateTo&quot; style=&quot;display:inline;&quot;&gt;
		&lt;input type=&quot;text&quot; id=&quot;txtDateTo&quot; name=&quot;txtDateTo&quot; style=&quot;width:200px;&quot; value=&quot;&quot;/&gt;
	&lt;/div&gt;
    &lt;br&gt;&lt;br&gt;
    &lt;div class=&quot;borderTop&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_99b6c35a_45f5_419e_9de8_9035b5e39779$ctl00$btnSearch&quot; value=&quot;Search&quot; id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_btnSearch&quot; class=&quot;addButton&quot; style=&quot;width:70px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_99b6c35a_45f5_419e_9de8_9035b5e39779$ctl00$btnReset&quot; value=&quot;Reset&quot; id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_btnReset&quot; class=&quot;resetButton&quot; style=&quot;width:70px;&quot; /&gt;
    &lt;/div&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br&gt;
&lt;table class=&quot;fieldTitleDiv&quot;&gt;&lt;tr&gt;&lt;td&gt;    
&lt;br&gt;
&lt;span style=&quot;padding-left:5px&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_lblProject&quot; style=&quot;display:inline-block;width:70px;&quot;&gt;Project&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_99b6c35a_45f5_419e_9de8_9035b5e39779$ctl00$txtProject&quot; type=&quot;text&quot; readonly=&quot;readonly&quot; id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_txtProject&quot; style=&quot;width:200px;&quot; /&gt;
&lt;span style=&quot;padding-left:50px&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_lblTask&quot; style=&quot;display:inline-block;width:70px;&quot;&gt;Task&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_99b6c35a_45f5_419e_9de8_9035b5e39779$ctl00$txtTask&quot; type=&quot;text&quot; readonly=&quot;readonly&quot; id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_txtTask&quot; style=&quot;width:200px;&quot; /&gt;
&lt;br/&gt;&lt;br&gt;
&lt;div class=&quot;borderTop&quot;&gt;
&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_99b6c35a_45f5_419e_9de8_9035b5e39779$ctl00$btnAssign&quot; value=&quot;Assign&quot; id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_btnAssign&quot; class=&quot;addButton&quot; style=&quot;width:70px;&quot; /&gt;
&lt;/div&gt;

    
    &lt;/tr&gt;&lt;/td&gt;&lt;/table&gt;
&lt;br&gt;&lt;br&gt;
&lt;span id=&quot;FullPage_g_99b6c35a_45f5_419e_9de8_9035b5e39779_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{99B6C35A-45F5-419E-9DE8-9035B5E39779}" WebPart="true" __designer:IsClosed="false"></SearchEmployee:SearchEmployee>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

		
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{d6086949-16af-4587-8bff-55ced8cb6e2c}" WebPart="true" __designer:IsClosed="false" id="g_d6086949_16af_4587_8bff_55ced8cb6e2c" __designer:Preview="&lt;div id=&quot;g_d6086949_16af_4587_8bff_55ced8cb6e2c&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{d6086949-16af-4587-8bff-55ced8cb6e2c}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_d6086949_16af_4587_8bff_55ced8cb6e2c_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_d6086949_16af_4587_8bff_55ced8cb6e2c$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_d6086949_16af_4587_8bff_55ced8cb6e2c_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_d6086949_16af_4587_8bff_55ced8cb6e2c$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_d6086949_16af_4587_8bff_55ced8cb6e2c_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_d6086949_16af_4587_8bff_55ced8cb6e2c$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_d6086949_16af_4587_8bff_55ced8cb6e2c' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

		
						
</asp:Content>

