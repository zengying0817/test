<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserMenu.ascx.cs" Inherits="API.WebUI201509.Ctrls.UserMenu" %>
<style>
.yiwanka-con-left ul .child-menu li a{
	margin-left:10%;
}
.yiwanka-con-left ul .child-menu li a:hover{
	margin-left:10%;
}
.yiwanka-con-left ul .child-menu li a.childactive{
	margin-left:10% !important;
}
</style>
<!-- 菜单 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<div class="yiwanka-con-left">
            <ul class="menubar">
                <li><a href="/international/user/userinfo.aspx">Home</a></li>
                <li><a href="/international/security/securitycenter/index.aspx">Account Center</a></li>
                <li><a href="/international/recycle/recycleIndex.aspx">I want to supply</a></li>
                <li class="haschlids">
                    <a href="javascript:void(0);" class="li-child">Order Management</a>
                    <ul class="child-menu">
                        <li><a href="/international/recycle/bill.aspx">Card OrderList</a></li>
                        <li><a href="/international/recycle/bankbill.aspx">E-bank orders</a></li>
                        <li><a href="/international/recycle/apiinfo.aspx">Access mode</a></li>
                        <li><a href="/international/recycle/summary.aspx">Statistical Analysis</a></li>
                    </ul>
                </li>
                <li class="haschlids">
                    <a href="javascript:void(0);" class="li-child">Cash management</a>
                    <ul class="child-menu">
                        <li><a href="/international/finance/applycash.aspx">Withdrawal application</a></li>
                        <li><a href="/international/finance/cashrecord.aspx">Withdrawals record</a></li>
                        <li><a href="/international/finance/accountrecord.aspx">Capital flow</a></li>
                    </ul>
                </li>
                <li><a href="/international/recycle/recycleclearrate.aspx">Settlement Ratio</a></li>
                <li class="haschlids">
                    <a href="javascript:void(0);" class="li-child">API access</a>
                    <ul class="child-menu">
                        <li><a href="/international/recycle/apiinfo.aspx">Access information</a></li>

                    </ul>
                </li>
                <li><a href="/international/user/msgboxlist.aspx">Station letter</a></li>
                <li><a href="/international/user/deleteAccount.aspx">Exit</a></li>
                <% if (CurrentUser.userType == 2 || CurrentUser.userType == 4)
                   { %>
                <li class="haschlids">
                    <a href="javascript:void(0);" class="li-child">Agent management</a>
                    <ul class="child-menu">
                        <li><a href="/international/agent/userlist.aspx">Business listings</a></li>
                        <li><a href="/international/agent/bankbill.aspx">Merchant E-bank orders</a></li>
                        <li><a href="/international/agent/cardbill.aspx">Merchant point card orders</a></li>
                    </ul>
                </li>
                <% } else { %>
                <!--<li><a href="/international/agent/apply.aspx">Agent application</a></li>-->
                <% } %>
            </ul>
        </div>
<script type="text/javascript">
            $(document).ready(function () {
                var menuIndex = '<%=MenuIndex%>';
                var parentIndex = "";
                var childIndex = "";
                if (menuIndex.indexOf("-") > 0) {
                    var indexArr = menuIndex.split("-");
                    parentIndex = indexArr[0];
                    childIndex = indexArr[1];
                    var $liObj = $(".menubar").children("li:eq(" + parentIndex + ")");
                    $liObj.find("li:eq(" + childIndex + ")").addClass("childactive").children("a").addClass("childactive");
                    $liObj.find("li:eq(" + childIndex + ")").siblings().removeClass("childactive").find("a").removeClass("childactive");
                    $liObj.find(".child-menu").show();
                } else {
                    parentIndex = menuIndex;
                }

                var $lis = $(".yiwanka-con-left ul").children("li:eq(" + parentIndex + ")");
                $lis.children("a").addClass("newactive");
                $lis.siblings().find("a").removeClass("newactive");

                $(".yiwanka-con-left .haschlids").click(function () {
                    $(this).children("a").addClass("newactive");
                    $(this).siblings().find("a").removeClass("newactive");
                });

                $(".li-child").click(function () {
                    $(this).next(".child-menu").stop().slideToggle(500);
                });
            });
        </script>