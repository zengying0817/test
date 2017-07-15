<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="API.WebUI201509.Default" %>
<!DOCTYPE html>
<html>
	<head>
		<!--<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>-->
		<meta charset="utf-8" />
		<meta name="renderer" content="webkit">
		<title>Kdpay-Aggregation Gateway Service Platform</title>
		<meta name="keywords" content="<%=SiteKeywords%>" />
		<meta name="description" content="<%=SiteDescription%>" />
		<link rel="stylesheet" href="/international/css/reset.css"/>
		<link rel="stylesheet" href="/international/css/css.css"/>
		<link rel="stylesheet" href="/international/css/index.css"/>
        	 <!--[if lt IE 9]>
            		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
       		 <![endif]-->
		<!--<link href="css/small_phone.css" rel="stylesheet" type="text/css" media="(max-width:320px)"/>
		<link href="css/mid_phone.css" rel="stylesheet" type="text/css" media="(min-width:321px) and (max-width:640px)"/>
		<link href="css/ipad.css" rel="stylesheet" type="text/css" media="(min-width:641px) and (max-width:1199px)"/>-->
		<script type="text/javascript" src="/international/js/jquery-1.11.3.min.js" ></script>
		<script type="text/javascript" src="/international/js/index.js" ></script>
		<script type="text/javascript" src="/international/js/nicenav.js" ></script>
		<script type="text/javascript" src="/Scripts/secure/RSA.js"></script>
		<script type="text/javascript" src="/Scripts/secure/BigInt.js"></script>
		<script type="text/javascript" src="/Scripts/secure/Barrett.js"></script>
		<script>
			$(function(){
				$.nicenav(200,0);
			})
			
		    function rsapassword(password) {
		        setMaxDigits(1024);
		        key = new RSAKeyPair("<%=strPublicKeyExponent%>", "", "<%=strPublicKeyModulus%>");
		        var encpassword = encryptedString(key, encodeURIComponent(password));
		        return encpassword;
		    }
		</script>
		<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
		<script type="text/javascript">
			function refreshcaptchacode() {
				$("#cimg").attr("src", "/captchacode.ashx?date=" + new Date());
			}
			function shake(){
				$(".login-box").animate({"left":"35%"},100,"linear",function(){
					$(this).animate({"left":"65%"},100,"linear",function(){
						$(this).animate({"left":"45%"},100,"linear",function(){
							$(this).animate({"left":"55%"},100,"linear",function(){
								$(this).animate({"left":"50%"});
							})
						})
					})
				})
			}
			function doSubmit() {
				if ($("#login_user").val() == "") {
					shake();
					alert("Login name cannot be empty!");
					$("#login_user").focus();
					return false;
				}
				if ($("#login_pwd").val() == "") {
					shake();
					alert("Password cannot be empty!");
					$("#login_pwd").focus();
					return false;
				}
				if ($("#captchacode").val() == "") {
					shake();
					alert("Verification code cannot be empty!");
					$("#captchacode").focus();
					return false;
				}
				var password = $("#login_pwd").val();
				if (password.length > 32) {
					shake();
					return false;
				}
				ajaxreq({
					type : "get",
					url : "/user/getrandomstring.ashx",
					success : function(json) {
						var randomstring = json.msg;
						var encpassword = rsapassword(password + randomstring);
						$("#login_pwd").val(encpassword);
						$("#loginForm").submit();
					},
					error : function() {
					}
				});
			}
		
			function OrderieHandler(event) {
				event = event ? event : (window.event ? window.event : null);
				if (event.keyCode == 13 || event.which == 13) {
					$("#login_submit").click();
				}
			}
		
			$(document).ready(function() {
				msg = '';
				if (msg != '') {
					alert(msg);
				}
				$("#login_user").val("");
				$("#login_pwd").val("");
				$("#captchacode").val("");
			});
		</script>	
		<style>
			.nav-box ul.nav li a {
    				color: white;
				}
		</style>
	</head>
	<body class="all-screen">
		<div style="width: 100%;height: 100vh;">
			<video class="video" id="kd_video" autoplay loop>
				<source id="mp4" src="https://statics.duqee.com/international/kdvideo.mp4 " type="video/mp4"></source>
				
				Your browser does not support the video tag.
			</video>
		
		
		<div class="wrapper colorwhite pr" style="z-index: 99;">
			<!--目录-->
			<div class="nav-box clearfix">
				<a href="/international/Default.aspx">
					<img src="/international/img/kd-logo.png" class="fl"/>
				</a>
				<div class="Hamburge-menu fr">
					<div class="Hamburge-menu-icon"></div>
					<div class="Hamburge-menu-icon"></div>
					<div class="Hamburge-menu-icon"></div>
			    </div>
			    <div class="pr navlineBox fr">
				<ul class="nav fr">
					<li><a href="/international/Default.aspx">Home</a></li>
					<li><a href="/international/product_center.aspx">Product center </a></li>
					<li><a href="/international/about-us.aspx">About us</a></li>
					<li><a href="/international/contactUs.aspx">Contact us</a></li>
				</ul>
				<div id="buoy" class="buoy"></div>
				</div>
			</div>
			<!--<div class="sidemenu">
			<div class="green">x</div>
			
				<ul class="hide-nav">
					<li><a href="#" class="nav_active">Home</a></li>
					<li><a href="#">Product center</a></li>
					<li><a href="about-us.html">About us</a></li>
					<li><a href="#">Contact us</a></li>
				 </ul>
			
			</div>-->
			<% if (API.BLL.User.UserLogin.Instance.IsLogin == false)
       			{ %>
			<!--内容-->
				<div class="content tc">
					<h1>Welcome</h1>
					<p>Build first-class enterprise and first-class reputation </p>
					<p>and first-class service with first-class project </p>
					<p>Come on come on come on</p>
					<ul class="kd-btn clearfix">
						<li class="login-btn fl">
	                        <span class="line line-top"></span>
	                        <span class="line line-right"></span>
	                        <span class="line line-bottom"></span>
	                        <span class="line line-left"></span>
	                        Login
	                    </li>
						<li class="register-btn fr">
	                    	<span class="line line-top"></span>
	                        <span class="line line-right"></span>
	                        <span class="line line-bottom"></span>
	                        <span class="line line-left"></span>
	                    	<a class="colorwhite" href="/international/Register" style="display: block;width:100%;height:100%">Registered</a>
	                    </li>
					</ul>
				</div>
			<% }
   				else
   				{ %>
   				<div class="d_logineds" id="enter-admin">
			        <h3>Welcome：<a href="/user/main.aspx" id="myLoginUserName"><%=usename%></a><span><a href="/user/logout.aspx">[exit]</a></span></h3>
			        <div class="statis">
			          <div class="bd" id="indexUserFunds">
			            <p>Account Balance：<span id="myTotalBalance">￥ <%=UserBalance%></span><a href="/finance/accountrecord.aspx" class="a1">Running Account</a></p>
			            <p>Today's Deal：<span id="myRmbBalance">￥ <%=TodayIncome%></span><a href="/recycle/recycleIndex.aspx" class="a2">Cards Consignment</a></p>
						
						<p style="width:135px;margin:20px;"><a href="javascript:void();" onclick="window.location.href='/user/userinfo.aspx'" class="a3">Enter the system</a></p>
			          </div>
			        </div>
			      </div>	
			<% } %>
			<!--登陆框-->
			<div class="login-box tc">
				<span class="closebtn">×</span>
				<h2>Log in the kdpay</h2>
				<form id="loginForm" name="loginForm" onkeydown="OrderieHandler(event)" method="post" action="/user/login.aspx">
					<input type="hidden" name="remember" id="remember" value="12"/>
					<div class="myInput mt13 h74">
						<input name="login_user" id="login_user" errormsg="" type="text" class="login-usrname"/>
					</div>
					<div class="myInput mt50 h74" style="background-position: 0 -73px;">
						<input name="login_pwd" id="login_pwd" errormsg="" type="password" class="login-passwd"/>
					</div>
					<div class="myInput  mt50 h74" style="background: transparent url(/international/img/kg-btn.png) no-repeat 0 -73px;">
						<input name="captchacode" id="captchacode" type="text" class="login-captchacode" style="width: 145px; border-radius: 0 4px 4px 0;"/>
						<img id="cimg" src="/captchacode.ashx" onclick="refreshcaptchacode()" title="看不清？点击换一个" width="80" height="37" class="left"/>
					</div>
					<a class="forgetPasswd"  href="/international/findloginpsw.aspx">
						Forgot password？
					</a>
					<a href="javascript:void(0)" class="login" name="login_submit" id="login_submit" onclick="doSubmit()">login</a>
				</form>
			</div>
		</div>
		</div>
		
		<!--不需要的东西-->
		<div class="h_xinwen" style="display:none;">
			<asp:Repeater ID="rptdata" runat="server">				      
			</asp:Repeater>	
		    <asp:Repeater ID="rptnotify" runat="server">
			</asp:Repeater>	
		</div>
		<!--不需要的完-->
	</body>
</html>
