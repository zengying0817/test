<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="summary.aspx.cs" Inherits="API.WebUI201509.User.summary" %>
<%@ Import Namespace="API.BLL" %>


<%@ Register Src="~/international/Ctrls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/international/Ctrls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Order Trends|Kdpay</title>

     <link href="/content/themes/style/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/common.css?t=0" rel="stylesheet" type="text/css" />
    <link href="/content/themes/style/css/style.css?t=3" rel="stylesheet" type="text/css" />

    <script src="/Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="/Scripts/chart/FusionCharts.js" type="text/javascript"></script>
    <style>
        .chart-box
{
	position: relative;
	margin-top: 50px;
}
.chart-box .chart-c
{
	border: 1px solid #E1E2E2;
	padding: 10px;
	background: #fff;
}
.chart-box h4
{
	float: left;
	margin-right: 10px;
	font-size: 14px;
	font-weight: bold;
	position: absolute;
	z-index: 3;
	cursor: pointer;
	padding: 0 15px;
	background-color: whiteSmoke;
	border: 1px solid #E1E2E2;
	height: 40px;
	line-height: 40px;
	color: #666666;
}
.chart-box h4#m1
{
	left: 0;
	top: -41px;
}
.chart-box h4#m2
{
	left: 242px;
	top: -41px;
}
.chart-box h4#m3
{
	left: 354px;
	top: -41px;
}
.chart-box h4#m4
{
	left: 487px;
	top: -41px;
}
.chart-box h4.ac
{
	background: #fff;
	border-bottom: 1px solid #fff;
}
    </style>
</head>

<body>
<div class="yiwanka">
	 <!-- 头部 -->
        <uc1:Header runat="server" id="Header1"/>
        <uc1:UserMenu runat="server" id="UserMenu1" MenuIndex="3-4" />

    <!-- 主体 -->
	<div class="yiwanka-con-right">
		<div class="yiwanka-write" style="height:670px;">
			<div class="yiwanka-write-title warnicon">
				<span>Statistical Analysis</span>
			</div>
			
				<div id="content" class="b_clear" style="margin-top:18px">
   
    <script type="text/javascript">
        function updateChart1(date) {　///　　
            var myChart1 = new FusionCharts("/Scripts/chart/Column3D.swf", "myChart1", "720", "400", "0", "0");
            myChart1.setDataURL(escape("/Recycle/WS/get_channel_status.ashx?ran=" + Math.random() + "&datetime=" + date));
            myChart1.addParam("wmode", "Opaque");
            myChart1.render("chartchannel");
        }
        function updateChart2(date) {
            var myChart2 = new FusionCharts("/Scripts/chart/Pie3D.swf", "myChart2", "720", "400", "0", "0");
            myChart2.setDataURL(escape("/Recycle/WS/get_orderbl_status.ashx?ran=" + Math.random() + "&datetime=" + date));
            myChart2.addParam("wmode", "Opaque");
            myChart2.render("chartorderbl");
        }
        function updateChart3() {//
            var myChart3 = new FusionCharts("/Scripts/chart/MSCombi2D.swf", "myChart3", "720", "400", "0", "0");
            myChart3.setDataURL(escape("/Recycle/WS/get_syzs_status.ashx?ran=" + Math.random()));
            myChart3.addParam("wmode", "Opaque");
            myChart3.render("chartsyzs");
        }
        function updateChart4() {
            var myChart4 = new FusionCharts("/Scripts/chart/MSCombi2D.swf", "myChart4", "720", "400", "0", "0");
            myChart4.setDataURL(escape("/Recycle/WS/get_orderzs_status.ashx/?ran=" + Math.random()));
            myChart4.addParam("wmode", "Opaque");
            myChart4.render("chartorderzs");
        }
    </script>

            <div class="b_m_t chart-box">
                <h4 id="m1" class="ac">
                    Number of orders per channel</h4>
                <h4 id="m2">
                 Order Ratio</h4>
                <h4 id="m3">
                    Earnings trend</h4>
                <h4 id="m4">
                    Order trends</h4>
                <div class="clear">
                </div>
                <div class="chart-c">
                    <div id="m1-box">
                        <asp:Literal ID="litchart1" runat="server"></asp:Literal>                       
                    </div>
                    <!--Tab 1-->
                    <div id="m2-box" style="display: none">
                        <asp:Literal ID="litchart2" runat="server"></asp:Literal> 
                    </div>
                    <!--Tab 2-->
                    <div id="m3-box" style="display: none">
                        <asp:Literal ID="litchart3" runat="server"></asp:Literal> 
                    </div>
                    <!--Tab 3-->
                    <div id="m4-box" style="display: none">
                        <asp:Literal ID="litchart4" runat="server"></asp:Literal> 
                    </div>
                    <!--Tab 4-->
                </div>
            </div>
				</div>
			
	</div>
</div>	
<script type="text/javascript">

    jQuery(document).ready(function () {
        $(".chart-box h4").click(tab);
        function tab() {
            $(this).addClass("ac").siblings().removeClass("ac");
            var tab = $(this).attr("id");
            $("#" + tab + "-box").show().siblings().hide();
        };
    });
</script>

    </div>
    </body>

</html>
