$(function () {
    var $formValidate = $("#regform").validate({
        rules: {
            logpsw: {
                required: true,
                rangelength: [6, 256]
            },
            logpsw2: {
                required: true,
                rangelength: [6, 256],
                equalTo: "#logpsw"
            },
            imgcaptchacode: {
                required: true,
                remote: {
                    url: context_path + "/user/checkImgCaptchacode.ashx",
                    type: "post",
                    async: false,
                    data: {
                        imgcode: function () {
                            return $("#imgcaptchacode").val();
                        }
                    }
                }
            }
        },
        messages: {
            logpsw: {
                required: "Please enter your password",
                rangelength: "The password length should be between 6 and 256"
            },
            logpsw2: {
                required: "Please enter the confirmation password",
                rangelength: "The password length should be between 6 and 256",
                equalTo: "The password is not the same"
            },
            imgcaptchacode: {
                required: "please enter verification code",
                remote: "Verification code error"
            }
        },
        success: function (label, element) {
            element.removeClass("error").addClass("valid").parents(".register-text-one").find("img:not(#cimg)").show();
        },
        errorPlacement: function (error, element) {
            var $parents = element.removeClass("valid").addClass("error").parents(".register-text-one");
            $parents.find("img:not(#cimg)").hide();
            $parents.next(".register-text-two").find(".p2").text(error.html());
        }
    });

    // 默认加载手机验证
    var formDynamicValid = new FormDynamicValid();
    formDynamicValid.addPhoneValid();

    // 提交注册
    $("#register-btn").click(function () {
        if ($("#regform").valid()) {
            var logpsw = $("#logpsw").val();


            var enclogpsw = rsapassword(logpsw);
            $("#logpsw").val(enclogpsw);
            $("#logpsw2").val(enclogpsw);

            var action = "";
            if ($("#regtype").val() === "1") {
                action = context_path + "/user/phoneRegister.aspx";
            } else {
                action = context_path + "/user/emailRegister.aspx";
            }
            $("#regform").prop("action", action).submit();
        }
    });

    // 注册方式切换
    $(".register-type-btn").click(function () {
        var $this = $(this);
        $(".register-type").show().animate({ right: "+=600px" }, 600, function () {
            if ($this.parents(".register-type").hasClass("phone-register")) {
                $(".phone-register").css("right", "-600px").hide();
                $("#regtype").val("2");
                formDynamicValid.removeEmailValid();
                formDynamicValid.removePhoneValid();
                formDynamicValid.addEmailValid();
            } else {
                $(".email-register").css("right", "-600px").hide();
                $("#regtype").val("1");
                formDynamicValid.removePhoneValid();
                formDynamicValid.removeEmailValid();
                formDynamicValid.addPhoneValid();
            }
        });
        $formValidate.resetForm();
        $("#regform input:not(:hidden,:button)").val("");
        $("#regform .register-text-one .success").hide();
        $("#passcheckdiv").hide();
        $(".register-text-two .p2").text("");
    });

    // 发送验证码
    $("#sendphonecode").click(function () {
        sendphonecode($(this));
    });
    $("#sendemailcode").click(function () {
        sendemailcode($(this));
    });

    // 密码安全等级判定
    $('#logpsw').keyup(function () {
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        if ($(this).val().length < 6) {
            $("#passcheckdiv").hide();
            return false;
        }
        $("#passcheckdiv").show();
        if (strongRegex.test($(this).val())) {
            $("#passcheck span:eq(0)").removeClass().addClass("weak");
            $("#passcheck span:eq(1)").removeClass().addClass("normal");
            var $obj = $("#passcheck span:eq(2)").removeClass().addClass("safety");
            var left = parseInt($obj.position().left) + parseInt($obj.width()) - parseInt(10);
            $("#selectedicon").css("margin-left", left + "px");
            //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
        }
        else if (mediumRegex.test($(this).val())) {
            $("#passcheck span:eq(0)").removeClass().addClass("weak");
            var $obj = $("#passcheck span:eq(1)").removeClass().addClass("normal");
            var left = parseInt($obj.position().left) + parseInt($obj.width()) - parseInt(10);
            $("#selectedicon").css("margin-left", left + "px");
            $("#passcheck span:eq(2)").removeClass().addClass("default");
            //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
        }
        else {
            var $obj = $("#passcheck span:eq(0)").removeClass().addClass("weak");
            var left = parseInt($obj.position().left) + parseInt($obj.width()) - parseInt(10);
            $("#selectedicon").css("margin-left", left + "px");
            $("#passcheck span:eq(1)").removeClass().addClass("default");
            $("#passcheck span:eq(2)").removeClass().addClass("default");
            //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
        }
        return true;
    });
});

function FormDynamicValid() {
    this.addEmailValid = function () {
        $("#emaillogname").rules("add",
            {
                required: true,
                rangelength: [3, 128],
                email: true,
                remote: {
                    url: context_path + "/user/checkLogname.ashx",
                    type: "post",
                    async: false,
                    data: {
                        logname: function () {
                            return $("#emaillogname").val();
                        }
                    }
                },
                messages: {
                    required: "Please enter your e-mail address",
                    rangelength: "E-mail length is between 3 and 128",
                    email: "please enter your vaild email",
                    remote: "The e-mail has been registered, please re-enter"
                }
            });
        $("#emailcaptchacode").rules("add",
            {
                required: true,
                remote: {
                    url: context_path + "/user/checkVerifyCode.ashx",
                    type: "post",
                    async: false,
                    data: {
                        regtype: function () {
                            return $("#regtype").val();
                        },
                        email: function () {
                            return $("#emaillogname").val();
                        },
                        imgcode: function () {
                            return $("#imgcaptchacode").val();
                        },
                        emailverifycode: function () {
                            return $("#emailcaptchacode").val();
                        }
                    }
                },
                messages: {
                    required: "Please enter your e-mail address",
                    remote: "E-mail verification code is incorrect. Please re-enter it"
                }
            });
    },
	this.addPhoneValid = function () {
	    $("#phonelogname")
		.rules("add", {
		    required: true,
		    isMobile: true,
		    remote: {
		        url: context_path + "/user/checkLogname.ashx",
		        type: "post",
		        async: false,
		        data: {
		            logname: function () {
		                return $("#phonelogname").val();
		            }
		        }
		    },
		    messages: {
		        required: "Please enter phone number",
		        isMobile: "Please enter a valid phone number",
		        remote: "The phone number has been registered, please re-enter"
		    }
		});
	    $("#phonecaptchacode")
		.rules("add", {
		    required: true,
		    remote: {
		        url: context_path + "/user/checkVerifyCode.ashx",
		        type: "post",
		        async: false,
		        data: {
		            regtype: function () {
		                return $("#regtype").val();
		            },
		            phone: function () {
		                return $("#phonelogname").val();
		            },
		            imgcode: function () {
		                return $("#imgcaptchacode").val();
		            },
		            smscode: function () {
		                return $("#phonecaptchacode").val();
		            }
		        }
		    },
		    messages: {
		        required: "Please enter phone verification code",
		        remote: "Phone verification code error. Please re-enter"
		    }
		});
	},
	this.removeEmailValid = function () {
	    $("#emaillogname").rules("remove");
	    $("#emailcaptchacode").rules("remove");
	},
	this.removePhoneValid = function () {
	    $("#phonelogname").rules("remove");
	    $("#phonecaptchacode").rules("remove");
	}
}

function sendphonecode($btn) {
    if ($("#phonelogname,#imgcaptchacode").valid()) {
        var sSource = context_path + "/user/sendVerifyCodeForReg.ashx";
        ajaxreq({
            url: sSource,
            data: {
                regtype: function () {
                    return $("#regtype").val();
                },
                phone: function () {
                    return $("#phonelogname").val();
                },
                imgcode: function () {
                    return $("#imgcaptchacode").val();
                }
            },
            success: function (json) {
                if (json.result == 'ok') {
                    $("#sendphonecode").parents(".register-text-one").next().find(".p2").html("<font style='color:#3BA00C'>Phone verification code sent successfully,please check</font>");
                    setDisabledTime($("#sendphonecode"));
                    $("#sendphonecode").focus();
                } else {
                    $("#sendphonecode").parents(".register-text-one").next().find(".p2").html("<font style='color:#ed461f'>Phone verification code sent failed,please check</font>");
                }
            },
            error: function () {
            }
        });
    }
}

function sendemailcode($btn) {
    if ($("#emaillogname,#imgcaptchacode").valid()) {
        var sSource = context_path + "/user/sendVerifyCodeForReg.ashx";
        ajaxreq({
            url: sSource,
            data: {
                regtype: function () {
                    return $("#regtype").val();
                },
                email: function () {
                    return $("#emaillogname").val();
                },
                imgcode: function () {
                    return $("#imgcaptchacode").val();
                }
            },
            success: function (json) {
                if (json.result == 'ok') {
                    $("#sendemailcode").parents(".register-text-one").next().find(".p2").html("<font style='color:#3BA00C'>Mailbox verification code sent successfully, please check</font>");
                    setDisabledTime($("#sendemailcode"));
                    $("#emailcaptchacode").focus();
                } else {
                    $("#sendemailcode").parents(".register-text-one").next().find(".p2").html("<font style='color:#ed461f'>Mailbox verification code sent failed,please check</font>");
                }
            },
            error: function () {
            }
        });
    }
}

var wait = 120;
var setFlg = false;
function setDisabledTime($btn) {
    if (wait == 0) {
        $btn.val("Send").prop("disabled", false).removeClass("send-smscode-disabled").addClass("send-smscode");
        $btn.parent().next().text("");
        wait = 120;
        setFlg = false;
    } else {
        if (!setFlg) {
            $btn.prop("disabled", true).removeClass("send-smscode").addClass("send-smscode-disabled");
            setFlg = true;
        }
        $btn.val(wait + "s re-issued");
        wait--;
        setTimeout(function () {
            setDisabledTime($btn);
        }, 1000);
    }
}

function refreshcaptchacode() {
    $("#cimg").attr("src", context_path + "/captchacode.ashx?date=" + new Date());
}