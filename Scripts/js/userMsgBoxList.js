$(function () {
    initReplyDataTable();
    $("#replyDataTable").refreshData();

    initComplaintDataTable();
    $("#complaintDataTable").refreshData();

    // 发送邮件
    $("#sendmailbtn").click(function () {
        sendMail();
    });

    // 保存草稿
    $("#savemailbtn").click(function () {
        $('#sendState').attr("value", "0");
        sendMail();
    });

    // 全选
    $("#selectAllBtn").click(function () {
        var $this = $(this);
        if ($this.text() == "select all") {
            $this.text("unselect all");
            $("#complaintDataTable input:checkbox").prop("checked", true);
        } else {
            $this.text("select all");
            $("#complaintDataTable input:checkbox").prop("checked", false);
        }
    });

    // 批量删除
    $("#bacthDeleteBtn").click(function () {
        batchDelete();
    });

    // 弹窗显示详细
    $("table").on("click", "tr td .title", function () {
        $(".complain-shade").show();
    });
});

// 收件箱加载
function initReplyDataTable() {
    var url = context_path + "/user/b2bmaillist.ashx";
    $('#replyDataTable').comDataTable(
			{
			    "sAjaxSource": url,
			    "fnServerData": function (sSource, aoData,
						fnCallback) {
			        var postData = aoData.concat($('#replySearchForm').serializeArray());
			        ajaxreq({
			            url: sSource,
			            data: postData,
			            success: function (json) {
			                if (json.result == 'ok') {
			                    fnCallback(json.data);
			                } else {
			                    dialog_simple_fail(json.msg);
			                    alert(json.msg);
			                }
			            }
			        })
			    },
			    "aoColumns": [
						{
						    "sName": "readState",
						    "mDataProp": function (aData, type,
									val) {
						        val = '<span id=readState' + aData.mailId + '>';
						        if (aData.readState == '0') {
						            val += "unread";
						        } else {
						            val += "Have read";
						        }
						        val += "</span>";
						        return val;
						    }
						},
						{
						    "sName": "title",
						    "mDataProp": function (aData, type, val) {
						        val = '';
						        val = val + '<a class="title" href="#" onclick="openDetail(\'' + aData.mailId + '\',2)">' + aData.title + '</a>';
						        return val;
						    }
						},
						{
						    "sName": "sendTime",
						    "mDataProp": "sendTime"
						}],
			    "aaSorting": [[13, "desc"]]
			});
};

// 加载发件箱
function initComplaintDataTable() {
    var url = context_path + "/user/b2bmaillist.ashx";
    $('#complaintDataTable')
			.comDataTable(
					{
					    "sAjaxSource": url,
					    "fnServerData": function (sSource, aoData, fnCallback) {
					        var postData = aoData.concat($('#complaintSearchForm').serializeArray());
					        ajaxreq({
					            url: sSource,
					            data: postData,
					            success: function (json) {
					                if (json.result == 'ok') {
					                    fnCallback(json.data);
					                } else {
					                    dialog_simple_fail(json.msg);
					                    alert(json.msg);
					                }
					            }
					        });
					    },
					    "aoColumns": [
								{
								    "sName": "mailId",
								    "mDataProp": function (aData, type,
											val) {
								        val = '<input type="checkbox" name="cb" id="cb_'
					    					+ aData.mailId + '" value="'
					    					+ aData.mailId + '" />';
								        return val;
								    }
								},
								{
								    "sName": "sendState",
								    "mDataProp": function (aData, type,
											val) {
								        val = '';
								        if (aData.sendState == '0') {
								            val += "draft";
								        } else {
								            val += "Has been sent";
								        }
								        return val;
								    }
								},
								{
								    "sName": "title",
								    "mDataProp": function (aData, type,
											val) {
								        val = '';
								        val = val
												+ '<a class="title" href="#" onclick= "openDetail("\''
												+ aData.mailId + '\'",1)">'
												+ aData.title + '</a>';
								        return val;
								    }
								},
								{
								    "sName": "sendTime",
								    "mDataProp": "sendTime"
								},
								{
								    "sName": "",
								    "mDataProp": function (aData, type, val) {
								        val = '';
								        val = val
										+ '<a href="#" class="a1" onclick= "openDetail(\''
										+ aData.mailId
										+ '\',1)">View</a>&nbsp;';
								        if (aData.sendState == '0') {
								            val = val
													+ '<a href="#" class="a3" onclick= "toModify(\''
													+ aData.mailId
													+ '\')">modify</a>&nbsp;';
								        }
								        val = val
										+ '<a href="#" class="a2" onclick= "delOne(\''
										+ aData.mailId
										+ '\')">delete</a>';
								        return val;
								    }
								}],

					    "aaSorting": [[13, "desc"]]
					});
}

// 查看邮件
function openDetail(mailId, mailType) {
    // mailType:1(投诉箱) 2(反馈箱)
    var source = context_path + '/user/mailInfoDetail.ashx?mailId=' + mailId + "&mailType=" + mailType;
    $.ajax({
        url: source,
        success: function (json) {
            if (json.result == 'ok') {
                var datas = json.data;
                if (datas.length > 0) {
                    if (mailType == "1") {
                        $("#emailTitle").text(datas[0].title);
                        $("#username").text(datas[0].userName + ":");
                        $("#askcontent").text(datas[0].mailContent);
                        $("#asktime").text(datas[0].sendTime);
                        $("#askemail").show();
                    } else if (mailType == "2") {
                        var readStateId = "readState" + mailId;
                        var readStateHtml = "已读";
                        $("#" + readStateId).html(readStateHtml);
                        $("#replyusername").text(datas[0].userName + ":");
                        $("#replycontent").text(datas[0].mailContent);
                        $("#replytime").text(datas[0].sendTime);
                        $("#replyemail").show();
                        if (datas.length > 1) {
                            $("#emailTitle").text(datas[1].title);
                            $("#username").text(datas[1].userName + ":");
                            $("#askcontent").text(datas[1].mailContent);
                            $("#asktime").text(datas[1].sendTime);
                            $("#askemail").show();
                        }
                    }
                    $(".complain-shade").show();
                }
            } else {
                alert(json.msg);
            }
        }
    });
}

// 修改投诉
function toModify(mailId) {
    $.ajax({
        type: "post",
        dataType: "json",
        url: context_path + "/user/modifyMail.ashx",
        data: {
            mailId: mailId
        },
        success: function (json) {
            if (json.result == 'ok') {
                $("#title").val(json.data.title);
                $("#mailContent").val(json.data.mailContent);
                $("#mailId").val(json.data.mailId);
                $("#newComplaintTab").click();
            } else {
                alert(json.msg);
            }
        }
    });
}

// 单条删除
function delOne(mailId) {
    try {
        var ok = confirm('You sure you want to delete it？');
        if (ok) {
            var source = context_path + '/user/delOneMail.ashx?mailId=' + mailId + '&mailType=1';
            $.ajax({
                url: source,
                dataType: "json",
                success: function (json) {
                    if (json.result == 'ok') {
                        // 成功后跳转到发件箱页面
                        location.href = context_path + '/user/msgboxlist.aspx?tabindex=1';
                    } else {
                        alert(json.msg);
                    }
                }
            });
        }

    } catch (e) {
        alert(e.message);
    }

}

// 批量删除
function batchDelete() {
    var ids = "";
    $("#complaintDataTable input[name='cb']").each(function () {
        if ($(this).prop("checked")) {
            ids = ids + $(this).val() + ",";
        }
    });
    if (ids == "") {
        alert("Please select the message you want to delete");
        return;
    }
    var ok = confirm('You sure you want to delete it？');
    if (ok) {
        var source = context_path + '/user/batchDelMails.ashx?mailIds=' + ids + '&mailType=1';
        $.ajax({
            url: source,
            dataType: "json",
            success: function (json) {
                if (json.result == 'ok') {
                    // 成功后跳转到发件箱页面
                    location.href = context_path + '/user/msgboxlist.aspx?tabindex=1';
                } else {
                    alert(json.msg);
                }
            }
        });
    }
}

// 发送信息
function sendMail() {
    loadVaildate();
    if ($("#sendMailForm").valid()) {
        var source = context_path + '/user/sendMail.ashx';
        var postData = $('#sendMailForm').serializeArray();
        $.ajax({
            url: source,
            dataType: "json",
            data: postData,
            type: "post",
            success: function (json) {
                if (json.result == 'ok') {
                    // 成功后跳转到发件箱页面
                    location.href = context_path + '/user/msgboxlist.aspx?tabindex=1';
                } else {
                    alert(json.msg);
                    $("#captchacode").attr("value", "");
                    refreshcaptchacode();
                }
            }
        });
    }
}

// 验证
function loadVaildate() {
    $("#sendMailForm").validate({
        rules: {
            title: {
                required: true,
                minlength: 1,
                maxlength: 33,
                chkIllegalchar: true
            },
            mailContent: {
                required: true,
                minlength: 1,
                maxlength: 666,
                chkIllegalchar: true
            },
            captchacode: {
                required: true
            }
        },
        messages: {
            title: {
                required: "Please enter a title",
                chkIllegalchar: "Title has illegal characters",
                maxlength: "The title exceeds the limit length"
            },
            mailContent: {
                required: "Please enter content",
                chkIllegalchar: "Content has illegal characters",
                maxlength: "Content exceeds limit length"
            },
            captchacode: {
                required: "please enter verification code"
            }
        },
        success: function (label, element) {
            element.parents("p").next("p").find(".span2").removeClass("errorimg").text("");
        },
        errorPlacement: function (error, element) {
            element.parents("p").next("p").find(".span2").addClass("errorimg").text(error.html());
        }
    });
}

jQuery.validator.addMethod("chkIllegalchar", function (value, element) {
    var bForbidden = true;
    var strForbidden = new Array("@", "#", "$", "%", "~", "&", "*", "<", ">", "/", "]", "[", "{", "}", "+", "=", "-", "`");
    //遍历用户输入的数据
    for (var i = 0; i < strForbidden.length; i++) {
        for (var j = 0; j < value.length; j++) {
            ch = value.substr(j, 1);
            //如果包含非法字符
            if (ch == strForbidden[i]) {
                //设置此变量为true
                bForbidden = false;
                break;
            }
        }
    }
    return bForbidden;
}, "Invaild symbol");

function refreshcaptchacode() {
    $("#imgcode").attr("src", context_path + "/captchacode.ashx?date=" + new Date());
}
