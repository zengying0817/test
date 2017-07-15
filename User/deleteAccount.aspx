<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteAccount.aspx.cs" Inherits="API.WebUI201509.User.deleteAccount" %>


<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Account cancellation|Kdpay</title>

     <link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />

    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<style>
.yiwanka-write-bottom p .span2 .confirm-btn {
    width: 100%;
 
}
.yiwanka-write-bottom p .span1 {
    width: 205px;
   
}
</style>
</head>

<script type="text/javascript" src="/Scripts/secure/BigInt.js"></script>
<script type="text/javascript" src="/Scripts/secure/RSA.js"></script>
<script type="text/javascript" src="/Scripts/secure/Barrett.js"></script>
<script type="text/javascript">
    function rsapassword(password) {
        setMaxDigits(1024);
        key = new RSAKeyPair("<%=strPublicKeyExponent%>", "", "<%=strPublicKeyModulus%>");
	    var encpassword = encryptedString(key, encodeURIComponent(password));
	    return encpassword;
    }
</script>
<body>
<div class="yiwanka">
	 <!-- 头部 -->
        <uc1:Header runat="server" id="Header1"/>
        <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="8" />

    <!-- 主体 -->
	<div class="yiwanka-con-right">
		<div class="yiwanka-write" style="height:670px;">
			<div class="yiwanka-write-title warnicon">
				<span>Account cancellation</span>
			</div>
			<div class="yiwanka-write-top">
				<p class="selected" style="width:33%">
					<span class="span1">①</span>
					<span class="span2">Transaction Password Verification</span>
				</p>
				<p style="width:33%">
					<span class="span1">②</span>
					<span class="span2">Secret security verification</span>
				</p>
				<p style="width:33%;">
						<span class="span1">③</span>
						<span class="span2"> <% if (CurrentUser.phoneValidated == 1){ %>Verify your phone <% }else{ %> Verify the mailbox <% } %></span>
					</p>
				</div>
			<div class="yiwanka-write-bottom" style="height:280px;">
				<div class="yiwanka-write-bottom-con">
				<form id="tradepswform">
					<p style="margin-top:35px;">
						<span class="span1">transaction password:</span>
						<span class="span2">
							<input id="tradepwd" name="tradepwd" type="password" value="" class="yxkeleyi" autocomplete="off"/>
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input id="validTradepswBtn" type="button" class="confirm-btn nextstep" value="The next step" />
						</span>
					</p>
					</form>
				</div>
				<div style="display:none;" class="yiwanka-write-bottom-con">
					<form id="questionpswform">
					<p style="margin-top:35px;">
						<span class="span1">Security Question:</span>
						<span class="span2"><%=CurrentUser.question%></span>
					</p>
					<p>
						<span class="span1">Enter secret protection:</span>
						<span class="span2">
							<input id="pswanswer" name="pswanswer" type="text" value="" class="yxkeleyi" />
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="The next step" />
						</span>
					</p>
					</form>
				</div>
				<div class="yiwanka-write-bottom-con" style="display:none;"> <% if (CurrentUser.phoneValidated == 1)
					       { %>
					<form id="phoneform">
					<p>
						<span class="span1">Has been tied to mobile phones:</span>
						<span class="span2"><%=UserViewPhone%></span>
					</p>
					<p>
						<span class="span1">Verification Code:</span>
						<span class="span2" style="width:auto;">
							<input id="phoneimgcode" name="phoneimgcode" type="text" class="yxkeleyi" style="width:100px;">
							<img src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-left:5px;width:75px;height:33px;cursor: pointer;" title="看不清？点击更换另一个。" />
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1">Phone verification code:</span>
						<span class="span2" style="width:auto;">
							<input id="phonevalidcode" name="phonevalidcode" type="text" class="yxkeleyi" style="width:100px;" disabled="disabled">
							<input id="sendphonevalildcodebtn" type="button" value="get verification code" class="confirm-btn" style="margin-left:5px;width:75px;height:35px;float:right;color:#ffffff;font-size:12px;">
						</span>
						<span class="span3" style="width:auto;min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input id="confirmQuitBtn" type="button" class="confirm-btn-disabled" value="Confirm logout account" style="width:115px;" disabled="disabled" />
						</span>
					</p>
					</form>
                    
                      <% }
					       else
					       { %>
                        <form id="emailform">
					<p>
						<span class="span1">Bundled mailboxes:</span>
						<span class="span2"><%=UserViewPhone%></span>
					</p>
					<p>
						<span class="span1">Verification Code:</span>
						<span class="span2" style="width:auto;">
							<input id="emailimgcode" name="emailimgcode" type="text" class="yxkeleyi" style="width:100px;">
							<img src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-left:5px;width:75px;height:33px;cursor: pointer;" title="看不清？点击更换另一个。" />
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1">E-mail verification code:</span>
						<span class="span2" style="width:auto;">
							<input id="emailvalidcode" name="emailvalidcode" type="text" class="yxkeleyi" style="width:100px;" disabled="disabled">
							<input id="sendvalildcodebtn" type="button" value="get verification code" class="confirm-btn" style="margin-left:5px;width:75px;height:35px;float:right;color:#ffffff;font-size:12px;">
						</span>
						<span class="span3" style="width:auto;min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input id="confirmQuitBtn" type="button" class="confirm-btn-disabled" value="Confirm logout account" style="width:115px;" disabled="disabled" />
						</span>
					</p>
					</form>


                        <% } %>
				</div>
				</div>
			<div class="yiwanka-write-bottom-explain">
				<p style="line-height:50px; font-size:16px; color:#333333; font-weight:bold; text-align:left;">Log out of account steps</p>
				<p>Prerequisite: Verify that the account balance is 0, not 0 can not be canceled</p>
				<p>一：Verify the transaction password</p>
				<p>二：Verify security issues</p>
				<p>三：Verify the mailbox / phone to receive verification code, complete account cancellation</p>
                <%if(CurrentUser.fixedbank == 2){ %>
				<p style="color:#b91414; font-weight:bold;">Note: This account can not be used after the account is canceled</p>
                 <% } %>
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
			if($form[0].id === "tradepswform") {
				validBalance($this);
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
					optype : "2021",
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
				type : "post",
				url : "/user/bind/sendPhoneVerifyCode.ashx",
				data : {
					optype : "2011",
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
	
	$("#confirmQuitBtn").click(function(){
		var $validObj = "";
		if ('<%=UserViewPhone%>' != "") {
			$validObj = $("#phoneform");
		} else {
			$validObj = $("#emailform");
		}
		
		if($validObj.valid()){
			$.ajax({
				type : "post",
				dataType : "json",
				url : "/user/authEmailOrPhoneForQuitAccount.ashx",
				success : function(json) {
					if (json.result == 'ok') {
						alert(json.msg);
						location.href="/";
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

function validBalance($this) {
	$.ajax({
		type : "post",
		dataType : "json",
		url : "/user/ws/refreshBalance.ashx?date=" + new Date(),
		success : function(json) {
			if (json.result == 'ok') {
				var money = json.msg;
				if(money > 0)
				{
					alert("Account balance is not equal to 0, can not write-off account");
					return false;
				} else {
					nextStep($this);
				}
			} else {
				alert(json.msg);
			}
		},
		error : function() {
		}
	});
}

var RebindValidator = {
		loadDefaultErrorStyle : function(){
			$.validator.setDefaults({
				success : function(label, element) {
					element.removeClass("error").addClass("valid").parent().siblings(".span3").removeClass("errorimg").addClass("validimg").text("");
				},
				errorPlacement : function(error, element) {
					element.removeClass("valid").addClass("error").parent().siblings(".span3").removeClass("validimg").addClass("errorimg").text(error.html());
				}
			});
		},
		loadValidByIndex : function(index){
			switch(index){
				case 0: this.tradepswValid();break;
				case 1: this.pswquestionValid();break;
				case 2: 
				    if ('<%=UserViewPhone%>' != "") {
							this.phoneValid();break;										
						} else {
							this.emailValid();break;	
						}
			}
		},
		tradepswValid : function(){
			$("#tradepswform").validate({
				rules : {
					tradepwd : {
						required : true,
						remote : {
							url : "/user/bind/validOldTradePsw.ashx",
							type : "post",
							async : false,
							data : {
								optype : "2040",
								oldtradepsw : function() {
									return rsapassword($("#tradepwd").val());
								}
							}
						}
					}
				},
				messages : {
					tradepwd : { required : "Please enter the transaction password ", remote:" Password wrong"},
				}
			});
		},
		pswquestionValid : function(){
			$("#questionpswform").validate({
				rules : {
					pswanswer : {
						required : true,
						remote : {
							url : "/user/bind/validPswQuestion.ashx",
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
					pswanswer : { required : "Please enter secret answer ", remote:" answer wrong"},
				}
			});
		},
		emailValid : function(){
			$("#emailform").validate({
				rules : {
					emailimgcode : {
						required : true,
						remote : {
							url : "/user/bind/validImgVerifyCode.ashx",
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
							url : "/user/bind/validEmailVerifyCode.ashx",
							type : "post",
							async : false,
							data : {
								optype : "2021",
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
					emailimgcode : { required : "Please enter the verification code ", remote:" verification code error"},
					emailvalidcode : {required : "Please enter the mail verification code ", remote:" Mail authentication code error"}
				}
			});
		},
		phoneValid : function(){
			$("#phoneform").validate({
				rules : {
					phoneimgcode : {
						required : true,
						remote : {
							url : "/user/bind/validImgVerifyCode.ashx",
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
							url : "/user/bind/validPhoneVerifyCode.ashx",
							type : "post",
							async : false,
							data : {
								optype : "2011",
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
					phoneimgcode : { required : "Please enter the verification code ", remote:" verification code error"},
					phonevalidcode : {required : "Please enter the phone verification code ", remote:" phone verification code error"}
				}
			});
		}
};

var wait = 60;
function setDisabledTime($btn){
	if (wait == 0) {
		$btn.prop("disabled",false).removeClass("confirm-btn-disabled").addClass("confirm-btn").val("get verification code");
		$btn.next("span").text("");
		wait = 60;
	} else {
		if(!$btn.prop("disabled")){
			$btn.prop("disabled",true).removeClass("confirm-btn").addClass("confirm-btn-disabled");
		}
		$btn.val(wait+"Sec");
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
