$(function () {
    // Loads the default error style for Jquery.validate.js
    loadDefaultErrorStyle();
    // Load Retrieval Validation
    validateApplyForm();
    // Load Binding Card Verification
    validateBindForm();

    // Confirm Binding Card
    $("#bindBankBtn").click(function () {
        if ($("#bindForm").valid()) {
            ajaxreq({
                type: "post",
                dataType: "json",
                url: context_path + "/finance/bindBankCard.ashx",
                data: $("#bindForm").serialize(),
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        window.location.href = context_path + "/finance/applycash.aspx";
                    } else {
                        alert(json.msg);
                    }
                },
                error: function () {
                }
            });
        }
    });

    //Confirm the cash withdrawal
    $("#applycashbtn").click(function () {
        if ($("#applyForm").valid()) {
            var encpassword = rsapassword($("#showtradepsw").val());
            $("#tradepsw").val(encpassword);
            var ok = confirm('Are you sure you want to withdraw?£¿');
            if (ok) {
                $.ajax({
                    type: "post",
                    url: context_path + '/finance/submitapplycash.ashx',
                    data: $("#applyForm").serialize(),
                    success: function (json) {
                        if (json.result == 'ok') {
                            alert(json.msg);
                            window.location.href = context_path + "/finance/cashrecord.aspx";
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

function loadDefaultErrorStyle() {
    $.validator.setDefaults({
        success: function (label, element) {
            element.parents("p").siblings(".p3").find("span").removeClass("errorimg").addClass("validimg").text("");
        },
        errorPlacement: function (error, element) {
            element.parents("p").siblings(".p3").find("span").removeClass("validimg").addClass("errorimg").text(error.html());
        }
    });
}

function validateApplyForm() {
    jQuery.validator.addMethod("isLessThenBalance", function (value, element) {
        return this.optional(element) || parseFloat(value) <= parseFloat(MODEL_BALANCE)
    }, "The cash withdrawal amount can not exceed the balance of the account");

    jQuery.validator.addMethod("isCaptchacodeRequired", function (value, element) {
        return $.trim(value).length > 0 || eval(MODEL_HAVEGOOGLEAUTH);
    }, "please enter verification code");

    jQuery.validator.addMethod("isMobileCodeRequired", function (value, element) {
        return $.trim(value).length > 0 || !eval(MODEL_HAVEGOOGLEAUTH);
    }, "please enter verification code");

    $("#applyForm").validate({
        rules: {
            applymoney: {
                required: true,
                number: true,
                isLessThenBalance: true,
                max: 49999,
                min: 200
            },
            showtradepsw: {
                required: true,
                remote: {
                    url: context_path + "/user/bind/validOldTradePsw.ashx",
                    type: "post",
                    async: false,
                    data: {
                        oldtradepsw: function () {
                            return rsapassword($("#showtradepsw").val());
                        }
                    }
                }
            },
            mobilecode: {
                isMobileCodeRequired: true,
                remote: {
                    url: context_path + "/finance/validMobileCode.ashx",
                    type: "post",
                    async: false,
                    data: {
                        mobilecode: function () {
                            return $("#applyForm #mobilecode").val();
                        }
                    }
                }
            },
            captchacode: {
                isCaptchacodeRequired: true,
                remote: {
                    url: context_path + "/user/bind/validImgVerifyCode.ashx",
                    type: "post",
                    async: false,
                    data: {
                        imgverifycode: function () {
                            return $("#applyForm #captchacode").val();
                        }
                    }
                }
            }
        },
        messages: {
            applymoney: {
                required: "Please enter a cash withdrawal amount",
                number: "Please enter the correct amount",
                max: "The maximum amount of single withdrawal is less than 50,000 yuan",
                min: "The maximum amount of single withdrawal can not be less than 200 yuan",
                remote: "The account has been bound"
            },
            showtradepsw: {
                required: "Please enter the transaction password",
                remote: "The transaction password is incorrect"
            },
            mobilecode: {
                remote: "Wrong cell phone password"
            },
            captchacode: {
                remote: "Verification code error"
            }
        }
    });
}

function validateBindForm() {
    $("#bindForm").validate({
        rules: {
            accountno: {
                required: true,
                isbankno: true,
                minlength: 3,
                maxlength: 64,
                remote: {
                    url: context_path + "/finance/isExistedBankCard.ashx" +
                        "",
                    type: "post",
                    async: false,
                    data: {
                        bankcode: function () {
                            return $("#bankcode").val();
                        },
                        accountno: function () {
                            return $("#accountno").val();
                        },
                        optype: function () {
                            return $("#optype").val();
                        }
                    }
                }
            },
            captchacode: {
                required: true,
                remote: {
                    url: context_path + "/user/bind/validImgVerifyCode.ashx",
                    type: "post",
                    async: false,
                    data: {
                        imgverifycode: function () {
                            return $("#bindForm #captchacode").val();
                        }
                    }
                }
            }
        },
        messages: {
            accountno: {
                required: "Please enter the card number",
                minlength: "Please enter the correct card number",
                maxlength: "Please enter the correct card number",
                remote: "The account has been bound"
            },
            captchacode: {
                required: "please enter verification code",
                remote: "Verification code error"
            }
        }
    });
}

function refreshcaptchacode(obj) {
    $(obj).attr("src", context_path + "/captchacode.ashx?date=" + new Date());
}

jQuery.validator.addMethod("provicevalidator", function (value, element) {
    return value !== "" && value !== "--province--";
}, "Please select a province");

jQuery.validator.addMethod("cityvalidator", function (value, element) {
    return value !== "" && value !== "--city--";
}, "Please select a city");

jQuery.validator.addMethod("bankAddressvalidator", function (value, element) {
    return value !== "";
}, "Please enter a branch");

jQuery.validator.addMethod("isbankno", function (value, element, params) {
    var bankcode = $("#bankcode").val();
    var other = (bankcode === "ZFB" || bankcode === "CFT");
    if (other === true) {
        return true;
    }
    return luhmCheck(value);
}, 'The bank card number is not in the correct format');

/**
		Verify that the card is a bank card
		*/
function luhmCheck(bankno) {

    var lastNum = bankno.substr(bankno.length - 1, 1);//Remove the last digit (compare with luhm)

    var first15Num = bankno.substr(0, bankno.length - 1);//The first 15 or 18 bits
    var newArr = new Array();
    for (var i = first15Num.length - 1; i > -1; i--) {    //The first 15 or 18 bits are stored in reverse order into the array
        newArr.push(first15Num.substr(i, 1));
    }
    var arrJiShu = new Array();  //Odd-numbered bits * 2 <9
    var arrJiShu2 = new Array(); //Odd-numbered bits * 2 >9

    var arrOuShu = new Array();  //An even bit array
    for (var j = 0; j < newArr.length; j++) {
        if ((j + 1) % 2 == 1) {//Odd bit
            if (parseInt(newArr[j]) * 2 < 9)
                arrJiShu.push(parseInt(newArr[j]) * 2);
            else
                arrJiShu2.push(parseInt(newArr[j]) * 2);
        }
        else //Even bit
            arrOuShu.push(newArr[j]);
    }

    var jishu_child1 = new Array();//Odd bits * 2> 9 after the division of the array of single-digit
    var jishu_child2 = new Array();//The odd number of bits * 2> 9 after the division of the tens digit of the array
    for (var h = 0; h < arrJiShu2.length; h++) {
        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
    }

    var sumJiShu = 0; //Odd-numbered bits * 2 <9
    var sumOuShu = 0; //The sum of even-numbered bit arrays
    var sumJiShuChild1 = 0; //Odd bits * 2> 9 after the division of the array of digits
    var sumJiShuChild2 = 0; //And the odd-numbered bits * 2> 9 after the division
    var sumTotal = 0;
    for (var m = 0; m < arrJiShu.length; m++) {
        sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
    }

    for (var n = 0; n < arrOuShu.length; n++) {
        sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
    }

    for (var p = 0; p < jishu_child1.length; p++) {
        sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
        sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
    }
    //Calculate the sum
    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

    //Calculate the Luhm value
    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
    var luhm = 10 - k;
    if (lastNum == luhm) {
        return true;
    }
    else {
        return false;
    }
}

