<%@ Register tagprefix="UserList" namespace="SP2010VisualWebPart.Admin.User.UserList" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../_catalogs/masterpage/Admin.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderLeftNavBar" runat="server"></asp:Content>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><UserList:UserList runat="server" ID="g_47b855fe_0945_4fb9_896f_20829f2ef0fa" Description="UserList" ChromeType="None" Title="UserList" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='UserList' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_47b855fe_0945_4fb9_896f_20829f2ef0fa' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa&quot;&gt;
	
&lt;br&gt;&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Manage User&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
    &lt;br /&gt;
&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_lblEmployee&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;Employee&lt;/span&gt;
&lt;div class=&quot;styled-selectLong&quot;&gt;
    &lt;select name=&quot;FullPage$g_47b855fe_0945_4fb9_896f_20829f2ef0fa$ctl00$ddlType&quot; id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_ddlType&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
		&lt;option value=&quot;Have LoginID&quot;&gt;Have LoginID&lt;/option&gt;
		&lt;option value=&quot;Not Have LoginID&quot;&gt;Not Have LoginID&lt;/option&gt;

	&lt;/select&gt;&lt;/div&gt;&lt;br&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_lblRank&quot; style=&quot;display:inline-block;width:100px;&quot;&gt;Rank&lt;/span&gt;
    &lt;div class=&quot;styled-selectLong&quot;&gt;
        &lt;select name=&quot;FullPage$g_47b855fe_0945_4fb9_896f_20829f2ef0fa$ctl00$ddlRankUser&quot; id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_ddlRankUser&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;All&quot;&gt;All&lt;/option&gt;
		&lt;option value=&quot;Admin&quot;&gt;Admin&lt;/option&gt;
		&lt;option value=&quot;User&quot;&gt;User&lt;/option&gt;

	&lt;/select&gt;&lt;/div&gt;
    &lt;br /&gt;
    &lt;br&gt;

	&lt;div class=&quot;borderTop&quot; style=&quot;padding-bottom:0px;&quot;&gt;
&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_47b855fe_0945_4fb9_896f_20829f2ef0fa$ctl00$btnSave&quot; value=&quot;Save&quot; id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
&lt;/div&gt;&lt;br&gt;
    &lt;table&gt;&lt;tr&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br /&gt;
&lt;span id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;



&lt;span id=&quot;FullPage_g_47b855fe_0945_4fb9_896f_20829f2ef0fa_ctl00_lblSuccess&quot; style=&quot;color:Green;&quot;&gt;&lt;/span&gt;






&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{47B855FE-0945-4FB9-896F-20829F2EF0FA}" WebPart="true" __designer:IsClosed="false"></UserList:UserList>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

			
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{4e03fca0-e9f9-40a9-888a-3639b6b015ba}" WebPart="true" __designer:IsClosed="false" id="g_4e03fca0_e9f9_40a9_888a_3639b6b015ba" __designer:Preview="&lt;div id=&quot;g_4e03fca0_e9f9_40a9_888a_3639b6b015ba&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{4e03fca0-e9f9-40a9-888a-3639b6b015ba}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_4e03fca0_e9f9_40a9_888a_3639b6b015ba_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_4e03fca0_e9f9_40a9_888a_3639b6b015ba' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
			
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{bc65183d-6774-463c-8246-8d88704e9b38}" WebPart="true" __designer:IsClosed="false" id="g_bc65183d_6774_463c_8246_8d88704e9b38" __designer:Preview="&lt;div id=&quot;g_bc65183d_6774_463c_8246_8d88704e9b38&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{bc65183d-6774-463c-8246-8d88704e9b38}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_bc65183d_6774_463c_8246_8d88704e9b38_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_bc65183d_6774_463c_8246_8d88704e9b38$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_bc65183d_6774_463c_8246_8d88704e9b38_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_bc65183d_6774_463c_8246_8d88704e9b38$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_bc65183d_6774_463c_8246_8d88704e9b38_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_bc65183d_6774_463c_8246_8d88704e9b38$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_bc65183d_6774_463c_8246_8d88704e9b38' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

			
						
</asp:Content>


