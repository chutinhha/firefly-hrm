<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotifyEmployeeUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Admin.NotifyEmployee.NotifyEmployeeUserControl" %>
<SharePoint:CssRegistration ID="CssRegistration0" name="/_layouts/STYLES/human_management/menuStyles.css" After="corev4.css" runat="server"/>
<script language="javascript" type="text/javascript">
	var statusID;
	function showNotif() {
	    var value = "<%= this.inputValue %>".split(";");
        for(i=0;i<value.length;i++){
	        if (value[i] != "") {
	            SP.UI.Notify.addNotification(value[i], true);
	        }
        }
	}
</script>
<asp:Label ID="lblScript" runat="server" Text="<script>ExecuteOrDelayUntilScriptLoaded(showNotif,'sp.js');</script>"></asp:Label>