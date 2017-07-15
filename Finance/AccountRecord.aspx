<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountRecord.aspx.cs" Inherits="API.WebUI201509.Finance.AccountRecord" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Capital flow|Kdpay</title>

<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<style>
		.button_listm,
		.bianji_list,
		.button_list,
		.bianji_list li a
 {
   			 width: auto;
		}


	</style>


</head>
    <body>
<div class="yiwanka">
	<uc1:Header runat="server" id="Header1"/>
     <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="4-2" />
    <div class="yiwanka-con-right">
		<div class="yiwanka-dingdan-title">
			<p>Capital flow</p>
		</div>
		<div class="yiwanka-dingdan">
		<form id="searchForm">
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">Capital flow：</span>
					<span class="span2">
						<input name="recordid" id="recordid" type="text" class="littlelong" />
					</span>
				</p>
				<p>
					<span class="span1">System serial number：</span>
					<span class="span2">
						<input name="tradeno" id="tradeno" type="text" class="littlelong" />
					</span>
				</p>
				<p>
					<span class="span1">User order number：</span>
					<span class="span2">
						<input name="orderNumber" id="orderNumber" type="text" />
					</span>
				</p>
			</div>
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">Transaction Type：</span>
					<span class="span2">
						<select name="tradetypeid" class="long">
								<option value="">---please choose---</option>
								<option value="1">income</option>
								<option value="2">expenditure</option>
						</select>
					</span>
				</p>
				<p><span class="span1">application time：</span>
					<span class="span2">
						<input name="dotimestart" id="dotimestart" type="text" class="littlelong_bl date" /> 
					</span>
				</p>
				<p>
					<span class="span1" style="text-align:center;">----</span>
					<span class="span2">
						<input id="dotimeend" name="dotimeend" type="text" class="littlelong_bl date" />
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
			</ul>
		</div>
		<div class="tongji" id="statistics">
			<a href="###" class="shouqi fr">Put away</a>
			<p>
				The total number of transactions： <b><span id="tradecnt">0</span> </b> pen
				Total Expenditure：<b><span id="payout">0</span> </b> yuan
				Total income：<b><span id="income">0</span> </b> yuan
			</p>
		</div>
		<div class="zhkd">
			<table id="dataTable" border="0" cellspacing="0" cellpadding="0"
				class="ly_tab yiwanka-dingdan-table">
				<thead>
					<tr class="hsbg">
						<th>Capital flow</th>
						<th>Transaction Type</th>
						<th>System serial number</th>
						<th>User order number</th>
						<th>amount of payout</th>
						<th>Income Amount</th>
						<th>Account Balance</th>
						<th>transaction hour</th>
						<th>Description of Income and Expenditure</th>
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
<script type="text/javascript" src="/Scripts/datapicker/WdatePicker.js"></script>
</body>
<script type="text/javascript">	
$(function() {
	$(".adv-filiter-trigger").click(function() {
		$(this).toggleClass("opened");
		$(this).nextAll("dl.adv-filiter").slideToggle("fast");
	});
	loadDateWithSecond2($('#dotimestart'), $('#dotimeend'));
	loadBind();
	initDataTable();
	$('#dataTable').dtColumnManager({
		"listTargetID" : "toggle_columns"
	});
	loadStatistics();
	loadExport();
	$("#dataTable").refreshData();
});
loadStatistics = function() {
	// 查询统计
	$('#btn_statistics').click(function(e) {
		e.preventDefault();
		$('#btn_statistics').attr('disabled', "true");
		$('#statistics').show();
		var postData = $('#searchForm').serializeArray();
		ajaxreq({
			url : "/finance/statisticsAccountRecord.ashx",
			data : postData,
			success : function(json) {
				if (json.result == 'ok') {
					$('#tradecnt').html(json.data.tradecnt);
					$('#payout').html(json.data.payout);
					$('#income').html(json.data.income);
					$('#statistics').show();
				} else {
					dialog_simple_fail(json.msg);
					alert(json.msg);
				}
				$('#btn_statistics').removeAttr("disabled");
			},
			error : function() {
				$('#btn_statistics').removeAttr("disabled");
			}
		})
	});
}
loadExport = function() {
	// 导出列表
	$('#btn_export')
			.click(
					function(e) {
						e.preventDefault();
						var postData = $('#searchForm').serialize();
						window.open('/finance/exportAccountRecord.aspx?'+ postData);
					});
}
loadBind = function() {
	// 查询按钮
	$("#btn_query").click(function() {
		$("#dataTable").refreshData();
	});
}

initDataTable = function() {
	var url = "/finance/queryAccountRecord.ashx";
	$('#dataTable').comDataTable(
			{
				"sAjaxSource" : url,
				"fnServerData" : function(sSource, aoData, fnCallback) {
					var postData = aoData.concat($('#searchForm')
							.serializeArray());
					ajaxreq({
						url : sSource,
						data : postData,
						success : function(json) {
							if (json.result == 'ok') {
								fnCallback(json.data);
							} else {
								dialog_simple_fail(json.msg);
								alert(json.msg);
							}
						}
					})
				},
				"aoColumns" : [ {
					"sName" : "recordid",
					"mDataProp" : "recordid"
				}, {
					"sName" : "tradetypeidremark",
					"mDataProp" : "tradetypeidremark"
				}, {
					"sName" : "tradeno",
					"mDataProp" : "tradeno"
				}, {
					"sName" : "orderno",
					"mDataProp" : "orderno"
				}, {
					"sName" : "payout",
					"mDataProp" : function(aData, type, val) {
						return aData.payout + "yuan";
					}
				}, {
					"sName" : "income",
					"mDataProp" : function(aData, type, val) {
						return aData.income + "yuan";
					}
				}, {
					"sName" : "balance",
					"mDataProp" : function(aData, type, val) {
						return aData.balance + "yuan";
					}
				}, {
					"sName" : "dotime",
					"mDataProp" : "dotime"
				}, {
					"sName" : "tradedesc",
					"mDataProp" : "tradedesc"
				} ],
				"aaSorting" : [ [ 13, "desc" ] ]
			});
}
</script>
</html>
