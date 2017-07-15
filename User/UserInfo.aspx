<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="API.WebUI201509.User.Userinfo" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home|Kdpay</title>
    <link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/common.css?t=1" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<style>
	.yiwanka-con-right3-con-r .right3-p1 b{
		width: 90px;
	}
	.yindao-con-bottom1 .p4{
		width: 400px;
	}
	.yindao-con-bottom1 .p1 .span1{
		font-size: 13px;
		width: 140px;
	}
	.yindao-con-bottom1 .p1{
		width: 400px;
	}
	.yindao-con-top span{
		width: 126px;
		font-size: 12px;
	}
	.yindao-con-top .yindaospan{
		width: 126px;
		font-size: 12px;
	}
	.yindao-con-bottom6 .p1.checked{
		width: 300px;
	}
	.yindao-con-bottom6 .p1 .span2{
		width: 172px;
	}
	.yindao-con-bottom1 .p2{
		width: 400px;
	}
	.yindao-con-bottom6 .p1.unchecked{
		width: 300px;
	}
	.yindao-desc{
		background: url(/international/img/yindao.png) no-repeat;
	}
	.yindao-con-bottom1 .p2 .span1{
		width:80px;
	}
	.yindao-con-bottom1 .p2 .span2{
		width:270px;
	}
</style>
<body>
    <div class="yiwanka">
        <!-- 头部 -->
        <uc1:Header runat="server" id="Header1"/>
        <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="index" />

        <!-- 账户信息 -->
        <div class="yiwanka-con-right">
            <div class="yiwanka-con-right-content">
                <div class="yiwanka-con-right1">
                    <p class="p1">Account funds dynamics</p>
                </div>
                <div class="yiwanka-con-right2">
                    <ul>
                        <li style="margin-left: 2px"><a href="javascript:void(0)"><span class="span1" style="background-color: #8197a7;"><b id="baseinfo_usertotalbalance" class="b1"><%= usertotalbalance %></b><b class="b2">yuan</b></span><span class="span2" style="color: #8197a7">General Ledger</span></a></li>
                        <li><a href="javascript:void(0)"><span class="span1" style="background-color: #8197a7;"><b id="baseinfo_userbalance" class="b1"><%= userbalance %></b><b class="b2">yuan</b></span><span class="span2" style="color: #8197a7">Available Balance</span></a></li>
                        <li><a href="javascript:void(0)"><span class="span1" style="background-color: #7ca47a;"><b id="detention" class="b1"><%=detention%></b><b class="b2">yuan</b></span><span class="span2" style="color: #7ca47a;">Amount to be liquidated</span></a></li>
                        <li><a href="javascript:void(0)"><span class="span1" style="background-color: #a99b71;"><b id="todaysuccedmoney" class="b1"><%=todaysuccedmoney%></b><b class="b2">yuan</b></span><span class="span2" style="color: #a99b71;">Turnover today</span></a></li>
                        <li style="display: none"><a href="javascript:void(0)"><span class="span1" style="background-color: #7ca47a;"><b id="jifenbalance" class="b1"><%=integral%></b><b class="b2">分</b></span><span class="span2" style="color: #7ca47a;">Account points</span></a></li>
                        <li ><a href="javascript:void(0)"><span class="span1" style="background-color: #b18784;"><b id="freezebalance" class="b1"><%=freezebalance%></b><b class="b2">yuan</b></span><span class="span2" style="color: #b18784;">Frozen amount</span></a></li>
                    </ul>
                </div>
                <div class="yiwanka-con-right3">
                    <div class="yiwanka-con-right3-title">Account basic information</div>
                    <div class="yiwanka-con-right3-con">
                        <div class="yiwanka-con-right3-con-l">
                            <img src="/content/themes/style/images/<% if (UserClass == 0){ %>rentou<% }else{ %>rentou-b<% } %>.jpg">
                        </div>
                        <div class="yiwanka-con-right3-con-r">
                            <p class="right3-p1" style="margin-top: 10px;">
                                <b>User ID:</b><span><%= CurrentUser.userId %></span>
                            </p>
                            <p class="right3-p1">
                                <b>Username:</b><span><%= CurrentUser.username %></span>
                            </p>
                            <p class="right3-p1">
                                <b>Information:</b>
                                <span style="width: 180px;">
                                    <span id="percent-scope" class="percent-scope">
                                        <span id="percent" class="percent"></span>
                                    </span>
                                    <span id="percent-text" style="font-weight: bold; margin-left: 5px; color: #FF001D"></span>
                                </span>
                            </p>
                            <p class="right3-p1">
                                <b>Verification：</b>
                                <a href="/international/security/securitycenter/index.aspx?tabindex=0">
                                    <% if (CurrentUser.realnameValidated == 1){ %> 
                                    <b class="b1"><img src="/content/themes/style/images/authbind.jpg"></b>
                                    <b class="b2" style="color: #68763e">Verified</b>
                                    <% }else { %>
                                    <b class="b1"><img src="/content/themes/style/images/authnobind.jpg"></b>
                                    <b class="b2" style="color: #999999">Not real-name</b><% } %>
                                </a>
                                 <a href="/international/security/securitycenter/protocol.aspx">
                                    <% if (CurrentUser.procstatus == 2){ %> 
                                    <b class="b1"><img src="/content/themes/style/images/authbind.jpg"></b>
                                    <b class="b2" style="color: #68763e">signed</b>
                                    <% }else { %>
                                    <b class="b1"><img src="/content/themes/style/images/authnobind.jpg"></b>
                                    <b class="b2" style="color: #999999">not signed</b><% } %>
                                </a>
                                <a href="/international/security/securitycenter/index.aspx?tabindex=2">
                                    <% if (CurrentUser.emailValidated == 1){ %> 
                                    <b class="b1"><img src="/content/themes/style/images/mailbind.jpg"></b>
                                    <b class="b2" style="color: #68763e">authenticated</b>
                                    <% } else{ %>
                                    <b class="b1"><img src="/content/themes/style/images/mailnobind.jpg"></b>
                                    <b class="b2" style="color: #999999">not authenticated</b><% } %>
                                </a>
                                <a href="/international/security/securitycenter/index.aspx?tabindex=1">
                                     <% if (CurrentUser.phoneValidated == 1){ %> 
                                    <b class="b1"><img src="/content/themes/style/images/phonebind.jpg"></b>
                                    <b class="b2" style="color: #68763e">authenticated</b>
                                    <% } else{ %>
                                    <b class="b1"><img src="/content/themes/style/images/phonenobind.jpg"></b>
                                    <b class="b2" style="color: #999999">not authenticated</b><% } %>
                                </a>
                                <a href="/international/security/securitycenter/index.aspx?tabindex=3">
                                    <% if (CurrentUser.securityissue == 1){ %> 
                                    <b class="b1"><img src="/content/themes/style/images/mibaobind.jpg"></b>
                                    <b class="b2" style="color: #68763e">signed</b>
                                    <% } else{ %>
                                    <b class="b1"><img src="/content/themes/style/images/mibaonobind.jpg"></b>
                                    <b class="b2" style="color: #999999">not signed</b><% } %>
                                </a>
                                <a href="/international/finance/applycash.aspx">
                                    <% if (CurrentUser.bindsettleaccout > 0){ %> 
                                    <b class="b1"><img src="/content/themes/style/images/cardbind.jpg"></b>
                                    <b class="b2" style="color: #68763e">Account withdrawals bound</b>
                                    <% } else{ %>
                                    <b class="b1"><img src="/content/themes/style/images/cardnobind.jpg"></b>
                                    <b class="b2" style="color: #999999">Unpaid account</b><% } %>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="yiwanka-con-right4">
                    <div class="yiwanka-con-right4-l">
                        <h3>Fast selling cards</h3>
                        <div id="card_list_div">
                            <ul class="ul1 ul1-hidden">
                                <asp:Repeater ID="rptcardlist" runat="server">
                                    <ItemTemplate> <li><a href="/international/recycle/recycleIndex.aspx" style="">
                                    <p class="p1"><img src="/content/themes/style/images/img_<%#Eval("cardid") %>.jpg"></p>
                                    <p class="p2"><%#Eval("cardname") %></p>
                                    <p class="p3">Status：<span><%#Eval("state").ToString()=="1"?"normal":"maintain" %></span></p>
                                    <p class="p4">Ratio：<span><%#Eval("rate","{0:p2}") %></span></p>
                                    <p></p>
                                </a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <li></li>
                            </ul>
                        </div>
                        <div class="gonggao-anniu">
                            <a href="javascript:void(0)">see more</a>
                        </div>
                    </div>
                    <div class="yiwanka-con-right4-r">
                        <div class="title">
                            <span class="h3">Latest Announcement</span>
                            <a style="float: right;" href="/user/listnotice.aspx" target="_blank">more&gt;&gt;</a>
                        </div>
                        <div class="gonggao-ul">
                            <ul id="noticeul" class="gonggao-ul1-hidden">
                                     <asp:Repeater ID="rptnews" runat="server">
                                         <ItemTemplate>
                                   <li><span style="float: left;">·</span><a href="/user/noticedetail.aspx?id=<%#Eval("id")%>" target="_blank" class="a1"><%#Eval("title")%></a><a href="/user/noticedetail.aspx?id=<%#Eval("id")%>" target="_blank" class="a2"><%#Eval("newsdate","{0:yyyy-MM-dd}")%></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>         </ul>
                            <div class="right3-anniu">
                                <a href="javascript:void(0)">see more</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
         <% if (CurrentUser.bindstatusisok == false) { %>
        <div class="zhezhao"></div>
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
        <div class="yindao"><div class="yindao-desc"></div>
		<div class="yindao-con">
			<div class="yindao-con-top">
				<span id="0">Identity Information</span>
				<span id="1">transaction password</span>
				<span id="2">Security Question</span>
                <% if (CurrentUser.regtype == 1)
                   { %>
				  <span id="3">Set mailbox</span>
                <% } %>
                <%
                   else
                   { %>
                   <span id="4">Set phone</span>
                <% } %>
				<span id="5">Configure the bank card</span>
				</div>
			<div class="yindao-con-bottom">
				<div class="yindao-con-bottom1" style="z-index:6;">
				<form id="idnoForm" action="/user/bind/bindIdNo.ashx">
					<input type="hidden" id="tradepswoptype" name="optype" value="1010">
                    <input type="hidden" id="val_userclass"  name="userclass" value="<%=UserClass %>">
					<p class="p1" style="margin-top:35px;">
						<span class="span1"><% if (!IsBusiness){ %>actual name<% } %><%else{ %>Company Name<% } %>:</span><span class="span2">
							<input id="realname" name="realname" type="text">
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2">
						<span class="span1"></span>
						<span class="span2"></span>
						<span class="span3"></span>
					</p>
					<p class="p1" style="margin-top:0px;">
						<span class="span1"><% if (!IsBusiness){ %>ID number<% } %><%else{ %>Business License No<% } %>:</span>
						<span class="span2">
							<input id="idno" name="idno" type="text">
						</span>
						<span class="span3">
						</span>
					</p>
					<p class="p2">
						<span class="span1"></span>
						<span class="span2"></span>
						<span class="span3"></span>
					</p>	
					<p class="p3"><img src="/content/themes/style/images/youqing.jpg">friendly reminder</p>
					<p class="p4">
						<% if (!IsBusiness){ %><span>1.Name and ID number is very important, please set carefully</span><br>
						<span>2.After the binding is successful, the name is the bank account name</span><br>
						<span>3.ID number is the account back to the important condition, please bear in mind</span>
                        <% } %><%else{ %><span>1.Business name and business license number is very important, please set carefully</span><br>
						<span>2.Binding is successful, the enterprise name is the name of the bank account</span><br>
						<span>3.Business license number is an important condition for account recovery, please bear in mind</span><% } %>
					</p>
					<p class="p5">
						<a id="idno-submit-btn" href="#" class="yindao-next">next step</a>
					</p>
				</form>
				</div>
				<div  class="yindao-con-bottom1 yindao-con-bottom2" style="z-index:5;">
				<form id="tradepswForm" action="/user/bind/bindTradepsw.ashx">
					<input type="hidden" id="tradepswoptype" name="optype" value="1090">
					<input id="tradepsw" name="tradepsw" type="hidden">
					<input id="tradepswagain" name="tradepswagain" type="hidden">
					<p class="p1" style="margin-top:35px;">
						<span class="span1">transaction password:</span>
						<span class="span2"><input id="showtradepsw" name="showtradepsw" type="password" autocomplete="off"></span>
						<span class="span3"></span>
					</p>
					<p class="p2">
						<span class="span1"></span>
						<span class="span2"></span>
						<span class="span3"></span>
					</p>
					<p class="p1" style="margin-top:0px;">
						<span class="span1">confirm password:</span>
						<span class="span2"><input id="showtradepswagain" name="showtradepswagain" type="password" autocomplete="off"></span>
						<span class="span3"></span>
					</p>
					<p class="p2">
						<span class="span1"></span>
						<span class="span2"></span>
						<span class="span3"></span>
					</p>	
					<p class="p3"><img src="/content/themes/style/images/youqing.jpg">friendly reminder</p>
					<p class="p4">
						<span>1.The transaction password is the cash withdrawal verification password</span><br>
						<span>2.The transaction password can not be the same as the login password</span>
					</p>
					<p class="p5"><a href="#" class="yindao-next">next step</a></p>
				</form>
				</div>
				<div  class="yindao-con-bottom1 yindao-con-bottom4" style="z-index:4;">
				<form id="questionpswForm" action="/user/bind/bindPswQuestion.ashx">
					<input type="hidden" id="questionoptype" name="optype" value="1040">
					<p class="p1" style="margin-top:35px;">
						<span class="span1">Security Question:</span>
						<span class="span2">
							<select id="pswquestion" name="pswquestion">
								<option value="">--Please select the security issue--</option>
								<option>What is your spouse's birthday?</option>
								<option>What is your closest friend's name?</option>
								<option>Which class are you most familiar with?</option>
								<option>What is your most respected person's name?</option>
								<option>What is your mother's birthday?</option>
								<option>What is your father's birthday?</option>
								<option>What is your grandmother's birthday?</option>
								<option>Your grandfather 's birthday is?</option>
								<option>Your high school name is?</option>
								<option>Your junior high school is?</option>
							</select>
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>
					<p class="p1" style="margin-top:0px;">
						<span class="span1">Answer:</span>
						<span class="span2"><input id="pswanswer" name="pswanswer" type="text" ></span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>	
					<p class="p3"><img src="/content/themes/style/images/youqing.jpg">friendly reminder</p>
					<p class="p4">
						<span>1.Secret security is very important, please set carefully, and keep in mind</span><br>
						<span>2.Secret security answer is an important condition for account recovery</span>
					</p>
					<p class="p5"><a href="#" class="yindao-next">next step</a></p>
				</form>
				</div>
                
                <% if (CurrentUser.regtype == 1)
                   { %>
                <div  class="yindao-con-bottom1 yindao-con-bottom3"   style="z-index:3;">
				<form id="emailForm" action="/user/bind/bindEmail.ashx">
					<input type="hidden" id="emailoptype" name="optype" value="1060">
					<p class="p1" style="margin-top:35px;">
						<span class="span1">E-mail:</span>
						<span class="span2">
							<input id="email" name="email" type="text" >
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2">
						<span class="span1"></span>
						<span class="span2"></span>
						<span class="span3"></span>
					</p>
					<p class="p1" style="margin-top:0px;">
						<span class="span1">Verification Code:</span>
						<span class="span2">
							<input id="emailimgcode" name="imgverifycode" type="text" style="width:110px;" >
							<img id="cimg" src="/captchacode.ashx" onClick="refreshcaptchacode()" style="width:80px; height:40px; float: right; line-height:40px; text-align:center;" title="change" />
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>	
					<p class="p1" style="margin-top:0px;">
						<span class="span1">E-mail verification code:</span>
						<span class="span2">
							<input id="emailverifycode" name="emailverifycode" type="text" style="width:110px;" >
							<input type="button" id="sendemailverifycode" style="width:80px; height:40px; cursor:pointer; text-indent:0px; line-height:40px; text-align:center; background-color:#f39800; color:#ffffff; float:right;" value="send">
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>
					<p class="p3"><img src="/content/themes/style/images/youqing.jpg">friendly reminder</p>
					<p class="p4">
						<span>1.This step is optional. If not, skip this step</span><br>
						<span>2.Strongly recommended to bind the mailbox, can greatly enhance account security</span>
					</p>
					<p class="p5">
						<a href="#" class="skip">skip</a>
						<a href="#" class="yindao-next">next step</a>
					</p>
				</form>
				</div>
                 <% } %>
                <%
                   else
                   { %>
				<div  class="yindao-con-bottom1 yindao-con-bottom3" style="z-index:2;">
				<form id="phoneForm" action="/user/bind/bindPhone.ashx">
					<input type="hidden" id="phoneoptype" name="optype" value="1020">
					<p class="p1" style="margin-top:35px;">
						<span class="span1">cellphone number:</span>
						<span class="span2"><input id="phone" name="phone" type="text" ></span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>
					<p class="p1" style="margin-top:0px;">
						<span class="span1">Verification Code:</span>
						<span class="span2">
							<input id="phoneimgcode" name="imgverifycode" type="text" style="width:110px;" >
							<img id="cimg" src="/captchacode.ashx" onClick="refreshcaptchacode()" style="width:80px; height:40px; float: right; line-height:40px; text-align:center;" title="change" />
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>
					<p class="p1" style="margin-top:0px;">
						<span class="span1">Phone verification code:</span>
						<span class="span2"><input id="smscode" name="smscode" type="text" style="width:110px;" >
						<input type="button" id="sendsmscode" style="width:80px; height:40px; cursor:pointer; text-indent:0px; line-height:40px; text-align:center; background-color:#f39800; color:#ffffff; float:right;" value="send">
						</span>
						<span class="span3"></span>
					</p>
					<p class="p2"><span class="span1"></span><span class="span2"></span><span class="span3"></span></p>	
					<p class="p3"><img src="/content/themes/style/images/youqing.jpg">friendly reminder</p>
					<p class="p4">
						<span>1.This step is optional. If not, skip this step</span><br>
						<span>2.Strongly recommend binding mobile phone number, can greatly enhance account security</span>
				</p>
					<p class="p5"><a href="#" class="skip">skip</a><a href="#" class="yindao-next">next step</a></p>
				</form>
				</div>
                 <% } %>
				<div id="setbankcard" class="yindao-con-bottom1 yindao-con-bottom6" style="z-index:1;" >
				<form id="fixedbankForm" action="/user/bind/bindFixedBank.aspx" method="post">
					<div class="pp1"  style="margin-top:40px;">
						<p class="p1 checked">
							<span class="span1" style="width:37px;">
								<input type="radio" name="fixedbank" checked="checked" value="2">
							</span>
							<span class="span2" style="text-align: left;">Card can be changed</span>
							<span class="span3"><img src="/content/themes/style/images/qianbi01.gif"></span>
						</p>
					</div>
					<p class="p2" style="margin-left:30px;">
						<span class="span2" style="width:100%;color:#00AE3E;font-weight: bold;"> Tip: You can change or change the bank card in the future.</span>
					</p>
					<div class="pp1">
						<p class="p1 unchecked">
							<span class="span1" style="width:37px;"><input type="radio" name="fixedbank" value="1"></span>
							<span class="span2" style="text-align: left;">Card can not be changed</span>
							<span class="span3"><img src="/content/themes/style/images/qianbi02.gif"></span>
						</p>
					</div>
					<p class="p2" style="margin-left:30px;">
						<span class="span2" style="width:100%;color:#FF3D04;font-weight: bold;display:none;">Tip:Bank cards will no longer be allowed in the future.</span>
					</p>
					<p class="p3"><img src="/content/themes/style/images/youqing.jpg">friendly reminder</p>
					<p class="p4">
						<span>1.If the configuration "can be changed", it represents the future replacement cash card</span><br>
						<span>2.If the configuration "can not be changed", it means that the bank card can not be changed in the future</span><br>
						<span>3.The default setting is "Can be changed", please carefully configure, after selection can not be changed</span>
					</p>
					<p class="p5"><a href="#" id="complete-btn">Complete</a></p>
				</form>
				</div>
				</div>
		</div></div>
        <script type="text/javascript" src="/Scripts/custom/noname.js?v=20160705"></script>
        <script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=4"></script>
        <script type="text/javascript" src="/Scripts/custom/validate.js?t=2"></script>
        <script type="text/javascript" src="/international/Scripts/firstSetUserInfo.js?t=20160701"></script>
        <script type="text/javascript">
    var context_path = '';
    $(function () {
        $(".yindao-con-top").find("span:eq(0)").addClass("yindaospan");
    });

    function refreshcaptchacode() {
        $("#cimg").attr("src", context_path + "/captchacode.ashx?date=" + new Date());
    }
</script> 
        <% } %>
    </div>
    <div class="yiwanka-kefu">
        <img src="/international/img/kefu001.png">
    </div>
    <div class="complain-shade" <%=newscss %>>
	<div class="complain-shade-zhezhao"></div>
	<div class="complain-shade-con complain-shade-con2" style="width:100%; position:absolute; top:0; height: auto;">
		<div class="complain-shade-con-content">
		<h3 id="emailTitle" class="complain-shade-con-title"><%=newstitle %>
		</h3>
		<div id="replyemail" class="fankui-wanka" style="width:auto; height:auto; overflow:auto;">
			<p class="complain-shade-con-desc"></p>
			<p id="replyusername" class="complain-shade-con-user"></p>
			<p id="replycontent" class="complain-shade-con-email"><%=newscontent %></p>
			<p id="replytime" class="complain-shade-con-time"><span style="font-size:12px;"><%=newstime %></span></p>
		</div>
		<p style="margin-top:10px;">
			<a href="#" class="a4" style="background-color:#6f7c94; height:40px; line-height:40px; margin-left:200px;">Got it</a>
		</p>
		</div>
	</div>
</div>
</body>
<script>
    $(function () {
        // 获取积分
        //getjifenbalance();
        // 获取当日成功金额
        gettodaysuccedmoney();
        // 获取冻结金额
        getfreezemoney();
        // 快速售卡
        indexcardquery();
        // 最新公告
        loadnotice();
        // 加载认证进度条
        getAuthPercent();

        $(".gonggao-anniu a").click(function () {
            var $UL = $(".yiwanka-con-right4-l .ul1");
            if ($UL.hasClass("ul1-hidden")) {
                $UL.removeClass("ul1-hidden").addClass("ul1-show");
                $(this).text("Put away");
            } else {
                $UL.removeClass("ul1-show").addClass("ul1-hidden");
                $(this).text("See more");
            }
        });
        $(".right3-anniu a").click(function () {
            var $UL = $(".yiwanka-con-right4-r ul");
            if ($UL.hasClass("gonggao-ul1-hidden")) {
                $UL.removeClass("gonggao-ul1-hidden").addClass("gonggao-ul1-show");
                $(this).text("Put away");
            } else {
                $UL.removeClass("gonggao-ul1-show").addClass("gonggao-ul1-hidden");
                $(this).text("See more");
            }
        });
        $(".yiwanka-kefu").click(function () {
            $(".ywkindex-shade").show();
        });
        $(".complain-shade-con2 .a4").click(function () {
            $(".complain-shade").hide();
            $("#replyemail").hide();
            $("#askemail").hide();
        });
    });

    function getjifenbalance() {
        $.ajax({
            type: "get",
            dataType: "json",
            timeout: 100000,
            url: "/jifen/querybalance.ashx?date=" + new Date(),
            success: function (json) {
                $('#jifenbalance').html(json.data.balance);
            },
            error: function (xmlHttpRequest, error) {
            }

        });
    }

    function gettodaysuccedmoney() {
        $.ajax({
            type: "get",
            dataType: "json",
            timeout: 100000,
            url: "/recycle/gettodaysuccmoney.ashx?date="
                    + new Date(),
            success: function (json) {
                $('#todaysuccedmoney').html(json.msg);
            },
            error: function (xmlHttpRequest, error) {
            }

        });
    }

    function getfreezemoney() {
        $.ajax({
            type: "get",
            dataType: "json",
            timeout: 100000,
            url: "/user/ws/getfreezemoney.ashx?date="
                    + new Date(),
            success: function (json) {
                $('#baseinfo_usertotalbalance').html(json.data.balance);
                $('#baseinfo_userbalance').html(json.data.availableBalance);
               // $('#todaysuccedmoney').html(json.msg);
                $('#detention').html(json.data.detention);
                $('#freezebalance').html(json.data.freeze);
            },
            error: function () {
            }
        });
    }

    function indexcardquery() {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/recycle/findUserRate.ashx",
            success: function (json) {
                if (json.result == 'ok') {
                    var html = "";
                    html += '<ul class="ul1 ul1-hidden">';
                    var j = 0;
                    for (var i = 0; i < json.data.aaData.length; i++) {
                        var val = json.data.aaData[i];
                        if (val.cardid != 'ofykt' && val.cardid != 'zyykt' && val.cardid != 'jsykt' && val.facevalue == 0) {
                            j++;
                            var rightNoBorder = '';
                            if (parseInt(j) % 5 === 0) {
                                rightNoBorder = 'border: none';
                            }
                            html += '<li><a href="/international/recycle/recycleIndex.aspx" style="' + rightNoBorder + '">';
                            html += '<p class="p1"><img src="/content/themes/style/images/img_' + val.cardid + '.jpg" /></p>';
                            html += '<p class="p2">' + val.cardname + '</p>';
                            html += '<p class="p3">Status：';
                            if (val.state == '1') {
                                html += '<span>normal</span>';
                            }
                            else {
                                html += '<span style="color:red;">maintain</span>';
                            }
                            html += '<p class="p4">Ratio：<span>' + val.rate + '%</span></p>';
                            html += '</p></a></li>';
                        }
                    }
                    var blankNo = parseInt(j) % 5;
                    if (blankNo < 5) {
                        for (blankNo; blankNo < 5; blankNo++) {
                            html += '<li></li>';
                        }
                    }
                    html += '</ul>';
                    $('#card_list_div').html(html);
                } else {
                    dialog_simple_fail(json.msg);
                    alert(json.msg);
                }
            },
            error: function (xmlHttpRequest, error) {
            }
        });
    }

    function loadnotice() {
        var sSource = '/user/ws/listb2bindexusernotice.ashx';
        $.ajax({
            type: "post",
            url: sSource,
            data: {
                pageno: "12"
            },
            success: function (json) {
                if (json.result == 'ok') {
                    var data = json.data;
                    var html = '';
                    for (var i = 0; i < data.length; i++) {
                        var noticelink = '/user/noticedetail.aspx?id=' + data[i].id;
                        html += '<li>';
                        html += '<span style="float:left;">·</span><a href="' + noticelink + '" target="_blank" class="a1">' + data[i].title + '</a>';
                        html += '<a href="' + noticelink + '" target="_blank" class="a2">' + data[i].addtime2 + '</a>';
                        html += '</li>';
                    }
                    $('#noticeul').html(html);
                }
            },
            error: function () {
            }
        })
    }

    function getAuthPercent() {
        // 邮箱认证
        var email = '<%=emailValidatedStr%>' === 'true' ? 1 : 0;
        // 手机认证
        var phone = '<%=phoneValidatedStr%>' === 'true' ? 1 : 0;
        // 实名认证
        var auth = '<%=realnameValidatedStr%>' === 'true' ? 1 :0;
        // 银行卡认证
        var card = '<%=bindsettleaccoutStr%>' === 'true' ? 1 : 0;
        // 密保认证
        var question = '<%=securityissueStr%>' === 'true' ? 1 : 0;
        // 协议签署
        var protocol = '<%=protocolStr%>' === 'true' ? 1 : 0;

        var successNum = parseInt(email) + parseInt(phone) + parseInt(auth) + parseInt(card) + parseInt(question) + parseInt(protocol);

        var color = "#FF001D";
        switch (successNum) {
            case 1:
                color = "#f63a0f";
                break;
            case 2:
                color = "#f27011";
                break;
            case 3:
                color = "#f2b01e";
                break;
            case 4:
                color = "#5CBBB1";
                break;
            case 5:
                color = "#5CBBB1";
                break;
            case 6:
                color = "#88bd88";
                break;
        }
        var percent = parseInt((successNum / 6) * 100) + "%";
        $("#percent-scope").css({ "border-color": color });
        $("#percent").css({ "width": percent, "background-color": color });
        $("#percent-text").css({ "color": color }).text(percent);
    }
</script>
</html>
