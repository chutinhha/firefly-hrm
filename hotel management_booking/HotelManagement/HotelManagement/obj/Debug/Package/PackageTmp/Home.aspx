<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HotelManagement.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="user1" class="right bottommain">
                    <div class="moduletable">
                        <h3>
                            Hot Property</h3>
                        <div class="bannergroup">
                            <div class="scrollprev0">
                            </div>
                            <div class="scrollArticleBox0" style="float: left;">
                                <asp:Panel ID="HotRoom" runat="server">
                                
                                
                                </asp:Panel>
                            </div>
                            <div class="scrollnext0">
                            </div>
                            <script language="javascript" type="text/javascript">
                                (function ($) {
                                    $(".anyClass0").jCarouselLite({
                                        btnNext: ".scrollnext0",
                                        btnPrev: ".scrollprev0",
                                        auto: 0,
                                        vertical: 0,
                                        scroll: 3,
                                        speed: 500,
                                        visible: 3,
                                        delay_step: 3000
                                    });
                                })(jQuery);
                            </script>
                            <span class="clear"></span>
                        </div>
                    </div>
                    <div class="clearfix user1separator">
                    </div>
                </div>
                <div id="user2user3" class="right bottommain">
                    <div id="user2" class="user2user3" style="width: 308px; margin-right: 21px; overflow: auto;
                        height: 245px;">
                        <!--			<div id="user2" class="user2user3" style="width:233px;margin-right:21px;overflow:hidden"> -->
                        <div class="moduletable">
                            <h3>
                                Lastest news</h3>
                            <style>
                                .articlebox_title img
                                {
                                    display: block;
                                }
                                .articlebox_introtext img
                                {
                                    display: block;
                                }
                            </style>
                            <asp:Panel ID="pnlNews" runat="server">
                            </asp:Panel>
                        </div>
                    </div>
                    <div id="user3" class="user2user3" style="width: 315px; overflow: auto; height: 250px;">
                        <!--				<div id="user3" class="user2user3" style="width:233px;margin-left:21px;overflow:hidden">-->
                        <div class="moduletable">
                            <h3>
                                Visit our furniture store</h3>
                            <a href="http://www.davidducdecor.com/" target="_blank">
                                <img src="Images/fur-store.png" border="0" height="150"
                                    width="288"></a><p>
                                        &nbsp;</p>
                            <p>
                                Please visit <a class="readon" href="http://www.davidducdecor.com/" target="_blank">
                                    www.davidducdecor.com</a>
                            </p>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <script type="text/javascript">
                    (function ($) {
                        $(document).ready(function () {
                            $("#user2user3 .user2user3").equalHeights();
                        });
                    })(jQuery);
                </script>
                <div class="clearfix">
                </div>
</asp:Content>
