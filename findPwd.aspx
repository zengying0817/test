<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="findlogpsw.aspx.cs" Inherits="API.WebUI201509.findlogpsw" Async="True" %>
<%@ Register Src="~/Ctrls/IndexNav.ascx" TagPrefix="uc1" TagName="IndexNav" %>
<%@ Register Src="~/Ctrls/IndexFooter2.ascx" TagPrefix="uc1" TagName="IndexFooter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>密码重置-<%=SiteName%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="js/index.js" ></script>
<script type="text/javascript" src="js/nicenav.js" ></script>
<script type="text/javascript">
	$(function(){
				$.nicenav(200,0);
			})	
    function refreshcaptchacode() {
        $("#cimg").attr("src", "/captchacode.ashx?date=" + new Date());
    }

    function doSubmit() {
        if ($("#logname").val() == "") {
            alert("username can't be none!");
            $("#logname").focus();
            return false;
        }
        if ($("#captchacode").val() == "") {
            alert("Verification code can't be none!");
            $("#captchacode").focus();
            return false;
        }
        $("#findlogpswForm").submit();
    }

    function OrderieHandler(event) {
        event = event ? event : (window.event ? window.event : null);
        if (event.keyCode == 13 || event.which == 13) {
            $("#login_submit").click();
        }
    }
    $(document).ready(function () {
        msg = '<%=msg%>';
        if (msg != '') {
            alert(msg);
        }
        $("#captchacode").val("");
    });
</script>
<style>
	ul.nav li a{
				color: #aca8a8;
			}
			.buoy{
				background: #413535;
			}
</style>
</head>
<body>
	<!--头部开始-->
	<div class="wrapper">
			<header class="nav-box clearfix">
				<a href="/international/Default.aspx">
					<img src="img/gray-logo.png" class="fl"/>
				</a>
				<div class="Hamburge-menu fr">
					<div class="Hamburge-menu-icon"></div>
					<div class="Hamburge-menu-icon"></div>
					<div class="Hamburge-menu-icon"></div>
			    </div>
			    <div class="pr navlineBox fr">
				<ul class="nav fr">
					<li><a href="Default.aspx">Home</a></li>
					<li><a href="product_center.aspx">Product center </a></li>
					<li><a href="about-us.aspx">About us</a></li>
					<li><a href="javascript:void(0)">Contact us</a></li>
				</ul>
				<div class="buoy"></div>
				</div>
			</header>
			<div class="sidemenu">
			<div class="green">x</div>
			
				<ul class="hide-nav">
					<li><a href="#" class="nav_active">Home</a></li>
					<li><a href="#">Product center</a></li>
					<li><a href="about-us.html">About us</a></li>
					<li><a href="#">Contact us</a></li>
				 </ul>
			
		</div>
	</div>
	
	<!--主体区开始-->
<div class="com_warp mt100">
<!--<img src="/New/kdzf/res_img/forget_pwd.png" class="none find_pwdimg">-->
<div class="Register-fill wrapper bgwhite findpwdBox">
  <div id="regmain">
    <div class="Register-con" id="form-con" style="height:500px;">
      <div id="stepOne" >
        <div id="pagename">
        	<h3 class="findpwdTitle fn tc">
        		<img src="img/lock.png" class="fl"/>	
        		<span class="fl">Retrieve password</span>
        	</h3>
        </div>
        <div class="ml80">
        <div class="middleMargin">
        	<ul class="findStep mt35 clearfix">
					<li class="findFirTitle"></li>
					<li class="findSecTitle"></li>
			</ul>
        <% if (step1){ %>
		<form name='findlogpswForm' id='findlogpswForm' onkeydown="OrderieHandler(event)" method="post" style="margin-top: 10px;" action="/user/ws/findlogpsw.ashx">
		<input type="hidden" id="validphone" name="validphone" value="" />
          <!--<div class="form-line">
            <div class="form-tit">用户名：</div>
            <div  class="form-con" style="*position:relative;text-align: left;">
			<input id="logname" name="logname" type="text" class="txt" size="57" />
            </div>
          </div>-->
          <!--<div class="form-line">
            <div class="form-tit">验证码：</div>
            <div  class="form-con" style="width:228px;text-align: left;">
              <input class="txt" type="text" name="captchacode" errmsg='请填写图像验证码' id="captchacode"  pattern="limit(4,4)" position="s" style="width:190px;"/>
            </div>
            <div class="form-code"> <img alt='请填写至少4位的验证码' onclick="refreshcaptchacode()" src="/captchacode.ashx" width="75" height="40" id="cimg" /></div>
          </div>-->
          <div class="mt35">
				<label for="logname" class="findcount db">Please fill in the account you need to find:：</label>
				<input id="logname" name="logname" type="text"  placeholder="Please enter the account number or email" class="comfind count pl10 mt20" />
			</div>
			<div class="mt28 clearfix">
				<input class="txt comfind findpwdvalidate fl pl10" type="text" name="captchacode" errmsg='Verification code cannot be null' id="captchacode"  pattern="limit(4,4)" position="s"   placeholder="Verification code"  />
				<img src="/captchacode.ashx" alt="Verification code is at least 4" title="Can't see?" onclick="refreshcaptchacode()" class="findpassimg" id="cimg" />
			</div>
        </div>
        </div>
        <div class="bottomLine"> <a class="alibtn_orange50 findNext f30 colorwhite dib tc ml80" title='login_now' id="login_submit" name="login_submit" onclick="return doSubmit();"><h4>The next step</h4></a></div>
	  </form>
        <% } %>
           <% if (step2){ %>
        <form id="findlogpswForm" action="/user/ws/findlogpsw_checkpswquestion.ashx" method="post">
		  <div class="form-line">
            <div class="form-tit findcount db">Encrypted problem：</div>
			<font size="4"><%=question%></font>
            </div>
          </div>
          <div class="form-line">
           <div class="form-tit findcount db">Encrypted answer：</div>
            <div class="form-con" style="*position:relative; text-align: left;">
			<input id="pswanswer" name="pswanswer" type="text" class="txt comfind count pl10 mt20" size="57" />
            </div>
          </div>
        <div class="bottomLine"> <a class="alibtn_orange50 findNext f30 colorwhite dib tc ml80" title='login_now' id="login_submit" name="login_submit" onclick="return doSubmit();"><h4>The next step</h4></a></div>
		</form>
         <% } %>
          <% if (step3){ %>
        <form id="findlogpswForm" action="#">
			<span class="tips"><font size="5">The new password has been sent to your:<b><%=username%></b>Please note that check</font></span>
			<p></p>
			<span class="tips"><font size="5">If you didn't receive can also click</font></span>
			<a id="login_submit" name="login_submit" class="alibtn_orange50 tc db colorshow login-btn"onclick="return doSubmit();" href="#">letter once again</a>
		</form>
         <% } %>
      </div>
    </div>
  </div>
</div>
</div>        


		<script>
			$(function(){
				var navLi=$(".nav_box .main_menu li");
				navLi.on('click',function () {

					$(this).parent('ul').children('li').removeClass("menu_on");
					$(this).parent('ul').children('li').addClass('menu')
					$(this).addClass('menu_on');
					if(!$(this).find('.box').is(":animated")){
					$(this).find('.box').slideToggle().parent().siblings().find('.box').slideUp();

					}

				})
				
//				var url = "http://www.kdpay.com/user/listb2bindexusernotice.ashx?newstype=1";  
//				//header("Access-Control-Allow-Origin：*");
//				jQuery.getJSON(url, function(data){  
//					console.log(data);
//				});
			});
</script>
</body>
</html>