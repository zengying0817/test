<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="API.WebUI201509.Security.SecurityCenter.Index" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>securitycenter|Kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
<script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<style>
.manage-goods-total-head span,
.manage-goods-total-head .goods-activespan,

{
	width:150px;
}
.manage-goods-child .attestation p .span1,
.manage-goods .confirm-btn, .manage-goods .confirm-btn-disabled{
	width:250px;

}

.manage-goods-child .attestation p .span2 select,
.manage-goods-child .attestation {
   
    width: 100%;
  
}
.manage-goods-total-head .goods-activespan {
    width: 150px;
  
}
.manage-goods-total-head span {
    width: 150px;
 
}
</style>

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
<div class="yiwanka">
	<!-- 头部 -->
	<uc1:Header runat="server" id="Header1"/>

    <!-- 菜单 -->
    <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="security" /><!-- 主体 -->

	<div class="yiwanka-con-right">
		<div class="manage-goods">
			<div class="manage-goods-con">
				<div class="manage-goods-total">
					<div class="manage-goods-total-head">
						<span class="goods-activespan" style="margin-left:0px;">Authentication </span>
						<span id="phonetab">Phone binding</span>
						<span>Mailbox Binding</span>
						<span>Problems binding</span>
						<span>transaction password</span>
						<span>login password</span>		
					</div>
					<div class="manage-goods-title">
						<div>
							<h3 id="bind-title">Authentication</h3>
						</div>
					</div>
					<div class="manage-goods-child">
						<div class="manage-goods-child-state">
							<div class="attestation">
								<p><span class="span1">Certification status：</span>
									<span class="span2" style="font-weight:bold; width:320px; color:#6cab0d;">
										<% if (CurrentUser.realnameValidated == 1)
										   { %>Foundation real name<% }
										   else
										   { %> not certified <% } %>
                                       ( protocol&nbsp;<% if (CurrentUser.procstatus == 2)
										   { %>signed<% }
                                           else if (CurrentUser.procstatus == 1)
										   { %>under review <% } else{%>Not signed <% } %>)

									</span>
								</p>
								<p style="display:none;"><span class="span1">Binding state：</span>
									<span class="span2" style="font-weight:bold; width:200px; color:#6cab0d;">
										<% if (CurrentUser.phoneValidated == 1)
										   { %>Foundation real name<% }
										   else
										   { %> not certified <% } %></span>
								</p>
								<p style="display:none;"><span class="span1">Binding state：</span>
									<span class="span2" style="font-weight:bold; width:200px; color:#6cab0d;">
										<% if (CurrentUser.emailValidated == 1)
										   { %>Foundation real name<% }
										   else
										   { %> not certified <% } %></span>
								</p>
								<p style="display:none;"><span class="span1">Binding state：</span>
									<span class="span2" style="font-weight:bold; width:200px; color:#6cab0d;">
										<% if (CurrentUser.securityissue == 1)
										   { %>Foundation real name<% }
										   else
										   { %>  not certified <% } %></span>
								</p>
								<p style="display:none;"><span class="span1">Setting status：</span>
									<span class="span2" style="font-weight:bold; width:200px; color:#6cab0d;">
										<% if (!string.IsNullOrEmpty(CurrentUser.tradepsw))
										   { %>Foundation real name<% }
										   else
										   { %> not certified <% } %></span>
								</p>
							</div>
						</div>
					</div>
                    <% if (!SESSIONCHECKOK){ %>
					<div class="manage-goods-child" id="checkPhoneDiv" style="display:none;">
						<div>
							<div class="attestation">
								<script type="text/javascript">
								    $(function () {
								        $(".change-type-btn").click(function () {
								            $(this).parents(".validDiv").hide().siblings().show();
								        });
								    });
</script>
                                <% if (CurrentUser.phoneValidated == 1)
                                   { %>
<div class="validDiv">
<form id="validBindPhoneForm">
	<p>
		<span class="span1">
			Bind your phone：
		</span>
		<span class="span2" style="font-weight:bold; width:130px; color:#666666;">
			<%= UserViewPhone %></span>
		<span class="span2" style=" font-size:14px; width:auto; color:#E58C15;font-weight: bold;">
			（f you want to modify, you must first verify the phone has been tied
				 <% if (CurrentUser.emailValidated == 1)
				    {
				 %>
				&nbsp;&nbsp;or&nbsp;&nbsp;<a class="change-type-btn" href="javascript:void(0);" style="font-weight: normal;text-decoration: underline;">Verify the mailbox</a>
					<% } %>
			）
		</span>
		<span id="oldPhoneValidMsg" class="span3 changeBindPhone">
		</span>
	</p>
	<p>
		<span class="span1">
			Verification Code：
		</span>
		<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
			<input id="validPhoneImgCode" name="validPhoneImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
		</span>
		<img id="step1Cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title=" Click to replace the other。" />
		<span class="span3">
		</span>
	</p>
	<p>
		<span class="span1">
			Phone verification code：
		</span>
		<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
			<input id="validPhoneCode" name="validPhoneCode" type="text" class="yxkeleyi" placeholder="Please enter phone verification code" style="width:100%;height:33px;text-align:center;" disabled="disabled">
		</span>
		<input type="button" id="validPhoneCodeSend" class="confirm-btn" value="get verification code">
		<span class="span3">
		</span>
	</p>
	<p>
		<span class="span1">
		</span>
		<span class="span2" style="width:210px; color:#666666;">
			<input type="button" id="validBindPhoneBtn" class="confirm-btn-disabled" value="Verify your phone" disabled="disabled">
		</span>
	</p>
</form>
</div>
                                <% } %>
<% if (CurrentUser.emailValidated == 1  ){ %>
<div class="validDiv" <%=validBindEmailFormShow%>>
	<form id="validBindEmailForm">
	<div>
		<p>
			<span class="span1">
				Bind the mailbox：
			</span>
			<span class="span2" style="font-weight:bold; width:auto; color:#666666;">
				<%= UserViewEmail %></span>
			<span class="span2" style="font-size:14px; width:auto; color:#E58C15;font-weight: bold;">
				（If you need to modify, you must first verify the mailbox has been tied
					
                    <%if (CurrentUser.phoneValidated == 1)
                        {
                        %>
					&nbsp;&nbsp;或&nbsp;&nbsp;<a class="change-type-btn" href="javascript:void(0);" style="font-weight: normal;text-decoration: underline;">Verify your phone</a>
                <% } %>
					）
			</span>
		</p>
		<p>
			<span class="span1">
				Verification Code：
			</span>
			<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
				<input id="validEmailImgCode" name="validEmailImgCode" type="text" class="yxkeleyi" placeholder="Please enter phone verification code" style="width:100%;height:33px;text-align:center;">
			</span>
			<img id="emailStep1Img" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title="Click to replace the other。" />
			<span class="span3">
			</span>
		</p>
		<p>
			<span class="span1">
				E-mail verification code：
			</span>
			<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px;">
				<input id="validEmailCode" name="validEmailCode" type="text" value="" class="yxkeleyi" style="width:100%; height:33px;text-align:center;" disabled="true" placeholder="Please enter your verification code">
			</span>
			<input type="button" id="validEmailCodeSend" class="confirm-btn" value="get verification code">
			<span id="oldEmailMsg" class="span3">
			</span>
		</p>
		<p>
			<span class="span1">
			</span>
			<span class="span2" style="width:600px; color:#666666;">
				<input type="button" id="validBindEmailBtn" class="confirm-btn-disabled" value="Verify the mailbox" disabled="disabled">
			</span>
		</p>
		</div>
</form>
</div>
                                <% } %>
</div>
						</div>
					</div>
                    <% } %>
					<div class="manage-goods-child bind-content">
						<div class="manage-goods-child-one">
							<div class="attestation">
								<p><span class="span1"><% if (UserClass == 0){ %>actual name<% }else{ %>Company Name<% } %>：</span><span class="span2" style="font-weight:bold; width:500px; color:#666666;"><%= CurrentUser.personName %></span></p>
								<p><span class="span1"><% if (UserClass == 0){ %>ID card<% }else{ %>License number<% } %>：</span><span class="span2" style="font-weight:bold; width:500px; color:#666666;"><%= UserViewIdCard %></span></p>
								<!-- 是否可以更改 -->
								<p>
										<span class="span1"></span>
										<span class="span2" style="font-weight:bold; width:120px; color:#666666;">
										<% if (CurrentUser.procstatus == 2)
										   { %>signed<% }
                                           else if (CurrentUser.procstatus == 1)
										   { %>
<span style="width:200px; height:35px; background-color:#AFADAB; float:left;  text-align:center; color:#ffffff; font-size:14px; font-weight:500; border-radius:4px;">Agreement is under review</span>   										    <% } else{%>
											<a href="/international/security/securitycenter/protocol.aspx" style="width:100px; height:35px; background-color:#e58c15; float:left;  text-align:center; color:#ffffff; font-size:14px; font-weight:500; border-radius:4px;">Sign agreement</a>
 <% } %>

										</span>
									</p>
								</div>
							<div class="certificate-right">
							</div>
						</div>
						
							    <% if (CurrentUser.phoneValidated == 1)
							       { %>
                        
                        <div class="manage-goods-child-one" style="display:none;">
							<div class="attestation">
								<form id="changePhoneForm">
								<div id="changephonestep1">
									<p>
										<span class="span1">
											Bind your phone：
										</span>
										<span class="span2" style="font-weight:bold; width:130px; color:#666666;">
											<%= UserViewPhone %></span>
										<span class="span2" style=" font-size:14px; width:auto; color:#E58C15;font-weight: bold;">
											（If you want to modify, you must first verify the phone has been tied）
										</span>
										<span id="oldPhoneValidMsg" class="span3 changeBindPhone">
										</span>
									</p>
									<p>
										<span class="span1">
											Verification Code：
										</span>
										<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
											<input id="phoneStep1ImgCode" name="phoneStep1ImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
										</span>
										<img id="step1Cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title="看不清？点击更换另一个。" />
										<span id="phoneStep1ImgCodeMsg" class="span3">
										</span>
									</p>
									<p>
										<span class="span1">
											Phone verification code：
										</span>
										<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
											<input id="oldPhoneValidCode" name="oldPhoneValidCode" type="text" class="yxkeleyi" placeholder="Please enter phone verification code" style="width:100%;height:33px;text-align:center;" disabled="disabled">
										</span>
										<input type="button" id="oldPhoneSend" class="confirm-btn" value="get verification code">
										<span id="oldPhoneValidCodeMsg" class="span3">
										</span>
									</p>
									<p>
										<span class="span1">
										</span>
										<span class="span2" style="width:210px; color:#666666;">
											<input type="button" id="changePhoneStep1Btn" class="confirm-btn-disabled" value="Verify your phone" disabled="disabled">
										</span>
									</p>
								</div>
								<div id="changephonestep2" style="display: none;">
									<p>
										<span class="span1">
											Bind your phone：
										</span>
										<span class="span2" style="font-weight:bold; width:130px; color:#666666;">
											<%= UserViewPhone %></span>
										<span id="oldPhoneValidMsg" class="span3 changeBindPhone">
										</span>
									</p>
									<p>
										<span class="span1">
											New mobile phone number：
										</span>
										<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
											<input id="changePhone" name="changePhone" type="text" class="yxkeleyi" placeholder="Please enter your new phone number" style="width:100%; height:33px;text-align:center;" />
										</span>
										<span id="changePhoneValidMsg" class="span3">
										</span>
									</p>
									<p>
										<span class="span1">
											Verification Code：
										</span>
										<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
											<input id="phoneStep2ImgCode" name="phoneStep2ImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
										</span>
										<img id="phoneStep2Cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title="看不清？点击更换另一个。" />
										<span id="phoneStep2ImgCodeMsg" class="span3">
										</span>
									</p>
									<p>
										<span class="span1">
											Phone verification code：
										</span>
										<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
											<input id="changePhoneValidCode" name="changePhoneValidCode" type="text" class="yxkeleyi" placeholder="Please enter phone verification code" style="width:100%;height:33px;text-align:center;" disabled="disabled">
										</span>
										<input type="button"  id="changePhoneSend" class="confirm-btn" value="get verification code">
										<span id="changePhoneValidCodeMsg" class="span3">
										</span>
									</p>
									<p>
										<span class="span1">
										</span>
										<span class="span2" style="width:210px; color:#666666;">
											<input type="button"  id="changePhoneSubmitBtn" class="confirm-btn-disabled" value="Confirm the changes" disabled="disabled">
										</span>
									</p>
								</div>
								</form>
                                
							</div>
						</div>
                                <% }else { %>
                         <div class="manage-goods-child-one mustValidPhone" style="display:none;">
							<div class="attestation">
							    <% if (SESSIONCHECKOK){ %>
                                <form id="newPhoneForm">
								<p>
									<span class="span1">
										cellphone number：
									</span>
									<span class="span2" style="font-weight:bold; width:255px; color:#666666;">
										<input id="newPhone" name="newPhone" type="text" class="yxkeleyi" placeholder="please enter your phone number" style="width:100%; height:33px;text-align:center;"/>
									</span>
									<span id="newPhoneValidMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										Verification Code：
									</span>
									<span class="span2" style="font-weight:bold; width:255px; color:#666666;margin-right:10px">
										<input id="newPhoneImgCode" name="newPhoneImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
									</span>
									<img id="cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title="看不清？点击更换另一个。" />
									<span id="newPhoneImgCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										Phone verification code：
									</span>
									<span class="span2" style="font-weight:bold; width:255px; color:#666666;margin-right:10px">
										<input id="newPhoneValidCode" name="newPhoneValidCode" type="text" class="yxkeleyi" placeholder="Please enter phone verification code" style="width:100%;height:33px;text-align:center;" disabled="disabled">
									</span>
									<input type="button"  id="newPhoneSend" class="confirm-btn" value="get verification code">
									<span id="newPhoneValidCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:600px; color:#666666;">
										<input type="button" id="bindNewPhoneBtn" class="confirm-btn-disabled" value="Bind your new phone" disabled="disabled">
									</span>
								</p>
								</form>

                                <% } %>
							</div>
						</div>
                        <% } %>

                        

						
							    <% if (CurrentUser.emailValidated == 1)
							       { %>
                        
                        <div class="manage-goods-child-one" style="display:none;">
							<div class="attestation">
							    
								<form id="changeEmailForm">
								<div id="changeemailstep1">
								<p>
									<span class="span1">
										Bind the mailbox：
									</span>
									<span class="span2" style="font-weight:bold; width:auto; color:#666666;">
										<%= UserViewEmail %></span>
									<span class="span2" style="font-size:14px; width:auto; color:#E58C15;font-weight: bold;">
										（If you need to modify, you must first verify the mailbox has been tied）
									</span>
								</p>
								<p>
									<span class="span1">
										Verification Code：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
										<input id="emailStep1ImgCode" name="emailStep1ImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
									</span>
									<img id="emailStep1Img" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title=" Click to replace the other." />
									<span id="emailStep1ImgCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										E-mail verification code：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
										<input id="oldEmailCode" name="oldEmailCode" type="text" value="" class="yxkeleyi" style="width:100%; height:33px;text-align:center;" disabled="true" placeholder="Please enter your email verification code">
									</span>
									<input type="button" id="oldEmailCodeSend" class="confirm-btn" value="get verification code">
									<span id="oldEmailMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:600px; color:#666666;">
										<input type="button" id="bindNewEmailBtn" class="confirm-btn-disabled" value="Verify the mailbox" disabled="disabled">
									</span>
								</p>
								</div>
								<div id="changeemailstep2" style="display:none;">
								<p>
									<span class="span1">
										Bind the mailbox：
									</span>
									<span class="span2" style="font-weight:bold; width:130px; color:#666666;">
										<%= UserViewEmail %></span>
								</p>
								<p>
									<span class="span1">
										Bind the new mailbox：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;">
										<input id="newemail" name="newemail" type="text" class="yxkeleyi" style="width:100%; height:33px;text-align:center;" placeholder="Please enter a new mailbox to bind to">
									</span>
									<span id="newEmailMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										Verification Code：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
										<input id="emailStep2ImgCode" name="emailStep2ImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
									</span>
									<img id="emailStep2Img" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title="Click to replace the other." />
									<span id="emailStep2ImgCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										E-mail verification code：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
										<input id="newEmailCode" name="newEmailCode" type="text" value="" class="yxkeleyi" style="width:100%; height:33px;text-align:center;" placeholder="Please enter your email address" disabled="disabled">
									</span>
									<input type="button" class="confirm-btn" id="newEmailCodeSend" value="get verification code">
									<span id="newEmailCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:210px; color:#666666;">
										<input type="button" id="confirmBindEmailBtn" class="confirm-btn-disabled" disabled="disabled" value="Confirm the binding">
									</span>
								</p>
								</div>
								</form>
                                </div>
						</div>	
                                <% }
							       else
							       {%>
                        
                        <div class="manage-goods-child-one mustValidPhone" style="display:none;">
							<div class="attestation">
							    <% if (SESSIONCHECKOK)
							       { %>
                                
                                <form id="newEmailForm">
								<p>
									<span class="span1">
										E-mail：
									</span>
									<span class="span2" style="font-weight:bold; width:210px; color:#666666;">
										<input id="addEmail" name="addEmail" type="text" class="yxkeleyi" style="width:205px; height:33px;text-align:center;" placeholder="Please enter the mailbox to bind to">
									</span>
									<span id="addEmailCodeSendMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										Verification Code：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
										<input id="addEmailImgCode" name="addEmailImgCode" type="text" class="yxkeleyi" placeholder="please enter verification code" style="width:100%;height:33px;text-align:center;">
									</span>
									<img id="addEmailImg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-right:8px;width:90px; height:35px; float: left; line-height:35px; text-align:center;cursor: pointer;" title="Click to replace the other" />
									<span id="addEmailImgCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										E-mail verification code：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;margin-right:10px">
										<input id="addEmailCode" type="text" value="" class="yxkeleyi" style="width:100%; height:33px;text-align:center;" disabled="disabled" placeholder="Please enter your email address">
									</span>
									<input type="button" class="confirm-btn" id="addEmailSend" value="get verification code">
									<span id="addEmailCodeMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:210px; color:#666666;">
										<input type="button" id="bindEmailBtn" class="confirm-btn-disabled" value="Confirm the binding" disabled="disabled">
									</span>
								</p>
								</form>

                                <% } %>
								</div>
						</div>

                        
                        <% }%>
								
						<div class="manage-goods-child-one mustValidPhone" style="display:none;">
							<div class="attestation">
                                <% if (SESSIONCHECKOK)
                                   {%>
								<form id="changePswQuestionForm">
								<p>
									<span class="span1">
										The original secret security issues：
									</span>
									<span class="span2" style="font-weight:bold; width:210px; color:#666666;">
										<%=CurrentUser.question %></span>
									<span id="oldQuestionMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										The original secret security answer：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;">
										<input id="oldPswAnswer2" name="oldPswAnswer" type="text" class="yxkeleyi" placeholder="Please enter secret answer" style="width:100%; height:33px;text-align:center;"/>
									</span>
									<span id="oldPswAnswerMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										New secret security issues：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;">
										<select id="newPswQuestion" name="newPswQuestion">
											<option value="">--Please select the security issue--</option>
											<option>What is your spouse's birthday ?</option>
											<option>What is your most familiar name?</option>
											<option>Who is your  most familiar students?</option>
											<option>What is your most respected person's name?</option>
											<option>When is your mother's birthday?</option>
											<option>When is your father's birthday?</option>
											<option>When is your grandmother's birthday?</option>
											<option>When is your grandfather's birthday?</option>
											<option>What is your high school name?</option>
											<option>What is your middle school name?</option>
										</select>
									</span>
									<span id="newPswQuestionMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										New secret security answer：
									</span>
									<span class="span2" style="font-weight:bold; width:280px; color:#666666;">
										<input id="newPswAnswer" name="newPswAnswer" type="text" class="yxkeleyi" placeholder="Please enter secret answer" style="width:100%; height:33px;text-align:center;">
									</span>
									<span id="newPswAnswerMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:210px; color:#666666;">
										<input type="button" id="changePswQuestionBtn" href="#" class="confirm-btn" value="Set the new security">
									</span>
								</p>
								</form>
                                <%} %>
								</div>
						</div>						
						<div class="manage-goods-child-one mustValidPhone" style="display:none">
							<div class="attestation"> 
                                <% if (SESSIONCHECKOK)
                                   {%>
								<form id="changeTradePwdForm" name="changeTradePwdForm">
								<p>
									<span class="span1">
										old password：
									</span>
									<span class="span2" style="font-weight:bold; width:340px; color:#666666;">
										<input id="oldPassword" name="oldPassword" type="password" class="yxkeleyi" autocomplete="off" style="width:100%; height:33px;text-align:center;" placeholder="Please enter the original transaction password" >
									</span>
									<span id="oldPasswordMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										new password：
									</span>
									<span class="span2" style="font-weight:bold; width:340px; color:#666666;">
										<input id="newPassword" name="newPassword" type="password" class="yxkeleyi" value="" autocomplete="off" style="width:100%; height:33px;text-align:center;" placeholder="Please enter the latest transaction password" >
									</span>
									<span id="newPasswordMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
										confirm password：
									</span>
									<span class="span2" style="font-weight:bold; width:340px; color:#666666;">
										<input id="confirmNewPassword" name="confirmNewPassword" type="password" class="yxkeleyi" value="" autocomplete="off" style="width:100%; height:33px;text-align:center;" placeholder="Please enter the latest transaction password again" >
									</span>
									<span id="confirmNewPasswordMsg" class="span3">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:210px; color:#666666;">
										<a id="tradePwdChangeBtn" href="#" class="confirm-btn">
											Make the changes
										</a>
									</span>
								</p>
								</form>
                                 <%} %>
								</div>

						</div>
						<div class="manage-goods-child-one mustValidPhone" style="display:none">
							<div id="loginScope" class="attestation">
                                <% if (SESSIONCHECKOK)
                                   {%>
								<form id="changeLoginPwdForm" name="changeLoginPwdForm">
								<p>
									<span class="span1">
										old password：
									</span>
									<span class="span2" style="font-weight:bold; width:290px; color:#666666;">
										<input id="oldLoginPwd" name="oldLoginPwd" type="password" class="yxkeleyi" autocomplete="off" style="width:100%; height:33px;text-align:center;" placeholder="Please enter the original login password" >
									</span>
									<span id="oldLoginPwdMsg" class="span3" style=" font-size:14px;  color:red;">
									</span>
								</p>
								<p>
									<span class="span1">
										new password：
									</span>
									<span class="span2" style="font-weight:bold; width:290px; color:#666666;">
										<input id="newLoginPwd" name="newLoginPwd" type="password" class="yxkeleyi" value="" autocomplete="off" style="width:100%; height:33px;text-align:center;" placeholder="Please enter a new login password" >
									</span>
									<span id="newLoginPwdMsg" class="span3" style=" font-size:14px;  color:red;">
									</span>
								</p>
								<p>
									<span class="span1">
										confirm password：
									</span>
									<span class="span2" style="font-weight:bold; width:290px; color:#666666;">
										<input id="newConfirmLoginPwd" name="newConfirmLoginPwd" type="password" class="yxkeleyi" value="" autocomplete="off" style="width:100%; height:33px;text-align:center;" placeholder="Please enter a new login password again" >
									</span>
									<span id="newConfirmLoginPwdMsg" class="span3" style="font-size:14px;  color:red;">
									</span>
								</p>
								<p>
									<span class="span1">
									</span>
									<span class="span2" style="width:210px; color:#666666;">
										<a id="loginPswChangeBtn" href="#" class="confirm-btn">
											Make the changes
										</a>
									</span>
								</p>
								</form>
                                 <%} %>
								</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript" src="/Scripts/custom/jianrong.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/validate.js?t=1"></script>
<script type="text/javascript" src="/international/Scripts/js/securityCenter.js?t=1124"></script></body>
<script type="text/javascript">
    var context_path = '';
    var MODEL_TABINDEX = '<%=MODEL_TABINDEX_VALUE%>';
    var isBindedPhone = '<%=isBindedPhone%>';
    var isBindedEmail = '<%=isBindedEmail%>';
    var SESSION_PHONECHECK = '<%=SESSION_PHONECHECK%>';
    var SESSION_EMAILCHECK = '<%=SESSION_EMAILCHECK%>';

    $(function () {
        $(".manage-goods-total-head > span").click(function () {
            $("#bind-title").text($(this).text());
            $(this).addClass("goods-activespan").siblings().removeClass("goods-activespan");

            var suoyin = $(this).index();
            $(".manage-goods-child-state p").hide().eq(suoyin).show();
            var $selectDiv = $(".bind-content > div").eq(suoyin);
            $selectDiv.show().siblings().hide();

            // 如果已经没有验证过手机，则显示验证手机模块
            if ($selectDiv.hasClass("mustValidPhone")) {
                $("#checkPhoneDiv").show();
            } else {
                $("#checkPhoneDiv").hide();
            }
        });
        if (MODEL_TABINDEX) {
            $(".manage-goods-total-head").find("span:eq(" + MODEL_TABINDEX + ")").click();
        }
        $(".phonelink").click(function () {
            $("#phonetab").click();
        });
    });

    function refreshcaptchacode(obj) {
        $(obj).attr("src", context_path + "/captchacode.ashx?date=" + new Date());
    }
</script>
</html>