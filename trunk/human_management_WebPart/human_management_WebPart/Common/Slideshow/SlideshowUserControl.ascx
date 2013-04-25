<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideshowUserControl.ascx.cs" Inherits="SP2010VisualWebPart.Common.Slideshow.SlideshowUserControl" %>
<script type="text/javascript">
<!--
    var image1 = new Image()
    image1.src = "/_layouts/Images/21_2_ob/orbis image/child.jpg"
    var image2 = new Image()
    image2.src = "/_layouts/Images/21_2_ob/orbis image/health.jpg"
    var image3 = new Image()
    image3.src = "/_layouts/Images/21_2_ob/orbis image/child1.jpg"
    var image4 = new Image()
    image4.src = "/_layouts/Images/21_2_ob/orbis image/old.jpg"
    var image5 = new Image()
    image5.src = "/_layouts/Images/21_2_ob/orbis image/child2.jpg"
    var image6 = new Image()
    image6.src = "/_layouts/Images/21_2_ob/orbis image/old1.jpg"
    var image7 = new Image()
    image7.src = "/_layouts/Images/21_2_ob/orbis image/child3.jpg"
    var image8 = new Image()
    image8.src = "/_layouts/Images/21_2_ob/orbis image/child4.jpg"
    var image9 = new Image()
    image9.src = "/_layouts/Images/21_2_ob/orbis image/plan.jpg"
    var image10 = new Image()
    image10.src = "/_layouts/Images/21_2_ob/orbis image/child5.jpg"
//-->
</script>
<img src="/_layouts/Images/21_2_ob/orbis image/child2.jpg" name="slide" width="100%" height="550px;"/>
<script type="text/javascript">
<!--
    //variable that will increment through the images
    var step = 1
    function slideit() {
        //if browser does not support the image object, exit.
        if (!document.images)
            return
        document.images.slide.src = eval("image" + step + ".src")
        if (step < 10)
            step++
        else
            step = 1
        //call function "slideit()" every 2.5 seconds
        setTimeout("slideit()", 5000)
    }
    slideit()
//-->
</script>
