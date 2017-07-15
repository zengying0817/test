<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="API.WebUI201509.Agent.UserList" %>

<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Subordinate users|<%=SiteName%></title>
<link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
<link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />

<script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<style>
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
	<uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="9-0" />

    <div class="yiwanka-con-right">
		<div class="yiwanka-jifen-title">
			<p>Subordinate users</p>
		</div>
		<div class="yiwanka-dingdan">
		<form id="searchForm">
			<div class="yiwanka-dingdan-1">
				<p>
					<span class="span1">User ID：</span>
					<span class="span2">
						<input name="userid" id="userid" type="text" class="littlelong" />
					</span>
				</p>
				<p>
					<span class="span1">User Name：</span>
					<span class="span2">
						<input name="username" id="username" type="text" class="littlelong" />
					</span>
				</p>
				<p>
					<span class="span1">Cellphone Number：</span>
					<span class="span2">
						<input name="phone" id="phone" type="text" class="littlelong" />
					</span>
				</p>
			</div>
			
			
			<div style="width:100%;margin-top:20px;height:35px;">
				<a id="btn_query" name="btn_query" href="javascript:void(0);" style="width:15%;margin:0 auto; display:block; background-color:#1597ed;height:35px; line-height:35px;border-radius:5px; color:#ffffff;  ">Search</a>
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
				Total number of users: <b><span id="tradecnt">0</span> </b>items 
				Total face value submitted：<b><span id="facevalue">0</span></b> yuan
				Total actual face value：<b><span id="realvalue">0</span> </b> yuan
				Total Settlement：<b><span id="clearmoney">0</span> </b> yuan
			</p>
		</div>
		<div class="zhkd">
			<table id="dataTable" border="0" cellspacing="0" cellpadding="0" class="ly_tab yiwanka-dingdan-table">
				<thead>
					<tr class="hsbg">
						<th>User ID</th>
						<th>User Name</th>
						<th>Total transaction amount</th>
						<th>Today 's trading volume</th>
                        <th>Today 's profits</th>
                        <th>Total profit</th>
						<th>Registration time</th>
                        <th>user status</th>
						<th>Settlement Ratio</th>
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
	});
	
	loadStatistics = function() {
		// 查询统计
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
		// 导出列表
		$('#btn_export').click(
						function(e) {
							e.preventDefault();
							var postData = $('#searchForm').serialize();
							window.open('/recycle/exportRecycleBill.aspx?'+ postData);
						});
	};
	loadBind = function() {
		// 查询
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
	    var url = "/agent/underlinglist.ashx";
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
									    "sName": "userId",
									    "mDataProp": "userId"
									},
									{
									    "sName": "username",
									    "mDataProp": "username",
									   "bSortable" : false
									},									
									{
									    "sName": "totaltrandeamt",
									    "mDataProp": "totaltrandeamt",
										"bSortable" : false
									},
									{
									    "sName": "todaytrandeamt",
									    "mDataProp": "todaytrandeamt",
										"bSortable" : false
									},
									{
									    "sName": "todayagentincome",
									    "mDataProp": "todayagentincome",
									    "bSortable": false
									},
									{
									    "sName": "totalagentincome",
									    "mDataProp": "totalagentincome",
									    "bSortable": false
									},
									{
									    "sName": "LastLoginTime",
									    "mDataProp": "LastLoginTime",
									    "bSortable": false
									},
									{
									    "sName": "stateRemark",
									    "mDataProp": "stateRemark",
									    "bSortable": false
									}
                                    ,
                                    {
							        "sName": "",
							        "mDataProp": function(aData, type, val) {
							            var html = '';
							            var url = 'recycleclearrate.aspx?userid=' + aData.userId;

							            html = '<a href="' + url + '" style="color: #2261A0;">Show'
							                + '</a>';
							            return html;
							        },
							        "bSortable": false
							    }
							],

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
</script>
</html>
