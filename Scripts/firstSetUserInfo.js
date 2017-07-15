$(function () {

    // 加载默认验证
    var selectedIndex = $(".yindao-con-top span:eq(0)").prop("id");
    AuthValidate.loadErrorDefaults();
    AuthValidate.loadValidByIndex(selectedIndex);

    // 下一步按钮
    // 先提交当前Form，成功后：跳到下一步
    $(".yindao-next").click(function () {
        var $clickBtn = $(this);
        var $form = $clickBtn.parents("form");
        if ($form.valid()) {
            $form.find(":password").each(function () {
                var hiddenid = $(this).prop("id").replace(/show/gm, "");
                $("#" + hiddenid).val(rsapassword($(this).val()));
            });
            ajaxreq({
                type: "post",
                url: $form[0].action,
                data: $form.serialize(),
                success: function (json) {
                    if (json.result == 'ok') {
                        // 继续完善下一个信息
                        var suoyin = $(".yindao-con-bottom").find($clickBtn.parents(".yindao-con-bottom1")).index();
                        // 如果是最后一个按钮，那么关闭引导页，刷新页面(只有异常操作才可能进入)
                        if ($(".yindao-con-top").find("span").length == parseInt(suoyin + 1)) {
                            alert(json.msg);
                            window.location.href = context_path + "/international/user/userinfo.aspx";
                        } else {
                            var $nowspan = $(".yindao-con-top > span").eq(suoyin + 1);
                            var index = $nowspan.prop("id");
                            // 加载下一个验证
                            AuthValidate.loadValidByIndex(index);
                            $nowspan.addClass("yindaospan").siblings().removeClass("yindaospan");
                            $(".yindao-con-bottom > .yindao-con-bottom1").eq(suoyin + 1).show().siblings(".yindao-con-bottom1").hide();
                        }
                    } else {
                        alert(json.msg);
                    }
                },
                error: function () {
                }
            });
        }
    });

    // 跳过按钮
    $(".skip").click(function () {
        // 继续完善下一个信息
        var suoyin = $(".yindao-con-bottom").find($(this).parents(".yindao-con-bottom1")).index();
        // 如果是最后一个按钮，那么关闭引导页，刷新页面(只有异常操作才可能进入)
        if ($(".yindao-con-top").find("span").length == parseInt(suoyin + 1)) {
            window.location.href = context_path + "/international/user/userinfo.aspx";
        } else {
            var $nowspan = $(".yindao-con-top > span").eq(suoyin + 1);
            var index = $nowspan.prop("id");
            // 加载下一个验证
            AuthValidate.loadValidByIndex(index);
            $(".yindao-con-bottom > .yindao-con-bottom1").eq(suoyin + 1).show().siblings(".yindao-con-bottom1").hide();
            $nowspan.addClass("yindaospan").siblings().removeClass("yindaospan");
        }
    });

    // 发送邮件验证码
    $("#sendemailverifycode").click(function () {
        if ($("#email,#emailimgcode").valid()) {
            var $this = $(this);
            ajaxreq({
                type: "post",
                url: context_path + "/user/bind/sendEmailVerifyCode.ashx",
                data: {
                    optype: $("#emailoptype").val(),
                    imgverifycode: $("#emailimgcode").val(),
                    email: $("#email").val()
                },
                success: function (json) {
                    var $msg = $this.parents(".p1").next(".p2").find(".span2");
                    if (json.result == 'ok') {
                        setDisabledTime($this);
                        $msg.addClass("valid").text(json.msg);
                        $("#emailverifycode").focus();
                    } else {
                        $msg.removeClass("valid").text(json.msg);
                    }
                },
                error: function () {
                }
            });
        }
    });

    // 发送手机验证码
    $("#sendsmscode").click(function () {
        if ($("#phone,#phoneimgcode").valid()) {
            var $this = $(this);
            ajaxreq({
                type: "post",
                url: context_path + "/user/bind/sendPhoneVerifyCode.ashx",
                data: {
                    optype: $("#phoneoptype").val(),
                    imgverifycode: $("#phoneimgcode").val(),
                    phone: $("#phone").val()
                },
                success: function (json) {
                    var $msg = $this.parents(".p1").next(".p2").find(".span2");
                    if (json.result == 'ok') {
                        setDisabledTime($this);
                        $msg.addClass("valid").text(json.msg);
                        $("#smscode").focus();
                    } else {
                        $msg.removeClass("valid").text(json.msg);
                    }
                },
                error: function () {
                }
            });
        }
    });

    // 配置银行卡
    $("#setbankcard .p1").on("click", function () {
        $(this).removeClass("unchecked").addClass("checked").find("input").prop("checked", true);
        $(this).parent().next().find("span").show();
        $(this).parents("#setbankcard").find("input:not(:checked)").parents(".p1").removeClass("checked").addClass("unchecked").parent().next().find("span").hide();;
    });

    $("#complete-btn").click(function () {
        if ($("#fixedbankForm input:checked")[0]) {
            var text = $("#fixedbankForm").find(":checked").parent().next().text();
            if (confirm("Are you sure you choose【" + text + "】？")) {
                $("#fixedbankForm").submit();
            }
        }
    });
});

/** 各种验证 **/
var AuthValidate = {
    loadErrorDefaults: function () {
        $.validator.setDefaults({
            success: function (label, element) {
                element.removeClass("error").addClass("valid").parent().next(".span3").removeClass("errorimg").addClass("validimg");
            },
            errorPlacement: function (error, element) {
                element.removeClass("valid").addClass("error").parent().next(".span3").removeClass("validimg").addClass("errorimg");
                element.parents(".p1").next(".p2").find(".span2").text(error.html());
            }
        });
    },
    loadValidByIndex: function (index) {
        switch (index) {
            case '0': this.validIdNo(); break;
            case '1': this.validTradePsw(); break;
            case '2': this.validQuestionPsw(); break;
            case '3': this.validEmail(); break;
            case '4': this.validPhone(); break;
            case '5': this.validBankCard(); break;
            default: this.validIdNo(); break;
        }
    },
    // 验证身份证
    validIdNo: function () {
        var userclass = $("#val_userclass").val();
        if (userclass == "0") {
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
                        required: "Please input your ID card number",
                        isIdCard: "Please enter a valid ID number"
                    }
                }
            });
        } else {
            $("#idnoForm").validate({
                rules: {
                    realname: {
                        required: true,
                        rangelength: [3, 255]
                    },
                    idno: {
                        required: true,
                        isValidBusCode: true
                    }
                },
                messages: {
                    realname: {
                        required: "Please enter your company name",
                        rangelength: "The name is not the correct length"
                    },
                    idno: {
                        required: "Please enter the business execution number",
                        isValidBusCode: "Please enter a valid business execution number"
                    }
                }
            });
        }
    },
    // 验证交易密码
    validTradePsw: function () {
        $("#tradepswForm").validate({
            rules: {
                showtradepsw: {
                    required: true,
                    rangelength: [6, 32],
                    remote: {
                        url: context_path + "/user/bind/equalToLogpsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            tradepsw: function () {
                                return rsapassword($("#showtradepsw").val());
                            }
                        }
                    }
                },
                showtradepswagain: {
                    required: true,
                    rangelength: [6, 32],
                    equalTo: "#showtradepsw"
                }
            },
            messages: {
                showtradepsw: {
                    required: "Please enter the transaction password",
                    rangelength: "The transaction password length should be between 6-32",
                    remote: "The transaction password can not be the same as the login password"
                },
                showtradepswagain: {
                    required: "Please enter the confirmation password",
                    rangelength: "Confirm password length is between 6-32",
                    equalTo: "The two passwords are not the same"
                }
            }
        });
    },
    // 验证密保问题
    validQuestionPsw: function () {
        $("#questionpswForm").validate({
            rules: {
                pswquestion: {
                    required: true
                },
                pswanswer: {
                    required: true,
                    maxlength: 64
                }
            },
            messages: {
                pswquestion: {
                    required: "Please select the security issue"
                },
                pswanswer: {
                    required: "Please enter secret answer",
                    maxlength: "Secret security answer long"
                }
            }
        });
    },
    // 验证邮箱
    validEmail: function () {
        $("#emailForm").validate({
            rules: {
                email: {
                    required: true,
                    isEmail: true,
                    rangelength: [3, 128],
                    remote: {
                        url: context_path + "/user/bind/isExistedEmail.ashx",
                        type: "post",
                        async: false,
                        data: {
                            email: function () {
                                return $("#email").val();
                            }
                        }
                    }
                },
                emailverifycode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validEmailVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: $("#emailoptype").val(),
                            email: function () {
                                return $("#email").val();
                            },
                            imgverifycode: function () {
                                return $("#emailimgcode").val();
                            },
                            emailactivecode: function () {
                                return $("#emailverifycode").val();
                            }
                        }
                    }
                },
                imgverifycode: {
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
                }
            },
            messages: {
                email: {
                    required: "Please enter your e-mail address",
                    isEmail: "E-mail format is incorrect",
                    rangelength: "Mailbox length is between 3-128",
                    remote: "The mailbox has been bound by another account, please re-enter"
                },
                emailverifycode: {
                    required: "Please enter your email address",
                    remote: "Mailbox verification code error"
                },
                imgverifycode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                }
            }
        });
    },
    // 验证手机
    validPhone: function () {
        $("#phoneForm").validate({
            rules: {
                phone: {
                    required: true,
                    isMobile: true,
                    remote: {
                        url: context_path + "/user/bind/isExistedPhone.ashx",
                        type: "post",
                        async: false,
                        data: {
                            phone: function () {
                                return $("#phone").val();
                            }
                        }
                    }
                },
                smscode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPhoneVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: $("#phoneoptype").val(),
                            phone: function () {
                                return $("#phone").val();
                            },
                            imgverifycode: function () {
                                return $("#phoneimgcode").val();
                            },
                            smscode: function () {
                                return $("#smscode").val();
                            }
                        }
                    }
                },
                imgverifycode: {
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
                }
            },
            messages: {
                phone: {
                    required: "Please enter the phone number",
                    isMobile: "Please enter the correct phone number",
                    remote: "The phone number has been bound by other accounts, please re-enter"
                },
                smscode: {
                    required: "Please enter phone verification code",
                    remote: "Wrong phone verification code"
                },
                imgverifycode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                }
            }
        });
    },
    // 配置银行卡
    validBankCard: function () {
    }
};

var wait = 60;
function setDisabledTime($btn) {
    if (wait == 0) {
        $btn.prop("disabled", false).css({ "background-color": "#f39800", "cursor": "pointer" }).val("send");
        $btn.parent(".p1").next(".p2").find(".span2").text("");
        wait = 60;
    } else {
        if (!$btn.prop("disabled")) {
            $btn.prop("disabled", true).css({ "background-color": "#d5d5d5", "cursor": "default" });
        }
        $btn.val(wait + "s reissue");
        wait--;
        setTimeout(function () {
            setDisabledTime($btn);
        }, 1000);
    }
}