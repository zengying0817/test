<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="API.WebUI201509.Ctrls.Header" %>
<style>
.ywkindex-shade-text .p2 .span2 b{
	margin-left: 5px;
	width:175px;
	text-align: left;
}
.ywkindex-shade-text .p2 .span2{
	width:280px;
}
</style>
<!-- ͷ�� -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<div class="yiwanka-top">
	<div class="yiwanka-top-l">
		<a href="/international/user/UserInfo.aspx"><img src="/content/themes/style/images/kdlogo01.png"></a>
	</div>
	<div class="yiwanka-top-r">
		<div class="yiwanka-top-r-border">
		<div class="p1">
		
				Your last login ip is<span><%=LastLoginIp%></span> 
				Ip location is<span>
				<%=LastLoginAddress %></span>
                <%if(showerror) {%>
                     <a href="javascript:void(0);" style="color:red;" class="not-place">(The logon location is abnormal) </a>
                <%}%>
				</div>
		<div class="p2">
			<p class="p22">
					<a id="callkefu" href="javascript:void(0);" class="span3">
						<img src="/content/themes/style/images/lianxi.gif">
					</a>
					<a href="/international/user/msgboxlist.aspx" class="span2" style="position: relative;">
						<span id="mailCnt" class="span11">0</span>
					</a>
					<a href="/user/logout.aspx" class="span4">
						<img src="/content/themes/style/images/yiwanka004.jpg">
					</a>
			</p>
			<p class="p11">
				Hello,<%=UserName%>&nbsp;&nbsp;<span class="span1">Available Balance:</span><span><font id="userbalance"><%=UserBalance%></font>yuan</span><a
					href="#" onclick="refreshbalance();">(Refresh)</a>
			</p>
		</div>
		</div>
	</div>
</div>
<div class="ywkindex-shade-palce">
	<div class="ywkindex-shade-palce1"></div>
	<div class="ywkindex-shade-palce2">
		<div class="ywkindex-shade-palcetext">
			<p class="p1">
				<span class="span1 index-place"><img src="/content/themes/style/images/guanbi-waka.jpg"></span>
			</p>
			<p style="color:red;font-weight: bold;">Warning:Your IP address is different from last time</p>
			<p>You are currently logged in IP is:<font><%=CurrentLoginIp%></font> The location is:<font><%=CurrentLoginAddress%></font></p>
			<p>Your last login IP is:<font><%=LastLoginIp%></font> The location is:<font><%=LastLoginAddress %></font></p>
			<p style="margin-bottom: 10px;">Please confirm whether it is your own operation, if not, we recommend that you modify the login password.</p>
			<p style="width:60%;margin-bottom: 20px;">
				<a href="#" style="float:left;" class="index-place">Yes,It's me</a>
				<a href="/security/securitycenter/index.aspx?tabindex=5" style="float:right;">No,Change password</a>
			</p>
		</div>
	</div>
</div>
<div class="ywkindex-shade">
	<div class="ywkindex-shade-con1"></div>
	<div class="ywkindex-shade-con2">
		<div class="ywkindex-shade-text">
			<p class="p1"><span class="span1" style="width:720px;"><font style="font-size:22px;">Online service</font>��The service needs to communicate through the QQ, please start QQ.��</span><span class="index-kefuclick"><img src="/content/themes/style/images/guanbi-waka.jpg"></span></p>
			<p class="p2">
				<span class="span1" style="width:700px;"><font style="font-size:22px;">Business services QQ</font>(Responsible for order inquiry, business common problem processing!)</span>
				<span class="span2"><b>Enterprise QQ��800137279</b>
					<a href="javascript:void(0);"><img style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=800137279&o=www.kdpay.com&q=7&ref='+document.location, '_blank', 'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  border="0" src="/content/themes/style/images/index-qq2.jpg"></a></span>

				<span class="span2" style="margin-left:20px; width:300px;"><b style="width:260px;">consumer hotline��400-995-8876</b></span>
			</p>
			<!--<p class="p2 p3">
				<span class="span1"><font style="font-size:22px;">BusinessQQ</font>(Responsible for business consulting and follow-up services to follow up!)</span>
				<span class="span2" style="margin-left:120px;"><b>kdpay Business-XX</b>
					<a href="http://wpa.qq.com/msgrd?v=3&uin=QQ&site=qq&menu=yes" rel="nofollow" target="_blank"><img src="/content/themes/style/images/index-qq2.jpg" alt="Click here to send me a message" title="Click here to send me a message"></a></span>
				<span class="span2"><b>kdpay Business-XX</b>
					<a href="http://wpa.qq.com/msgrd?v=3&uin=QQ&site=qq&menu=yes" rel="nofollow" target="_blank"><img src="/content/themes/style/images/index-qq2.jpg" alt="Click here to send me a message" title="Click here to send me a message"></a></span>
				<span class="span2"><b>kdpay Business-XX</b>
					<a href="http://wpa.qq.com/msgrd?v=3&uin=QQ&site=qq&menu=yes" rel="nofollow" target="_blank"><img src="/content/themes/style/images/index-qq2.jpg" alt="Click here to send me a message" title="Click here to send me a message"></a></span>
			</p>-->
			<p class="p2 p4">
				<span class="span1" style="width:720px;"><font style="font-size:22px;">Financial complaint QQ</font>(Responsible for settlement inquiries and complaints handling!)</span>
				<span class="span2" style="margin-left:120px;"><b>Finance:321131480</b>
					<a href="http://wpa.qq.com/msgrd?v=3&uin=321131480&site=qq&menu=yes" rel="nofollow" target="_blank"><img src="/content/themes/style/images/index-qq2.jpg" alt="Click here to send me a message" title="Click here to send me a message"></a></span>
				<span class="span2"><b>Technical Adviser:2851066099</b>
					<a href="http://wpa.qq.com/msgrd?v=3&uin=2851066099&site=qq&menu=yes" rel="nofollow" target="_blank"><img src="/content/themes/style/images/index-qq2.jpg" alt="Click here to send me a message" title="Click here to send me a message"></a></span>
			</p>
<p style="margin-left:260px;">Complaints received mail:<a>Complaints@DuQee.Com</a></p>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function () {
        $(".not-place").click(function () {
            $(".ywkindex-shade-palce").show();
        });
        $(".index-place").click(function () {
            $(".ywkindex-shade-palce").hide();
        });
        $(".index-kefuclick").click(function () {
            $(".ywkindex-shade").hide();
        });
        $("#callkefu").click(function () {
            $(".ywkindex-shade").show();
        });
    });

    // �˻����
    refreshbalance();
    // δ���ʼ�
    getUnReadMailCnt();

    function refreshbalance() {
        $.ajax({
            type: "post",
            dataType: "json",
            timeout: 100000,
            url: "/user/ws/refreshBalance.ashx?date=" + new Date(),
            success: function (json) {
                if (json.result == 'ok') {
                    $('#userbalance').html(json.msg);
                    $('#baseinfo_userbalance').html(json.msg);
                } else {
                    dialog_simple_fail(json.msg);
                    alert(json.msg);
                }
            },
            error: function (xmlHttpRequest, error) {
            }
        });
    }

    function getUnReadMailCnt() {
        $.ajax({
            type: "get",
            url: "/user/ws/unReadMailCount.ashx?date="+ new Date(),
            success: function (json) {
                var unReadCount4Mail = json.msg;
                if (unReadCount4Mail > 0) {
                    $('#mailCnt').html(unReadCount4Mail);
                }
            },
            error: function (xmlHttpRequest, error) {
            }
        });
    }
    window.setInterval(getUnReadMailCnt, 120000);
</script>