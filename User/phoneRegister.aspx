<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="phoneRegister.aspx.cs" Inherits="API.WebUI201509.User.phoneRegister1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register success</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/register.css" />
		<link rel="stylesheet" href="css/success.css" />
		<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
		<script type="text/javascript" src="js/nicenav.js" ></script>
		 <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <style>
        	ul.nav li a{
				color: #aca8a8;
			}
			.buoy{
				background: #413535;
			}
        </style>
        <script>
		$(function(){
			$.nicenav(200,0);
			
		})
		</script>
	</head>
	<body>
		<!--头部开始-->
		<div class="wrapper">
			<div class="nav-box clearfix">
				<a href="/international/Default.aspx">
					<img src="img/gray-logo.png" class="fl"/>
				</a>
				<!--<div class="Hamburge-menu fr">
					<div class="Hamburge-menu-icon"></div>
					<div class="Hamburge-menu-icon"></div>
					<div class="Hamburge-menu-icon"></div>
			    </div>-->
			    <div class="pr navlineBox fr">
				<ul class="nav fr">
					<li><a href="/international/Default.aspx">Home</a></li>
					<li><a href="/international/product_center.aspx">Product center </a></li>
					<li><a href="/international/about-us.aspx">About us</a></li>
					<li class="nav_bottom"><a href="/international/contactUs.aspx">Contact us</a></li>
				</ul>
				<div class="buoy"></div>
				</div>
			</div>
			<!--<div class="sidemenu">
			<div class="green">x</div>
			
				<ul class="hide-nav">
					<li><a href="#" class="nav_active">Home</a></li>
					<li><a href="#">Product center</a></li>
					<li><a href="about-us.html">About us</a></li>
					<li class="nav_bottom"><a href="#">Contact us</a></li>
				 </ul>
			
		</div>-->
		</div>
		<!--头部结束-->
		<div class="bg clearfix">
			<div class="success-box clearfix">
				<div class="button-box clearfix">
					<a href="/international/Default">Enter Home</a>
					<a href="/international/login.aspx" class="ml56">Return Login</a>
				</div>
			</div>
		</div>
	</body>
</html>