<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="../_catalogs/masterpage/Member.master" meta:progid="SharePoint.WebPartPage.Document"       %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
	<SharePoint:UIVersionedContent runat="server" UIVersion="3" Id="PlaceHolderWebDescription" __designer:Preview="" __designer:Values="&lt;P N='InDesign' T='False' /&gt;&lt;P N='ID' ID='1' T='PlaceHolderWebDescription' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;">
		<ContentTemplate>
			<div class="ms-webpartpagedescription"><SharePoint:ProjectProperty Property="Description" runat="server"/></div>
		</ContentTemplate>
	</SharePoint:UIVersionedContent>
	<asp:UpdatePanel
		   id="updatePanel"
		   runat="server"
		   UpdateMode="Conditional"
		   ChildrenAsTriggers="false">
		<ContentTemplate>
			<SharePoint:VersionedPlaceHolder UIVersion="4" runat="server" __designer:Preview="&lt;Regions&gt;&lt;Region Name=&quot;0&quot; Editable=&quot;True&quot; Content=&quot;&amp;#xD;&amp;#xA;				&amp;lt;SharePoint:SPRibbonButton&amp;#xD;&amp;#xA;					id=&amp;quot;btnWikiEdit&amp;quot;&amp;#xD;&amp;#xA;					RibbonCommand=&amp;quot;Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit&amp;quot;&amp;#xD;&amp;#xA;					runat=&amp;quot;server&amp;quot;&amp;#xD;&amp;#xA;				    Text=&amp;quot;edit&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;div style='display:none'&amp;amp;gt;&amp;amp;lt;input type=&amp;amp;quot;submit&amp;amp;quot; name=&amp;amp;quot;btnWikiEdit&amp;amp;quot; value=&amp;amp;quot;edit&amp;amp;quot; id=&amp;amp;quot;btnWikiEdit&amp;amp;quot; /&amp;amp;gt;&amp;amp;lt;/div&amp;amp;gt;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N='ID' ID='1' T='btnWikiEdit' /&amp;amp;gt;&amp;amp;lt;P N='RibbonCommand' T='Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit' /&amp;amp;gt;&amp;amp;lt;P N='Text' T='edit' /&amp;amp;gt;&amp;amp;lt;P N='Page' ID='2' /&amp;amp;gt;&amp;amp;lt;P N='TemplateControl' R='2' /&amp;amp;gt;&amp;amp;lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;				&amp;lt;SharePoint:SPRibbonButton&amp;#xD;&amp;#xA;					id=&amp;quot;btnWikiSave&amp;quot;&amp;#xD;&amp;#xA;					RibbonCommand=&amp;quot;Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop&amp;quot;&amp;#xD;&amp;#xA;					runat=&amp;quot;server&amp;quot;&amp;#xD;&amp;#xA;				    Text=&amp;quot;edit&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;div style='display:none'&amp;amp;gt;&amp;amp;lt;input type=&amp;amp;quot;submit&amp;amp;quot; name=&amp;amp;quot;btnWikiSave&amp;amp;quot; value=&amp;amp;quot;edit&amp;amp;quot; id=&amp;amp;quot;btnWikiSave&amp;amp;quot; /&amp;amp;gt;&amp;amp;lt;/div&amp;amp;gt;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N='ID' ID='1' T='btnWikiSave' /&amp;amp;gt;&amp;amp;lt;P N='RibbonCommand' T='Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop' /&amp;amp;gt;&amp;amp;lt;P N='Text' T='edit' /&amp;amp;gt;&amp;amp;lt;P N='Page' ID='2' /&amp;amp;gt;&amp;amp;lt;P N='TemplateControl' R='2' /&amp;amp;gt;&amp;amp;lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;				&amp;lt;SharePoint:SPRibbonButton&amp;#xD;&amp;#xA;					id=&amp;quot;btnWikiRevert&amp;quot;&amp;#xD;&amp;#xA;					RibbonCommand=&amp;quot;Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert&amp;quot;&amp;#xD;&amp;#xA;				    runat=&amp;quot;server&amp;quot;&amp;#xD;&amp;#xA;					Text=&amp;quot;Revert&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;div style='display:none'&amp;amp;gt;&amp;amp;lt;input type=&amp;amp;quot;submit&amp;amp;quot; name=&amp;amp;quot;btnWikiRevert&amp;amp;quot; value=&amp;amp;quot;Revert&amp;amp;quot; id=&amp;amp;quot;btnWikiRevert&amp;amp;quot; /&amp;amp;gt;&amp;amp;lt;/div&amp;amp;gt;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N='ID' ID='1' T='btnWikiRevert' /&amp;amp;gt;&amp;amp;lt;P N='RibbonCommand' T='Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert' /&amp;amp;gt;&amp;amp;lt;P N='Text' T='Revert' /&amp;amp;gt;&amp;amp;lt;P N='Page' ID='2' /&amp;amp;gt;&amp;amp;lt;P N='TemplateControl' R='2' /&amp;amp;gt;&amp;amp;lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;			&quot; /&gt;&lt;/Regions&gt;&lt;div height=&quot;&quot; width=&quot;&quot; style=&quot;&quot; _designerRegion=0&gt;&lt;/div&gt;" __designer:Values="&lt;P N='UIVersion' T='4' /&gt;&lt;P N='Visible' T='True' /&gt;&lt;P N='ID' ID='1' T='ctl00' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;">
				<SharePoint:SPRibbonButton
					id="btnWikiEdit"
					RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit"
					runat="server"
				    Text="edit"/>
				<SharePoint:SPRibbonButton
					id="btnWikiSave"
					RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop"
					runat="server"
				    Text="edit"/>
				<SharePoint:SPRibbonButton
					id="btnWikiRevert"
					RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert"
				    runat="server"
					Text="Revert"/>
			</SharePoint:VersionedPlaceHolder>
			<SharePoint:EmbeddedFormField id="WikiField" FieldName="WikiField" ControlMode="Display" runat="server"></SharePoint:EmbeddedFormField>
			<WebPartPages:WebPartZone runat="server" ID="Bottom" Title="loc:Bottom" __designer:Preview="&lt;Regions&gt;&lt;Region Name=&quot;0&quot; Editable=&quot;True&quot; Content=&quot;&quot; NamingContainer=&quot;True&quot; /&gt;&lt;/Regions&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; border=&quot;0&quot; id=&quot;Bottom&quot;&gt;
	&lt;tr&gt;
		&lt;td style=&quot;white-space:nowrap;&quot;&gt;&lt;table cellspacing=&quot;0&quot; cellpadding=&quot;2&quot; border=&quot;0&quot; style=&quot;width:100%;&quot;&gt;
			&lt;tr&gt;
				&lt;td style=&quot;white-space:nowrap;&quot;&gt;Bottom&lt;/td&gt;
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
&lt;/table&gt;" __designer:Values="&lt;P N='ID' ID='1' T='Bottom' /&gt;&lt;P N='HeaderText' T='loc:Bottom' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
	</ContentTemplate>
	<Triggers>
	    <asp:PostBackTrigger ControlID="WikiField" />
	    <asp:PostBackTrigger ControlID="btnWikiRevert" />
	    <asp:PostBackTrigger ControlID="btnWikiSave" />
	</Triggers>
 </asp:UpdatePanel>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{be49f9de-5754-4e7c-a807-83576d4b69a8}" WebPart="true" __designer:IsClosed="false" id="g_be49f9de_5754_4e7c_a807_83576d4b69a8" __designer:Preview="&lt;div id=&quot;g_be49f9de_5754_4e7c_a807_83576d4b69a8&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{be49f9de-5754-4e7c-a807-83576d4b69a8}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_be49f9de_5754_4e7c_a807_83576d4b69a8_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_be49f9de_5754_4e7c_a807_83576d4b69a8' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{c413c245-16aa-496f-9682-e86e48c8146b}" WebPart="true" __designer:IsClosed="false" id="g_c413c245_16aa_496f_9682_e86e48c8146b" __designer:Preview="&lt;div id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{c413c245-16aa-496f-9682-e86e48c8146b}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_c413c245_16aa_496f_9682_e86e48c8146b$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_c413c245_16aa_496f_9682_e86e48c8146b$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_c413c245_16aa_496f_9682_e86e48c8146b_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_c413c245_16aa_496f_9682_e86e48c8146b$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='ID' ID='2' T='g_c413c245_16aa_496f_9682_e86e48c8146b' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

											
</asp:Content>


