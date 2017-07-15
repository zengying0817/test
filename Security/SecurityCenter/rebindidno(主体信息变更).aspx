<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rebindidno.aspx.cs" Inherits="API.WebUI201509.Security.SecurityCenter.rebindidno" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>万卡-重新实名认证</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript" src="/Scripts/custom/jianrong.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/validate.js?t=1"></script>
    <script type="text/javascript" src="/international/Scripts/js/rebindIdentitycard.js?v=2015"></script>
    
    <script type="text/javascript">
var context_path = '';
</script>
<style>

.yiwanka-write-bottom p .span2 .confirm-btn-disabled{
	width:180px;

}
.yiwanka-write-bottom p .span2 .confirm-btn{
width:180px;

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
    }</script></head>
<body>
<div class="yiwanka">
	<!-- 头部 -->
	<uc1:Header runat="server" id="Header1"/>
    
    <!-- 菜单 -->
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="1" />
    
    <!-- 主体 -->
	<div class="yiwanka-con-right">
		<div class="yiwanka-write">
			<div class="yiwanka-write-title renzhenicon">
				<span>Re-real-name authentication</span>
			</div>
			<div class="yiwanka-write-top">
				<p class="selected"><span class="span1">①</span><span class="span2">
					  <% if (CurrentUser.phoneValidated == 1){ %>Verify phone <% }else{ %>  Verify email <% } %>
					</span></p>
				<p><span class="span1">②</span><span class="span2">Verify problems</span></p>
				<p><span class="span1">③</span><span class="span2">Verify transaction password</span></p>
				<p><span class="span1">④</span><span class="span2">original identity information</span></p>
				<p><span class="span1">⑤</span><span class="span2">Re-real-name authentication</span></p>
			</div>
			<div class="yiwanka-write-bottom">
				<div class="yiwanka-write-bottom-con">
					<div class="change-type">
					    <% if (CurrentUser.phoneValidated == 1)
					       { %>
					<form id="phoneForm">
					<p style="margin-top:25px;">
						<span class="span1">cellphone number:</span>
						<span class="span2"><%= UserViewPhone %></span>
					</p>
					<p>
						<span class="span1">Verification Code:</span>
						<span class="span2">
                            <input id="opsessionid" name="opsessionid" type="hidden" value="<%= sessionid %>">
							<input id="phoneimgcode" name="phoneimgcode" type="text" class="yxkeleyi"  style="width:85px;">
							<b class="b1">
								<img src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="width:75px;height:33px;cursor: pointer;" title=" Click to replace the other." />
							</b>
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">Phone verification code:</span>
						<span class="span2">
							<input id="phonevalidcode" name="phonevalidcode" type="text" class="yxkeleyi"  style="width:85px;" disabled="disabled">
							<input id="phonevalildcodebtn" type="button" value="get verification code" class="confirm-btn" style="width:75px;height:35px;float:right;color:#ffffff;font-size:12px;">
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn-disabled nextstep" value="The next step" disabled="disabled">
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
							<input id="emailvalildcodebtn" type="button" value="send" class="confirm-btn" style="width:75px;height:35px;float:right;color:#ffffff;font-size:12px;">
						</span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn-disabled nextstep" value="The next step" disabled="disabled">
						</span>
					</p>
					</form>

                        <% } %>
					</div>
					</div>
				<div style="display:none;" class="yiwanka-write-bottom-con">
					<form id="questionForm">
					<p style="margin-top:25px;">
						<span class="span1">Security Question:</span>
						<span class="span2"><%=CurrentUser.question%></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">Security Answer:</span>
						<span class="span2">
							<input id="pswanswer" name="pswanswer" type="text" class="yxkeleyi"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="The next step">
						</span>
					</p>
					</form>
				</div>
				<div style="display:none;" class="yiwanka-write-bottom-con">
					<form id="tradepswForm">
					<p style="margin-top:25px;">
						<span class="span1">transaction password:</span>
						<span class="span2"><input id="tradepsw" name="tradepsw" type="password" class="yxkeleyi" value="" autocomplete="off"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="The next step">
						</span>
					</p>
					</form>
				</div>
				<div style="display:none;" class="yiwanka-write-bottom-con">
					<form id="oldIdnoForm">
					<p style="margin-top:25px;">
						<span class="span1">Original real name:</span>
						<span class="span2"><%=CurrentUser.personName%></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">Original ID card number:</span>
						<span class="span2"><input id="oldidno" name="oldidno" type="text" class="yxkeleyi" value=""></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="The next step">
						</span>
					</p>
					</form>
				</div>
				<div style="display:none;" class="yiwanka-write-bottom-con">
					<form id="idnoForm">
					<input type="hidden" id="optype" name="optype" value="1011">
                        <input type="hidden" name="session" value="<%=sessionid%>">
					<p style="margin-top:25px;">
						<span class="span1">actual name:</span>
						<span class="span2"><input id="realname" name="realname" type="text" class="yxkeleyi"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1">ID card number:</span>
						<span class="span2"><input id="idno" name="idno" type="text" class="yxkeleyi"></span>
						<span class="span3"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input id="rebindIdnoBtn" type="button" class="confirm-btn" value="Re-certification">
						</span>
					</p>
					</form>
				</div>
				<div class="write-success yiwanka-write-bottom-con" style="display:none;">
					<p><img src="/content/themes/style/images/write02.jpg"></P>
					<p class="p1">Real-name authentication changes successfully</p>
					<p class="p2" style="margin-top:20px;">
						<a href="/user/main.aspx">Return to the home page</a>
						<a href="/international/finance/applycash.aspx" style="margin-left:20px;background-color:#eb904d">Continue to withdraw</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
