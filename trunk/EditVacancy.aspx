<%@ Register tagprefix="EditVacancy" namespace="SP2010VisualWebPart.EditVacancy" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><EditVacancy:EditVacancy runat="server" ID="g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a" Description="EditVacancy" ChromeType="None" Title="EditVacancy" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='EditVacancy' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a&quot;&gt;
	
&lt;br&gt;&lt;div id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Edit Vancancy&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Title(*)&lt;/span&gt;
    &lt;div class=&quot;styled-selectLong&quot;&gt;&lt;select name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$ddlJobTitle&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_ddlJobTitle&quot;&gt;

		&lt;/select&gt;&lt;/div&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblVacancy&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Vacancy Name(*)&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$txtVacancy&quot; type=&quot;text&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_txtVacancy&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblHiringManager&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Hiring Manager&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$txtHiringManager&quot; type=&quot;text&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_txtHiringManager&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblNoOfPosition&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Number of Positions&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$txtNoOfPosition&quot; type=&quot;text&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_txtNoOfPosition&quot; style=&quot;width:200px;&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblDescription&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Description&lt;/span&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;&lt;textarea name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$txtDescription&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_txtDescription&quot; style=&quot;height:100px;width:500px;&quot;&gt;&lt;/textarea&gt;
    &lt;br /&gt;
    &lt;br /&gt;
    &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblActive&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Active&lt;/span&gt;
    &lt;input id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_chkActive&quot; type=&quot;checkbox&quot; name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$chkActive&quot; checked=&quot;checked&quot; /&gt;
    &lt;br /&gt;
    &lt;br /&gt;&lt;div class=&quot;borderTop&quot;&gt;
    &lt;span style=&quot;padding-left:155px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return confirm('Are you sure you want to save ?');&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;&lt;/div&gt;
    
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
	&lt;/div&gt;
&lt;br /&gt;
    &lt;br /&gt;
    &lt;span id=&quot;FullPage_g_1c4cc94c_b0b8_4e23_a9b1_0dbfc5356c7a_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{1C4CC94C-B0B8-4E23-A9B1-0DBFC5356C7A}" WebPart="true" __designer:IsClosed="false"></EditVacancy:EditVacancy>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

							

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{862c6416-e04b-4f71-b602-4ebae8814157}" WebPart="true" __designer:IsClosed="false" id="g_862c6416_e04b_4f71_b602_4ebae8814157" __designer:Preview="&lt;div id=&quot;g_862c6416_e04b_4f71_b602_4ebae8814157&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{862c6416-e04b-4f71-b602-4ebae8814157}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_862c6416_e04b_4f71_b602_4ebae8814157_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_862c6416_e04b_4f71_b602_4ebae8814157' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
							

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{67c04db0-486d-4f54-8e0e-8d146c532de4}" WebPart="true" __designer:IsClosed="false" id="g_67c04db0_486d_4f54_8e0e_8d146c532de4" __designer:Preview="&lt;div id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{67c04db0-486d-4f54-8e0e-8d146c532de4}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_67c04db0_486d_4f54_8e0e_8d146c532de4$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_67c04db0_486d_4f54_8e0e_8d146c532de4$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_67c04db0_486d_4f54_8e0e_8d146c532de4_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_67c04db0_486d_4f54_8e0e_8d146c532de4$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_67c04db0_486d_4f54_8e0e_8d146c532de4' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

							
						
</asp:Content>


