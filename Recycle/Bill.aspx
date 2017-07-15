<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="API.WebUI201509.Recycle.Bill" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Card bills|Kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />

    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    
     <style type="text/css">
        .Mir_List { width: 100%;height: auto;margin-top: 5px;}
        .Mir_List .M_Item{width: 100%;height: 25px;overflow: hidden;background: #F5F5F5;}
        .Mir_List .Pub{background: #ffffff;}
        .Mir_List .Head{color: #fff;font-weight: bold;}
        .Mir_List .M_Item ul{padding: 0px;margin: 0px;}
        .Mir_List li{ margin: 2px;height: 25px;line-height: 25px;float: left;list-style-type: none;}
        .Mir_List .li_0{text-align: right;width: 102px;overflow: hidden;}
        .Mir_List .li_1{overflow: hidden;width: 180px;}
        .Mir_List .li_2{text-align: right;width: 100px;overflow: hidden;}
        .Mir_List .li_3{overflow: hidden;}


	.button_list,.bianji_list,.bianji_list li a{
	width:auto;
}





    </style>
</head>
    <body>
<div class="yiwanka">
	<!-- 头部 -->
	<uc1:Header runat="server" id="Header1"/>
    <!-- 菜单 -->
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="3-0" />

    <div class="yiwanka-con-right">
		<div class="yiwanka-jifen-title">
			<p>Point card order</p>
		</div>
		<div class="yiwanka-dingdan">
		<form id="searchForm">
		    <input name="stype" type="hidden" value="bill"/>
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">System serial number：</span>
					<span class="span2">
						<input name="billid" id="billid" type="text" class="littlelong" />
					</span>
				</p>
				<p>
					<span class="span1">User order number：</span>
					<span class="span2">
						<input name="userorderid" id="userorderid" type="text" class="littlelong" />
					</span>
				</p>
				<p>
					<span class="span1">Recharge card number：</span>
					<span class="span2">
						<input name="cardsn" id="cardsn" type="text" class="littlelong" />
					</span>
				</p>
			</div>
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">Card species：</span>
					<span class="span2">
						<select name="cardid">
							<option value="">---please choose---</option>
						<%=options%>
							</select>
					</span>
				</p>
				<p><span class="span1">status：</span>
					<span class="span2">
						<select name="stateid">
							<option value="">---please choose---</option>
							<option value="succ">success</option>
							<option value="fail">failure</option>
							<option value="process">Processing</option>
							<option value="cardhaverecord">The card has a processing record</option>
						</select>
					</span>
				</p>
			</div>
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">Submission Time：</span>
					<span class="span2">
						<input id="ordertimestart" name="ordertimestart" type="text" class="littlelong_bl date" />
					</span>
				</p>
				<p>
					<span class="span1" style="text-align:center;">----</span>
					<span class="span2">
						<input id="ordertimeend" name="ordertimeend" type="text" class="littlelong_bl date" />
					</span>
				</p>
			</div>
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">transaction hour：</span>
					<span class="span2">
						<input name="endtimestart" id="endtimestart" type="text" class="littlelong_bl date" />
					</span>
				</p>
				<p>
					<span class="span1" style="text-align:center;">----</span>
					<span class="span2">
						<input name="endtimeend" id="endtimeend" type="text" class="littlelong_bl date" />
					</span>
				</p>
			</div>
			<div style="width:100%;margin-top:20px;height:35px;">
				<a id="btn_query" name="btn_query" href="javascript:void(0);" style="width:15%;margin:0 auto; display:block; background-color:#1597ed;height:35px; line-height:35px;border-radius:5px; color:#ffffff;  ">Inquire Now</a>
			</div>
		</form>
		</div>
		<div style="width: 97%;">
		<div class="toolbar">
			<ul class="bianji_list fr">
				<li>
					<div class="edit buttonDiv">
						<a href="#" class="buttonDiv-link">Edit the display items</a>
					</div>
					<div class="zhanshi">
						<ul id="toggle_columns"></ul>
					</div>
				</li>
			</ul>
			<ul class="button_list fl">
				<li><a href="###" id="btn_statistics" class="ck_tongji">View statistics</a></li>
				<li><a href="###" id="btn_export">Export the list</a></li>
			<div class="clear"></div>
			</ul>
		</div>
		<div class="tongji" id="statistics">
			<a href="###" class="shouqi fr">Put away</a>
			<p>
				The total number of transactions： <b><span id="tradecnt">0</span> </b> 
				The total amount of face value submitted by the pen：<b><span id="facevalue">0</span></b>yuan 
				Total actual face value：<b><span id="realvalue">0</span> </b> yuan  
				Total Settlement：<b><span id="clearmoney">0</span> </b> yuan
			</p>
		</div>
		<div class="zhkd">
			<table id="dataTable" border="0" cellspacing="0" cellpadding="0"
				class="ly_tab yiwanka-dingdan-table">
				<thead>
					<tr class="hsbg">
						<th>System serial number</th>
						<th>Submit the serial number</th>
						<th>Card species</th>
						<th>province</th>
						<th>Recharge card number</th>
						<th>Recharge card password</th>
						<th>Submit face value</th>
						<th>True face value</th>
						<th>Settlement Amount</th>
						<th>result</th>
						<th>Submission Time</th>
						<th>transaction hour</th>
						<th>Custom information</th>
						<th>duration</th>
						<th>Notification of results</th>
						<th>Submit again</th>
						<th>Order Complaint</th>
                         <th>operating</th>
					</tr>
				</thead>
				<tbody id="toporder">
				</tbody>
			</table>
		</div>
		<div class="clear"></div>
	</div>
	</div>
</div>
        
        <div class="complain-shade" style="display:none;">
	<div class="complain-shade-zhezhao"></div>
	<div class="complain-shade-con complain-shade-con2" style="width:100%; position:absolute; top:0; height: auto;">
		<div class="complain-shade-con-content">
		<h3 id="emailTitle" class="complain-shade-con-title">order details</h3>
            <div class='Mir_List'>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>The system order number：</li>
                            <li class='li_1'><span id="lblsysOrderId"></span></li>
                            <li class='li_2'>Order category：</li>
                            <li class='li_3'><span id="lblisapi"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>Channel type：</li>
                            <li class='li_1'><span id="lblchannelId"></span></li>
                            <li class='li_2'></li>
                            <li class='li_3'></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>Merchant order number：</li>
                            <li class='li_1'><span id="lblOrderId"></span></li>
                            <li class='li_2'>User Submission Amount：</li>
                            <li class='li_3'><span id="lblfaceValue"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>Total number of notifications：</li>
                            <li class='li_1'><span id="lblnotifycount"></span></li>
                            <li class='li_2'>Notification Status：</li>
                            <li class='li_3'><span id="lblnotifystatus"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>interface：</li>
                            <li class='li_1'><span id="lblversion"></span></li>
                             <li class='li_0'>Remarks：</li>
                            <li class='li_1'><span id="lblnotice"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>Add time：</li>
                            <li class='li_1'><span id="lbladdtime"></span></li>
                            <li class='li_2'>Order Status：</li>
                            <li class='li_3'><span id="lblstatus"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>The actual amount：</li>
                            <li class='li_1'><span id="lblrealvalue"></span></li>
                            <li class='li_2'>Merchant rates：</li>
                            <li class='li_3'><span id="lblpayRate"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>Merchant Amount：</li>
                            <li class='li_1'><span id="lblpayAmt"></span></li>
                            <li class='li_2'>Complete time：</li>
                            <li class='li_3'><span id="lblcompletetime"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>Submit address：</li>
                            <li class='li_1'><span id="lblrefurl"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub' style="height:50px">
                        <ul>
                            <li class='li_0'>Asynchronous notification：</li>
                            <li class='li_3' style="width:400px;height:50px"><textarea id="lblresulturl" style="width:400px"></textarea></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>Remarks：</li>
                            <li class='li_1'><span id="lblmessage"></span></li>
                        </ul>
                    </div>
                <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>card number：</li>
                            <li class='li_1'><span id="lblcardno"></span></li>
                            <li class='li_2'>Card：</li>
                            <li class='li_3'><span id="lblcardpwd"></span></li>
                        </ul>
                    </div>
                </div>
		
		<p style="margin-top:10px;">
			<a href="#" class="a4" style="background-color:#6f7c94; height:40px; line-height:40px; margin-left:200px;">close</a>
		</p>
		</div>
	</div>
    </div>

<script type="text/javascript" src="/Scripts/jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.columnmanager.js"></script>
<script type="text/javascript" src="/international/Scripts/custom/dataTableCommon.js"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript" src="/Scripts/custom/core.js"></script>
<script type="text/javascript" src="/Scripts/custom/163css.js"></script>
<script type="text/javascript" src="/Scripts/datapicker/WdatePicker.js?t=2015"></script>
</body>
<script type="text/javascript">
	$(function(){
		var error = '';
		if (error != null && error != '') {
			alert('');
		}
		$(".adv-filiter-trigger").click(function() {
			$(this).toggleClass("opened");
			$(this).nextAll("dl.adv-filiter").slideToggle("fast");
		});
		loadDateWithSecond3($('#ordertimestart'), $('#ordertimeend'));
		datetimeformat($('#endtimestart'));
		datetimeformat($('#endtimeend'));
		loadBind();
		initDataTable();
		$('#dataTable').dtColumnManager({
			"listTargetID" : "toggle_columns"
		});
		loadStatistics();
		loadExport();
		$("#dataTable").refreshData();
		
		$(".a11").click(function(){
			var suoyin =$(".yiwanka-write-bottom").find($(this).parents(".yiwanka-write-bottom-con")).index();
			$(".yiwanka-write-top > p").eq(suoyin+1).find(".span1,.span2").addClass("span1add");
			$(".yiwanka-write-top > p").eq(suoyin).find(".span1,.span2").removeClass("span1add");
			$(".yiwanka-write-bottom > div").eq(suoyin+1).show().siblings().hide();
		});

		$(".complain-shade-con2 .a4").click(function () {
		    $(".complain-shade").hide();
		});
	});
	
	loadStatistics = function() {
		// Query stats
		$('#btn_statistics').click(function(e) {
			e.preventDefault();
			var postData = $('#searchForm').serializeArray();
			ajaxreq({
				url : "/recycle/statisticsRecycleBill.ashx",
				data : postData,
				success : function(json) {
					if (json.result == 'ok') {
						$('#tradecnt').html(json.data.tradecnt);
						$('#facevalue').html(json.data.facevalue);
						$('#realvalue').html(json.data.notifyvalue);
						$('#clearmoney').html(json.data.clearmoney);
						$('#statistics').show();
					} else {
						dialog_simple_fail(json.msg);
						alert(json.msg);
					}
				},
				error : function() {
				}
			});
		});
	};
	loadExport = function() {
		// Export the list
		$('#btn_export')
				.click(
						function(e) {
							e.preventDefault();
							var postData = $('#searchForm').serialize();
							window.open('/recycle/exportRecycleBill.aspx?'+ postData);
						});
	};
	loadBind = function() {
		// Inquire
		$("#btn_query").click(function() {
			$("#dataTable").refreshData();
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
		var url = "/recycle/listbill.ashx";
		$('#dataTable').comDataTable(
						{
							"sAjaxSource" : url,
							"bSort" : true, // Sort function
							"fnServerData" : function(sSource, aoData,fnCallback) {
								var postData = aoData.concat($('#searchForm').serializeArray());
								ajaxreq({
									url : sSource,
									data : postData,
									success : function(json) {
										if (json.result == 'ok') {
											fnCallback(json.data);
											//$('#btn_statistics').click();
										} else {
											dialog_simple_fail(json.msg);
											alert(json.msg);
										}
									}
								});
							},
							"aoColumns" : [
									{
										"sName" : "billid",
										"mDataProp" : "billid"
									},
									{
										"sName" : "userorderid",
										"mDataProp" : "userorderid"
									},
									{
										"sName" : "cardname",
										"mDataProp" : function(aData, type,
												val) {
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
											html = '<a href="'+url+'" target="_blank" style="color: #2261A0;">'
													+ aData.cardname
													+ '</a>';
											return html;
										},
										"bSortable" : false
									},
									{
										"sName" : "province",
										"mDataProp" : "province",
										"bSortable" : false
									},
									{
										"sName" : "cardsn",
										"mDataProp" : "cardsn",
										"bSortable" : false
									},
									{
										"sName" : "cardpsw",
										"mDataProp" : function(aData, type,val) {
											val = '<label id="cardpsw'+ aData.billid + '"';
											val += ' onclick="decrypt(\''
													+ aData.billid
													+ '\',\''
													+ aData.cardpsw
													+ '\');" style="color: #2261A0;cursor:pointer;">Decryption';
											val += '</label>';
											return val;
										},
										"bSortable" : false
									},
									{
										"sName" : "facevalue",
										"mDataProp" : "facevalue",
										"bSortable" : false
									},
									{
										"sName" : "notifyvalue",
										"mDataProp" : "notifyvalue",
										"bSortable" : false
									},
									{
										"sName" : "clearmoney",
										"mDataProp" : function(aData, type,val) {
											return aData.clearmoney;
										},
										"bSortable" : false
									},
									{
										"sName" : "notifymsg",
										"mDataProp" : function(aData, type,val) {
										    if (aData.flag == 1) {
										        if (aData.success == 1) {
										            return '<font color="blue">'
                                                            + 'payment successful'
                                                            + '</font>';
										        }
										        else if (aData.success == 0) {
										            return '<font color="red">'
                                                            + 'failure[' + aData.notifymsg + ']'
                                                            + '</font>';
										        }
										    }
										    return 'Processing';
										},
										"bSortable" : false
									},
									{
										"sName" : "ordertime",
										"mDataProp" : "ordertime"
									},
									{
										"sName" : "endtime",
										"mDataProp" : "endtime",
										"bSortable" : false,
										"bVisible" : false
									},
									{
										"sName" : "attach",
										"mDataProp" : "attach",
										"bVisible" : false,
										"bSortable" : false
									},
									{
										"sName" : "usedtime",
										"mDataProp" : "usedtime",
										"bSortable" : false
									},
									{
										"sName" : "",
										"mDataProp" : function(aData, type,val) {
											val = '';
											val += '<a href="javascript:" onclick="notify(\''
													+ aData.billid
													+ '\')" class="show_click" >Notification of results</a>';
											return val;
										},
										"bVisible" : false,
										"bSortable" : false
									},
									{
										"sName" : "",
										"mDataProp" : function(aData, type,val) {
											val = '';
											val += '<a href="javascript:" onclick="submitagain(\''
													+ aData.billid
													+ '\')" class="ddts" >Submit again</a>';
											return val;
										},
										"bVisible" : false,
										"bSortable" : false
									},
									{
										"sName" : "",
										"mDataProp" : function(aData, type,
												val) {
											val = '';
											val += '<a href="/user/msgboxlist.aspx?billId='
													+ aData.billid
													+ '" class="zctj" >Order Complaint</a>';
											return val;
										},
										"bSortable" : false
									} ,
								{
								    "sName": "",
								    "mDataProp": function (aData, type, val) {
								        val = '';
								        val = val
								            + '<a href="#" class="a1" onclick= "openDetail(\''
								            + aData.billid
								            + '\')">View</a>&nbsp;';
								        if (aData.success == 1) {
								            val += '<a href="#" class="a1" onclick= "notify(\''
								                + aData.billid
								                + '\')">Replacement</a>&nbsp;';
								        }
								        return val;
								    },
								    "bSortable": false
								}],

							"aaSorting" : [ [ 0, "desc" ] ]

						});
	};
	function notify(billid) {
		var postData = 'billid=' + billid;
		ajaxreq({
			type : "get",
			url : "/recycle/notify.ashx",
			data : postData,
			success : function(json) {
				alert(json.msg);
			},
			error : function() {
			}
		});
	}
	function submitagain(billid) {
		var postData = 'billid=' + billid;
		ajaxreq({
			type : "post",
			url : "/recycle/submitagain.ashx",
			data : postData,
			success : function(json) {
				alert(json.msg);
			},
			error : function() {
			}
		});
	}

	function openDetail(sysOrderId) {
	    var source = '/Recycle/card/OrderDetail.ashx?sysOrderId=' + sysOrderId;
	    $.ajax({
	        url: source,
	        success: function (json) {
	            if (json.result == 'ok') {
	                var obj = json.data;
	                $("#lblsysOrderId").text(obj.sysOrderId);
	                $("#lblisapi").text(obj.useApiText);
	                $("#lblchannelId").text(obj.channelName);
	                //$("#lblBankName").text(obj.bankName);
	                $("#lblOrderId").text(obj.orderId);
	                $("#lblfaceValue").text(obj.faceValue);
	                $("#lblnotifycount").text(obj.report);
	                $("#lblnotifycontext").text(obj.callbackText);
	                $("#lblversion").text(obj.versionText);
	                $("#lblnotice").text(obj.notic);
	                $("#lbladdtime").text(obj.addtime);
	                $("#lblstatus").text(obj.StatusText);
	                $("#lblrealvalue").text(obj.payMoney);
	                $("#lblpayRate").text(obj.commission);
	                $("#lblpayAmt").text(obj.usersettleAmt);
	                $("#lblcompletetime").text(obj.updateTime);
	                $("#lblresulturl").text(obj.result_url2);
	                //if (obj.flag == 1) {
	                //    $("#lblresulturl").text(obj.result_url2);
	                //}
	                //$("#lblrefurl").text(obj.lblrefurl);

	                $("#lblmessage").text(obj.errorMsg);
	                $("#lblcardno").text(obj.cardId);
	                $("#lblcardpwd").text(obj.cardPass);
	                $(".complain-shade").show();
	            } else {
	                alert(json.msg);
	            }
	        }
	    });
	}
</script>
</html>
