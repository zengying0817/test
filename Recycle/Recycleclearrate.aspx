<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recycleclearrate.aspx.cs" Inherits="API.WebUI201509.Recycle.Recycleclearrate" %>
<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Settlement Ratio|Kdpay</title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
<div class="yiwanka">
	<!-- 头部 -->
	<uc1:Header runat="server" id="Header1"/>
    <!-- 菜单 -->
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="5" />

<div class="yiwanka-con-right">
		<div class="yiwanka-settle">
			<div class="yiwanka-settle-title">
				<p style="font-size:16px; color:#666666; font-weight:bold; line-height:30px; margin-top:20px;">Settlement Ratio</p>
			</div>
			<div class="yiwanka-settle-data">
				<table id="dataTable" border="0" cellspacing="0" cellpadding="0"
					class="ly_tab" style="margin-top: 0;">
					<thead>
						<tr class="hsbg">
							<th>coding</th>
							<th>aisle</th>
							<th>face value</th>
							<th>Rate</th>
							<th>status</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>	
		</div>
	</div>
</div>	
<script type="text/javascript" src="/Scripts/jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery/jquery.columnmanager.js"></script>
<script type="text/javascript" src="/international/Scripts/custom/dataTableCommon.js"></script>
<script type="text/javascript" src="/Scripts/custom/noname.js"></script>
<script type="text/javascript">
	$(function() {
		findUserRate();
	});
	function findUserRate() {
		var url = "/recycle/findUserRate.ashx";
		$('#dataTable').comDataTable({
			"sAjaxSource" : url,
			"iDeferLoading" : null,//是否默认加载
			"fnServerData" : function(sSource, aoData, fnCallback) {
				ajaxreq({
					url : sSource,
					success : function(json) {
						if (json.result == 'ok') {
							fnCallback(json.data);
						} else {
							dialog_simple_fail(json.msg);
						}
					}
				})
			},
			"sDom" : 'rft', // 元素布局
			"fnRowCallback":function(nRow, aData, iDataIndex){
				if (aData.state != '1') {
					$(nRow).css("background-color","#F9FFC6");
				}
			},
			"aoColumns" : [ {
				"sName" : "cardid", // 卡编码
				"mDataProp" : "cardid",
				"bVisible" : false
			}, 
			{
				"sName" : "cardname",
				"mDataProp" : "cardname"
			}, 
			{
				"sName" : "facevalue",
				"mDataProp" : function(aData, type, val) {
					if (aData.facevalue == 0) {
						return 'All denominations';
					} else {
						return aData.facevalue;
					}
				}
			}, 
			{
				"sName" : "rate",
				"mDataProp" : function(aData, type, val) {
					return aData.rate + ' %';
				}
			}, 
			{
				"sName" : "state",
				"mDataProp" : function(aData, type, val) {
					if (aData.state == '1') {
						return 'normal'
					} else {
						return '<font style="color:red;font-weight:bold;">maintain</font>'
					}
				}
			}, 
		],
			"aaSorting" : [ [ 13, "desc" ] ]
		});
	}
</script>
</body>
</html>