$(function () {
    RebindValidator.loadDefaultErrorStyle();
    RebindValidator.loadValid();

    $(".nextstep").click(function () {
        var $this = $(this);
        var $form = $this.parents("form");
        if ($form.valid()) {
            var suoyin = $(".yiwanka-write-bottom").find($(this).parents(".yiwanka-write-bottom-con")).index();
            $(".yiwanka-write-top > p").eq(suoyin + 1).addClass("selected");
            $(".yiwanka-write-top > p").eq(suoyin).removeClass("selected").addClass("pass");
            $(".yiwanka-write-bottom > div").eq(suoyin + 1).show().siblings().hide();
        }
    });

    // 发送验证码
    $("#phonevalildcodebtn").click(function () {
        if ($("#phoneimgcode").valid()) {
            var data = {
                optype: "2012",
                imgverifycode: $("#phoneimgcode").val()
            };
            CommFunc.sendVerifyCode($(this), data, "phone");
        }
    });
    $("#emailvalildcodebtn").click(function () {
        if ($("#emailimgcode").valid()) {
            var data = {
                optype: "2022",
                imgverifycode: $("#emailimgcode").val()
            };
            CommFunc.sendVerifyCode($(this), data, "email");
        }
    });

    // 重新认证
    $("#rebindIdnoBtn").click(function () {
        var $this = $(this);
        var $form = $("#idnoForm");
        if ($("#idnoForm").valid()) {
            if (confirm("Re-real-name authentication after you bind the bank account will be cleared, \ r \ n you re-real-name authentication?")) {
                ajaxreq({
                    type: "post",
                    url: context_path + "/user/bind/bindIdNo.ashx",
                    data: $form.serialize(),
                    success: function (json) {
                        if (json.result == 'ok') {
                            var suoyin = $(".yiwanka-write-bottom").find($this.parents(".yiwanka-write-bottom-con")).index();
                            $(".yiwanka-write-top > p").eq(suoyin + 1).addClass("selected");
                            $(".yiwanka-write-top > p").eq(suoyin).removeClass("selected").addClass("pass");
                            $(".yiwanka-write-bottom > div").eq(suoyin + 1).show().siblings().hide();
                        } else {
                            alert(json.msg);
                        }
                    },
                    error: function () {
                    }
                });
            }
        }
    });
});

var RebindValidator = {
    loadDefaultErrorStyle: function () {
        $.validator.setDefaults({
            success: function (label, element) {
                element.parent().siblings(".span3").removeClass("errorimg").addClass("validimg").text("");
            },
            errorPlacement: function (error, element) {
                element.parent().siblings(".span3").removeClass("validimg").addClass("errorimg").text(error.html());
            }
        });
    },
    loadValid: function () {
        this.phoneOrEmailValid();
        this.pswquestionValid();
        this.tradepswValid();
        this.idNoValid();
        this.changeIdNoValid();
    },
    phoneOrEmailValid: function () {
        $("#phoneForm").validate({
            rules: {
                phoneimgcode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#phoneimgcode").val();
                            }
                        }
                    }
                },
                phonevalidcode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPhoneVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2012",
                            imgverifycode: function () {
                                return $("#phoneimgcode").val();
                            },
                            smscode: function () {
                                return $("#phonevalidcode").val();
                            },
                            opsessionid: function () {
                                return $("#opsessionid").val();
                            }
                        }
                    }
                }
            },
            messages: {
                phoneimgcode: { required: "please enter verification code", remote: "Verification code error" },
                phonevalidcode: { required: "Please enter phone verification code", remote: "phone verification code error" }
            }
        });
        $("#emailForm").validate({
            rules: {
                emailimgcode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#emailimgcode").val();
                            }
                        }
                    }
                },
                emailvalidcode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validEmailVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2022",
                            imgverifycode: function () {
                                return $("#emailimgcode").val();
                            },
                            emailverifycode: function () {
                                return $("#emailvalidcode").val();
                            },
                            opsessionid: function () {
                                return $("#opsessionid").val();
                            }
                        }
                    }
                }
            },
            messages: {
                emailimgcode: { required: "please enter verification code", remote: "Verification code error" },
                emailvalidcode: { required: "Please enter your email address", remote: "Mailbox verification code error" }
            }
        });
    },
    pswquestionValid: function () {
        $("#questionForm").validate({
            rules: {
                pswanswer: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPswQuestion.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2030",
                            oldpswanswer: function () {
                                return $("#pswanswer").val();
                            },
                            opsessionid: function () {
                                return $("#opsessionid").val();
                            }
                        }
                    }
                }
            },
            messages: {
                pswanswer: { required: "Please enter secret answer", remote: "wrong answer" },
            }
        });
    },
    tradepswValid: function () {
        $("#tradepswForm").validate({
            rules: {
                tradepsw: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validOldTradePsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2040",
                            oldtradepsw: function () {
                                return rsapassword($("#tradepsw").val());
                            },
                            opsessionid: function () {
                                return $("#opsessionid").val();
                            }
                        }
                    }
                }
            },
            messages: {
                tradepsw: { required: "Please enter the transaction password", remote: "wrong password" },
            }
        });
    },
    idNoValid: function () {
        $("#oldIdnoForm").validate({
            rules: {
                oldidno: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validIdNo.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2050",
                            idno: function () {
                                return $("#oldidno").val();
                            },
                            opsessionid: function () {
                                return $("#opsessionid").val();
                            }
                        }
                    }
                }
            },
            messages: {
                oldidno: { required: "Please enter your ID number", remote: "ID card number error" }
            }
        });
    },
    changeIdNoValid: function () {
        $("#idnoForm").validate({
            rules: {
                realname: {
                    required: true,
                    isChinese: true,
                    rangelength: [2, 64]
                },
                idno: {
                    required: true,
                    isIdCard: true
                }
            },
            messages: {
                realname: {
                    required: "please enter your real name",
                    isChinese: "The name must be Chinese",
                    rangelength: "The name is not the correct length"
                },
                idno: {
                    required: "Please enter your ID card number",
                    isIdCard: "Please enter a valid ID number"
                }
            }
        });
    }
};

var CommFunc = {
    sendVerifyCode: function ($sendbtn, data, type) {
        var sendUrl = "";
        if (type === "phone") {
            sendUrl = context_path + "/user/bind/sendPhoneVerifyCode.ashx";
        } else if (type === "email") {
            sendUrl = context_path + "/user/bind/sendEmailVerifyCode.ashx";
        }
        ajaxreq({
            type: "post",
            url: sendUrl,
            data: data,
            success: function (json) {
                if (json.result == 'ok') {
                    setDisabledTime($sendbtn);
                    $sendbtn.parent().next().addClass("validimg").text(json.msg);
                    $sendbtn.prev("input").prop("disabled", false).focus();
                    $sendbtn.parents("p").next("p").find("input")
                                .removeClass("confirm-btn-disabled").addClass("confirm-btn").prop("disabled", false);
                } else {
                    alert(json.msg);
                }
            },
            error: function () {
            }
        });
    }
};


var wait = 60;
function setDisabledTime($btn) {
    if (wait == 0) {
        $btn.prop("disabled", false).removeClass("confirm-btn-disabled").addClass("confirm-btn").val("get verification code");
        $btn.next("span").text("");
        wait = 60;
    } else {
        if (!$btn.prop("disabled")) {
            $btn.prop("disabled", true).removeClass("confirm-btn").addClass("confirm-btn-disabled");
        }
        $btn.val(wait + "s later resend");
        wait--;
        setTimeout(function () {
            setDisabledTime($btn);
        }, 1000);
    }
}

function refreshcaptchacode(obj) {
    $(obj).attr("src", context_path + "/captchacode.ashx?date=" + new Date());
}