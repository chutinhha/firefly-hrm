<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="/_catalogs/masterpage/MasterPage/212ob.master" meta:progid="SharePoint.WebPartPage.Document"       %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="ManageUser" namespace="SP2010VisualWebPart.Common.ManageUser" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
			<SharePoint:EmbeddedFormField id="WikiField" FieldName="WikiField" ControlMode="Display" runat="server"><div class="ExternalClassA6E2B85F942E4A7E978B1AD11185906D">
                <table id="layoutsTable" style="width:100%"><tbody><tr style="vertical-align:top"><td style="width:66.6%"><div class="ms-rte-layoutszone-outer" style="width:100%"><div class="ms-rte-layoutszone-inner">
<Login:Login runat="server" ID="g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7" Description="            This Web Part has a User Control to render the UI.          " ChromeType="None" Title="Login" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            This Web Part has a User Control to render the UI.          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='Login' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' ID='2' T='g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;div id=&quot;g_1179f2c7_ee84_4a3e_98bd_e827e2d708e7&quot;&gt;

&lt;/div&gt;" __MarkupType="vsattributemarkup" __WebPartId="{1179F2C7-EE84-4A3E-98BD-E827E2D708E7}" WebPart="true" __designer:IsClosed="false"></Login:Login>




















































<ManageUser:ManageUser runat="server" ID="g_c8df396d_87d6_4f6e_ace5_5cb6901ee19f" Description="My Visual WebPart" ChromeType="None" Title="ManageUser" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='ManageUser' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' ID='2' T='g_c8df396d_87d6_4f6e_ace5_5cb6901ee19f' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;div id=&quot;g_c8df396d_87d6_4f6e_ace5_5cb6901ee19f&quot;&gt;
	
&amp;nbsp;&lt;span id=&quot;g_c8df396d_87d6_4f6e_ace5_5cb6901ee19f_ctl00_lblError&quot; style=&quot;color: Red;&quot;&gt;&lt;/span&gt;

&lt;/div&gt;" __MarkupType="vsattributemarkup" __WebPartId="{C8DF396D-87D6-4F6E-ACE5-5CB6901EE19F}" WebPart="true" __designer:IsClosed="false"></ManageUser:ManageUser>




















































            <p> </p>
          </div></div></td>
<td style="width:33.3%"><div class="ms-rte-layoutszone-outer" style="width:100%"><div class="ms-rte-layoutszone-inner">
                                        <p class="ms-rteThemeForeColor-5-5" style="text-align:left;font-size:10pt">
                                            <img alt="People collaborating" src="/_layouts/images/homepageSamplePhoto.jpg" style="margin:5px" />
                                        </p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
          </div></div></td></tr></tbody></table>
            <span id="layoutsData" style="display:none">false,false,2</span></div></SharePoint:EmbeddedFormField>
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
</asp:Content>




