<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Applycash.aspx.cs" Inherits="API.WebUI201509.Finance.Applycash" %>

<%@ Register Src="~/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>提现申请|口袋支付</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
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
					<p class="p2"><span style="color:#999999; font-weight:bold;">您好，</span><%=UserName%></p>
					<p class="p3">您可提现金额：<span style="color:#454d69;font-weight:bold;"><%=UserBalance %>元</span></p>
				</div>
				<div class="withdrawals-one">
					<p class="p1" style="width:85px; text-align:center;">提现金额:</p>
					<p class="p2" style="width:160px;">
						<span>
							<input id="applymoney" name="applymoney" type="text" placeholder="请输入提现金额" class="yxkeleyi" style="width:120px;">
						</span>&nbsp;&nbsp;&nbsp;元</p>
					<p class="p3" style="width:auto; "><span></span></p>
				</div>
				<div class="withdrawals-two">
					<div class="p1" style=" width:85px; height:40px; color:#666666; line-height:40px; text-align:center; color:#999999; font-size:12px;">选择卡号</div>
					<div class="bank">
							<div class="choose-bank" style="width:734px; height:<%=GetHeight()%>px; overflow:hidden;">
							    <% if (CurrentUser.bindstatus == 0)
							       { %>
								<label class="empty-label">
									<span>您还没有绑定任何银行卡！</span>
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
							<p class="add-bankcard click-checkout">添加银行卡</p>
							<p class="add-bankcard click-checkalter" style=" margin-left:8px;">更改银行卡</p>
							<p class="more-bankcard"><span class="span1">更多</span><span class="span2 up"></span></p>
						</div>
					</div><!--withdrawals-two-->
				</div>
				<font color="#FF0000"><b>支付宝提现方式到账较慢，请慎重选择</b></font>
				<div class="withdrawals-one" style="border-bottom: none;">
					<p class="p1" style=" width:85px; text-align:center;">交易密码：</p>
					<p class="p2" style="width:auto;">
						<span>
							<input id="tradepsw" name="tradepsw" type="hidden" class="yxkeleyi" style="width:175px;color:#666666;">
							<input id="showtradepsw" name="showtradepsw" type="password" autocomplete="off" class="yxkeleyi" style="width:175px;color:#666666;">
							<a href="/security/securitycenter/findTradepsw.aspx" tabindex="-1" class="findpsw">忘记密码?</a>
						</span>
					</p>
					<p class="p3">
						<span></span>
					</p>
				</div>
				<div class="withdrawals-one">
				<p class="p1" style=" width:85px; text-align:center;">验证码：</p>
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
					       { %><input id="applycashbtn" type="button" value="确定提现" class="submit-btn-disabled"  disabled="disabled" /><% } %>
                        <%else{ %>
                         <input id="applycashbtn" type="button" value="确定提现" class="submit-btn"/>
                        <% } %>

					   
					</div>
				</div>
				<div class="withdrawals-produce">
					<p style="font-size: 15px;font-weight: bold;"> 帮助信息 </p>
					<p>(一)：支持银行：工行、农行、建行、中行、招商、民生、支付宝等热门银行</p>
					<p>(二)：结算金额：单笔提现最低10元，银行卡提现单笔最高限额小于5万</p>
					<p>(三)：手续费：全免手续费</p>
					<p> (四)：提现次数：<p>
					<p style="text-indent: 40px;">单笔提现金额大于等于500元，不限制提现次数 </p>
					<p> (五)：出款时间：早9:00--晚22:00，在线API两小时内到，点卡交易5分钟左右到账</p>
					<p style="text-indent: 40px;">晚22:00之后申请的结算，次日9：00一并处理 </p>
				</div>
		</div><!--withdrawals-->
        </form>
		</div><!--goods-total-->
		<div class="yiwanka-zhezhao1 yiwanka-zhezhao1-change" style="display:none" ></div>
		<div class="yiwanka-zhezhao2 yiwanka-zhezhao1-change"  style="display:none" >
			<div class="yiwanka-zhezhao2-con">
				<p style="width:500px; border-bottom:#c5c5c5 1px solid"><span style="float:left; font-size:16px; font-weight:bold;">更改银行卡的步骤如下</span><span class="close-bangding" style="float:right; cursor:pointer;"><img src="/content/themes/style/images/bangding01.jpg"></span></p>
				<p style="margin-top:35px;font-weight: bold;">第一步：重新认证实名信息</p>
				<p>（注意：实名认证信息修改后，之前绑定的所有银行卡将全部删除）</p>
				<p style="font-weight: bold;">第二步：重新绑定新的银行卡</p>
				<p>（银行卡名字须跟实名信息的名字一致）</p>
				<p style="width:110px; margin-top:30px;">请联系商务更改</p>
			</div>
		</div>
		<% if (CurrentUser.bindsettleaccout == 0)
		   { %>
		<!-- 如果还没有绑定任何银行卡的话，弹出层提示绑定 -->
		<div class="yiwanka-zhezhao1"></div>
			<div class="yiwanka-zhezhao2" >
				<div class="yiwanka-zhezhao2-con">
					<p style="width:500px; border-bottom:#c5c5c5 1px solid">
						<span style="float:left; font-size:16px; font-weight:bold;">友情提示</span>
						<span class="close-bangding" style="float:right; cursor:pointer;">
							<img src="/content/themes/style/images/bangding01.jpg"></span>
					</p>
					<p style="margin-top:35px;">亲爱的商户，您需要添加银行卡后才能进行提现操作，</p>
					<p>请点击"添加银行卡"来绑定银行卡至您的账户，</p>
					<p>感谢您的支持与配合！</p>
					<p style="width:110px; margin-top:30px;"><a href="#" class="lock-wankacard">绑定银行卡</a></p>
				</div>
			</div>
        <% } %>

		<div class="buyinfo-shade">
			<div style="width:100%; height:100%; background-color:#666666; opacity:0.5; position:absolute; top:0;"></div>
			<div style="width:100%; height: auto; background: none; position:absolute; top:50px;">
			<div class="buyinfo-shade-con" style="margin:0 auto; background-color:#ffffff;">
				<div class="buyinfo-shade-h3" style="width:730px; font-size:16px; height:45px; line-height:45px; border-bottom:#c5c5c5 1px solid; margin:0 auto">
					<span style=" float:left;">合作银行</span>
					<span style=" float:right; cursor:pointer;" id="tixian-spanhid">
						<img src="/content/themes/style/images/del.jpg" style="margin-top:17px;">
					</span>
				</div>
				<div class="tixian-con">
					<ul>
						<li style="opacity: 1;" class="addnew"><a href="#" id="ICBC"><img src="/content/themes/style/images/bank/icbc.jpg" ></a></li>
						<!--<li><a href="#" id="ZFB"><img src="/content/themes/style/images/bank/zfb.jpg"></a></li>
                        <li><a href="#" id="CFT"><img src="/content/themes/style/images/bank/cft.jpg"></a></li>-->
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
					<p style="width:100%; height:40px; float:left;"><a id="chooseBankCardBtn" href="#" class="tixian-next">下一步</a></p>
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
						<span style=" float:left;">绑定卡号</span>
						<span style=" float:right; cursor:pointer;" id="tixian-spanhid1">
							<img src="/content/themes/style/images/del.jpg" style="margin-top:17px;">
						</span>
					</div>
					<div class="bundling-one" style=" height:40px;">
						<p class="p1">所选银行：</p>
						<p class="p2">
							<span>
								<input id="bankcode" name="bankcode" type="hidden"/>
                                <input id="optype" name="optype" type="hidden" value="0"/>
                                <input id="settleaccoutid" name="settleaccoutid" type="hidden" value="0"/>
								<img id="choosedBank" src="" >
							</span>
							<i style="float:left; color:#999999; margin-left:10px;">储蓄卡</i></p>
						<p class="p3">
							<a id="reChooseBankBtn" href="javascript:void(0);" style=" color:#54b8ad; text-decoration:underline;">重新选择</a>
						</p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">姓名：</p>
						<p class="p2">
							<span style="width:135px; border:#d5d5d5 1px solid; height:33px;background-color:#ffffff;color:#999999; "><%= UserFullName %></span>
							<i style="float:left; font-size:12px; color:#999999; margin-left:10px;"></i>
						</p>
						<p class="p3"><a href="/security/securitycenter/rebindidno.aspx" style=" color:#54b8ad; text-decoration:underline">重新实名认证</a></p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">身份证：</p>
						<p class="p2" style="width:185px">
							<span style="width:180px; border:#d5d5d5 1px solid; height:33px;background-color:#ffffff;  color:#999999;"><%= UserViewIdCard %></span>
						</p>
						<p class="p3"><i style="float:left; font-size:12px; color:#999999; margin-left:10px;"></i></p>
					</div>
                    <div class="bundling-one bankcss" style="height:25px;">
						<p class="p1">类型：</p>
						<p class="p2 parentCls">
							<input type="radio" name="cardtype" value="0" checked="checked"/>对私
                            <input type="radio" name="cardtype" value="1" />对公
						</p>
						<p class="p3"><span></span></p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">卡号：</p>
						<p class="p2 parentCls" style="width:185px;">
							 <input id="accountno" name="accountno" type="text" class="inputElem yxkeleyi" style="width:180px;"/>
						</p>
						<p class="p3"><span></span></p>
					</div>
                    <div class="bundling-one bankcss" style="height:25px;">
						<p class="p1">开户行：</p>
						<p class="p2" style="width:285px;">
							 <select id="ddlprovice" name="provice" class="provicevalidator" style="float:left;height: 20px">
							     <%=ddlproviceValues %>
							 </select>
                            &nbsp; &nbsp;
                            <select id="ddlcity" name="city"  class="cityvalidator" style="float: left;height: 20px">
							     <option >--城市--</option>
							 </select>
                           
						</p>
						<p class="p3"><span></span></p>
					</div>
                    <div class="bundling-one bankcss" style="height:25px;">
						<p class="p1">分行：</p>
						<p class="p2" style="width:185px;">
							 <input id="bankAddress" name="bankAddress" type="text" class="inputElem yxkeleyi bankAddressvalidator" style="width:180px;"/>
						</p>
						<p class="p3"><span></span></p>
					</div>
					<div class="bundling-one" style="height:25px;">
						<p class="p1">验证码：</p>
						<p class="p2">
							 <input id="captchacode" name="captchacode" type="text" class="inputElem yxkeleyi" style="width:100px;float:left;height:32px;margin-right:5px;text-indent: 10px;"/>
							 <img id="cimg" src="/captchacode.ashx" onclick="refreshcaptchacode(this)" style="width:90px; height:35px;line-height:35px; text-align:center;cursor: pointer;" title="看不清？点击更换另一个。" />
						</p>
						<p class="p3"><span></span></p>
					</div>
					<div class="bundling-one" style="height:25px; width:110px; margin:0 auto; margin-top:40px;">
						<input id="bindBankBtn" type="button" value="确认绑定" class="submit-btn" />
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
    <script type="text/javascript" src="/Scripts/js/financeApplyCash.js?t=2020"></script><script type="text/javascript">
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
				$(this).find(".span1").text("收起");
			} else {
				$(".choose-bank").css("overflow","hidden").stop().animate({height:"124px"},500);
				$(this).find(".span2").removeClass("down").addClass("up");
				$(this).find(".span1").text("更多");
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