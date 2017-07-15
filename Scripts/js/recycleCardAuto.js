$(function () {
    // 去除非法字符
    $("#clearchar").click(function () {
        var $cardcontent = $("#batchForm #cardcontent");
        var $customchar = $("#batchForm #customchar");
        var str = $cardcontent.val();
        str = str.replace(eval('/' + $customchar.val() + '/g'), '');
        $cardcontent.val(str);
        $customchar.val('');
    });

    // 整理卡密
    $("#cleanup").click(function () {
        var cardcontent = $("#batchForm #cardcontent").val();
        if (cardcontent == '') {
            alert('Please enter the card number and password');
            $('#batchForm #cardcontent').focus();
            return false;
        }
        var postData = 'cardcontent=' + encodeURIComponent(cardcontent);
        ajaxreq({
            url: context_path + '/recycle/cleanupcardcontent.ashx',
            data: postData,
            success: function (json) {
                if (json.result == 'ok') {
                    $('#batchForm #cardcontent').val(json.msg);
                } else {
                    dialog_simple_fail(json.msg);
                    alert(json.msg);
                }
            },
            error: function () {
            }
        });
        return false;
    });

    // 智能提交
    $("#bacthSubmitBtn").click(function () {
        var facevalue = $('.autofacevaluelist .linew').find("a").text();
        if (!facevalue) {
            alert('Please select the face value');
            return false;
        }
        $("#batchForm #facevalue").val(facevalue);
        var cardcontent = $("#batchForm #cardcontent").val();
        if (cardcontent == '') {
            alert('Please enter the card number and password');
            $('#batchForm #cardcontent').focus();
            return false;
        }
        // 确认提交
        var sSource = context_path + '/recycle/confirmbatchsubmitcard.ashx';
        var postData = $('#batchForm').serializeArray();
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
    $(".autofacevaluelist").on("click", "ul li", function () {
        $('#batchForm #autoCardFaceValue').html($(this).text());
    });

    // 计算提交卡张数（不检查卡是否非法，仅作为参考）
    $('#batchForm #cardcontent').keydown(function (event) {
        if (event.keyCode == "13" || event.keyCode == "8") {
            calAutoCardNum($(this).val());
        }
    });
    $('#batchForm #cardcontent').on("blur focus", function () {
        calAutoCardNum($(this).val());
    });
});

function calAutoCardNum(val) {
    var counter = 0;
    var shuzu = val.split("\n");
    for (var i = 0; i < shuzu.length; i++) {
        if ($.trim(shuzu[i]) != "")
            counter += 1;
    }
    $("#autoCardNum").html(counter + "sheets");
}

function zhinengConfirmSubmit() {
    $("#confirmSubmitBtn").prop("disabled", true);
    var sSource = context_path + '/recycle/batchsubmitcard.ashx';
    var postData = $('#batchForm').serializeArray();
    ajaxreq({
        url: sSource,
        data: postData,
        success: function (json) {
            if (json.result == 'ok') {
                $('#cardcontent').val('');
                $(".yiwanka-shade").hide();
                loadnotice();
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
    $("#customchar").val('');
}
