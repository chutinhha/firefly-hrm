<%@ Register tagprefix="ImportEmployees" namespace="SP2010VisualWebPart.Admin.CSV.ImportEmployees" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_ffb7ef9b_4a55_49b8_937f_999640cffb4f" Description="
            Login
          " Title="
          Login
        " __designer:Values="&lt;P N='Description' T='&amp;#xA;            Login&amp;#xA;          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='&amp;#xA;          Login&amp;#xA;        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_ffb7ef9b_4a55_49b8_937f_999640cffb4f' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
			&lt;tr class=&quot;ms-WPHeader&quot;&gt;
				&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;&lt;td title=&quot;
          Login
         - 
            Login
          &quot; id=&quot;WebPartTitleFullPage_g_ffb7ef9b_4a55_49b8_937f_999640cffb4f&quot; class=&quot;ms-WPHeaderTd&quot;&gt;&lt;div class=&quot;ms-WPTitle&quot;&gt;&lt;nobr&gt;&lt;span&gt;
          Login
        &lt;/span&gt;&lt;span id=&quot;WebPartCaptionFullPage_g_ffb7ef9b_4a55_49b8_937f_999640cffb4f&quot;&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;/div&gt;&lt;/td&gt;&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td class=&quot;&quot; valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_ffb7ef9b_4a55_49b8_937f_999640cffb4f&quot; width=&quot;100%&quot; class=&quot;ms-WPBody ms-wpContentDivSpace&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_ffb7ef9b_4a55_49b8_937f_999640cffb4f&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{FFB7EF9B-4A55-49B8-937F-999640CFFB4F}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<ImportEmployees:ImportEmployees runat="server" ID="g_48003bc1_8a44_4fee_a918_f39f1e8847a4" Description="ImportEmployees" Title="ImportEmployees" __designer:Values="&lt;P N='Description' ID='1' T='ImportEmployees' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_48003bc1_8a44_4fee_a918_f39f1e8847a4' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
			&lt;tr class=&quot;ms-WPHeader&quot;&gt;
				&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;&lt;td title=&quot;ImportEmployees - ImportEmployees&quot; id=&quot;WebPartTitleFullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4&quot; class=&quot;ms-WPHeaderTd&quot;&gt;&lt;div class=&quot;ms-WPTitle&quot;&gt;&lt;nobr&gt;&lt;span&gt;ImportEmployees&lt;/span&gt;&lt;span id=&quot;WebPartCaptionFullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4&quot;&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;/div&gt;&lt;/td&gt;&lt;td align=&quot;left&quot; class=&quot;ms-wpTdSpace&quot;&gt;&amp;#160;&lt;/td&gt;
			&lt;/tr&gt;
		&lt;/table&gt;&lt;/td&gt;
	&lt;/tr&gt;&lt;tr&gt;
		&lt;td class=&quot;&quot; valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4&quot; width=&quot;100%&quot; class=&quot;ms-WPBody ms-wpContentDivSpace&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4&quot;&gt;
	

&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
    &lt;tr&gt;
        &lt;td&gt;
            &lt;table class=&quot;fieldTitleTable&quot;&gt;
                &lt;tr&gt;
                    &lt;td class=&quot;fieldTitleTd&quot;&gt;
                        &lt;span style=&quot;color: white;&quot;&gt;Import Employee Data From CSV&lt;/span&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;br /&gt;
            &lt;div id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4_ctl00_Panel1&quot;&gt;
		
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;file&quot; name=&quot;FullPage$g_48003bc1_8a44_4fee_a918_f39f1e8847a4$ctl00$FileUpload1&quot; id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4_ctl00_FileUpload1&quot; Size=&quot;30&quot; style=&quot;width:280px;&quot; /&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_48003bc1_8a44_4fee_a918_f39f1e8847a4$ctl00$btnUpload&quot; value=&quot;Upload&quot; id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4_ctl00_btnUpload&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4_ctl00_lblMessage&quot;&gt;&lt;/span&gt;
            
	&lt;/div&gt;
            
            
            
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;br /&gt;
&lt;span id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;
&lt;span id=&quot;FullPage_g_48003bc1_8a44_4fee_a918_f39f1e8847a4_ctl00_lblSuccess&quot; style=&quot;color: Green;&quot;&gt;&lt;/span&gt;
&lt;br /&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{48003BC1-8A44-4FEE-A918-F39F1E8847A4}" WebPart="true" __designer:IsClosed="false"></ImportEmployees:ImportEmployees>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">


<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{cdd01b39-5ccb-4aa3-bf86-93b3ca76e8d7}" WebPart="true" __designer:IsClosed="false" id="g_cdd01b39_5ccb_4aa3_bf86_93b3ca76e8d7" __designer:Preview="&lt;div id=&quot;g_cdd01b39_5ccb_4aa3_bf86_93b3ca76e8d7&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{cdd01b39-5ccb-4aa3-bf86-93b3ca76e8d7}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_cdd01b39_5ccb_4aa3_bf86_93b3ca76e8d7' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{481099a2-b627-4cec-81f6-43a2cdf54d15}" WebPart="true" __designer:IsClosed="false" id="g_481099a2_b627_4cec_81f6_43a2cdf54d15" __designer:Preview="&lt;div id=&quot;g_481099a2_b627_4cec_81f6_43a2cdf54d15&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{481099a2-b627-4cec-81f6-43a2cdf54d15}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_481099a2_b627_4cec_81f6_43a2cdf54d15_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_481099a2_b627_4cec_81f6_43a2cdf54d15$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_481099a2_b627_4cec_81f6_43a2cdf54d15_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_481099a2_b627_4cec_81f6_43a2cdf54d15$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_481099a2_b627_4cec_81f6_43a2cdf54d15_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_481099a2_b627_4cec_81f6_43a2cdf54d15$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_481099a2_b627_4cec_81f6_43a2cdf54d15' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

</asp:Content>


