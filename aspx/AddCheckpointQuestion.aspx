<%@ Register tagprefix="AddNewQuestion" namespace="SP2010VisualWebPart.Admin.Checkpoint.AddNewQuestion" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_7fe91e02_e182_4fa4_bc95_d6fa8ac06212" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_7fe91e02_e182_4fa4_bc95_d6fa8ac06212' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_7fe91e02_e182_4fa4_bc95_d6fa8ac06212&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_7fe91e02_e182_4fa4_bc95_d6fa8ac06212&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{7FE91E02-E182-4FA4-BC95-D6FA8AC06212}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<AddNewQuestion:AddNewQuestion runat="server" ID="g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90" Description="AddNewQuestion" ChromeType="None" Title="AddNewQuestion" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='AddNewQuestion' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90&quot;&gt;
	
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

&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;span style=&quot;color: white;&quot;&gt;Add Checkpoint Question&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_lblQuestion&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Question(*)&lt;/span&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;
            &lt;textarea name=&quot;FullPage$g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90$ctl00$txtQuestion&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_txtQuestion&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_lblAnserType&quot; style=&quot;display:inline-block;width:143px;&quot;&gt;Answer type&lt;/span&gt;
            &lt;span style=&quot;display:inline-block;width:100px;&quot;&gt;&lt;input id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_rdoYesNo&quot; type=&quot;radio&quot; name=&quot;FullPage$g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90$ctl00$rdoGroup&quot; value=&quot;rdoYesNo&quot; checked=&quot;checked&quot; /&gt;&lt;label for=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_rdoYesNo&quot;&gt;Yes/No&lt;/label&gt;&lt;/span&gt;
            &lt;span style=&quot;display:inline-block;width:100px;&quot;&gt;&lt;input id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_rdoNote&quot; type=&quot;radio&quot; name=&quot;FullPage$g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90$ctl00$rdoGroup&quot; value=&quot;rdoNote&quot; /&gt;&lt;label for=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_rdoNote&quot;&gt;Write note&lt;/label&gt;&lt;/span&gt;
            &lt;input id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_rdoLevel&quot; type=&quot;radio&quot; name=&quot;FullPage$g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90$ctl00$rdoGroup&quot; value=&quot;rdoLevel&quot; /&gt;&lt;label for=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_rdoLevel&quot;&gt;Choose level&lt;/label&gt;
            &lt;p&gt;
                &amp;nbsp;&lt;/p&gt;
            
            &amp;nbsp;&lt;span style=&quot;color: Red;&quot;&gt;(*) is required&lt;/span&gt;
                &lt;br /&gt;
                &lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 150px;&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return ConfirmOnSave();&quot; id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;/div&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br /&gt;
    &amp;nbsp;&lt;span id=&quot;FullPage_g_4c534ddd_2016_4c98_8ccf_8c6e2f3afd90_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;
&lt;br /&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{4C534DDD-2016-4C98-8CCF-8C6E2F3AFD90}" WebPart="true" __designer:IsClosed="false"></AddNewQuestion:AddNewQuestion>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">
				
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{8738fad4-9690-4b29-908e-94a04fb94c3e}" WebPart="true" __designer:IsClosed="false" id="g_8738fad4_9690_4b29_908e_94a04fb94c3e" __designer:Preview="&lt;div id=&quot;g_8738fad4_9690_4b29_908e_94a04fb94c3e&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{8738fad4-9690-4b29-908e-94a04fb94c3e}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_8738fad4_9690_4b29_908e_94a04fb94c3e_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_8738fad4_9690_4b29_908e_94a04fb94c3e$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_8738fad4_9690_4b29_908e_94a04fb94c3e_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_8738fad4_9690_4b29_908e_94a04fb94c3e$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_8738fad4_9690_4b29_908e_94a04fb94c3e_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_8738fad4_9690_4b29_908e_94a04fb94c3e$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_8738fad4_9690_4b29_908e_94a04fb94c3e' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>
						
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{c890e6ae-6671-4a0f-b63b-ed7f2a5d5483}" WebPart="true" __designer:IsClosed="false" id="g_c890e6ae_6671_4a0f_b63b_ed7f2a5d5483" __designer:Preview="&lt;div id=&quot;g_c890e6ae_6671_4a0f_b63b_ed7f2a5d5483&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{c890e6ae-6671-4a0f-b63b-ed7f2a5d5483}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_c890e6ae_6671_4a0f_b63b_ed7f2a5d5483' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
						
</asp:Content>


