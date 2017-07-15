<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="findTradepsw.aspx.cs" Inherits="API.WebUI201509.Security.SecurityCenter.findTradepsw" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Retrieve the transaction password|kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<style>
	.yiwanka-write-bottom p{
		width: 650px;
	}
	.yiwanka-write-bottom p .span1{
		width: 225px;
	}
</style>
<script type="text/javascript" src="/Scripts/secure/BigInt.js"></script>
        <script type="text/javascript" src="/Scripts/secure/RSA.js"></script>
        <script type="text/javascript" src="/Scripts/secure/Barrett.js"></script>
 <script type="text/javascript">
     function rsapassword(password) {
         setMaxDigits(129);
         key = new RSAKeyPair("<%= strPublicKeyExponent %>", "", "<%= strPublicKeyModulus %>");
         var encpassword = encryptedString(key, encodeURIComponent(password));
         return encpassword;
     }</script>
    <body>
<div class="yiwanka">
	<!-- 头部 -->
	<!-- 头部 -->
	<uc1:Header runat="server" id="Header1"/>
    
    <!-- 菜单 -->
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="1" />
    
    <!-- 主体 -->
	<div class="yiwanka-con-right">
		<div class="yiwanka-write" style="height:630px;">
			<div class="yiwanka-write-title findicon">
				<span>Retrieve the transaction password</span>
			</div>
			<div class="yiwanka-write-top">
				<p class="selected" style="width:33%;">
					<span class="span1">①</span>
					<span class="span2">
						<% if (CurrentUser.phoneValidated == 1){ %>Verify phone <% }else{ %>  Verify email <% } %>
					</span>
				</p>
				<p style="width:33%">
					<span class="span1">②</span>
					<span class="span2">Secret security verification</span>
				</p>
				<p style="width:33%">
					<span class="span1">③</span>
					<span class="span2">Retrieve the transaction password</span>
				</p>
			</div>
			<div class="yiwanka-write-bottom" style="height:280px;">
				<div class="yiwanka-write-bottom-con">
				<div class="change-type">
					<% if (CurrentUser.phoneValidated == 1)
					       { %>
					<form id="phoneform">
					<p>
						<span class="span1">Has been bound phone number:</span>
						<span class="span2"><%=UserViewPhone %></span>
					</p>
					<p>
						<span class="span1">Verification Code:</span>
						<span class="span2" style="width:auto;">
							<input id="phoneimgcode" name="phoneimgcode" type="text" class="yxkeleyi" style="width:100px;">
							<img src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-left:5px;width:75px;height:33px;cursor: pointer;" title="change" />
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1">Phone verification code:</span>
						<span class="span2" style="width:auto;">
							<input id="phonevalidcode" name="phonevalidcode" type="text" class="yxkeleyi" style="width:100px;" disabled="disabled">
							<input id="sendphonevalildcodebtn" type="button" value="send" class="confirm-btn" style="margin-left:5px;width:75px;height:35px;float:right;color:#ffffff;font-size:12px;">
						</span>
						<span class="span3" style="width:auto;min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="next step">
						</span>
					</p>
					</form>
					<% }
					       else
					       { %>
                        <form id="emailForm">
					<p style="margin-top:25px;">
						<span class="span1">E-mail:</span>
						<span class="span2"><%=UserViewEmail %></span>
					</p>
					<p>
						<span class="span1">Verification Code:</span>
						<span class="span2">
							<input id="emailimgcode" name="emailimgcode" type="text" class="yxkeleyi"  style="width:85px;">
							<b class="b1">
								<img src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="width:75px;height:33px;cursor: pointer;" title="Click to replace the other." />
							</b>
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">E-mail verification code:</span>
						<span class="span2">
							<input id="emailvalidcode" name="emailvalidcode" type="text" class="yxkeleyi"  style="width:85px;" disabled="disabled">
							<input id="sendvalildcodebtn" type="button" value="send" class="confirm-btn" style="width:75px;height:35px;float:right;color:#ffffff;font-size:12px;">
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn-disabled nextstep" value="next step" disabled="disabled">
						</span>
					</p>
					</form>

                        <% } %>
					</div>
				</div>
				<div class="yiwanka-write-bottom-con"  style="display:none;">
					<form id="questionform" action="/security/resetTradepsw.ashx">
					<p style="margin-top:25px;">
						<span class="span1">Security Question:</span>
						<span class="span2"><%=CurrentUser.question%></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">Answer:</span>
						<span class="span2">
							<input id="pswanswer" name="pswanswer" type="text" class="yxkeleyi"/></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="next step"/>
						</span>
					</p>
					</form>
				</div>
				<div class="yiwanka-write-bottom-con"  style="display:none;">
					<div style="width:100px;height:200px; float: left;margin-top: 55px;margin-left: 10px;">
						<img src="/content/themes/style/images/write02.jpg">
					</div>
					<div style="width:200px;height:200px; float: left;text-align: left;text-indent: 20px;color:#666666;">
						<p style="margin-top: 50px;color:#4CAD00;font-weight: bold;font-size: 20px;">
							<span>Congratulations, the transaction password is successful!</span>
						</p>
						<p style="margin-top: 10px;">
							<span >Your new password is:</span><span id="newTradepsw" style="color:red;font-weight: bold;">XXXXXX</span>
						</p>
						<p style="margin-top: 0px;">
							<span>In order to ensure the security of your account, we recommend that you immediately enter
									<a style="color:red;text-decoration: underline;" href="/international/security/securitycenter/Index.aspx?tabindex=4">Security center</a>，
							Modify the transaction password.</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/validate.js?t=1"></script></body>
<script type="text/javascript">
$(function(){
	RebindValidator.loadDefaultErrorStyle();
	RebindValidator.loadValidByIndex(0);
	
	$(".nextstep").click(function() {
		var $this = $(this);
		var $form = $this.parents("form");
		if($form.valid()){
			var action = $form.prop("action");
			if (action) {
				$.ajax({
				    type: "post",
                    dataType:"json",
					url : action,
					success : function(json) {
						if (json.result == 'ok') {
							$("#newTradepsw").text(json.msg);
							nextStep($this);
						} else {
							alert(json.msg);
						}
					},
					error : function() {
					}
				});
			} else {
				nextStep($this);
			}
		}
	});
	
	$("#sendvalildcodebtn").click(function(){
		var $sendbtn = $(this);
		if($("#emailimgcode").valid()) {
			$.ajax({
				type : "post",
				url : "/user/bind/sendEmailVerifyCode.ashx",
				data : {
					optype : "2020",
					imgverifycode : $("#emailimgcode").val()
				},
				success : function(json) {
					if (json.result == 'ok') {
						setDisabledTime($sendbtn);
						$sendbtn.parent().next().addClass("validimg").text(json.msg);
						$sendbtn.prev("input").prop("disabled",false).focus();
						$sendbtn.parents("p").next("p").find("input")
									.removeClass("confirm-btn-disabled").addClass("confirm-btn").prop("disabled",false);
					} else {
						alert(json.msg);
					}
				},
				error : function() {
				}
			});
		}
	});
	
	$("#sendphonevalildcodebtn").click(function(){
		var $sendbtn = $(this);
		if($("#phoneimgcode").valid()) {
			$.ajax({
			    type: "post",
                dataType:'json',
				url: "/user/bind/sendPhoneVerifyCode.ashx",
				data : {
					optype : "2010",
					imgverifycode : $("#phoneimgcode").val()
				},
				success : function(json) {
					if (json.result == 'ok') {
						setDisabledTime($sendbtn);
						$sendbtn.parent().next().addClass("validimg").text(json.msg);
						$sendbtn.prev("input").prop("disabled",false).focus();
						$sendbtn.parents("p").next("p").find("input")
									.removeClass("confirm-btn-disabled").addClass("confirm-btn").prop("disabled",false);
					} else {
						alert(json.msg);
					}
				},
				error : function() {
				}
			});
		}
	});
});

function nextStep($obj){
	var suoyin = $(".yiwanka-write-bottom").find($obj.parents(".yiwanka-write-bottom-con")).index();
	$(".yiwanka-write-top > p").eq(suoyin + 1).addClass("selected");
	$(".yiwanka-write-top > p").eq(suoyin).removeClass("selected").addClass("pass");
	$(".yiwanka-write-bottom > div").eq(suoyin + 1).show().siblings().hide();
	RebindValidator.loadValidByIndex(suoyin+1);
}

var RebindValidator = {
		loadDefaultErrorStyle : function(){
			$.validator.setDefaults({
				success : function(label, element) {
					element.parent().siblings(".span3").removeClass("errorimg").addClass("validimg").text("");
				},
				errorPlacement : function(error, element) {
					element.parent().siblings(".span3").removeClass("validimg").addClass("errorimg").text(error.html());
				}
			});
		},
		loadValidByIndex : function(index){
			switch(index){
				case 0: this.phoneOrEmailValid();break;
				case 1: this.pswquestionValid();break;
			}
		},
		phoneOrEmailValid : function(){
			$("#phoneform").validate({
				rules : {
					phoneimgcode : {
						required : true,
						remote : {
						    url: "/user/bind/validImgVerifyCode.ashx",
							type : "post",
							async : false,
							data : {
								imgverifycode : function() {
									return $("#phoneimgcode").val();
								}
							}
						}
					},
					phonevalidcode : {
						required : true,
						remote : {
						    url: "/user/bind/validPhoneVerifyCode.ashx",
							type : "post",
							async : false,
							data : {
								optype : "2010",
								imgverifycode : function() {
									return $("#phoneimgcode").val();
								},
								smscode : function() {
									return $("#phonevalidcode").val();
								}
							}
						}
					}
				},
				messages : {
					phoneimgcode : { required : "please enter verification code", remote : "Verification code error"},
					phonevalidcode : {required : "Please enter phone verification code",remote : "Wrong phone verification code"}
				}
			});
			$("#emailform").validate({
				rules : {
					emailimgcode : {
						required : true,
						remote : {
						    url: "/user/bind/validImgVerifyCode.ashx",
							type : "post",
							async : false,
							data : {
								imgverifycode : function() {
									return $("#emailimgcode").val();
								}
							}
						}
					},
					emailvalidcode : {
						required : true,
						remote : {
						    url: "/user/bind/validEmailVerifyCode.ashx",
							type : "post",
							async : false,
							data : {
								optype : "2020",
								imgverifycode : function() {
									return $("#emailimgcode").val();
								},
								emailverifycode : function() {
									return $("#emailvalidcode").val();
								}
							}
						}
					}
				},
				messages : {
					emailimgcode : { required : "please enter verification code", remote : "Verification code error"},
					emailvalidcode : {required : "Please enter your email address",remote : "Mailbox verification code error"}
				}
			});
		},
		pswquestionValid : function(){
			$("#questionform").validate({
				rules : {
					pswanswer : {
						required : true,
						remote : {
						    url: "/user/bind/validPswQuestion.ashx",
							type : "post",
							async : false,
							data : {
								optype : "2030",
								oldpswanswer : function() {
									return $("#pswanswer").val();
								}
							}
						}
					}
				},
				messages : {
					pswanswer : { required : "Please enter secret answer", remote : "wrong answer"},
				}
			});
		}
};

var wait = 60;
function setDisabledTime($btn){
	if (wait == 0) {
		$btn.prop("disabled",false).removeClass("confirm-btn-disabled").addClass("confirm-btn").val("send");
		$btn.next("span").text("");
		wait = 60;
	} else {
		if(!$btn.prop("disabled")){
			$btn.prop("disabled",true).removeClass("confirm-btn").addClass("confirm-btn-disabled");
		}
		$btn.val(wait+"s Resend");
		wait--;
		setTimeout(function() {
			setDisabledTime($btn);
		}, 1000);
	}
}
function refreshcaptchacode(obj) {
    $(obj).attr("src", "/captchacode.ashx?date=" + new Date());
}
</script>
</html>
