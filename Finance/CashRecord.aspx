<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashRecord.aspx.cs" Inherits="API.WebUI201509.Finance.CashRecord" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Refund Order Inquiry|Kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<style>
.bianji_list,
.bianji_list li a {
    width: auto; 
}

</style>
</head>
<div class="yiwanka">
	<!-- 头部 -->
	 <uc1:Header runat="server" id="Header1"/>
     <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="4-1" />
    
    <div class="yiwanka-con-right">
		<div class="yiwanka-jifen-title">
			<p>Withdrawals record</p>
		</div>
		<div class="yiwanka-jifen">
		<form id="searchForm">
			<div class="yiwanka-jifen-1">
				<p style="width:25%">
					<span class="span1">Cash flow：</span>
					<span class="span2">
						<input name="flowid" id="flowid" type="text" class="littlelong" />
					</span>
				</p>
				<p style="width:30%">
					<span class="span1">trading status：</span>
					<span class="span2">
						<select name="state" class="long">
								<option value="">---please choose---</option>
                                <option value="1">Processing</option>
                                <option value="4">Not approved</option>
								<option value="2">Payment</option>
								<option value="8">Has been hit</option>
                                <option value="16">Playing failed</option>
						</select>
					</span>
				</p>
				<p style="width:45%">
					<span class="span1" style="width:18%;">time：</span>
					<span class="span2" style="width:80%;">
						<input name="applytimestart" id="applytimestart" type="text" class="littlelong_bl" class="date" style="width:45%;float:left;"/>
						--
						<input name="applytimeend" id="applytimeend" type="text" class="littlelong_bl" class="date" style="width:45%;float:right;"/>
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
		</div>
		<div class="zhkd">
			<table id="dataTable" border="0" cellspacing="0" cellpadding="0"
				class="ly_tab">
				<thead>
					<tr class="hsbg">
						<th>Cash flow</th>
						<th>Application Amount</th>
						<th>Amount of the transaction</th>
						<th>Account Balance</th>
						<th>Bank name</th>
						<th>Bank Account</th>
						<th>Account Name</th>
						<th>trading status</th>
						<th>application time</th>
						<th>transaction hour</th>
						<th>Custom information</th>
						<th>Feedback</th>
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
<script type="text/javascript" src="/Scripts/datapicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function() {
	$(".adv-filiter-trigger").click(function() {
		$(this).toggleClass("opened");
		$(this).nextAll("dl.adv-filiter").slideToggle("fast");
	});
	loadDateWithSecond2($('#applytimestart'), $('#applytimeend'));
	loadBind();
	initDataTable();
	$('#dataTable').dtColumnManager({
		"listTargetID" : "toggle_columns"
	});
	$("#dataTable").refreshData();
});

loadBind = function() {
	// 查询按钮
	$("#btn_query").click(function() {
		$("#dataTable").refreshData();
	});
}

initDataTable = function() {
	var url = "/finance/queryCashRecord.ashx";
	$('#dataTable')
			.comDataTable(
					{
						"sAjaxSource" : url,
						"fnServerData" : function(sSource, aoData,
								fnCallback) {
							var postData = aoData.concat($('#searchForm').serializeArray());
							ajaxreq({
								url : sSource,
								data : postData,
								success : function(json) {
									if (json.result == 'ok') {
										fnCallback(json.data);
									} else {
										dialog_simple_fail(json.msg);
									}
								}
							})
						},
						"aoColumns" : [
								{
									"sName" : "flowid",
									"mDataProp" : "flowid"
								},
								{
									"sName" : "applymoney",
									"mDataProp" :  function(aData, type, val) {
										return aData.applymoney + "yuan";
									}
								},
								{
									"sName" : "dealmoney",
									"mDataProp" : function(aData, type, val) {
										return aData.dealmoney + "yuan";
									}
								},
								{
									"sName" : "balance",
									"mDataProp" : function(aData, type, val) {
										return aData.balance + "yuan";
									}
								},
								{
									"sName" : "bankname",
									"mDataProp" : "bankname"
								},
								{
									"sName" : "accountno",
									"mDataProp" : "accountno"
								},
								{
									"sName" : "accountusername",
									"mDataProp" : "accountusername"
								},
								{
									"sName" : "stateremark",
									"mDataProp" : function(aData, type,
											val) {
										if (aData.state == '1') {
											return '<font color="blue">'
													+ aData.stateremark
													+ '</font>';
										} else if (aData.state == '4'
												|| aData.state == '5') {
											return '<font color="red">'
													+ aData.stateremark
													+ '</font>';
										} else {

											return aData.stateremark;
										}
									}
								},
								{
									"sName" : "applytime",
									"mDataProp" : "applytime"
								},
								{
									"sName" : "dealtime",
									"mDataProp" : "dealtime"
								},
								{
									"sName" : "custommsg",
									"mDataProp" : "custommsg",
									"bVisible" : false
								},
								{
									"sName" : "staffmsg",
									"mDataProp" :  function(aData, type, val) {
										if (aData.warnstate == '1') {
											return "<font style='color:red;'>"+$.trim(aData.staffmsg)+"</font>";
										} else {
											return $.trim(aData.staffmsg);
										}
									}
								},
								{
									"sName" : "",
									"mDataProp" : function(aData, type,
											val) {
										var flowid = aData.flowid;
										var val = '';
										if (aData.state == '6') {
											val += '<a href="#" onclick="sendcashauthemail(\''
													+ aData.flowid
													+ '\')" class="ddts" >Re-sent</a>';
										}
										return val;
									},
									"bVisible" : false
								} ],

						"aaSorting" : [ [ 13, "desc" ] ]

					});
}
function sendcashauthemail(flowid) {
	var postData = 'flowid=' + flowid;
	ajaxreq({
		type : "post",
		url : "/security/sendcashauthemail",
		data : postData,
		success : function(json) {
			alert(json.msg);
		},
		error : function() {
		}
	})
}
</script>
</body>
</html>