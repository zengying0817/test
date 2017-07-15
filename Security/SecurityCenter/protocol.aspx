<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="protocol.aspx.cs" Inherits="API.WebUI201509.Security.SecurityCenter.protocol" %>


<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Kdpay-Protocol upload</title>

     <link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />

    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/ajaxfileupload.js?r=2016" type="text/javascript" ></script> 
    <script type="text/javascript" src="/Scripts/custom/noname.js"></script>
    <script type="text/javascript" src="/Scripts/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="/international/Scripts/custom/validate.js"></script> 
<style>
.yiwanka-write-bottom p .span1 {
    width: 200px;
 
}
.yiwanka-write-bottom p .span2 .confirm-btn {
    width: 150px;
   
}
.pr{
	position: relative;
	
}
.pa{
   position: absolute;
     top: 0;
    left: 0;
    width: 100%;
    text-align: center;
    cursor: pointer;
    background: #e58c15;
    color: white;
    border-radius: 5px;
    display: none;
}
.transparent{
	/*opacity: 0;*/
}
.hand{
	cursor: pointer;
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
        <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="security" />
    <div class="yiwanka-con-right">
		<div class="yiwanka-write" style="height:670px;">
			<div class="yiwanka-write-title renzhenicon">
				<span>Cooperation agreement upload</span>
			</div>	<div class="yiwanka-write-bottom" style="height:280px;">
				<div class="yiwanka-write-bottom-con">
    <!-- 主体 -->
	<form id="protocoluploadform">
	    <% if (CurrentUser.procstatus == 0 ||( CurrentUser.procstatus==4 && redo=="1"))
        { %>
	                <p>
						<span class="span1">actual name:</span>
						<span class="span2" style="width:auto;">
							<input id="realname" name="realname" type="text" value="<%= personName %>" autocomplete="off" class="yxkeleyi" style="width:175px;color:#666666;">
                           
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
                    <p>
						<span class="span1">Passport number:</span>
						<span class="span2" style="width:auto;">
							<input id="idno" name="idno" type="text" value="<%= personId %>" autocomplete="off" class="yxkeleyi" style="width: 300px; color: #666666;"/>
                           
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
                     <p>
						<span class="span1">Signed domain name:</span>
						<span class="span2" style="width:auto;">
							<textarea id="hosts" name="hosts" class="yxkeleyi" placeholder="Multiple domain names are separated by a semicolon ',' comma" style="width: 300px; color: #666666;" rows="3" cols="4"></textarea>
                           
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1">ID card positive(.jpg):</span>
						<span class="span2 pr">
							<i class="pa">upload files</i>
                            <input id="IdNoImageA" type="file" name="IdNoImageA" accept=".jpg" class="transparent hand"/>
						</span>
						<span class="span3"></span>
					</p>
                    <p>
						<span class="span1">ID negative(.jpg):</span>
						<span class="span2 pr">
							<i class="pa">upload files</i>
                            <input id="IdNoImageB" type="file" name="IdNoImageB" accept=".jpg" class="transparent hand"/>
						</span>
						<span class="span3"></span>
					</p>
                    <p>
						<span class="span1">Cooperation agreement(.pdf):</span>
						<span class="span2 pr">
							<i class="pa">upload files</i>
                            <input id="protocal" type="file" name="protocal" accept=".pdf" class="transparent hand"/>
						</span>
						<span class="span3"></span>
					</p>
                    <p>
						<span class="span1">transaction password:</span>
						<span class="span2" style="width:auto;">
							<input id="tradepsw" name="tradepsw" type="text" class="yxkeleyi" style="width: 100px; display: none"/>
							<input id="showtradepsw" name="showtradepsw" type="password" autocomplete="off" class="yxkeleyi" style="width: 175px; color: #666666;"/>
                            <a href="/international/security/securitycenter/findTradepsw.aspx" tabindex="-1" class="findpsw">forget password?</a>
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
                    <p>
						<span class="span1">Verification Code:</span>
						<span class="span2" style="width:auto;">
							<input id="captchacode" name="captchacode" type="text" class="inputElem yxkeleyi" style="width:100px;float:left;height:32px;margin-right:5px;text-indent: 10px;"/>
							 <img id="cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="width:90px; height:35px;line-height:35px; text-align:center;cursor: pointer;" title="看不清？点击更换另一个。" />
						</span>
						<span class="span3" style="width:auto; min-width: 40px;"></span>
					</p>
					<p>
						<span class="span1"></span>
						<span class="span2">
							<input type="button" class="confirm-btn nextstep" value="Submit review" onclick="ajaxFileUpload();"/>
						</span>
					</p>
        <% } %>
        
        <% else{ %>
        <div class="manage-goods-child bind-content">
						<div class="manage-goods-child-one">
							<div class="attestation">
								<p><span class="span1">actual name：</span><span class="span2" style="font-weight:bold; width:120px; color:#666666;"><%= CurrentUser.personName %></span></p>
								<p><span class="span1">identification number：</span><span class="span2" style="font-weight:bold; width:120px; color:#666666;"><%= UserViewIdCard %></span></p>
                                <p><span class="span1">Approval Status：</span><span class="span2" style="font-weight:bold; width:120px; color:#666666;"><%= procstatetext %></span></p>
                               <% if (CurrentUser.procstatus == 4)
                                  { %>
                                 <p><span class="span1">Description of the audit：</span><span class="span2" style="font-weight:bold; width:1200px; color:#666666;"><%= reason %></span></p>
								<% } %>
                                <!--Can be changed -->
								<p>
										<span class="span1"></span>
										<span class="span2" style="font-weight:bold; width:120px; color:#666666;">
<% if (CurrentUser.procstatus == 4)
   { %>
											<a href="/security/securitycenter/protocol.aspx?redo=1" style="width:100px; height:35px; background-color:#e58c15; float:left;  text-align:center; color:#ffffff; font-size:14px; font-weight:500; border-radius:4px;">Resubmit</a>
										<% } %>
                                        </span>
									</p>
								</div>
							<div class="certificate-right">
							</div>
						</div>
            <div class="manage-goods-child-one mustValidPhone" style="display:none;">
							<div class="attestation">
							    
							</div>
						</div>
</div>

        <% } %>
					</form></div></div></div></div>
</div>	
    
    <div class="buyinfo-shade">
			<div style="width:100%; height:100%; background-color:#666666; opacity:0.5; position:absolute; top:0;"></div>
			<div style="width:100%; height: auto; background: none; position:absolute; top:300px;text-align:center">
<img src="/content/themes/style/images/UpLoading.gif"/>
			</div>
		</div>
</html>
<script type="text/javascript">
    var context_path = "";
    var MODEL_HAVEGOOGLEAUTH = '';

    $(function () {
        loadDefaultErrorStyle();
        validateUploadForm();
       
    });

    function validateUploadForm() {
        jQuery.validator.addMethod("isCaptchacodeRequired", function (value, element) {
            return $.trim(value).length > 0 || eval(MODEL_HAVEGOOGLEAUTH);
        }, "Enter verification code");

        $("#protocoluploadform").validate({
            rules: {
                realname: {
                    required: true,
//                  isChinese: true,
                    rangelength: [2, 64]
                },
                idno: {
                    required: true,
                    ispassport: true
                },
                hosts: {
                    required: true
                },
                IdNoImageA: {
                    required: true,
                    accept: ".jpg"
                },
                IdNoImageB: {
                    required: true,
                    accept: ".jpg"
                },
                protocal: {
                    required: true,
                    accept: ".pdf"
                },
                showtradepsw: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validOldTradePsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            oldtradepsw: function () {
                                return rsapassword($("#showtradepsw").val());
                            }
                        }
                    }
                },
                captchacode: {
                    isCaptchacodeRequired: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#captchacode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                realname: {
                    required: "please enter your real name",
//                  isChinese: "The name must be Chinese",
                    rangelength: "The length of the name is not correct"
                },
                idno: {
                    required: "Please input your ID card number",
                    isIdCard: "Please enter a valid ID number"
                },
                hosts: {
                    required: "Enter a domain name, multiple domain names separated by a semicolon ',' comma"
                },
                IdNoImageA: {
                    accept: "Please select a jpg file",
                    required: "Please select a file to upload"
                },
                IdNoImageB: {
                    accept: "Please select a jpg file",
                    required: "Please select a file to upload"
                },
                protocal: {
                    accept: "Please select a pdf file",
                    required: "Please select a file to upload"
                },
                showtradepsw: {
                    required: "Please enter the transaction password",
                    remote: "The transaction password is incorrect"
                },
                captchacode: {
                    remote: "Error in verification code"
                }
            }
        });
    }

    function ajaxFileUpload() {
        if ($("#protocoluploadform").valid()) {
            $(".buyinfo-shade").show();

            $.ajaxFileUpload({
                url: "uploadprotocol.ashx", //submit to UploadFileServlet  
                data: { realname: $("#realname").val(), idno: $("#idno").val(), hosts: $("#hosts").val(), captchacode: $("#captchacode").val(), tradepsw: rsapassword($("#showtradepsw").val()) },
                secureuri: false,
                fileElementId: ['IdNoImageA', 'IdNoImageB', 'protocal'],
                dataType: 'json', //or json xml whatever you like~  
                success: function (json, status) {
                    $(".buyinfo-shade").hide();
                    if (json.result == 'ok') {
                        alert("Submitted successfully! Please wait patiently for staff review");
                        window.location.href = window.location.href;
                        //window.location.href = context_path + "/finance/applycash.aspx";
                    } else {
                        alert(json.msg);
                    }
                },
                error: function (json, status, e) {
                    $(".buyinfo-shade").hide();

                    alert(e);
                }
            });
            return false;
        }
        return false;
    };

    function UploadData(id) {
        var val = $("#" + id).val();
        $.ajaxFileUpload({
            url: "uploadprotocol.ashx", //submit to UploadFileServlet  
            data: { captchacode: $("#captchacode").val(), tradepsw: rsapassword($("#showtradepsw").val()), type: id },
            secureuri: false,
            fileElementId: id,
            dataType: 'json', //or json xml whatever you like~  
            success: function (json, status) {
                if (json.result == 'ok') {
                    $("#" + id + "Data").val(json.msg);
                    alert("Submitted successfully! Please wait patiently for staff review");
                    //window.location.href = context_path + "/finance/applycash.aspx";
                } else {
                    alert(json.msg);
                }
            },
            error: function (json, status, e) {
                alert("upload failed! error：" + e.message);
                //alert(e);
            }
        });
        $("#" + id).val(val);
    };

    function loadDefaultErrorStyle() {
        $.validator.setDefaults({
            success: function (label, element) {
                element.removeClass("error").addClass("valid").parent().siblings(".span3").removeClass("errorimg").addClass("validimg").text("");
            },
            errorPlacement: function (error, element) {
                element.removeClass("valid").addClass("error").parent().siblings(".span3").removeClass("validimg").addClass("errorimg").text(error.html());
            }
        });
    }

    function refreshcaptchacode(obj) {
        $(obj).attr("src", context_path + "/captchacode.ashx?date=" + new Date());
    }

    isUpdated = function(busCode) {
        
    }
</script>  