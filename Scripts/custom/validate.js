/** ***********一些基本jqury validate验证*********** */
jQuery.extend(jQuery.validator.messages, {
    required: "Can not be empty",
    remote: "Please fix this field",
    email: "Please enter a properly formatted email",
    url: "Please enter a valid URL",
    date: "Please enter a valid date",
    dateISO: "Please enter a valid date (ISO).",
    number: "Please enter a valid number",
    digits: "Only integers can be entered",
    creditcard: "Please enter a valid credit card number",
    equalTo: "Please enter the same value again",
    accept: "Please enter a string with a legal suffix",
    maxlength: jQuery.validator.format("Length can not be greater than {0}"),
    minlength: jQuery.validator.format("Length can not be less than {0}"),
    rangelength: jQuery.validator.format("The length must be between {0} and {1}"),
    range: jQuery.validator.format("The value must be between {0} and {1}"),
    max: jQuery.validator.format("Can not be greater than {0}"),
    min: jQuery.validator.format("Can not be less than {0}")
});
$.validator.addMethod("isMobile", function (value, element, params) {
    return isMobile(value);
}, 'The phone number is not in the correct format');
$.validator.addMethod("isPhone", function (value, element, params) {
    return isPhone(value);
}, 'The fixed phone is not in the correct format');
$.validator.addMethod("isEmail", function (value, element, params) {
    return isEmail(value);
}, 'E-mail format is incorrect');
$.validator.addMethod("isIdCard", function (value, element, params) {
    return isIDCardNo(value);
}, 'The ID card number is not in the correct format');
//护照号的验证
$.validator.addMethod("ispassport", function (value, element, params) {
    return checknumber(value);
}, 'The passport number is not in the correct format');
$.validator.addMethod("isValidBusCode", function (value, element, params) {
    return isValidBusCode(value);
}, 'The business order number is not in the correct format');
$.validator.addMethod("isChinese", function (value, element, params) {
    return isChinese(value);
}, '请输入中文');
jQuery.validator.addMethod("isLongDate", function (value, element) {
    var reg = /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    r[2] = r[2] - 1;
    var d = new Date(r[1], r[2], r[3], r[4], r[5], r[6]);
    if (d.getFullYear() != r[1])
        return false;
    if (d.getMonth() != r[2])
        return false;
    if (d.getDate() != r[3])
        return false;
    if (d.getHours() != r[4])
        return false;
    if (d.getMinutes() != r[5])
        return false;
    if (d.getSeconds() != r[6])
        return false;
    return true;
}, "Please enter the correct date");
jQuery.validator.addMethod("isShortDate", function (value, element) {
    var reg = /^(\d{4})\-(\d{2})\-(\d{2})$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    r[2] = r[2] - 1;
    var d = new Date(r[1], r[2], r[3]);
    if (d.getFullYear() != r[1])
        return false;
    if (d.getMonth() != r[2])
        return false;
    if (d.getDate() != r[3])
        return false;
    return true;
}, "Please enter the correct date");
//验证两次输入值是否不相同
jQuery.validator.addMethod("notEqualTo", function (value, element, param) {
    return value != $(param).val();
}, $.validator.format("The two inputs can not be the same!"));
function showBadParamSpan(data) {
    $.each(data, function (k, v) {
        if (k == 'province' || k == 'city' || k == 'area') {
            k = 'area';
        }
        var span = $("#" + k).parent().find('span:last');
        if (span && span.attr('for') == k) {
            span.html(v);
            span.show();
        } else {
            var ret = '<span for="' + k
					+ '" generated="true" class="warning" style="">' + v
					+ '</span>';
            $("#" + k).parent().append(ret);
            $("#" + k).parent().find('span:last').show();
        }
    });
}
function checknumber(number){
var str=number;
//在JavaScript中，正则表达式只能使用"/"开头和结束，不能使用双引号
var Expression=/^1[45][0-9]{7}|([P|p|S|s]\d{7})|([S|s|G|g]\d{8})|([Gg|Tt|Ss|Ll|Qq|Dd|Aa|Ff]\d{8})|([H|h|M|m]\d{8，10})$/;
var objExp=new RegExp(Expression);
if(objExp.test(str)==true){
   return true;
}else{
   return false;
} 
}