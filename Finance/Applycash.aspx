<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Applycash.aspx.cs" Inherits="API.WebUI201509.Finance.Applycash" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ApplyCash|Kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<style>
	.tixian-click .add-bankcard{
	    width: 150px;
}
	.yiwanka-zhezhao2-con p{
		height:auto;
}

.bundling-one .p2{
	width:240px;
}
.withdrawals .withdrawals-one .p3{
	width:300px;
}
</style>
</head>
<script type="text/javascript" src="/Scripts/secure/RSA.js"></script>
<script type="text/javascript" src="/Scripts/secure/BigInt.js"></script>
<script type="text/javascript" src="/Scripts/secure/Barrett.js"></script>
<script type="text/javascript">
    function rsapassword(password) {
        setMaxDigits(129);
        key = new RSAKeyPair("<%=strPublicKeyExponent%>", "", "<%=strPublicKeyModulus%>");
        var encpassword = encryptedString(key, encodeURIComponent(password));
        return encpassword;
    }
</script><body>
<div class="yiwanka finance">
	<!-- 头部 -->
	 <uc1:Header runat="server" id="Header1"/>
     <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="4-0" />

    <div class="yiwanka-con-right">
		<div class="goods-total">
		<form id="applyForm">
			<div class="withdrawals"><!--withdrawals-->
				<div class="withdrawals-one">
					<p class="p1"><img src="/content/themes/style/images/tixian001.png"></p>
					<p class="p2"><span style="color:#999999; font-weight:bold;">Hello，</span><%=UserName%></p>
					<p class="p3">You can withdraw：<span style="color:#454d69;font-weight:bold;"><%=UserBalance %>yuan</span></p>
				</div>
				<div class="withdrawals-one">
					<p class="p1" style="width:150px; text-align:center;">Withdrawal Amount:</p>
					<p class="p2" style="width:250px;">
						<span>
							<input id="applymoney" name="applymoney" type="text" placeholder="enter Withdrawal Amount" class="yxkeleyi" style="width:200px;">
						</span>&nbsp;&nbsp;&nbsp;yuan</p>
					<p class="p3" style="width:auto; "><span></span></p>
				</div>
				<div class="withdrawals-two">
					<div class="p1" style=" width:150px; height:40px; color:#666666; line-height:40px; text-align:center; color:#999999; font-size:12px;">Select the card number</div>
					<div class="bank">
							<div class="choose-bank" style="width:734px; height:<%=GetHeight()%>px; overflow:hidden;">
							    <% if (CurrentUser.bindstatus == 0)
							       { %>
								<label class="empty-label">
									<span>You have not yet bound any bank cards！</span>
								</label>
                                <% } %>
                                
                                <%else{ %>
                                <asp:Repeater ID="rptData" runat="server" OnItemDataBound="rptData_ItemDataBound">
                                    <ItemTemplate>
                                         <label  <%#Eval("isdefault").ToString()=="1"?"class=\"new-label\"":""%>>
										<input name="accountid" type="radio" class="label-radio" value="<%#Eval("id")%>" <%#Eval("isdefault").ToString()=="1"?"checked=\"checked\"":""%> <%#IsShowAdd(Eval("bankcode"),Eval("bankAddress")) %>>
									<span class="span1"><img src="/content/themes/style/images/bank/<%#Eval("bankcode")%>.jpg"></span>
										<span class="span2"><%#GetAccoutNo(Eval("bankcode"),Eval("accountno")) %></span><span class="span3"><%#Eval("payeeName")%></span>
									</label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <% } %>
							</div>
						<div class="tixian-click">
							<p class="add-bankcard click-checkout">Add a bank card</p>
							<p class="add-bankcard click-checkalter" style=" margin-left:8px;">Modify a bank card</p>
							<p class="more-bankcard"><span class="span1">more</span><span class="span2 up"></span></p>
						</div>
					</div><!--withdrawals-two-->
				</div>
				<div class="withdrawals-one" style="border-bottom: none;">
					<p class="p1" style=" width:156px; text-align:left;">transaction password：</p>
					<p class="p2" style="width:auto;">
						<span>
							<input id="tradepsw" name="tradepsw" type="hidden" class="yxkeleyi" style="width:175px;color:#666666;">
							<input id="showtradepsw" name="showtradepsw" type="password" autocomplete="off" class="yxkeleyi" style="width:175px;color:#666666;">
							<a href="/security/securitycenter/findTradepsw.aspx" tabindex="-1" class="findpsw">forget password?</a>
						</span>
					</p>
					<p class="p3">
						<span></span>
					</p>
				</div>
				<div class="withdrawals-one">
				<p class="p1" style=" width:156px; text-align:left;">Verification Code：</p>
					<p class="p2" style="width:auto;">
						<span>
							<input id="captchacode" name="captchacode" type="text" class="yxkeleyi" style="width:100px;color:#666666;margin-right: 5px;">
							<img src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="margin-top:8px; width:90px; height:35px;line-height:35px; text-align:center;cursor: pointer;" title="看不清？点击更换另一个。" />
						</span>
					</p>
					<p class="p3">
						<span></span>
					</p>
				</div>
				<div class="withdrawals-one">
					<div class="bundling-one" style="height:35px; width:110px; margin:0 auto; margin-top:20px;">
					    <% if (!CanApplyCash)
					       { %><input id="applycashbtn" type="button" value="Withdrawal" class="submit-btn-disabled"  disabled="disabled" /><% } %>
                        <%else{ %>
                         <input id="applycashbtn" type="button" value="Withdrawal" class="submit-btn"/>
                        <% } %>

					   
					</div>
				</div>
				<div class="withdrawals-produce">
					<p style="font-size: 15px;font-weight: bold;"> Help message </p>
					<p>(一)：Support bank：ICBC, Agricultural Bank, Construction Bank, ICBC, China Merchants Bank, people's livelihood, Alipay and other popular banks</p>
					<p>(二)：Settlement Amount：Single withdrawal is a minimum 200 yuan, the bank card is a single ceiling is less than 50,000</p>
					<p>(三)：Processing fee：Free of charge</p>
					<p> (四)：Number of withdrawals：<p>
					<p style="text-indent: 40px;">Single cash amount is greater than or equal to 500 yuan, does not limit the number of withdrawals </p>
					<p> (五)：Time to pay：Early 9:00 - late 22:00，Online API within two hours，Point card transactions about 5 minutes into account</p>
					<p style="text-indent: 40px;">Application for settlement after 22:00, the next day 9:00 together </p>
				</div>
		</div><!--withdrawals-->
        </form>
		</div><!--goods-total-->
		<div class="yiwanka-zhezhao1 yiwanka-zhezhao1-change" style="display:none" ></div>
		<div class="yiwanka-zhezhao2 yiwanka-zhezhao1-change"  style="display:none" >
			<div class="yiwanka-zhezhao2-con">
				<p style="width:500px; border-bottom:#c5c5c5 1px solid"><span style="float:left; font-size:16px; font-weight:bold;">To change your bank card, follow the steps below</span><span class="close-bangding" style="float:right; cursor:pointer;"><img src="/content/themes/style/images/bangding01.jpg"></span></p>
				<p style="margin-top:35px;font-weight: bold;">first step：Re-certification of real-name information</p>
				<p>（Note: After the real name authentication information is modified, all the bank cards that were previously bound will be deleted）</p>
				<p style="font-weight: bold;">The second step：Rebind the new bank card</p>
				<p>（The name of the bank card must be the same as the name of the real name information）</p>
				<p style="width:110px; margin-top:30px;">Please contact the business to change</p>
			</div>
		</div>
		<% if (CurrentUser.bindsettleaccout == 0)
		   { %>
		<!-- 如果还没有绑定任何银行卡的话，弹出层提示绑定 -->
		<div class="yiwanka-zhezhao1"></div>
			<div class="yiwanka-zhezhao2" >
				<div class="yiwanka-zhezhao2-con">
					<p style="width:500px; border-bottom:#c5c5c5 1px solid">
						<span style="float:left; font-size:16px; font-weight:bold;">friendly reminder</span>
						<span class="close-bangding" style="float:right; cursor:pointer;">
							<img src="/content/themes/style/images/bangding01.jpg"></span>
					</p>
					<p style="margin-top:35px;">Dear Merchant, you need to add a bank card before you can make a withdrawal，</p>
					<p>Please click "Add Card" to bind the card to your account，</p>
					<p>Thank you for your support and cooperation！</p>
					<p style="width:110px; margin-top:30px;"><a href="#" class="lock-wankacard">Bind the bank card</a></p>
				</div>
			</div>
        <% } %>

		<div class="buyinfo-shade">
			<div style="width:100%; height:100%; background-color:#666666; opacity:0.5; position:absolute; top:0;"></div>
			<div style="width:100%; height: auto; background: none; position:absolute; top:50px;">
			<div class="buyinfo-shade-con" style="margin:0 auto; background-color:#ffffff;">
				<div class="buyinfo-shade-h3" style="width:730px; font-size:16px; height:45px; line-height:45px; border-bottom:#c5c5c5 1px solid; margin:0 auto">
					<span style=" float:left;">Cooperate Bank</span>
					<span style=" float:right; cursor:pointer;" id="tixian-spanhid">
						<img src="/content/themes/style/images/del.jpg" style="margin-top:17px;">
					</span>
				</div>
				<div class="tixian-con">
					<ul>
						<li style="opacity: 1;" class="addnew"><a href="#" id="ICBC"><img src="/content/themes/style/images/bank/icbc.jpg" ></a></li>

						<li><a href="#" id="CCB"><img src="/content/themes/style/images/bank/ccb.jpg"></a></li>
						<li><a href="#" id="BOC"><img src="/content/themes/style/images/bank/boc.jpg"></a></li>
						<li><a href="#" id="ABC"><img src="/content/themes/style/images/bank/abc.jpg"></a></li>
						<li><a href="#" id="CMB"><img src="/content/themes/style/images/bank/cmb.jpg"></a></li>
						<li><a href="#" id="PSBC"><img src="/content/themes/style/images/bank/psbc.jpg"></a></li>
						<li><a href="#" id="BCM"><img src="/content/themes/style/images/bank/bcm.jpg"></a></li>
						<li><a href="#" id="CEB"><img src="/content/themes/style/images/bank/ceb.jpg"></a></li>
						<li><a href="#" id="GDB"><img src="/content/themes/style/images/bank/gdb.jpg"></a></li>
						<li><a href="#" id="CITIC"><img src="/content/themes/style/images/bank/citic.jpg"></a></li>
						<li><a href="#" id="CIB"><img src="/content/themes/style/images/bank/cib.jpg"></a></li>
						<li><a href="#" id="PAB"><img src="/content/themes/style/images/bank/pab.jpg"></a></li>
						<li><a href="#" id="SPDB"><img src="/content/themes/style/images/bank/spdb.jpg"></a></li>
						<li><a href="#" id="CMBC"><img src="/content/themes/style/images/bank/cmbc.jpg"></a></li>
						<li><a href="#" id="BOB"><img src="/content/themes/style/images/bank/bob.jpg"></a></li>
						<li><a href="#" id="HXB"><img src="/content/themes/style/images/bank/hxb.jpg"></a></li>
						<li><a href="#" id="NBCB"><img src="/content/themes/style/images/bank/nbcb.jpg"></a></li>
						<li><a href="#" id="BJRCB"><img src="/content/themes/style/images/bank/bjrcb.jpg"></a></li>
						<li><a href="#" id="HZB"><img src="/content/themes/style/images/bank/hzb.jpg"></a></li>
						<li><a href="#" id="BOS"><img src="/content/themes/style/images/bank/bos.jpg"></a></li>
						<li><a href="#" id="HSB"><img src="/content/themes/style/images/bank/hsb.jpg"></a></li>
						<li><a href="#" id="NJCB"><img src="/content/themes/style/images/bank/njcb.jpg"></a></li>
						<li><a href="#" id="CBHB"><img src="/content/themes/style/images/bank/cbhb.jpg"></a></li>
						<li><a href="#" id="BEA"><img src="/content/themes/style/images/bank/bea.jpg"></a></li>
					</ul>
					<p style="width:100%; height:40px; float:left;"><a id="chooseBankCardBtn" href="#" class="tixian-next">The next step</a></p>
				</div>	
			</div>
			</div>
		</div>
		
		<div class="buyinfo-shade-next" style="display: none;">
			<form id="bindForm">
			<div style="width:100%; height:100%; background-color:#666666; opacity:0.5; position:absolute; top:0;"></div>
			<div style="width:100%; height: auto; background: none; position:absolute; top:50px;">
				<div class="buyinfo-shade-con" style="margin:0 auto; height:500px;">
					<div class="buyinfo-shade-h3" style="width:730px; font-size:16px; height:45px; line-height:45px; border-bottom:#c5c5c5 1px solid; margin:0 auto">
						<span style=" float:left;">Bind the card number</span>
						<span style=" float:right; cursor:pointer;" id="tixian-spanhid1">
							<img src="/content/themes/style/images/del.jpg" style="margin-top:17px;">
						</span>
					</div>
					<div class="bundling-one" style=" height:40px;">
						<p class="p1">Selected bank：</p>
						<p class="p2">
							<span>
								<input id="bankcode" name="bankcode" type="hidden"/>
                                <input id="optype" name="optype" type="hidden" value="0"/>
                                <input id="settleaccoutid" name="settleaccoutid" type="hidden" value="0"/>
								<img id="choosedBank" src="" >
							</span>
							<i style="float:left; color:#999999; margin-left:10px;">Debit Card</i></p>
						<p class="p3">
							<a id="reChooseBankBtn" href="javascript:void(0);" style=" color:#54b8ad; text-decoration:underline;">Re-select</a>
						</p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">Name：</p>
						<p class="p2">
							<span style="width:135px; border:#d5d5d5 1px solid; height:33px;background-color:#ffffff;color:#999999; "><%= UserFullName %></span>
							<i style="float:left; font-size:12px; color:#999999; margin-left:10px;"></i>
						</p>
						<p class="p3"><a href="/international/security/securitycenter/rebindidno(主体信息变更).aspx" style=" color:#54b8ad; text-decoration:underline">Re-real-name authentication</a></p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">ID card：</p>
						<p class="p2" style="width:185px">
							<span style="width:180px; border:#d5d5d5 1px solid; height:33px;background-color:#ffffff;  color:#999999;"><%= UserViewIdCard %></span>
						</p>
						<p class="p3"><i style="float:left; font-size:12px; color:#999999; margin-left:10px;"></i></p>
					</div>
                    <div class="bundling-one bankcss" style="height:25px;">
						<p class="p1">Types：</p>
						<p class="p2 parentCls">
							<input type="radio" name="cardtype" value="0" checked="checked"/>private
                            <input type="radio" name="cardtype" value="1" />public
						</p>
						<p class="p3"><span></span></p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">card number：</p>
						<p class="p2 parentCls" style="width:185px;">
							 <input id="accountno" name="accountno" type="text" class="inputElem yxkeleyi" style="width:180px;"/>
						</p>
						<p class="p3"><span></span></p>
					</div>
                    <div class="bundling-one bankcss" style="height:25px;">
						<p class="p1">Banks：</p>
						<p class="p2" style="width:285px;">
							 <select id="ddlprovice" name="provice" class="provicevalidator" style="float:left;height: 20px">
							     <%=ddlproviceValues %>
							 </select>
                            &nbsp; &nbsp;
                            <select id="ddlcity" name="city"  class="cityvalidator" style="float: left;height: 20px">
							     <option >--city--</option>
							 </select>
                           
						</p>
						<p class="p3"><span></span></p>
					</div>
                    <div class="bundling-one bankcss" style="height:25px;">
						<p class="p1">Branches：</p>
						<p class="p2" style="width:185px;">
							 <input id="bankAddress" name="bankAddress" type="text" class="inputElem yxkeleyi bankAddressvalidator" style="width:180px;"/>
						</p>
						<p class="p3"><span></span></p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">Verification Code：</p>
						<p class="p2">
							 <input id="captchacode" name="captchacode" type="text" class="inputElem yxkeleyi" style="width:100px;float:left;height:32px;margin-right:5px;text-indent: 10px;"/>
							 <img id="cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="width:90px; height:35px;line-height:35px; text-align:center;cursor: pointer;" title="Click to replace the other。" />
						</p>
						<p class="p3"><span></span></p>
					</div>
					<div class="bundling-one" style="height:25px; width:150px; margin:0 auto; margin-top:40px;">
						<input id="bindBankBtn" type="button" value="Confirm the binding" class="submit-btn" />
					</div>
			</div>
            </div>
			</form>
		</div>
    
	</div>
    
    </div>
</body>
<script type="text/javascript" src="/Scripts/custom/tixian-show.js"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.validate.js?t=1"></script>
<script type="text/javascript" src="/Scripts/custom/validate.js?t=1"></script>
    <script type="text/javascript" src="/international/Scripts/js/financeApplyCash.js?t=2020"></script><script type="text/javascript">
var context_path = '';
var MODEL_BALANCE = '<%=UserBalanceModel.balance.ToString("f2") %>';
var MODEL_HAVEGOOGLEAUTH = '';

$(function(){
	var error = '';
	if (error != null && error != '') {
		alert('');
	}
	$(".choose-bank >label").click(function() {
		$(this).addClass("new-label").siblings().removeClass("new-label").parents(".choose-bank").siblings().find("label").removeClass("new-label");
	});
	$(".more-bankcard").click(function() {
		var labelIndex = $(".choose-bank").find("label").length;
		if (labelIndex > 2) {
			if ($(".choose-bank").css("height") == "124px") {
				var newHeight = labelIndex > 5 ? "310px" : (labelIndex*62) + "px";
				$(".choose-bank").css("overflow","auto").stop().animate({height:newHeight},500);
				$(this).find(".span2").removeClass("up").addClass("down");
				$(this).find(".span1").text("Put away");
			} else {
				$(".choose-bank").css("overflow","hidden").stop().animate({height:"124px"},500);
				$(this).find(".span2").removeClass("down").addClass("up");
				$(this).find(".span1").text("More");
			}
		}
	});
	$(".click-checkout").click(function() {
		$(".buyinfo-shade").show();
	});
	$("#buyinfo-shade-h3-hide").click(function() {
		$(".buyinfo-shade").hide();
	});
	$(".tixian-con ul li").click(function() {
		$(this).animate({
			"opacity": "1"
		},
		100).addClass("addnew").end();
		$(this).siblings("li").animate({
			"opacity": "0.5"
		}).removeClass("addnew");
	});
	
	// 选择银行卡
	$("#chooseBankCardBtn").click(function() {
		$(".buyinfo-shade").hide();
		var chooseBankSrc = $(".tixian-con").find(".addnew").find("img").prop("src");
		var chooseBankCode = $(".tixian-con").find(".addnew").find("a").prop("id");
		$("#choosedBank").prop("src",chooseBankSrc);
		$("#bankcode").val(chooseBankCode);
	    if (chooseBankCode === "ZFB" || chooseBankCode === "CFT") {
	        $(".bankcss").hide();
	    } else {
	        $(".bankcss").show();
	    }

	    $(".buyinfo-shade-next").show();
	});
	// 重新选择银行卡
	$("#reChooseBankBtn").click(function(){
		$(".buyinfo-shade-next").hide();
		$(".buyinfo-shade").show();
	});
	
	$("#tixian-spanhid,#tixian-spanhid1").click(function() {
		$(".buyinfo-shade").hide();
		$(".buyinfo-shade-next").hide();
	});
	$(".close-bangding").click(function() {
		$(".yiwanka-zhezhao1").hide();
		$(".yiwanka-zhezhao2").hide();
	});
	$(".lock-wankacard").click(function() {
		$(".yiwanka-zhezhao1").hide();
		$(".yiwanka-zhezhao2").hide();
		$(".buyinfo-shade").show();
	});
	$(".click-checkalter").click(function() {
		$(".yiwanka-zhezhao1-change").show();
		$(".yiwanka-zhezhao2-change").show();
	});

    $("#ddlprovice").change(function() {
        $("#ddlcity option:not(:first)").remove();
        var url = "GetCitys.ashx?id=" + new Date().getTime();
        var provincecode = $("#ddlprovice option:selected").val();
        var sendData = { "provincecode": provincecode };
        $.post(url, sendData, function (json) {
            for (var i = 0; i < json.length; i++) {
                $("#ddlcity").append($("<option value=" + json[i].citycode + ">" + json[i].cityname + "</option>"));
            }
        });
    });

    $("input[name='accountid']").click(function () {
        if ($(this).attr("adddetail") === "1") {
            var url = "GetSettleAccoutInfo.ashx?id=" + new Date().getTime();
            var id = $(this).val();
            var sendData = { "id": id };
            $.post(url, sendData, function (json) {
                var chooseBankSrc = "/content/themes/style/images/bank/" + json.bankcode + ".jpg";
                $("#choosedBank").prop("src", chooseBankSrc);
                $("#bankcode").val(json.bankcode);
                $("#accountno").val(json.accountno);
                $("#optype").val("1");
                $("#settleaccoutid").val(json.id);
            });

            $(".buyinfo-shade-next").show();
        }
        
    });
});
</script>
</html>