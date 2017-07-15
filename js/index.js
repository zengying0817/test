$(function(){
//	var firstnavDis =  
//	$("ul.nav li").each(function(){
//		$(this).click(function(){
//			
//		})
//	})login-btngreen
	$(".closebtn").click(function(){
		$(this).parent(".login-box").hide();
	})
	$(".login-btn").click(function(){
		$(".login-box").show();
	})
	$(".Hamburge-menu").click(function(){
		$(".sidemenu").animate({
			"right":"0px"
		},600);
	})
	$(".sidemenu").children(".green").click(function(){
		$(".sidemenu").animate({
			"right":"-300px"
			},600);
	})
	
//	$(".about-one").find(".about-oneCon").animate({
//			"opacity" : "1",
//			"top" : "20%"
//		},2000);
//	$(".about-two").find(".about-oneCon").animate({
//			"opacity" : "1",
//			"right" : "2%"
//		},2000);
//	$(".about-three").find(".about-oneCon").animate({
//			"opacity" : "1",
//			"left" : "6%"
//		},2000);
//	$(".about-four").find(".about-oneCon").animate({
//			"opacity" : "1",
//			"right" : "2%"
//		},2000);
})

