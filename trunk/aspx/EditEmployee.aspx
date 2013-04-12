<%@ Register tagprefix="Login" namespace="SP2010VisualWebPart.Login" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="inforEmployee" namespace="SP2010VisualWebPart.Admin.Employee.inforEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="NotifyEmployee" namespace="SP2010VisualWebPart.Admin.NotifyEmployee" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%@ Register tagprefix="UserAccount" namespace="SP2010VisualWebPart.UserAccount" assembly="SP2010VisualWebPart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9e50fa317a931bf3" %>
<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="../../_catalogs/masterpage/Admin.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
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
&lt;/table&gt;" __designer:Values="&lt;P N='Title' ID='1' T='Full Page' /&gt;&lt;P N='HeaderText' T='loc:FullPage' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='FrameType' E='2' /&gt;&lt;P N='PartChromeType' E='3' /&gt;&lt;P N='ID' ID='2' T='FullPage' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Templates="&lt;Group Name=&quot;ZoneTemplate&quot;&gt;&lt;Template Name=&quot;ZoneTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"><ZoneTemplate><Login:Login runat="server" ID="g_c92597d8_d82b_47b0_8a4c_6237cf3dbd1c" Description="            Login          " ChromeType="None" Title="          Login        " __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='            Login          ' /&gt;&lt;P N='DisplayTitle' ID='1' T='          Login        ' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='1' /&gt;&lt;P N='ID' T='g_c92597d8_d82b_47b0_8a4c_6237cf3dbd1c' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_c92597d8_d82b_47b0_8a4c_6237cf3dbd1c&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_c92597d8_d82b_47b0_8a4c_6237cf3dbd1c&quot;&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{C92597D8-D82B-47B0-8A4C-6237CF3DBD1C}" WebPart="true" __designer:IsClosed="false"></Login:Login>

<inforEmployee:inforEmployee runat="server" ID="g_00070203_b3a6_4552_abe8_f9e6253e8ed0" Description="My Visual WebPart" ChromeType="None" Title="inforEmployee" __designer:Values="&lt;P N='ChromeType' E='2' /&gt;&lt;P N='Description' T='My Visual WebPart' /&gt;&lt;P N='DisplayTitle' ID='1' T='inforEmployee' /&gt;&lt;P N='IsShared' T='True' /&gt;&lt;P N='IsStandalone' T='False' /&gt;&lt;P N='IsStatic' T='False' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='ZoneIndex' T='2' /&gt;&lt;P N='ID' T='g_00070203_b3a6_4552_abe8_f9e6253e8ed0' /&gt;&lt;P N='Page' ID='2' /&gt;&lt;P N='TemplateControl' R='2' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;" __designer:Preview="&lt;table class=&quot;s4-wpTopTable&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;
	&lt;tr&gt;
		&lt;td valign=&quot;top&quot;&gt;&lt;div WebPartID=&quot;&quot; HasPers=&quot;false&quot; id=&quot;WebPartFullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0&quot; width=&quot;100%&quot; class=&quot;ms-WPBody&quot; allowDelete=&quot;false&quot; allowExport=&quot;false&quot; style=&quot;&quot; &gt;&lt;div id=&quot;WebPartContent&quot;&gt;
			&lt;div id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0&quot;&gt;
	&lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css&quot; /&gt;
&lt;script src=&quot;http://code.jquery.com/jquery-1.9.1.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;http://code.jquery.com/ui/1.10.2/jquery-ui.js&quot;&gt;&lt;/script&gt;
&lt;script&gt;
    $(function () {
        $(&quot;#txtBirthDate&quot;).datepicker({
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
                    &lt;td class=&quot;fieldTitleTd&quot; align=&quot;left&quot;&gt;
                        &lt;span style=&quot;color: white;&quot;&gt;Employee Information&lt;/span&gt;
                    &lt;/td&gt;
                    &lt;td class=&quot;fieldTitleTd&quot; align=&quot;right&quot;&gt;
                        &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$bntEmpListPage&quot; value=&quot;Back To Employees List Page&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_bntEmpListPage&quot; class=&quot;addButton&quot; style=&quot;width:230px;background:#2CA6CD;box-shadow: none;text-decoration: underline;border:none;&quot; /&gt;
                    &lt;/td&gt;
                    
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;table width=&quot;100%&quot;&gt;
                &lt;tr&gt;
                    &lt;td style=&quot;width: 425px;&quot;&gt;
                        &lt;br /&gt;
                        &lt;span style=&quot;padding-left: 10px;&quot;&gt;&lt;/span&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblEmployeeImageTitle&quot;&gt;&lt;/span&gt;
                    &lt;/td&gt;
                    &lt;td&gt;
                        &lt;br /&gt;
                        &lt;div style=&quot;background-color: rgb(44, 166, 205); height: 30px; color: white; font-weight: bold;
                            line-height: 30px; border-radius: 5px 5px 5px 5px; padding-left: 5px; width: 99.5%&quot;&gt;
                            Personal Detail&lt;/div&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
                &lt;tr&gt;
                    &lt;td&gt;
                        &lt;span style=&quot;padding-left: 10px;&quot;&gt;&lt;/span&gt;
                        &lt;img id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_imgEmployeeImage&quot; Src=&quot;&quot; style=&quot;height:200px;width:200px;border-width:0px;&quot; /&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblPhotoDetail&quot; style=&quot;color:#663300;&quot;&gt;&lt;/span&gt;
                        &lt;br /&gt;
                        &lt;span style=&quot;padding-left: 10px;&quot;&gt;&lt;/span&gt;
                        &lt;br /&gt;&lt;br /&gt;
                        &lt;span style=&quot;padding-left: 10px;&quot;&gt;&lt;/span&gt;&lt;input type=&quot;submit&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$btnUpdateImage&quot; value=&quot;Change Image&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_btnUpdateImage&quot; class=&quot;addButton&quot; style=&quot;width:150px;&quot; /&gt;
                    &lt;/td&gt;
                    &lt;td&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblFullName&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Full Name *&lt;/span&gt;
                        &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtFullName&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtFullName&quot; style=&quot;width:200px;&quot; /&gt;
                        &lt;br /&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblBirthDate&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Birth Date&lt;/span&gt;
                        &lt;input type=&quot;text&quot; size=&quot;30&quot; id=&quot;&quot; name=&quot;&quot;
                            value=&quot;&quot;  /&gt;
                        &lt;br /&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblSSNNumber&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;SSNNumber&lt;/span&gt;
                        &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtSSNNumber&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtSSNNumber&quot; style=&quot;width:200px;&quot; /&gt;
                        &lt;br /&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblGender&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Sex&lt;/span&gt;
                        &lt;input id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbGenderMale&quot; type=&quot;radio&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$Gender&quot; value=&quot;rdbGenderMale&quot; checked=&quot;checked&quot; /&gt;&lt;label for=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbGenderMale&quot;&gt;Male&lt;/label&gt;
                        &lt;input id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbGenderFemale&quot; type=&quot;radio&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$Gender&quot; value=&quot;rdbGenderFemale&quot; /&gt;&lt;label for=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbGenderFemale&quot;&gt;Female&lt;/label&gt;
                        &lt;br /&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblMeritalStatus&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Marital Status&lt;/span&gt;
                        &lt;input id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbMaritalSingle&quot; type=&quot;radio&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$MaritalStatus&quot; value=&quot;rdbMaritalSingle&quot; checked=&quot;checked&quot; /&gt;&lt;label for=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbMaritalSingle&quot;&gt;Single&lt;/label&gt;
                        &lt;input id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbMaritalMerried&quot; type=&quot;radio&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$MaritalStatus&quot; value=&quot;rdbMaritalMerried&quot; /&gt;&lt;label for=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_rdbMaritalMerried&quot;&gt;Married&lt;/label&gt;
                        &lt;br /&gt;
                        &lt;br /&gt;
                        &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblRank&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Rank&lt;/span&gt;
                        &lt;div class=&quot;styled-selectLong&quot;&gt;
                            &lt;select name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$ddlRank&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_ddlRank&quot;&gt;
		&lt;option selected=&quot;selected&quot; value=&quot;User&quot;&gt;User&lt;/option&gt;
		&lt;option value=&quot;Admin&quot;&gt;Admin&lt;/option&gt;

	&lt;/select&gt;
                        &lt;/div&gt;
                        &lt;br /&gt;
                        &lt;br /&gt;
                        
                        &lt;div class=&quot;borderTop&quot; style=&quot;padding-left: 0px;&quot;&gt;
                            &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$btnEditPersonDetails&quot; value=&quot;Edit&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_btnEditPersonDetails&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                            
                        &lt;/div&gt;
                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;div style=&quot;background-color: rgb(44, 166, 205); height: 30px; color: white; font-weight: bold;
                line-height: 30px; border-radius: 5px 5px 5px 5px; padding-left: 5px;&quot;&gt;
                Contact Title&lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblEmail&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Email&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtEmail&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtEmail&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left: 50px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblHomePhone&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Home Phone&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtHomePhone&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtHomePhone&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblMobile&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Mobile&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtMobile&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtMobile&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left: 50px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblCountry&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Country&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$ddlCountry&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_ddlCountry&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblCity&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;City&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtCity&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtCity&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;span style=&quot;padding-left: 50px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblAddressStreet&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Address Street&lt;/span&gt;
            &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtAddressStreet&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtAddressStreet&quot; style=&quot;width:200px;&quot; /&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$btnEditContactDetails&quot; value=&quot;Edit&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_btnEditContactDetails&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                
            &lt;/div&gt;
            &lt;div style=&quot;background-color: rgb(44, 166, 205); height: 30px; color: white; font-weight: bold;
                line-height: 30px; border-radius: 5px 5px 5px 5px; padding-left: 5px;&quot;&gt;
                Employee State&lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
            &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblEmpStatus&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Employee Status&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$ddlCurrentFlag&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_ddlCurrentFlag&quot;&gt;
		&lt;option value=&quot;Active&quot;&gt;Active&lt;/option&gt;
		&lt;option value=&quot;Inactive&quot;&gt;Inactive&lt;/option&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;span style=&quot;padding-left: 50px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblJobTitle&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Job Title&lt;/span&gt;
            &lt;div class=&quot;styled-selectLong&quot;&gt;
                &lt;select name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$ddlJobTitle&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_ddlJobTitle&quot;&gt;

	&lt;/select&gt;
            &lt;/div&gt;
            &lt;br /&gt;
            &lt;br /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
            &lt;span id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lblDepartment&quot; style=&quot;display:inline-block;width:150px;&quot;&gt;Department&lt;/span&gt;
                &lt;input name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$txtDepartment&quot; type=&quot;text&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_txtDepartment&quot; disabled=&quot;disabled&quot; style=&quot;width:200px;&quot; /&gt;
                &lt;span style=&quot;padding-left: 5px;&quot;&gt;&lt;/span&gt;
                &lt;a id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_lbtnDepartment&quot; Href=&quot;javascript:__doPostBack('FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$lbtnDepartment','')&quot;&gt;Edit Department&lt;/a&gt;
                &lt;br /&gt;&lt;br /&gt;
            &lt;div class=&quot;borderTop&quot;&gt;
                &lt;span style=&quot;padding-left: 155px;&quot;&gt;&lt;/span&gt;
                &lt;input type=&quot;submit&quot; name=&quot;FullPage$g_00070203_b3a6_4552_abe8_f9e6253e8ed0$ctl00$btnEditEmpState&quot; value=&quot;Edit&quot; id=&quot;FullPage_g_00070203_b3a6_4552_abe8_f9e6253e8ed0_ctl00_btnEditEmpState&quot; class=&quot;addButton&quot; style=&quot;width:80px;&quot; /&gt;
                
            &lt;/div&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;

&lt;/div&gt;
		&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;" __MarkupType="vsattributemarkup" __WebPartId="{00070203-B3A6-4552-ABE8-F9E6253E8ED0}" WebPart="true" __designer:IsClosed="false"></inforEmployee:inforEmployee>

</ZoneTemplate></WebPartPages:WebPartZone> </td>
				</tr>
				<script type="text/javascript" language="javascript">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</script>
		</table>
</asp:Content>
<asp:Content id="Content1" runat="server" contentplaceholderid="PlaceHolderSearchArea">

<NotifyEmployee:NotifyEmployee runat="server" Description="NotifyEmployee" Title="NotifyEmployee" __MarkupType="vsattributemarkup" __WebPartId="{086e6a87-9f0e-4f25-af05-1fb0f4a2d939}" WebPart="true" __designer:IsClosed="false" id="g_086e6a87_9f0e_4f25_af05_1fb0f4a2d939" __designer:Preview="&lt;div id=&quot;g_086e6a87_9f0e_4f25_af05_1fb0f4a2d939&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{086e6a87-9f0e-4f25-af05-1fb0f4a2d939}&quot; WebPart=&quot;true&quot;&gt;
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

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='NotifyEmployee' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_086e6a87_9f0e_4f25_af05_1fb0f4a2d939' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></NotifyEmployee:NotifyEmployee>

						
<UserAccount:UserAccount runat="server" Description="UserAccount" Title="UserAccount" __MarkupType="vsattributemarkup" __WebPartId="{800aba59-4515-4517-87a2-62dee9e706c0}" WebPart="true" __designer:IsClosed="false" id="g_800aba59_4515_4517_87a2_62dee9e706c0" __designer:Preview="&lt;div id=&quot;g_800aba59_4515_4517_87a2_62dee9e706c0&quot; __MarkupType=&quot;vsattributemarkup&quot; __WebPartId=&quot;{800aba59-4515-4517-87a2-62dee9e706c0}&quot; WebPart=&quot;true&quot;&gt;
	
&amp;nbsp;&lt;a id=&quot;g_800aba59_4515_4517_87a2_62dee9e706c0_ctl00_lbtnUserName&quot; Href=&quot;javascript:__doPostBack('g_800aba59_4515_4517_87a2_62dee9e706c0$ctl00$lbtnUserName','')&quot;&gt;&lt;/a&gt;
&amp;nbsp;|
&lt;a id=&quot;g_800aba59_4515_4517_87a2_62dee9e706c0_ctl00_lbtnChangePassword&quot; Href=&quot;javascript:__doPostBack('g_800aba59_4515_4517_87a2_62dee9e706c0$ctl00$lbtnChangePassword','')&quot;&gt;Change Password&lt;/a&gt;
&amp;nbsp;|
&lt;a onclick=&quot;return confirm('Are you sure you want to log out ?');&quot; id=&quot;g_800aba59_4515_4517_87a2_62dee9e706c0_ctl00_lbtnLogOut&quot; Href=&quot;javascript:__doPostBack('g_800aba59_4515_4517_87a2_62dee9e706c0$ctl00$lbtnLogOut','')&quot;&gt;Logout&lt;/a&gt;

&lt;/div&gt;" __designer:Values="&lt;P N='Description' ID='1' T='UserAccount' /&gt;&lt;P N='DisplayTitle' R='1' /&gt;&lt;P N='Title' R='1' /&gt;&lt;P N='WebBrowsableObject' R='0' /&gt;&lt;P N='HasAttributes' T='True' /&gt;&lt;P N='ID' ID='2' T='g_800aba59_4515_4517_87a2_62dee9e706c0' /&gt;&lt;P N='Page' ID='3' /&gt;&lt;P N='TemplateControl' R='3' /&gt;&lt;P N='AppRelativeTemplateSourceDirectory' R='-1' /&gt;"></UserAccount:UserAccount>

						
</asp:Content>

