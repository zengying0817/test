$(function () {
    // 加载默认错误样式
    BindValidator.loadErrorStyleDefaults();

    // 已绑定手机的情况
    if (isBindedPhone === "true") {
        changePhone();
    } else {
        bindNewPhone();
    }

    // 已经绑定邮箱的情况
    if (isBindedEmail === "true") {
        changeEmail();
    } else {
        bindNewEmail();
    }

    changePwsQuestion();
    changeTradePsw();
    changeLogPsw();

    // 密保、交易密码、登录密码等修改的时候，需要先验证
    if (SESSION_PHONECHECK != "1" && SESSION_EMAILCHECK != "1") {
        validPhoneOrEmail();
    }
});

function validPhoneOrEmail() {
    BindValidator.validBindPhoneForm();
    // 验证手机：发送手机验证码
    $("#validPhoneCodeSend").click(function () {
        if ($("#validPhoneImgCode").valid()) {
            var data = {
                optype: "2010",
                imgverifycode: $("#validPhoneImgCode").val()
            };
            CommFunc.sendVerifyCode($(this), data, "phone");
        }
    });

    // 验证手机
    $("#validBindPhoneBtn").click(function () {
        if ($("#validPhoneImgCode,#validPhoneCode").valid()) {
            var tabindex = $(".manage-goods-total-head").find(".goods-activespan").index();
            window.location.href = context_path + "/international/security/securitycenter/index.aspx?tabindex=" + tabindex;
        }
    });

    BindValidator.validBindEmailForm();
    // 验证手机：发送手机验证码
    $("#validEmailCodeSend").click(function () {
        if ($("#validEmailImgCode").valid()) {
            var data = {
                optype: "2020",
                imgverifycode: $("#validEmailImgCode").val()
            };
            CommFunc.sendVerifyCode($(this), data, "email");
        }
    });

    // 验证手机
    $("#validBindEmailBtn").click(function () {
       
        if ($("#validEmailImgCode,#validEmailCode").valid()) {
          
            var tabindex = $(".manage-goods-total-head").find(".goods-activespan").index();
            window.location.href = context_path + "/international/security/securitycenter/index.aspx?tabindex=" + tabindex;
        }
    });
}

function bindNewPhone() {
    BindValidator.validNewPhoneForm();
    // 发送手机验证码
    $("#newPhoneSend").click(function () {
        if ($("#newPhone,#newPhoneImgCode").valid()) {
            var data = {
                optype: "1020",
                imgverifycode: $("#newPhoneImgCode").val(),
                phone: $("#newPhone").val()
            };
            CommFunc.sendVerifyCode($(this), data, "phone");
        }
    });

    // 确认绑定
    $("#bindNewPhoneBtn").click(function () {
        var data = {
            optype: "1020",
            phone: $("#newPhone").val(),
            imgverifycode: $("#newPhoneImgCode").val(),
            smscode: $("#newPhoneValidCode").val()
        };
        CommFunc.bindSubmit($(this), data, "phone");
    });
};

function bindNewEmail() {
    BindValidator.validNewEmailForm();
    // 发送手机验证码
    $("#addEmailSend").click(function () {
        if ($("#addEmail,#addEmailImgCode").valid()) {
            var data = {
                optype: "1060",
                imgverifycode: $("#addEmailImgCode").val(),
                email: $("#addEmail").val()
            };
            CommFunc.sendVerifyCode($(this), data, "email");
        }
    });

    // 确认绑定
    $("#bindEmailBtn").click(function () {
        var data = {
            optype: "1060",
            email: $("#addEmail").val(),
            imgverifycode: $("#addEmailImgCode").val(),
            emailverifycode: $("#addEmailCode").val()
        };
        CommFunc.bindSubmit($(this), data, "email");
    });
};

function changePhone() {
    BindValidator.validChangePhoneForm();
    // 发送邮箱验证码Step1
    $("#oldPhoneSend").click(function () {
        if ($("#phoneStep1ImgCode").valid()) {
            var data = {
                optype: "1031",
                imgverifycode: $("#phoneStep1ImgCode").val()
            };
            CommFunc.sendVerifyCode($(this), data, "phone");
        }
    });

    // 发送手机验证码Step2
    $("#changePhoneSend").click(function () {
        if ($("#changePhone,#phoneStep2ImgCode").valid()) {
            var data = {
                optype: "1032",
                imgverifycode: $("#phoneStep2ImgCode").val(),
                phone: $("#changePhone").val()
            };
            CommFunc.sendVerifyCode($(this), data, "phone");
        }
    });

    // 修改手机
    $("#changePhoneStep1Btn").click(function () {
        if ($("#phoneStep1ImgCode,#oldPhoneValidCode").valid()) {
            setTimeout(function () {
                $("#phoneStep2Cimg").click();
                $("#changephonestep1").hide();
                $("#changephonestep2").show();
            }, 500);
        }
    });

    // 确认换绑
    $("#changePhoneSubmitBtn").click(function () {
        var data = {
            optype: "1030",
            phone: $("#changePhone").val(),
            imgverifycode: $("#phoneStep2ImgCode").val(),
            smscode: $("#changePhoneValidCode").val()
        };
        CommFunc.bindSubmit($(this), data, "phone");
    });
}

function changeEmail() {
    BindValidator.validChangeEmailForm();

    // 发送邮箱验证码Step1
    $("#oldEmailCodeSend").click(function () {
        if ($("#emailStep1ImgCode").valid()) {
            var data = {
                optype: "1071",
                imgverifycode: $("#emailStep1ImgCode").val()
            };
            CommFunc.sendVerifyCode($(this), data, "email");
        }
    });
    // 发送邮箱验证码Step2
    $("#newEmailCodeSend").click(function () {
        if ($("#newemail,#emailStep2ImgCode").valid()) {
            var data = {
                optype: "1072",
                imgverifycode: $("#emailStep2ImgCode").val(),
                email: $("#newemail").val()
            };
            CommFunc.sendVerifyCode($(this), data, "email");
        }
    });
    // 修改邮箱
    $("#bindNewEmailBtn").click(function () {
        if ($("#emailStep1ImgCode,#oldEmailCode").valid()) {
            setTimeout(function () {
                $("#emailStep2Img").click();
                $("#changeemailstep1").hide();
                $("#changeemailstep2").show();
            }, 500);
        }
    });

    // 确认修改
    $("#confirmBindEmailBtn").click(function () {
        var data = {
            optype: "1070",
            email: $("#newemail").val(),
            imgverifycode: $("#emailStep2ImgCode").val(),
            emailverifycode: $("#newEmailCode").val()
        };
        CommFunc.bindSubmit($(this), data, "email");
    });
}

function changePwsQuestion() {
    BindValidator.changePswQuestionForm();
    $("#changePswQuestionBtn").click(function () {
        var data = {
            optype: "1050",
            oldpswanswer: $("#oldPswAnswer2").val(),
            pswquestion: $("#newPswQuestion").val(),
            pswanswer: $("#newPswAnswer").val()
        };
        CommFunc.bindSubmit($(this), data, "question");
    });
}

function changeTradePsw() {
    BindValidator.changeTradePwdForm();
    $("#tradePwdChangeBtn").click(function () {
        var data = {
            optype: "1091",
            oldtradepsw: rsapassword($("#oldPassword").val()),
            tradepsw: rsapassword($("#newPassword").val()),
            tradepswagain: rsapassword($("#confirmNewPassword").val())
        };
        CommFunc.bindSubmit($(this), data, "tradepsw");
    });
}

function changeLogPsw() {
    BindValidator.changeLoginPwdForm();
    $("#loginPswChangeBtn").click(function () {
        var data = {
            optype: "2000",
            oldlogpsw: rsapassword($("#oldLoginPwd").val()),
            logpsw: rsapassword($("#newLoginPwd").val()),
            logpswagain: rsapassword($("#newConfirmLoginPwd").val())
        };
        CommFunc.bindSubmit($(this), data, "logpsw");
    });
}

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
                    $sendbtn.next().addClass("validimg").text(json.msg);
                    $sendbtn.prev(".span2").find("input").prop("disabled", false).focus();
                    $sendbtn.parents("p").next("p").find("input[type=button]")
                                .removeClass("confirm-btn-disabled").addClass("confirm-btn").prop("disabled", false);
                } else {
                    alert(json.msg);
                }
            },
            error: function () {
            }
        });
    },
    bindSubmit: function ($btn, data, type) {
        var $form = $btn.parents("form");
        if ($form.valid()) {
            var sendUrl = "";
            var tabindex = "0";
            if (type === "phone") {
                sendUrl = context_path + "/user/bind/bindPhone.ashx";
                tabindex = "1";
            } else if (type === "email") {
                sendUrl = context_path + "/user/bind/bindEmail.ashx";
                tabindex = "2";
            } else if (type === "question") {
                sendUrl = context_path + "/user/bind/bindPswQuestion.ashx";
                tabindex = "3";
            } else if (type === "tradepsw") {
                sendUrl = context_path + "/user/bind/bindTradepsw.ashx";
                tabindex = "4";
            } else if (type === "logpsw") {
                sendUrl = context_path + "/user/bind/changeLogpsw.ashx";
                tabindex = "5";
            }
            ajaxreq({
                url: sendUrl,
                data: data,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        window.location.href = context_path + "/international/security/securitycenter/index.aspx?tabindex=" + tabindex;
                    } else {
                        alert(json.msg);
                    }
                },
                error: function () {
                }
            });
        }
    }
};


/** 各种验证 **/
var BindValidator = {
    loadErrorStyleDefaults: function () {
        $.validator.setDefaults({
            success: function (label, element) {
                element.removeClass("error").addClass("valid").parent().siblings(".span3").removeClass("errorimg").addClass("validimg").text("");
            },
            errorPlacement: function (error, element) {
                element.removeClass("valid").addClass("error").parent().siblings(".span3").removeClass("validimg").addClass("errorimg").text(error.html());
            }
        });
    },
    //	loadValidByIndex : function(index){
    //		switch(index){
    //			case 0: this.validIdNo();break;
    //			case 1: this.validTradePsw();break;
    //			case 2: this.validQuestionPsw();break;
    //			case 3: this.validEmail();break;
    //			case 4: this.validPhone();break;
    //			case 5: this.validBankCard();break;
    //			default:this.validIdNo();break;
    //		}
    //	},
    // 验证已绑定手机
    validBindPhoneForm: function () {
        $("#validBindPhoneForm").validate({
            rules: {
                validPhoneImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#validPhoneImgCode").val();
                            }
                        }
                    }
                },
                validPhoneCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPhoneVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2010",
                            imgverifycode: function () {
                                return $("#validPhoneImgCode").val();
                            },
                            smscode: function () {
                                return $("#validPhoneCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                validPhoneImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                },
                validPhoneCode: {
                    required: "Please enter phone verification code",
                    remote: "Wrong phone verification code"
                }
            }
        });
    },
    // 验证手机
    validNewPhoneForm: function () {
        $("#newPhoneForm").validate({
            rules: {
                newPhone: {
                    required: true,
                    isMobile: true,
                    remote: {
                        url: context_path + "/user/bind/isExistedPhone.ashx",
                        type: "post",
                        async: false,
                        data: {
                            phone: function () {
                                return $("#newPhone").val();
                            }
                        }
                    }
                },
                newPhoneValidCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPhoneVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "1020",
                            phone: function () {
                                return $("#newPhone").val();
                            },
                            imgverifycode: function () {
                                return $("#newPhoneImgCode").val();
                            },
                            smscode: function () {
                                return $("#newPhoneValidCode").val();
                            }
                        }
                    }
                },
                newPhoneImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#newPhoneImgCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                newPhone: {
                    required: "Please enter the phone number",
                    remote: "The phone number has been bound by other accounts, please re-enter"
                },
                newPhoneValidCode: {
                    required: "Please enter phone verification code",
                    remote: "Wrong phone verification code"
                },
                newPhoneImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                }
            }
        });
    },
    validChangePhoneForm: function () {
        $("#changePhoneForm").validate({
            rules: {
                phoneStep1ImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#phoneStep1ImgCode").val();
                            }
                        }
                    }
                },
                oldPhoneValidCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPhoneVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "1031",
                            imgverifycode: function () {
                                return $("#phoneStep1ImgCode").val();
                            },
                            smscode: function () {
                                return $("#oldPhoneValidCode").val();
                            }
                        }
                    }
                },
                changePhone: {
                    required: true,
                    isMobile: true,
                    remote: {
                        url: context_path + "/user/bind/isExistedPhone.ashx",
                        type: "post",
                        async: false,
                        data: {
                            phone: function () {
                                return $("#changePhone").val();
                            }
                        }
                    }
                },
                phoneStep2ImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#phoneStep2ImgCode").val();
                            }
                        }
                    }
                },
                changePhoneValidCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPhoneVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "1032",
                            phone: function () {
                                return $("#changePhone").val();
                            },
                            imgverifycode: function () {
                                return $("#phoneStep2ImgCode").val();
                            },
                            smscode: function () {
                                return $("#changePhoneValidCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                phoneStep1ImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                },
                oldPhoneValidCode: {
                    required: "Please enter your email verification code",
                    remote: "Wrong phone verification code"
                },
                changePhone: {
                    required: "Please enter the phone number",
                    remote: "The phone number has been bound by other accounts, please re-enter"
                },
                phoneStep2ImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                },
                changePhoneValidCode: {
                    required: "Please enter phone verification code",
                    remote: "Wrong phone verification code"
                }
            }
        });
    },
    // 验证已绑定邮箱
    validBindEmailForm: function () {
        $("#validBindEmailForm").validate({
            rules: {
                validEmailImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#validEmailImgCode").val();
                            }
                        }
                    }
                },
                validEmailCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validEmailVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "2020",
                            imgverifycode: function () {
                                return $("#validEmailImgCode").val();
                            },
                            emailverifycode: function () {
                                return $("#validEmailCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                validEmailImgCode: {
                    required: "please enter verification code",
                    remote: "Authentication code is wrong"
                },
                validPhoneCode: {
                    required: "Please enter phone verification code",
                    remote: "Wrong phone verification code"
                }
            }
        });
    },
    // 验证邮箱
    validNewEmailForm: function () {
        $("#newEmailForm").validate({
            rules: {
                addEmail: {
                    required: true,
                    isEmail: true,
                    remote: {
                        url: context_path + "/user/bind/isExistedEmail.ashx",
                        type: "post",
                        async: false,
                        data: {
                            email: function () {
                                return $("#addEmail").val();
                            }
                        }
                    }
                },
                addEmailImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#addEmailImgCode").val();
                            }
                        }
                    }
                },
                addEmailCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validEmailVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "1060",
                            email: function () {
                                return $("#addEmail").val();
                            },
                            imgverifycode: function () {
                                return $("#addEmailImgCode").val();
                            },
                            emailverifycode: function () {
                                return $("#addEmailCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                addEmail: {
                    required: "Please enter your e-mail address",
                    remote: "The mailbox has been bound by another account, please re-enter"
                },
                addEmailImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                },
                addEmailCode: {
                    required: "Please enter the email authentication code",
                    remote: "E-mail authentication code error"
                }
            }
        });
    },
    validChangeEmailForm: function () {
        $("#changeEmailForm").validate({
            rules: {
                emailStep1ImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#emailStep1ImgCode").val();
                            }
                        }
                    }
                },
                oldEmailCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validEmailVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "1071",
                            imgverifycode: function () {
                                return $("#emailStep1ImgCode").val();
                            },
                            emailverifycode: function () {
                                return $("#oldEmailCode").val();
                            }
                        }
                    }
                },
                newemail: {
                    required: true,
                    isEmail: true,
                    remote: {
                        url: context_path + "/user/bind/isExistedEmail.ashx",
                        type: "post",
                        async: false,
                        data: {
                            email: function () {
                                return $("#newemail").val();
                            }
                        }
                    }
                },
                emailStep2ImgCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validImgVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            imgverifycode: function () {
                                return $("#emailStep2ImgCode").val();
                            }
                        }
                    }
                },
                newEmailCode: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validEmailVerifyCode.ashx",
                        type: "post",
                        async: false,
                        data: {
                            optype: "1072",
                            email: function () {
                                return $("#newemail").val();
                            },
                            imgverifycode: function () {
                                return $("#emailStep2ImgCode").val();
                            },
                            emailverifycode: function () {
                                return $("#newEmailCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                emailStep1ImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                },
                oldEmailCode: {
                    required: "Please enter your email address",
                    remote: "Mailbox verification code error"
                },
                newemail: {
                    required: "Please enter your e-mail address",
                    remote: "The mailbox has been bound by another account, please re-enter"
                },
                emailStep2ImgCode: {
                    required: "please enter verification code",
                    remote: "Verification code error"
                },
                newEmailCode: {
                    required: "Please enter your email verification code",
                    remote: "Mailbox verification code error"
                }
            }
        });
    },
    changePswQuestionForm: function () {
        $("#changePswQuestionForm").validate({
            rules: {
                oldPswAnswer: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validPswQuestion.ashx",
                        type: "post",
                        async: false,
                        data: {
                            oldpswanswer2: function () {
                                return $("#oldPswAnswer2").val();
                            },
                            optype: "1050"
                        }
                    }
                },
                newPswQuestion: {
                    required: true
                },
                newPswAnswer: {
                    required: true
                }
            },
            messages: {
                oldPswAnswer: {
                    required: "Please enter the original security issue",
                    remote: "wrong answer"
                },
                newPswQuestion: {
                    required: "Please enter a new security question"
                },
                newPswAnswer: {
                    required: "Please enter a new answer"
                }
            }
        });
    },
    changeTradePwdForm: function () {
        $("#changeTradePwdForm").validate({
            rules: {
                oldPassword: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validOldTradePsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            oldtradepsw: function () {
                                return rsapassword($("#oldPassword").val());
                            }
                        }
                    }
                },
                newPassword: {
                    required: true,
                    rangelength: [6, 32],
                    remote: {
                        url: context_path + "/user/bind/equalToLogpsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            tradepsw: function () {
                                return rsapassword($("#newPassword").val());
                            }
                        }
                    }
                },
                confirmNewPassword: {
                    required: true,
                    rangelength: [6, 32],
                    equalTo: "#newPassword"
                }
            },
            messages: {
                oldPassword: {
                    required: "Please enter the original password",
                    remote: "The original password is wrong"
                },
                newPassword: {
                    required: "Please enter a new password",
                    rangelength: "The password length should be between 6-32 digits",
                    remote: "he transaction password can not be the same as the login password"
                },
                confirmNewPassword: {
                    required: "Please enter the confirmation password",
                    rangelength: "Confirm the password length is between 6-32 digits",
                    equalTo: "The two passwords are not the same"
                }
            }
        });
    },
    changeLoginPwdForm: function () {
        $("#changeLoginPwdForm").validate({
            rules: {
                oldLoginPwd: {
                    required: true,
                    remote: {
                        url: context_path + "/user/bind/validOldLogPsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            oldlogpsw: function () {
                                return rsapassword($("#oldLoginPwd").val());
                            }
                        }
                    }
                },
                newLoginPwd: {
                    required: true,
                    rangelength: [6, 32],
                    remote: {
                        url: context_path + "/user/bind/equalToTradepsw.ashx",
                        type: "post",
                        async: false,
                        data: {
                            logpsw: function () {
                                return rsapassword($("#newLoginPwd").val());
                            }
                        }
                    }
                },
                newConfirmLoginPwd: {
                    required: true,
                    rangelength: [6, 32],
                    equalTo: "#newLoginPwd"
                }
            },
            messages: {
                oldLoginPwd: {
                    required: "Please enter the original password",
                    remote: "The original password is wrong"
                },
                newLoginPwd: {
                    required: "Please enter a new password",
                    rangelength: "The password length should be between 6-32 digits",
                    remote: "The password and transaction login password can not be the same"
                },
                newConfirmLoginPwd: {
                    required: "Please enter the confirmation",
                    rangelength: "Confirm the password length is between 6-32 digits",
                    equalTo: "he two passwords are not the same"
                }
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
        $btn.val(wait + "s later can send again");
        wait--;
        setTimeout(function () {
            setDisabledTime($btn);
        }, 1000);
    }
}