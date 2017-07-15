<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankBill.aspx.cs" Inherits="API.WebUI201509.Recycle.BankBill" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Bankbills|Kdpay</title>
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
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="3-1" />

    <div class="yiwanka-con-right">
		<div class="yiwanka-jifen-title">
			<p>Online banking orders</p>
		</div>
		<div class="yiwanka-dingdan">
		<form id="searchForm">
		    <input name="stype" type="hidden" value="bankbill"/>
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
					<span class="span1">Channel type：</span>
					<span class="span2">
						<select name="cardid">
							<option value="">---please choose---</option>
							<option value="1">online banking</option>
							<option value="2">Alipay</option>
							<option value="3">TenPay</option>
							<option value="21">WeChat payment</option>
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
					<span class="span1">transaction Time：</span>
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
				items The total amount of the pen submission：<b><span id="facevalue">0</span></b>yuan 
				Pay the total amount of success：<b><span id="realvalue">0</span> </b>yuan  
				Total Settlement：<b><span id="clearmoney">0</span> </b> yuan
			</p>
		</div>
		<div class="zhkd">
			<table id="dataTable" border="0" cellspacing="0" cellpadding="0"
				class="ly_tab yiwanka-dingdan-table">
				<thead>
					<tr class="hsbg">
						<th>System serial number</th>
						<th>Merchant order number</th>
						<th>Channel type</th>
						<th>Bank name</th>
						<th>Submit face value</th>
						<th>True face value</th>
						<th>Settlement Amount</th>
						<th>result</th>
						<th>Submission Time</th>
						<th>transaction hour</th>
						<th>Custom information</th>
						<th>Notification of results</th>
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
<script type="text/javascript" src="/Scripts/jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.columnmanager.js"></script>
<script type="text/javascript" src="/international/Scripts/custom/dataTableCommon.js"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript" src="/Scripts/custom/core.js"></script>
<script type="text/javascript" src="/Scripts/custom/163css.js"></script>
<script type="text/javascript" src="/Scripts/datapicker/WdatePicker.js?t=2015"></script>
        
        
         <div class="complain-shade" style="display:none;">
	<div class="complain-shade-zhezhao"></div>
	<div class="complain-shade-con complain-shade-con2" style="width:100%; position:absolute; top:0; height: auto;">
		<div class="complain-shade-con-content">
		<h3 id="emailTitle" class="complain-shade-con-title">订单详情</h3>
            <div class='Mir_List'>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>系统订单号：</li>
                            <li class='li_1'><span id="lblsysOrderId"></span></li>
                            <li class='li_2'>订单类别：</li>
                            <li class='li_3'><span id="lblisapi"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>通道类型：</li>
                            <li class='li_1'><span id="lblchannelId"></span></li>
                            <li class='li_2'>银行名称：</li>
                            <li class='li_3'><span id="lblBankName"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>商户订单号：</li>
                            <li class='li_1'><span id="lblOrderId"></span></li>
                            <li class='li_2'>用户提交金额：</li>
                            <li class='li_3'><span id="lblfaceValue"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>通知总次数：</li>
                            <li class='li_1'><span id="lblnotifycount"></span></li>
                            <li class='li_2'>通知状态：</li>
                            <li class='li_3'><span id="lblnotifystatus"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>接口：</li>
                            <li class='li_1'><span id="lblversion"></span></li>
                             <li class='li_0'>备注：</li>
                            <li class='li_1'><span id="lblnotice"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>新增时间：</li>
                            <li class='li_1'><span id="lbladdtime"></span></li>
                            <li class='li_2'>订单状态：</li>
                            <li class='li_3'><span id="lblstatus"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>实际金额：</li>
                            <li class='li_1'><span id="lblrealvalue"></span></li>
                            <li class='li_2'>商家费率：</li>
                            <li class='li_3'><span id="lblpayRate"></span></li>
                        </ul>
                    </div>
                    <div class='M_Item Pub'>
                        <ul>
                            <li class='li_0'>商家金额：</li>
                            <li class='li_1'><span id="lblpayAmt"></span></li>
                            <li class='li_2'>完成时间：</li>
                            <li class='li_3'><span id="lblcompletetime"></span></li>
                        </ul>
                    </div>
      
                    <div class='M_Item'>
                        <ul>
                            <li class='li_0'>备注：</li>
                            <li class='li_1'><span id="lblmessage"></span></li>
                        </ul>
                    </div>
                </div>
		
		<p style="margin-top:10px;">
			<a href="#" class="a4" style="background-color:#6f7c94; height:40px; line-height:40px; margin-left:200px;">close</a>
		</p>
		</div>
	</div>
    </div>
</body>
<script type="text/javascript">
    $(function () {
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
		// 查询统计
		$('#btn_statistics').click(function(e) {
			e.preventDefault();
			var postData = $('#searchForm').serializeArray();
			ajaxreq({
				url : "/recycle/bank/statisticsRecycleBill.ashx",
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
		// 导出列表
		$('#btn_export')
				.click(
						function(e) {
							e.preventDefault();
							var postData = $('#searchForm').serialize();
							window.open('/recycle/bank/exportRecycleBill.aspx?' + postData);
						});
	};
	loadBind = function() {
		// 查询
		$("#btn_query").click(function() {
			$("#dataTable").refreshData();
		});
	};

	initDataTable = function() {
		var url = "/recycle/bank/listbill.ashx";
		$('#dataTable').comDataTable(
						{
							"sAjaxSource" : url,
							"bSort" : true, // 排序功能
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
										"mDataProp" : "cardname",
										"bSortable" : false
									},
									{
									    "sName": "bankName",
									    "mDataProp": "bankName",
										"bSortable" : false
									}
									,
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
										"mDataProp" : function(aData, type,
												val) {
											val = '';
											val += '<a href="/user/msgboxlist.aspx?billId='
													+ aData.billid
													+ '" class="zctj" >Order Complaint</a>';
											return val;
										},
										"bSortable" : false
									},
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
			url : "/recycle/bank/notify.ashx",
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
			url: "/recycle/bank/submitagain.ashx",
			data : postData,
			success : function(json) {
				alert(json.msg);
			},
			error : function() {
			}
		});
	}

	function openDetail(sysOrderId) {
	    var source = '/Recycle/Bank/OrderDetail.ashx?sysOrderId=' + sysOrderId;
	    $.ajax({
	        url: source,
	        success: function (json) {
	            if (json.result == 'ok') {
	                var obj = json.data;
	                $("#lblsysOrderId").text(obj.sysOrderId);
	                $("#lblisapi").text(obj.useApiText);
	                $("#lblchannelId").text(obj.channelName);
	                $("#lblBankName").text(obj.bankName);
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
	                $("#lblresulturl").text(obj.result_url);
	                if (obj.Success == 1) {
	                    $("#lblresulturl").text(obj.result_url2);
	                }
	                //$("#lblrefurl").text(obj.lblrefurl);
	                
	                $("#lblmessage").text(obj.errorMsg);
	                $(".complain-shade").show();
	            } else {
	                alert(json.msg);
	            }
	        }
	    });
	}
</script>
    
   
</html>
