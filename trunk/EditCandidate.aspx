<%@ Register tagprefix="EditCandidate" namespace="SP2010VisualWebPart.EditCandidate" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><EditCandidate:EditCandidate runat="server" ID="g_aefa577d_71b6_4387_93a3_242b6965159c" Description="EditCandidate" ChromeType="None" Title="EditCandidate" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' ID='1' T='EditCandidate' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_aefa577d_71b6_4387_93a3_242b6965159c' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_aefa577d_71b6_4387_93a3_242b6965159c&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c&quot;&gt;
	
&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;/resources/demos/style.css&quot; /&gt;
&lt;script&gt;
    $(function () {
        $(&quot;#txtDate&quot;).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
    $(function () {
        $(&quot;#txtInterviewDate&quot;).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
&lt;/script&gt;
&lt;br&gt;&lt;div id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_Panel1&quot; style=&quot;width:100%;&quot;&gt;
		&lt;table class=&quot;fieldTitleDiv&quot; cellpadding=&quot;0&quot;&gt;&lt;tr&gt;&lt;td&gt;
&lt;table class=&quot;fieldTitleTable&quot;&gt;
&lt;tr&gt;&lt;td class=&quot;fieldTitleTd&quot;&gt;&lt;font color=&quot;white&quot;&gt;Edit Candidate&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;br&gt;
        &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblFullName&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Full Name(*)&lt;/span&gt;
        &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtFullName&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtFullName&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblAddress&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Address Street&lt;/span&gt;
        &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtAddress&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtAddress&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;p&gt;
            &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblCity&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;City&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtCity&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtCity&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblState&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;State&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtState&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtState&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;/p&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblZipCode&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Zip Code&lt;/span&gt;
        &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtZipCode&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtZipCode&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblCountry&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Country&lt;/span&gt;
        &lt;div class=&quot;styled-selectLong&quot;&gt;
            &lt;select name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$ddlCountry&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_ddlCountry&quot;&gt;

		&lt;/select&gt;
        &lt;/div&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;p&gt;
            &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblHomePhone&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Home Phone&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtHomePhone&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtHomePhone&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblMobile&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Mobile&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtMobile&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtMobile&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;/p&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;p&gt;
            &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblWorkPhone&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Work Phone&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtWorkPhone&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtWorkPhone&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblEmail&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Email(*)&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtEmail&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtEmail&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;/p&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblVacancy&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Job Vacancy&lt;/span&gt;
        &lt;div class=&quot;styled-selectLong&quot;&gt;
            &lt;select name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$ddlVacancy&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_ddlVacancy&quot;&gt;

		&lt;/select&gt;
        &lt;/div&gt;
        &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblKeyword&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Keywords&lt;/span&gt;
        &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtKeyword&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtKeyword&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Job Title&lt;/span&gt;
        &lt;div class=&quot;styled-selectLong&quot;&gt;
            &lt;select name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$ddlJobTitle&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_ddlJobTitle&quot;&gt;

		&lt;/select&gt;
        &lt;/div&gt;
        &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblHiringManager&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Hiring Manager&lt;/span&gt;
        &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtHiringManager&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtHiringManager&quot; style=&quot;width:200px;&quot; /&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblStatus&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Status&lt;/span&gt;
        &lt;div class=&quot;styled-selectLong&quot;&gt;
            &lt;select name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$ddlStatus&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_ddlStatus&quot;&gt;

		&lt;/select&gt;
        &lt;/div&gt;
        &lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblApplyMethod&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Apply Method&lt;/span&gt;
        &lt;div class=&quot;styled-selectLong&quot;&gt;
            &lt;select name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$ddlApplyMethod&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_ddlApplyMethod&quot;&gt;
			&lt;option selected=&quot;selected&quot; value=&quot;Online&quot;&gt;Online&lt;/option&gt;
			&lt;option value=&quot;Manual&quot;&gt;Manual&lt;/option&gt;

		&lt;/select&gt;
        &lt;/div&gt;
        &lt;p&gt;
            &amp;nbsp;&lt;/p&gt;
        &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblApplyDate&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Apply Date&lt;/span&gt;
        &lt;div id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_pnlDate&quot; style=&quot;display:inline;&quot;&gt;
			
            &lt;input type=&quot;text&quot; id=&quot;txtDate&quot; name=&quot;txtDate&quot; size=&quot;30&quot; value=&quot;&quot;/&gt;
        
		&lt;/div&gt;
        &lt;br /&gt;
        &lt;br&gt;&lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
        &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblInterviewDate&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Interview Date&lt;/span&gt;
        &lt;div id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_pnlInterview&quot; style=&quot;display:inline;&quot;&gt;
			
            &lt;input type=&quot;text&quot; id=&quot;txtInterviewDate&quot; name=&quot;txtInterviewDate&quot; size=&quot;30&quot; value=&quot;&quot;/&gt;
        
		&lt;/div&gt;&lt;span style=&quot;padding-left:100px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblInterviewTime&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Time&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtInterviewTime&quot; type=&quot;text&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtInterviewTime&quot; style=&quot;width:200px;&quot; /&gt;&lt;br&gt;&lt;br&gt;
        &lt;p&gt;
            &lt;span style=&quot;padding-left:5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblComment&quot; valign=&quot;top&quot; style=&quot;display:inline-block;width:120px;&quot;&gt;Comment&lt;/span&gt;
        &lt;/p&gt;
        &lt;span style=&quot;padding-left:130px;&quot;&gt;&lt;/span&gt;
        &lt;textarea name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$txtComment&quot; rows=&quot;2&quot; cols=&quot;20&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_txtComment&quot; style=&quot;height:100px;width:650px;&quot;&gt;&lt;/textarea&gt;
        &lt;br&gt;
        &lt;br&gt;
        &lt;div class=&quot;borderTop&quot;&gt;
            &lt;span style=&quot;padding-left:125px;&quot;&gt;&lt;/span&gt;
            &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$btnSave&quot; value=&quot;Save&quot; onclick=&quot;return confirm('Are you sure you want to save ?');&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_btnSave&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
            &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_aefa577d_71b6_4387_93a3_242b6965159c$ctl00$btnCancel&quot; value=&quot;Cancel&quot; id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_btnCancel&quot; class=&quot;resetButton&quot; style=&quot;width:80px;&quot; /&gt;
        &lt;/div&gt;

&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
	&lt;/div&gt;
&lt;br&gt;
&lt;p&gt;
    &lt;span id=&quot;FullPage_g_aefa577d_71b6_4387_93a3_242b6965159c_ctl00_lblError&quot; style=&quot;color:red;&quot;&gt;&lt;/span&gt;
&lt;/p&gt;




&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{AEFA577D-71B6-4387-93A3-242B6965159C}" WebPart="true" __designer:IsClosed="false"></EditCandidate:EditCandidate>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>

<asp:Content id="Content2" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{5e27587a-3d00-461e-9335-b81c309194d3}" WebPart="true" __designer:IsClosed="false" id="g_5e27587a_3d00_461e_9335_b81c309194d3" __designer:Preview="&lt;div id=&quot;g_5e27587a_3d00_461e_9335_b81c309194d3&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{5e27587a-3d00-461e-9335-b81c309194d3}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_5e27587a_3d00_461e_9335_b81c309194d3_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_5e27587a_3d00_461e_9335_b81c309194d3$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_5e27587a_3d00_461e_9335_b81c309194d3_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_5e27587a_3d00_461e_9335_b81c309194d3$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_5e27587a_3d00_461e_9335_b81c309194d3_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_5e27587a_3d00_461e_9335_b81c309194d3$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;


&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_5e27587a_3d00_461e_9335_b81c309194d3' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

							
<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{dd576ec0-c4f9-483e-bc37-512767a89e87}" WebPart="true" __designer:IsClosed="false" id="g_dd576ec0_c4f9_483e_bc37_512767a89e87" __designer:Preview="&lt;div id=&quot;g_dd576ec0_c4f9_483e_bc37_512767a89e87&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{dd576ec0-c4f9-483e-bc37-512767a89e87}&quot; WebPart=&quot;true&quot;&gt;
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
&lt;span id=&quot;g_dd576ec0_c4f9_483e_bc37_512767a89e87_ctl00_lblScript&quot;&gt;&lt;script&gt;ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');&lt;/script&gt;&lt;/span&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_dd576ec0_c4f9_483e_bc37_512767a89e87' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

							
</asp:Content>


