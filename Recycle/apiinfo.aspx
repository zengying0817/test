<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apiinfo.aspx.cs" Inherits="API.WebUI201509.User.apiinfo" %>
<%@ Import Namespace="API.BLL" %>


<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>API access|Kdpay</title>

     <link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />

    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<style>
	.yiwanka-write-bottom{
		width:600px;
	}
	.yiwanka-write-bottom p{
		width:650px;
	}
</style>

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
        <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="3-2" />

    <!-- 主体 -->
	<div class="yiwanka-con-right">
		<div class="yiwanka-write" style="height:670px;">
			<div class="yiwanka-write-title warnicon">
				<span>APIAccess</span>
			</div>
			
			<div class="yiwanka-write-bottom" style="height:280px;">
				
			<div class="yiwanka-write-bottom-explain">
				<p style="color:#E4942C; font-weight:bold; margin:8px">Your businessID：<font color="#000000"><%=UserID %></font></p>
				<p style="color:#E4942C; font-weight:bold; margin:7px">Security code：<font color="#000000"><%=CurrentUser.salfStr %></font></p>
		<p>All card gateways：<%=Webinfo.Instance.GetDefaultModel().payurl %>/pay/Card.aspx</p>
		<p>Online banking and tripartite platform gateway：<%=Webinfo.Instance.GetDefaultModel().payurl %>/pay/Bank.aspx</p>
		<p>Interface support language：ASP,PHP,JSP,ASP.NET</p>
		<p><a href="/Content/download/KDPay-Api.zip" id="apidown">API documentation and examples download</a></p>
			</div>
				<p style="line-height:50px; font-size:16px; color:#333333; font-weight:bold; text-align:left;">Access Flow:</p>
				<p style="text-align:left">①Download the interface documentation   &nbsp;&nbsp;&nbsp;&nbsp;②Get the merchant ID and security code above</p>
				<p style="text-align:left">③Make the interface program   &nbsp;&nbsp;&nbsp;&nbsp;④The interface goes online</p>
				<p style="color:#b91414; font-weight:bold;">Tip: If the security code leak, it is recommended to update the use of reset; If you need to change the security code, 
                                       please start the station letter。
                                              </p>
		</div>
	</div>
</div>	
<script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/validate.js?t=1"></script>
    </div>
    </body>
</html>
