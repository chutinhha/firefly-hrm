<%@ Register tagprefix="AddVacancy" namespace="SP2010VisualWebPart.AddVacancy" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='FullPage' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' ID='2' T='Full Page' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='Title' R='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><WebPartPages:WikiContentWebpart runat="server" AllowEdit="True" AllowConnect="True" ConnectionID="00000000-0000-0000-0000-000000000000" Title="" IsIncluded="True" Dir="Default" IsVisible="True" AllowMinimize="True" ExportControlledProperties="True" ZoneID="FullPage" ID="g_27aec5a7_3e09_4211_867b_848632c3b173" PartImageSmall="" FrameType="None" FrameState="Normal" ExportMode="All" AllowHide="True" SuppressWebPartChrome="False" DetailLink="" ChromeType="None" HelpLink="" MissingAssembly="Cannot import this Web Part." AllowRemove="True" HelpMode="Modeless" Directive="&lt;%@ Register TagPrefix=&quot;SharePoint&quot; Namespace=&quot;Microsoft.Sharepoint.WebControls&quot; Assembly=&quot;Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c&quot; %&gt;" AllowZoneChange="True" PartOrder="1" Description="" PartImageLarge="" IsIncludedFilter="" __designer:Values="&lt;P N='Content' T='&amp;#xD;&amp;#xA;&amp;#xD;&amp;#xA;						&amp;lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td valign=&quot;top&quot;&amp;gt;&amp;lt;div id=&quot;WebPart&quot; width=&quot;100%&quot;&amp;gt;&amp;lt;div id=&quot;WebPartContent&quot;&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;div&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/div&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/div&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/div&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/td&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/tr&amp;gt;&amp;#xD;&amp;#xA;						&amp;lt;/table&amp;gt;&amp;#xD;&amp;#xA;						' /&gt;&lt;P N='ZoneID' T='FullPage' /&gt;&lt;P N='PartOrder' T='1' /&gt;&lt;P N='ID' T='g_27aec5a7_3e09_4211_867b_848632c3b173' /&gt;&lt;P N='StorageKey' T='27aec5a7-3e09-4211-867b-848632c3b173' /&gt;&lt;P N='Qualifier' T='WPQ1' /&gt;&lt;P N='ClientName' T='varPartWPQ1' /&gt;&lt;P N='Permissions' E='0' /&gt;&lt;P N='EffectiveTitle' T='Untitled' /&gt;&lt;P N='EffectiveStorage' E='2' /&gt;&lt;P N='ExportMode' E='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='Page' ID='1' /&gt;&lt;P N='TemplateControl' R='1' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;27aec5a7-3e09-4211-867b-848632c3b173&quot; HasPers=&quot;false&quot; id=&quot;WebPartWPQ1&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_27aec5a7_3e09_4211_867b_848632c3b173&quot;&gt;
	


						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td valign=&quot;top&quot;&gt;&lt;div id=&quot;WebPart&quot; width=&quot;100%&quot;&gt;&lt;div id=&quot;WebPartContent&quot;&gt;
							&lt;div&gt;
							&lt;/div&gt;
							&lt;/div&gt;
							&lt;/div&gt;
							&lt;/td&gt;
							&lt;/tr&gt;
						&lt;/table&gt;
						
&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{27AEC5A7-3E09-4211-867B-848632C3B173}" WebPart="true" Height="" Width=""><Content>


						<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td valign="top"><div id="WebPart" width="100%"><div id="WebPartContent">
							<div>
							</div>
							</div>
							</div>
							</td>
							</tr>
						</table>
						</Content>
</WebPartPages:WikiContentWebpart>

<Login:Login runat="server" ID="g_6c51cad1_5e42_45cf_b054_6c33d2844a77" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_6c51cad1_5e42_45cf_b054_6c33d2844a77' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_6c51cad1_5e42_45cf_b054_6c33d2844a77&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_6c51cad1_5e42_45cf_b054_6c33d2844a77&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{6C51CAD1-5E42-45CF-B054-6C33D2844A77}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<AddVacancy:AddVacancy runat="server" ID="g_b3f07d83_80af_41c4_84cb_c9563c6ca905" Description="AddVacancy" ChromeType="None" Title="AddVacancy" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='AddVacancy' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='3' /&gt;&lt;P N='ID' T='g_b3f07d83_80af_41c4_84cb_c9563c6ca905' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905&quot;&gt;
	
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

&lt;div id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		
    &lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;table class=&quot;fieldTitleTable&quot;&gt;
                    &lt;tr&gt;
                        &lt;td class=&quot;fieldTitleTd&quot;&gt;
                            &lt;span style=&quot;color: white;&quot;&gt;Add Job Vacancy&lt;/span&gt;
                        &lt;/td&gt;
                    &lt;/tr&gt;
                &lt;/table&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Title(*)&lt;/span&gt;
                &lt;div class=&quot;styled-selectLong&quot;&gt;
                    &lt;select name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$ddlJobTitle&quot; id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_ddlJobTitle&quot;&gt;

		&lt;/select&gt;
                &lt;/div&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_lblVacancy&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Vacancy Name(*)&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$txtVacancy&quot; type=&quot;text&quot; id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_txtVacancy&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_lblNoOfPosition&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Number of Positions&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$txtNoOfPosition&quot; type=&quot;text&quot; id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_txtNoOfPosition&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_lblDescription&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Description&lt;/span&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 160px;&quot;&gt;&lt;/span&gt;
                &lt;textarea name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$txtDescription&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_txtDescription&quot; style=&quot;height:100px;width:800px;&quot;&gt;&lt;/textarea&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;span id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_lblActive&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Active&lt;/span&gt;
                &lt;input id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_chkActive&quot; type=&quot;checkbox&quot; name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$chkActive&quot; checked=&quot;checked&quot; /&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &amp;nbsp;&lt;span style=&quot;color: Red;&quot;&gt;(*) is required&lt;/span&gt;
                &lt;br /&gt;
                &lt;br /&gt;
                &lt;div class=&quot;borderTop&quot;&gt;
                    &lt;span style=&quot;padding-left: 150px;&quot;&gt;&lt;/span&gt;
                    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return ConfirmOnSave();&quot; id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                    &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_b3f07d83_80af_41c4_84cb_c9563c6ca905$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;

	&lt;/div&gt;
&lt;br /&gt;
&amp;nbsp;&lt;span id=&quot;FullPage_g_b3f07d83_80af_41c4_84cb_c9563c6ca905_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;&lt;br /&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{B3F07D83-80AF-41C4-84CB-C9563C6CA905}" WebPart="true" __designer:IsClosed="false"></AddVacancy:AddVacancy>

<WebPartPages:WikiContentWebpart runat="server" AllowEdit="True" AllowConnect="True" ConnectionID="00000000-0000-0000-0000-000000000000" Title="" IsIncluded="True" Dir="Default" IsVisible="True" AllowMinimize="True" ExportControlledProperties="True" ZoneID="FullPage" ID="g_0fd0a5ac_7e89_42d6_989e_60b8752756fc" PartImageSmall="" FrameType="None" FrameState="Normal" ExportMode="All" AllowHide="True" SuppressWebPartChrome="False" DetailLink="" ChromeType="None" HelpLink="" MissingAssembly="Cannot import this Web Part." AllowRemove="True" HelpMode="Modeless" Directive="&lt;%@ Register TagPrefix=&quot;SharePoint&quot; Namespace=&quot;Microsoft.Sharepoint.WebControls&quot; Assembly=&quot;Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c&quot; %&gt;" AllowZoneChange="True" PartOrder="4" Description="" PartImageLarge="" IsIncludedFilter="" __designer:Values="&lt;P N='Content' T='&amp;#xD;&amp;#xA;							&amp;lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&amp;gt;&amp;#xD;&amp;#xA;								&amp;lt;tr&amp;gt;&amp;#xD;&amp;#xA;									&amp;lt;td valign=&quot;top&quot;&amp;gt;&amp;#xD;&amp;#xA;									&amp;lt;div id=&quot;WebPart&quot; width=&quot;100%&quot;&amp;gt;&amp;#xD;&amp;#xA;										&amp;lt;div id=&quot;WebPartContent&quot;&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;div&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/div&amp;gt;&amp;#xD;&amp;#xA;							&amp;lt;/div&amp;gt;&amp;lt;/div&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;/table&amp;gt;&amp;#xD;&amp;#xA;							' /&gt;&lt;P N='ZoneID' T='FullPage' /&gt;&lt;P N='PartOrder' T='4' /&gt;&lt;P N='ID' T='g_0fd0a5ac_7e89_42d6_989e_60b8752756fc' /&gt;&lt;P N='StorageKey' T='0fd0a5ac-7e89-42d6-989e-60b8752756fc' /&gt;&lt;P N='Qualifier' T='WPQ2' /&gt;&lt;P N='ClientName' T='varPartWPQ2' /&gt;&lt;P N='Permissions' E='0' /&gt;&lt;P N='EffectiveTitle' T='Untitled' /&gt;&lt;P N='EffectiveStorage' E='2' /&gt;&lt;P N='ExportMode' E='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='4' /&gt;&lt;P N='Page' ID='1' /&gt;&lt;P N='TemplateControl' R='1' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;0fd0a5ac-7e89-42d6-989e-60b8752756fc&quot; HasPers=&quot;false&quot; id=&quot;WebPartWPQ2&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_0fd0a5ac_7e89_42d6_989e_60b8752756fc&quot;&gt;
	

							&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
								&lt;tr&gt;
									&lt;td valign=&quot;top&quot;&gt;
									&lt;div id=&quot;WebPart&quot; width=&quot;100%&quot;&gt;
										&lt;div id=&quot;WebPartContent&quot;&gt;
							&lt;div&gt;
							&lt;/div&gt;
							&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
							
&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{0FD0A5AC-7E89-42D6-989E-60B8752756FC}" WebPart="true" Height="" Width=""><Content>

							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td valign="top">
									<div id="WebPart" width="100%">
										<div id="WebPartContent">
							<div>
							</div>
							</div></div></td></tr></table>
							</Content>
</WebPartPages:WikiContentWebpart>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

						

				

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{3eaf7469-d868-4f2c-9bb6-03d6b9a550e8}" WebPart="true" __designer:IsClosed="false" id="g_3eaf7469_d868_4f2c_9bb6_03d6b9a550e8" __designer:Preview="&lt;div id=&quot;g_3eaf7469_d868_4f2c_9bb6_03d6b9a550e8&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{3eaf7469-d868-4f2c-9bb6-03d6b9a550e8}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_3eaf7469_d868_4f2c_9bb6_03d6b9a550e8' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;"></NotifyEmployee:NotifyEmployee>
						

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{89ce49c3-44f0-4cd2-a1e7-02eeed5b0e19}" WebPart="true" __designer:IsClosed="false" id="g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19" __designer:Preview="&lt;div id=&quot;g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{89ce49c3-44f0-4cd2-a1e7-02eeed5b0e19}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_89ce49c3_44f0_4cd2_a1e7_02eeed5b0e19' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' T='~/' /&gt;"></UserAccount:UserAccount>

						
</asp:Content>


