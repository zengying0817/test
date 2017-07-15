$(function () {
    // 默认加载:移动神州行卡
    loadFaceValueList($(".danzhang .danzhang-ul li:eq(0)").prop("id"));

    // 根据卡种加载对应面值
    $(".danzhang .danzhang-ul li").click(function () {
        var cardid = $(this)[0].id;
        $("#normalSubmitForm #cardid").val(cardid);
        loadFaceValueList(cardid);
    });

    // 单张提交
    $("#singleSubmitBtn").click(function () {
        doSingleSubmit();
    });

    // 批量提交
    $("#moreSubmitBtn").click(function () {
        var facevalue = $('.normalfacevaluelist .linew').find("a").text();
        if (!facevalue) {
            alert('Please select the face value');
            return false;
        }
        $("#normalSubmitForm #facevalue").val(facevalue);
        var cardcontent = $("#normalSubmitForm #cardcontent").val();
        if (cardcontent == '') {
            alert('Please enter the card number and password');
            $('#normalSubmitForm #cardcontent').focus();
            return false;
        }
        // 确认提交
        var sSource = context_path + '/recycle/confirmbatchsubmitcard.ashx';
        var postData = $('#normalSubmitForm').serializeArray();
        ajaxreq({
            url: sSource,
            data: postData,
            success: function (json) {
                if (json.result == 'ok') {
                    $("#confirmSubmitMsg").html(json.msg);
                    $(".yiwanka-shade").show();
                } else {
                    alert(json.msg);
                }
            },
            error: function () {
            }
        });
    });

    // 获取当前选中的面值
    $(".normalfacevaluelist").on("click", "ul li", function () {
        $('#normalSubmitForm #normalCardFaceValue').html($(this).text());
    });

    // 计算提交卡张数（不检查卡是否非法，仅作为参考）
    $('#normalSubmitForm #cardcontent').keydown(function (event) {
        if (event.keyCode == "13" || event.keyCode == "8") {
            calNormalCardNum($(this).val());
        }
    });
    $('#normalSubmitForm #cardcontent').on("blur focus", function () {
        calNormalCardNum($(this).val());
    });
});

function calNormalCardNum(val) {
    var counter = 0;
    var shuzu = val.split("\n");
    for (var i = 0; i < shuzu.length; i++) {
        if ($.trim(shuzu[i]) != "")
            counter += 1;
    }
    $("#normalCardNum").html(counter + "sheets");
}

// 加载卡种面值
function loadFaceValueList(cardid) {
    ajaxreq({
        type: "post",
        url: context_path + "/recycle/accountRecharge.ashx?cardid=" + cardid,
        success: function (json) {
            if (json.result == "ok") {
                var facevauelist = "";
                var exist_100 = false;
                for (var i = 0; i < json.data.length; i++) {
                    if (json.data[i] === "100") {
                        exist_100 = true;
                        facevauelist += "<li class='linew'><a href='javascript:void(0);'>" + json.data[i] + "</a>yuan</li>";
                    } else {
                        facevauelist += "<li><a href='javascript:void(0);'>" + json.data[i] + "</a>yuan</li>";
                    }
                }
                if (!exist_100) {
                    var $newfacevaluelist = $("<ul>" + facevauelist + "</ul>");
                    $newfacevaluelist.find("li:last").addClass("linew");
                    facevauelist = $newfacevaluelist.html();
                }
                $(".normalfacevaluelist ul").html(facevauelist);
            }
        },
        error: function () {
        }
    });
}

function doSingleSubmit() {
    $('#cardsnmsg').html('');
    $('#cardpswmsg').html('');
    var facevalue = $('.normalfacevaluelist .linew').find("a").text();
    if (!facevalue) {
        alert('Please select the face value');
        return false;
    }
    $("#normalSubmitForm #facevalue").val(facevalue);
    var cardid = $('#normalSubmitForm #cardid').val();
    var cardsn = $('#cardsn').val();
    var cardpsw = $('#cardpsw').val();
    if (cardsn == "") {
        $('#cardsnmsg').html('Please enter the card number！');
        return false;
    }
    if (cardpsw == "") {
        $('#cardpswmsg').html('Please enter a password！');
        return false;
    }

    if (cardid == 'ydszx') {
        if (cardsn.length != 17) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 18) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'ltykc') {
        if (cardsn.length != 15) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 19) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'dxqgk') {
        if (cardsn.length != 19) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 18) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'sdykt') {
        if (cardsn.length != 15 && cardsn.length != 16) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 8) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'jwykt') {
        if (cardsn.length != 16) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 16) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'wmykt') {
        if (cardsn.length != 10) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 15) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'ztykt') {
        if (cardsn.length != 16) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 8) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'wyykt') {
        if (cardsn.length != 13) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 9) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'shykt') {
        if (cardsn.length != 20) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 12) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'jyykt') {
        if (cardsn.length != 13) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 10) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'qq') {
        if (cardsn.length != 9) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 12) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'txykt') {
        if (cardsn.length != 15) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 8) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'thykt') {
        if (cardid.length > 12) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length > 15) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'gyykt') {
        if (cardsn.length != 20) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 8) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else if (cardid == 'zyykt') {
        if (cardsn.length != 15) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length != 15) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    } else {
        if (cardsn.length < 3 || cardsn.length > 30) {
            $('#cardsnmsg').html('Does not meet the rules！');
            $('#cardsn').focus();
            return false;
        }
        if (cardpsw.length < 3 || cardpsw.length > 30) {
            $('#cardpswmsg').html('Does not meet the rules！');
            $('#cardpsw').focus();
            return false;
        }
    }
    var cardtype = $(".cardtypelist li.linew1").find(".span2").text();
    var confirmHtml = "Dear users, your choice is as follows：<br>"
						  + "Card：<b>" + cardtype + "</b><br>"
						  + "face value：<b>" + facevalue + "yuan</b><br>"
						  + "Confirm to submit？"
    $("#confirmSubmitMsg").html(confirmHtml);
    $(".yiwanka-shade").show();
}

function normalConfirmSubmit() {
    // 单张提交
    if ($(".putong-tab .single").hasClass("spanactive1")) {
        $('#confirmSubmitBtn').prop('disabled', true);
        var sSource = context_path + '/recycle/submitcard.ashx';
        var postData = $('#normalSubmitForm').serializeArray();
        ajaxreq({
            url: sSource,
            data: postData,
            success: function (json) {
                if (json.result == 'ok') {
                    $('#cardsn').val('');
                    $('#cardpsw').val('');
                    $(".yiwanka-shade").hide();
                    loadnotice();
                    scrollTo($("#m_orderlist"));
                    setTimeout("$('#m_orderlist').refreshData()", 1000);
                } else {
                    $(".yiwanka-shade").hide();
                    alert(json.msg);
                }
                $('#confirmSubmitBtn').prop('disabled', false);
            },
            error: function () {
                $('#confirmSubmitBtn').prop('disabled', false);
            }
        });
    } else {
        // 多张提交
        $("#confirmSubmitBtn").prop("disabled", true);
        var sSource = context_path + '/recycle/batchsubmitcard.ashx';
        var postData = $('#normalSubmitForm').serializeArray();
        ajaxreq({
            url: sSource,
            data: postData,
            success: function (json) {
                if (json.result == 'ok') {
                    $('#normalSubmitForm #cardcontent').val('');
                    $(".yiwanka-shade").hide();
                    scrollTo($("#m_orderlist"));
                    setTimeout("$('#m_orderlist').refreshData()", 1000);
                } else {
                    $(".yiwanka-shade").hide();
                    alert(json.msg);
                }
                $("#confirmSubmitBtn").prop("disabled", false);
            },
            error: function () {
                $("#confirmSubmitBtn").prop("disabled", false);
            }
        });
        $("#normalSubmitForm #customchar").val('');
    }
}