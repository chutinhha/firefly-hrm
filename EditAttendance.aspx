<%@ Register tagprefix="EditAttendance" namespace="SP2010VisualWebPart.EditAttendance" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><EditAttendance:EditAttendance runat="server" ID="g_a51f47a2_6b19_48e6_8adb_825cf881eb34" Description="EditAttendance" ChromeType="None" Title="EditAttendance" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='EditAttendance' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_a51f47a2_6b19_48e6_8adb_825cf881eb34' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34&quot;&gt;
	
&lt;br&gt;&lt;div id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Edit Attendance&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;br&gt;
&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_lblEmployeeName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employee Name&lt;/span&gt;
&lt;input name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$txtEmployeeName&quot; type=&quot;text&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_txtEmployeeName&quot; disabled=&quot;disabled&quot; style=&quot;width:290px;&quot; /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_lblPunchIn&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Punch In&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$txtPunchInDate&quot; type=&quot;text&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_txtPunchInDate&quot; style=&quot;width:150px;&quot; /&gt;
    &lt;input name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$txtPunchInHour&quot; type=&quot;text&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_txtPunchInHour&quot; style=&quot;width:120px;&quot; /&gt;
&lt;br /&gt;
&lt;p&gt;
    &amp;nbsp;&lt;/p&gt;
&lt;p&gt;
    &lt;br&gt;&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_lblPunchInNote&quot;&gt;Punch In Note&lt;/span&gt;
&lt;/p&gt;
&lt;p&gt;
    &lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;&lt;textarea name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$txtPunchInNote&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_txtPunchInNote&quot; style=&quot;height:100px;width:300px;&quot;&gt;&lt;/textarea&gt;
&lt;/p&gt;
&lt;p&gt;
    &lt;br&gt;&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_lblPunchOut&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Punch Out&lt;/span&gt;
    &lt;input name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$txtPunchOut&quot; type=&quot;text&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_txtPunchOut&quot; style=&quot;width:290px;&quot; /&gt;
    &lt;span style=&quot;padding-left:20px;&quot;&gt;&lt;/span&gt;
&lt;/p&gt;
&lt;p&gt;
    &amp;nbsp;&lt;/p&gt;
&lt;p&gt;
    &lt;br&gt;&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;&lt;span id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_lblPunchOutNote&quot;&gt;Punch Out Note&lt;/span&gt;
&lt;/p&gt;

&lt;span style=&quot;padding-left:160px;&quot;&gt;&lt;/span&gt;&lt;textarea name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$txtPunchOutNote&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_txtPunchOutNote&quot; style=&quot;height:100px;width:300px;&quot;&gt;&lt;/textarea&gt;&lt;br&gt;&lt;br&gt;
&lt;div class=&quot;borderTop&quot;&gt;
    &lt;span style=&quot;padding-left:155px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return confirm('Are you sure you want to save ?');&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_a51f47a2_6b19_48e6_8adb_825cf881eb34$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;&lt;/div&gt;
&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
	&lt;/div&gt;
&lt;p&gt;
    &amp;nbsp;&lt;/p&gt;
&lt;p&gt;
    &lt;span id=&quot;FullPage_g_a51f47a2_6b19_48e6_8adb_825cf881eb34_ctl00_lblError&quot; style=&quot;color:Red;&quot;&gt;&lt;/span&gt;
&lt;/p&gt;




&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{A51F47A2-6B19-48E6-8ADB-825CF881EB34}" WebPart="true" __designer:IsClosed="false"></EditAttendance:EditAttendance>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

						

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{7413ebcb-c49b-4bf8-8806-897b8d1d0516}" WebPart="true" __designer:IsClosed="false" id="g_7413ebcb_c49b_4bf8_8806_897b8d1d0516" __designer:Preview="&lt;div id=&quot;g_7413ebcb_c49b_4bf8_8806_897b8d1d0516&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{7413ebcb-c49b-4bf8-8806-897b8d1d0516}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_7413ebcb_c49b_4bf8_8806_897b8d1d0516_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_7413ebcb_c49b_4bf8_8806_897b8d1d0516' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
						

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{3703aaa2-ff8d-41f2-b475-ee3d565a588f}" WebPart="true" __designer:IsClosed="false" id="g_3703aaa2_ff8d_41f2_b475_ee3d565a588f" __designer:Preview="&lt;div id=&quot;g_3703aaa2_ff8d_41f2_b475_ee3d565a588f&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{3703aaa2-ff8d-41f2-b475-ee3d565a588f}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_3703aaa2_ff8d_41f2_b475_ee3d565a588f_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_3703aaa2_ff8d_41f2_b475_ee3d565a588f$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_3703aaa2_ff8d_41f2_b475_ee3d565a588f_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_3703aaa2_ff8d_41f2_b475_ee3d565a588f$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_3703aaa2_ff8d_41f2_b475_ee3d565a588f_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_3703aaa2_ff8d_41f2_b475_ee3d565a588f$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_3703aaa2_ff8d_41f2_b475_ee3d565a588f' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

						
</asp:Content>


