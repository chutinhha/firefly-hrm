<%@ Register tagprefix="AddProject" namespace="SP2010VisualWebPart.Admin.Project.AddProject" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_d10cee23_2ab9_4344_98a4_256c7fa29155" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_d10cee23_2ab9_4344_98a4_256c7fa29155' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_d10cee23_2ab9_4344_98a4_256c7fa29155&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_d10cee23_2ab9_4344_98a4_256c7fa29155&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{D10CEE23-2AB9-4344-98A4-256C7FA29155}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<AddProject:AddProject runat="server" ID="g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866" Description="My Visual WebPart" ChromeType="None" Title="AddProject" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='AddProject' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
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
    $(function () {
        $(&quot;#txtStartDate&quot;).datepicker({
            changeMonth: true,
            changeYear: true
        });
        $(&quot;#txtEndDate&quot;).datepicker({
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
                        &lt;span style=&quot;color: white;&quot;&gt;Add New Project&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_lblProjectName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Project Name(*)&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866$ctl00$txtProjectName&quot; type=&quot;text&quot; id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_txtProjectName&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_lblNote&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Note&lt;/span&gt;
            &lt;p&gt;
                &lt;span style=&quot;padding-left: 160px;&quot;&gt;
                    &lt;textarea name=&quot;FullPage$g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866$ctl00$txtNote&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_txtNote&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;
            &lt;/p&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_lblStartDate&quot; style=&quot;display:inline-block;width:155px;&quot;&gt;Start Date&lt;/span&gt;&lt;input
                type=&quot;text&quot; id=&quot;txtStartDate&quot; name=&quot;txtStartDate&quot; style=&quot;width: 200px;&quot; value=&quot;&quot; /&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_lblEndDate&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;End Date&lt;/span&gt;
            &lt;input type=&quot;text&quot; id=&quot;txtEndDate&quot; name=&quot;txtEndDate&quot; style=&quot;width: 200px;&quot; value=&quot;&quot; /&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
                &amp;nbsp;&lt;span style=&quot;color: Red;&quot;&gt;(*) is required&lt;/span&gt;
                &lt;br /&gt;
                &lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return ConfirmOnSave();&quot; id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;&lt;/div&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br /&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_758bd9cc_21fe_4c49_9b3e_4c2f026e3866_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;&lt;br /&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{758BD9CC-21FE-4C49-9B3E-4C2F026E3866}" WebPart="true" __designer:IsClosed="false"></AddProject:AddProject>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

								
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{daf8c0c1-5b4c-4350-ad9c-1fe36a98e528}" WebPart="true" __designer:IsClosed="false" id="g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528" __designer:Preview="&lt;div id=&quot;g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{daf8c0c1-5b4c-4350-ad9c-1fe36a98e528}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_daf8c0c1_5b4c_4350_ad9c_1fe36a98e528' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

								
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{db9e4520-8441-472e-a2b6-07a8a75926d5}" WebPart="true" __designer:IsClosed="false" id="g_db9e4520_8441_472e_a2b6_07a8a75926d5" __designer:Preview="&lt;div id=&quot;g_db9e4520_8441_472e_a2b6_07a8a75926d5&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{db9e4520-8441-472e-a2b6-07a8a75926d5}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_db9e4520_8441_472e_a2b6_07a8a75926d5' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

								
</asp:Content>

