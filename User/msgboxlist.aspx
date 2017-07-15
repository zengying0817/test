<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgboxList.aspx.cs" Inherits="API.WebUI201509.User.MsgboxList" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Station letters|Kdpay</title>
 <link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript" src="/Scripts/secure/BigInt.js"></script>
<script type="text/javascript" src="/Scripts/secure/RSA.js"></script>
<script type="text/javascript" src="/Scripts/secure/Barrett.js"></script>
<script type="text/javascript">
    function rsapassword(password) {
        setMaxDigits(1024);
        key = new RSAKeyPair("<%= strPublicKeyExponent %>", "", "<%= strPublicKeyModulus %>");
        var encpassword = encryptedString(key, encodeURIComponent(password));
        return encpassword;
    }
</script>
    <body>
<div class="yiwanka" style="position:relative;">
	  <!-- 头部 -->
        <uc1:Header runat="server" id="Header1"/>
        <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="7" />
    <!-- 主体 -->
	<div class="yiwanka-con-right">
		<div class="complain-wanka">
			<div class="complain-wanka-top">
				<span class="spanwanka1">inbox</span>
				<span>Outbox</span>
				<span id="newComplaintTab">send message</span>
			</div>
			<div class="complain-wanka-one-zong">
				<div class="complain-wanka-one">	
					<form id="replySearchForm">
						<input type="hidden" value="2" name="mailType" /> 
						<input type="hidden" value="1" name="fromType" />
					</form>
					<table id="replyDataTable" class="ly_tab">
						<thead>
							<tr class="hsbg">
								<th width="10%">status</th>
								<th width="60%">title</th>
								<th>Send time</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="complain-wanka-one" style="display:none;margin-top:14px;" >
					<form id="complaintSearchForm">
						<input type="hidden" value="1" name="mailType" /> 
						<input type="hidden" value="1" name="fromType" />
					</form>
					<div>
						<a id="selectAllBtn" class="btn" href="javascript:void(0);" style="background-color:#e58c15;">select all</a>
						<a id="bacthDeleteBtn" class="btn" href="javascript:void(0);">delete</a>
					</div>
					<table id="complaintDataTable" class="ly_tab">
						<thead>
							<tr class="hsbg">
								<th width="10%">select</th>
								<th width="10%">status</th>
								<th width="45%">title</th>
								<th width="20%">Send time</th>
								<th width="15%">operating</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="complain-wanka-one" style="display:none;">
					<form id="sendMailForm" action="/user/sendMail" method="post">
						<input type="hidden" id="sendState" name="sendState" value="1" />
						<input type="hidden" name="fromType" value="1" />
						<input type="hidden" id="mailId" name="mailId" value="" />
					<p>
						<span class="span1">title：</span>
						<span class="span2"><input id="title" name="title" type="text" class="yxkeleyi"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2" style="text-indent: 30px;"></span>
						<span class="span3"></span>
					</p>
					<p style="height:auto; overflow:hidden;">
						<span class="span1">content：</span>
						<span class="span2" style="width:450px; height:240px;">
							<textarea id="mailContent"
								name="mailContent" style="width:425px; height:225px;" class="yxkeleyi"></textarea>
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2" style="text-indent: 30px;"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">Verify：</span>
						<span class="span2" style="width:100px;">
							<input name="captchacode" id="captchacode" type="text" class="yxkeleyi" style="width:90px;">
						</span>
						<span class="span3"  style="text-align: left">
							<img id="imgcode" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="width:75px;height:38px;cursor: pointer;" title="看不清？点击更换另一个。" />
						</span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2" style="text-indent: 30px;"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2" style="width:100px;"><a id="sendmailbtn" href="javascript:void(0);">send immediately</a></span>
						<span class="span3"><a id="savemailbtn"  href="javascript:void(0);">save draft</a></span>
					</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>	
<div class="complain-shade" style="display:none;">
	<div class="complain-shade-zhezhao"></div>
	<div class="complain-shade-con complain-shade-con2" style="width:100%; position:absolute; top:0; height: auto;">
		<div class="complain-shade-con-content">
		<h3 id="emailTitle" class="complain-shade-con-title">
		</h3>
		<div id="replyemail" class="fankui-wanka" style="display:none;width:auto; height:auto; overflow:auto;">
			<p class="complain-shade-con-desc">System Feedback</p>
			<p id="replyusername" class="complain-shade-con-user"></p>
			<p id="replycontent" class="complain-shade-con-email"></p>
			<p id="replytime" class="complain-shade-con-time"><span style="font-size:12px;">2015-05-27 06:25:33.0</span></p>
		</div>
		<div id="askemail" class="fankui-wanka" style="display:none;width:auto; height:auto; overflow:auto;">
			<p class="complain-shade-con-desc">Sent</p>
			<p id="username" class="complain-shade-con-user"></p>
			<p id="askcontent" class="complain-shade-con-email"></p>
			<p id="asktime" class="complain-shade-con-time"><span style="font-size:12px;">2015-05-27 06:25:33.0</span></p>
		</div>
		<p style="margin-top:10px;">
			<a href="#" class="a4" style="background-color:#6f7c94; height:40px; line-height:40px; margin-left:200px;">Got it</a>
		</p>
		</div>
	</div>
</div>

<script type="text/javascript" src="/Scripts/jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.columnmanager.js"></script>
<script type="text/javascript" src="/international/Scripts/custom/dataTableCommon.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/validate.js?t=1"></script>
    <script type="text/javascript" src="/international/Scripts/js/userMsgBoxList.js?t=11"></script></body>
<script type="text/javascript">
var context_path = '';
var tabindex = '<%=tabindex%>';
    var billId = '<%=billId%>';
    var msgType = '<%=msgType%>';
$(function() {
	$(".complain-shade-con2 .a4").click(function() {
		$(".complain-shade").hide();
		$("#replyemail").hide();
		$("#askemail").hide();
	});
	
	$(document).keyup(function(event){
		 switch(event.keyCode) {
			 case 27:
			 case 96:
				 $(".complain-shade-con2 .a4").click();
		 }
	});
	
	$(".complain-wanka-top > span").click(function() {
		var suoyin = $(this).index();
		$(this).addClass("spanwanka1").siblings().removeClass("spanwanka1");
		$(".complain-wanka-one-zong > div").eq(suoyin).show().siblings().hide();
	});
	
	if (billId) {
		$("#title").val("Orders：" + billId + " complaint opinions");
		$("#newComplaintTab").click();
		$("#mailContent").focus();
	}
	else if (msgType === "agentapply") {
	    $("#title").val(" business number(<%=UserID%>) Apply for an agent");
	    $("#newComplaintTab").click();
	    $("#mailContent").focus();
	}
	else if (msgType === "rateupdate") {
	    $("#title").val("Apply to modify sub-merchant rates");
	    $("#newComplaintTab").click();
	    $("#mailContent").val("<%=content%>");
	    $("#mailContent").focus();
	}
	else {
		if(tabindex){
			$(".complain-wanka-top > span:eq("+tabindex+")").click();
		}
	}
});
</script>
</html>