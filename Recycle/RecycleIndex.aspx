<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecycleIndex.aspx.cs" Inherits="API.WebUI201509.Recycle.RecycleIndex" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Supply|Kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
</head>
<body>
<div class="yiwanka">
	<!-- 头部 -->
	<uc1:Header runat="server" id="Header1"/>
    <!-- 菜单 -->
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="2" />
    
    <div class="yiwanka-con-right">	
		<div class="yiwanka-con-right-content">
			<div class="yiwanka-fahuo1">
				<span id="submit_type_zhineng" class="spanactive">Smart Submission</span>
				<span id="submit_type_normal" >Ordinary Submission</span>	
			</div>
			<div class="yiwanka-fahuo2">
				<div class="zhineng">
					<form id="batchForm" method="post" class="jqtransformdone">
	<input type="hidden" id="cardid" name="cardid" value="allcard" />
	<input type="hidden" id="facevalue" name="facevalue" value="100" />
	<div class="danzhang-input">
		<div class="danzhang-1">
				<p class="p11">Select the face value:</p>
				<div class="danzhang-1-facevalue autofacevaluelist">
				<ul>
					<li><a href="javascript:void(0);">5</a>yuan</li>	
						<li><a href="javascript:void(0);">10</a>yuan</li>	
						<li><a href="javascript:void(0);">15</a>yuan</li>	
						<li><a href="javascript:void(0);">20</a>yuan</li>	
						<li><a href="javascript:void(0);">30</a>yuan</li>	
						<li><a href="javascript:void(0);">50</a>yuan</li>	
						<li style="margin-left:0px;" class="linew"><a href="javascript:void(0);">100</a>yuan</li>
						<li><a href="javascript:void(0);">200</a>yuan</li>	
						<li><a href="javascript:void(0);">300</a>yuan</li>	
						<li><a href="javascript:void(0);">1000</a>yuan</li>	
						</ul>
				</div>
		</div>
		<div class="danzhang-2">
				<p class="p11">Card Number: Password:</p>
				<div class="danzhang-ul zhineng-ul" style="text-align:left;">
					<textarea id="cardcontent" name="cardcontent" cols="" rows="" placeholder=" "
						style=" height:180px; width:95%; text-align:left; border:#7bb063 1px solid;"></textarea>
				</div>
		</div>
		<div class="danzhang-3">
			<p class="p11"></p>
			<span class="span33" style="width:50%;">
				<b style="font-size:13px;">
					<font style="color:#666666;">Has been entered<span id="autoCardNum">0 sheets</span>face value<span id="autoCardFaceValue">100 yuan</span>Of the recharge cards, each up to submit 100</font>
				</b>
			</span>
		</div>
		<div class="danzhang-3">
				<p class="p11">Remove characters:</p>
				<span class="span11" style="border:#92a3b5 1px solid;">
					<input id="customchar" name="customchar" placeholder="Custom Removes illegal chars" style="border:none; width:50%; margin-top:1px; margin-left:1px;">
					<a id="clearchar" href="javascript:void(0);" style="width:24%; height:38px; line-height:38px; background-color:#7793b0; color:#ffffff; float:left; text-align:center; margin-top:1px;">Del characters</a>
					<a id="cleanup" href="javascript:void(0);" style="width:24%; height:38px; line-height:38px; background-color:#7793b0; color:#ffffff; float: right; margin-right:1px; text-align:center; margin-top:1px;">Sort cards' code</a>
				</span>
				<span class="span22">Generally valid card number for the 17-22 bit, please enter the audit</span>
		</div>
		<div class="danzhang-3">
			<p class="p11"></p>
			<span class="span33" style="width:50%;">
				<a id="bacthSubmitBtn" href="javascript:void(0);" style="width:30%;">confirm submission</a>
				<input type="checkbox" disabled="disabled" checked="checked" style="margin-left:10px;">
				<b><a href="/gonghuoxieyi.aspx" target="_blank">Agreed to recharge card service agreement</a></b>
			</span>
		</div>
	</div>
	<div class="danzhang-4">
		<p class="weihu-imfo">
			<span class="title">Maintenance information</span>
			<span class="notice">
			</span>
		</p>
	</div>
	<div class="danzhang-3 danzhang-shuoming" style="float:left;">
		<div class="danzhang-zhushi zhineng-zhushi">
				<p style="color:#666666; font-size:14px; width:100%;">important hint</p>
				<p>one：Program automatically determine the recharge card type, without manual selection  </p>
				<p>two：The program automatically collates the card number password, removes the illegal character, only retains the card number password</p>
				<p>three：Custom illegal characters, you can specify the bulk removal of a character</p>
				<p>fore：Custom illegal characters, you can specify the bulk removal of a character</p>
				<p style="color:red;font-weight: bold;">five：Default face value of 100, a large face value card, please choose a good face value</p>
				<p>six：Batch submission Up to 100 cards can be submitted at one time</p>
				<p>seven：If the intelligent submission of judgment errors, please switch to the normal submission page recharge</p>
		</div>
	</div>
	</form>
<script type="text/javascript" src="/international/Scripts/js/recycleCardAuto.js?t=2"></script>
 <script type="text/javascript">
	var context_path = '';
</script></div>
				<div class="putong" style="display:none;">
					<form id="normalSubmitForm" method="post">
	<input type="hidden" id="cardid" name="cardid" value="ydszx" />
	<input type="hidden" id="facevalue" name="facevalue" value="100" />
	<div class="putong-top">
		<div class="putong-tab">
			<p class="p1">Select Quantity:</p>
			<p class="p2"><span class="spanactive1 single">Leaflets</span><span class="bacth">batch</span></p>
		</div>
	</div>
	<div class="putong-bottom" style="float:left;">
		<div class="danzhang">
			<div class="danzhang-input">
				<div class="danzhang-1">
					<p class="p11">Select the face value:</p>
					<div class="danzhang-1-facevalue normalfacevaluelist">
						<ul></ul>
					</div>
				</div>
				<div class="danzhang-2">
					<p class="p11">Select the card type:</p>
					<ul class="danzhang-ul cardtypelist">
                        <asp:Repeater ID="rptcards" runat="server">
                            <ItemTemplate>
                                <li id="<%#Eval("cardid")%>" <%#Container.ItemIndex==0?"class=\"li1 linew1\"":"" %>><a href="#"><span class="span1"><img src="/content/themes/style/images/kazhong_<%#Eval("channelId")%>.jpg"></span><span class="span2"><%#Eval("channelName")%></span></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
				<div class="active">
					<div class="danzhang-3">
						<p class="p11">card number:</p>
						<span class="span11"><input name="cardsn" id="cardsn" placeholder="Enter the card number" 
								onkeyup="this.value=this.value.replace(/[^\w\/]/ig,&#39;&#39;)"
								onblur="this.value=this.value.replace(/[^\w\/]/ig,&#39;&#39;)" maxlength="30"></span>
						<span id="cardsnmsg" class="span22" style="color:red;"></span>
					</div>
					<div class="danzhang-3">
						<p class="p11">password:</p>
						<span class="span11">
							<input type="text" name="cardpsw" id="cardpsw" placeholder="enter password" 
								onkeyup="this.value=this.value.replace(/[^\w\/]/ig,&#39;&#39;)"
								onblur="this.value=this.value.replace(/[^\w\/]/ig,&#39;&#39;)" maxlength="30"></span>
						<span id="cardpswmsg" class="span22" style="color:red;"></span>
					</div>
					<div class="danzhang-3">
						<p class="p11"></p>
						<span class="span33" style="width:50%;">
							<a id="singleSubmitBtn" href="javascript:void(0);" style="width:30%;">confirm submission</a>
							<input type="checkbox" disabled="disabled" checked="checked" style="margin-left:10px;">
							<b><a href="/gonghuoxieyi.aspx" target="_blank">Agreed to recharge card service agreement</a></b>
						</span>
					</div>
				</div>
				<div class="active" style="display:none;">
					<div class="danzhang-3 piliang-3">
						<p class="p11">Card Number: Password:</p>
						<span class="span11"><textarea id="cardcontent" name="cardcontent"></textarea></span>
					</div>
					<div class="danzhang-3">
						<p class="p11"></p>
						<span class="span33" style="width:50%;">
							<b style="font-size:13px;">
								<font style="color:#666666;">Has been entered<span id="normalCardNum">0Zhang</span>face value<span id="normalCardFaceValue">100 yuan </ span> prepaid card, each time up to submit 100</font>
							</b>
						</span>
					</div>
					<div class="danzhang-3">
						<p class="p11"></p>
						<span class="span33" style="width:50%;">
							<a id="moreSubmitBtn" href="javascript:void(0);" style="width:30%;">confirm submission</a>
							<input type="checkbox" disabled="disabled" checked="checked" style="margin-left:10px;">
							<b><a href="/gonghuoxieyi.aspx" target="_blank">Agreed to recharge card service agreement</a></b>
						</span>
					</div>
				</div>
			</div>
			<div class="danzhang-4">
				<p class="weihu-imfo">
					<span class="title">Maintenance information</span>
					<span class="notice"></span>
				</p>
			</div>
			<div class="danzhang-3 danzhang-shuoming">
				<div class="danzhang-zhushi">
					<p style="color:#666666; font-size:14px;">important hint</p>
					<p>one：Please try to use the original card number to submit, if their combination card number submitted. An error can not be queried</p>
					<p>two：If it is determined that the card number, password, card denomination input is correct, but the system prompts an error, please re-enter</p>
					<p>three：Please select the correct value of the submission, such as the nominal value is not recommended to choose a large par value, so as not to lose</p>
				</div>
			</div>
			<div class="danzhang-3 danzhang-shuoming" style="display:none;">
				<div class="danzhang-zhushi">
					<p style="color:#666666; font-size:14px;">important hint</p>
					<p>one：Batch submission Up to 100 cards can be submitted at one time</p>
					<p>two：Please be sure to choose the correct face value of the submission, if the wrong face value is lost can not be recovered </p>
					<p>three：Availability have any questions please contact customer service in a timely manner</p>
				</div>
			</div>
			</div>
		</div>
	</form>
<script type="text/javascript" src="/international/Scripts/js/recycleCardNormal.js?t=5"></script>

                    
                     <script type="text/javascript">
	var context_path = '';
</script></div>
			</div>
			<div class="yiwanka-bottom" style="float:left;">
	<div class="yiwanka-bottom-top">
		<ul>
			<li style="margin-left:0px; background-color:#8197a7;">
			<a href="#">The total number of transactions today：<span id="totaltradecnt">0</span>open</a></li>
			<li style="background-color:#a99b71;">
			<a href="#">Total face value submitted：<span id="totalfacevalue">0</span>yuan</a></li>
			<li style="background-color:#7ca47a;">
			<a href="#">Actual nominal value：<span id="totalrealvalue">0</span>yuan</a></li>
			<li style="background-color:#b18784;">
			<a href="#">Total settlement today：<span id="totalclearmoney">0</span>yuan</a></li>
			<li class="li2">
				<a id="btn_query" href="javascript:void(0)" style="height:40px; background-color:#35475a;">Refresh</a>
				<a href="/recycle/bill.aspx" style="float:right;background-color: #35475a;" target="_blank">Query all orders</a>
			</li>
		</ul>
	</div>
	<div class="yiwanka-bottom-bottom">
		<form id="searchForm">
		<input name="ordertimestart" id="ordertimestart" type="hidden" /> 
		<input name="ordertimeend" id="ordertimeend" type="hidden" />
		</form>
		<table id="m_orderlist" border="0" cellspacing="0" cellpadding="0"
		class="tablelist tcenter pusht datatable ">
		<thead>
			<tr class="hsbg">
				<th>Card species</th>
				<th>province</th>
				<th>province</th>
				<th>Card</th>
				<th>Submit face value</th>
				<th>True face value</th>
				<th>Settlement Amount</th>
				<th>Order Status</th>
				<th>Submission Time</th>
				<th>duration</th>
				<th>Submit again</th>
				<th>Order Complaint</th>
			</tr>
		</thead>
		<tbody id="toporder">
		</tbody>
	</table>
	</div>
</div>
<script type="text/javascript" src="/Scripts/jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.columnmanager.js"></script>
<script type="text/javascript" src="/international/Scripts/custom/dataTableCommon.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		loadBind();
		initDataTable();
		var d = new Date();
		$("#ordertimestart").val(
				d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
						+ d.getDate() + ' 00:00:00');
		$("#ordertimeend").val(
				d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
						+ d.getDate() + ' 23:59:59');
		setTimeout("$('#btn_query').click()", 1000);
		setInterval("$('#btn_query').click()", 90000);
	});
	loadBind = function() {
		// 查询
		$("#btn_query").click(
				function() {
					var d = new Date();
					$("#ordertimestart").val(
							d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
									+ d.getDate() + ' 00:00:00');
					$("#ordertimeend").val(
							d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
									+ d.getDate() + ' 23:59:59');
					$("#m_orderlist").refreshData();
					loadStatistics();
				});
	};
	function decrypt(billid, cardpsw) {
		var cardpsw = encodeURIComponent(cardpsw);
		var postData = 'cardpsw=' + cardpsw + '&billid=' + billid;
		ajaxreq({
			type : "post",
			url : "/recycle/decryptcardpsw.ashx",
			data : postData,
			success : function(json) {
				$('#cardpsw' + billid).html(json.msg);
			},
			error : function() {
			}
		});
	}
	initDataTable = function() {
		var url = "/recycle/listLatestTenBill.ashx";
		$('#m_orderlist')
				.comDataTable(
						{
							"sAjaxSource" : url,
							"sDom" : 'rft', // 元素布局
							"fnServerData" : function(sSource, aoData,fnCallback) {
								var postData = aoData.concat($('#searchForm').serializeArray());
								ajaxreq({
									url : sSource,
									data : postData,
									success : function(json) {
										if (json.result == 'ok') {
											fnCallback(json.data);
										} else {
										}
									}
								});
							},
							"aoColumns" : [
									{
										"sName" : "cardname",
										"mDataProp" : function(aData, type, val) {
											var html = '';
											var url = '';
											var cardid = aData.cardid;
											switch (cardid) {
											case 'ltykc':
												url = 'http://iservice.10010.com/oftenInfo.html?menuId=000400010004';
												break;
											case 'sdykt':
												url = 'https://pay.sdo.com/';
												break;
											case 'ztykt':
												url = 'http://pay.ztgame.com/index.html';
												break;
											case 'dxqgk':
												url = 'http://cq.189.cn/bill/bill.htm?id=6#IMG';
												break;
											case 'jyykt':
												url = 'http://pay.9you.com/funpay/index.php';
												break;
											case 'txykt':
												url = 'http://www.txtong.com.cn/txt_icard.php';
												break;
											case 'jwykt':
												url = 'http://www.jcard.cn/Bill/TradeSearch.aspx';
												break;
											case 'wyykt':
												url = 'http://ecard.163.com/script/login?refer_uri=%2Fscript%2Fsn_trans%2Fcheck_show';
												break;
											case 'thykt':
												url = 'http://kf.27399.com/login.aspx';
												break;
											case 'wmykt':
												url = 'http://pay.wanmei.com/e/jsp/query/queryUsedCard.jsp';
												break;
											case 'ydszx':
												url = 'http://www.sc.10086.cn/pay/bankpaymobile.jsp?type=5002';
												break;
											case 'qq':
												url = 'http://qd.qq.com/account/account_qqcard_query.shtml';
												break;
											default:
												url = '#';
											}
											html = '<a href="'+url+'" target="_blank">'
													+ aData.cardname + '</a>';
											return html;
										}
									},
									{
										"sName" : "province",
										"mDataProp" : "province"
									},
									{
										"sName" : "cardsn",
										"mDataProp" : "cardsn"
									},
									{
										"sName" : "cardpsw",
										"mDataProp" : function(aData, type, val) {
											val = '<label id="cardpsw'
													+ aData.billid + '"';
											val += ' onclick="decrypt(\''
													+ aData.billid
													+ '\',\''
													+ aData.cardpsw
													+ '\');" style="color: #2261A0;cursor:pointer;">Decryption';
											val += '</label>';
											return val;
										}
									},
									{
										"sName" : "facevalue",
										"mDataProp" : "facevalue"
									},
									{
										"sName" : "notifyvalue",
										"mDataProp" : "notifyvalue"
									},
									{
										"sName" : "clearmoney",
										"mDataProp" : function(aData, type, val) {
											return aData.clearmoney;
										}
									},
									{
										"sName" : "notifymsg",
										"mDataProp" : function(aData, type, val) {
											if (aData.stateid == '2'
													|| aData.stateid == '3'
													|| aData.stateid == '4') {
												return '<font color="blue">'
														+ aData.notifymsg
														+ '</font>';
											} else if (aData.stateid == '6'
													|| aData.stateid == '7'
													|| aData.stateid == '8'
													|| aData.stateid == '9'
													|| aData.stateid == '10'
													|| aData.stateid == '12') {
												if (aData.notifycode == '208') {
													return '<font color="#2E8B57">'
															+ aData.notifymsg
															+ '</font>';
												} else {
													return '<font color="red">'
															+ aData.notifymsg
															+ '</font>';
												}
											} else {
												return aData.notifymsg;
											}
										}
									},
									{
										"sName" : "ordertime",
										"mDataProp" : "ordertime"
									},
									{
										"sName" : "usedtime",
										"mDataProp" : "usedtime"
									},
									{
										"sName" : "",
										"mDataProp" : function(aData, type, val) {
											val = '';
											val += '<a href="javascript:" onclick="submitagain(\''
													+ aData.billid
													+ '\')" class="ddts">Submit again</a>';
											return val;
										}
									},
									{
										"sName" : "",
										"mDataProp" : function(aData, type, val) {
											val = '';
											val += '<a href="/user/msgboxlist.aspx?billId='
													+ aData.billid
													+ '" class="zctj">Order Complaint</a>';
											return val;
										}
									}

							],

							"aaSorting" : [ [ 13, "desc" ] ]

						});
	};
	loadStatistics = function() {
		// 查询统计
		var postData = $('#searchForm').serializeArray();
		ajaxreq({
			url : "/recycle/statisticsRecycleBill.ashx",
			data : postData,
			success : function(json) {
				if (json.result == 'ok') {
					$('#totaltradecnt').html(json.data.tradecnt);
					$('#totalfacevalue').html(json.data.facevalue);
					$('#totalrealvalue').html(json.data.notifyvalue);
					$('#totalclearmoney').html(json.data.clearmoney);
				} else {
				}
			},
			error : function() {
			}
		});
	};
	function submitagain(billid) {
		var postData = 'billid=' + billid;
		ajaxreq({
			type : "post",
			url : "/recycle/submitagain.ashx",
			data : postData,
			success : function(json) {
				alert(json.msg);
				$("#m_orderlist").refreshData();
			},
			error : function() {
			}
		});
	}
</script><!-- 弹出层 -->
			<div class="yiwanka-shade" style="display:none; margin-bottom: 0px;">
				<div class="yiwanka-shade-zhezhao" style="width:100%; height:100%;;position: relative;opacity:0.7; background-color:#a8a8a8;"></div>
				<div class="yiwanka-shade-con"  style=" width:400px;left:40%; z-index:600; position: absolute;top:0;">
					<h3 style="width:100%; height:30px; text-align:right;  background-color: #D6D6D6;">
						<span style="float:left;margin-left:10px;float: left;margin-left: 10px;font-weight: bold;color: #E58C15;font-size: 18px;cursor: default;">Submit confirmation</span>
						<a href="#" class="close-shadewaka"><img src="/content/themes/style/images/guanbi-waka.jpg"></a>
					</h3>
						<div id="confirmSubmitMsg" class="confirmMsg"></div>
						<p style="margin-top:10px;">
							<input id="confirmSubmitBtn" type="button" value="confirm">
							<input id="cancelSubmitBtn" type="button" value="cancel" style="margin-left:50px; background-color:#8ed0c9;">
						</p>
				</div>
			</div>
			<!-- 弹出层 -->
		</div>
	</div>

</div>
</body>
<script type="text/javascript">
$(function() {
	var error = '';
	if (error != null && error != '') {
		alert('');
	}
	
	// 加载维护信息
	loadnotice();
	
	// 弹出框确认提交
	$("#confirmSubmitBtn").click(function(){
		if($("#submit_type_zhineng").hasClass("spanactive")){
			// 智能提交
			zhinengConfirmSubmit();
		} else {
			// 普通提交
			normalConfirmSubmit();
		}
	});
	
	// 智能提交:弹出框取消提交
	$("#cancelSubmitBtn").click(function(){
		$(".yiwanka-shade").hide();
	});
	$(".close-shadewaka").click(function() {
		$(".yiwanka-shade").hide();
	});
	$(document).keydown(function(event) {
		if (event.keyCode == "27" || event.keyCode == "96") {
			if($(".yiwanka-shade").is(":visible")) {
				$(".yiwanka-shade").hide();
			}
		}
	});
	
	$(".yiwanka-fahuo1 span").click(function() {
		$(this).addClass("spanactive").siblings().removeClass("spanactive");
		var suoyin = $(this).index();
		$(".yiwanka-fahuo2 > div").eq(suoyin).show().siblings().hide();
	});
	
	$(".putong-tab .p2 span").click(function() {
		$(this).addClass("spanactive1").siblings().removeClass("spanactive1");
		var suoyin = $(this).index();
		$(".putong-bottom").find(".active").hide().eq(suoyin).show();
		$(".putong-bottom").find(".danzhang-shuoming").hide().eq(suoyin).show();
	});
	$(".danzhang-ul li").click(function() {
		$(this).addClass("linew1").siblings().removeClass("linew1");
	});
	$(".danzhang-1").on("click","ul li",function() {
		$(this).addClass("linew").siblings().removeClass("linew");
	});
})		

function loadnotice() {
    var sSource = '/recycle/listClosedRecycleCardRestrict.ashx?t='+Math.random();
    $.ajax({
    	type : "post",
        url: sSource,
        success: function(json) {
            if (json.result == 'ok') {
                var data = json.data;
                var html = '';
                if (data && data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        html += '<li style="width:100%;overflow:hidden;white-space:nowrap;">';
                        html += '<a href="javascript:void(0);" title="'+ data[i] +'" style="width:100%;">'+ data[i]+'</a></li>';
                    }
                } else {
                	  html += '<li style="width:100%;overflow:hidden;white-space:nowrap;">';
                      html += '<a href="javascript:void(0);" style="width:100%;">No maintenance information</a></li>';
                }
                $('.weihu-imfo .notice').html("<ul style='max-height:280px;overflow:auto;width:100%;'>"+html+"</ul>");
            }
        },
        error : function(){
        }
    })
}

function scrollTo($target){
	$(".yiwanka-con-right").animate({scrollTop:$target.offset().top},1000);
}
</script>
</html>