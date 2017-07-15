//常用项配置和汉化
$.fn.comDataTable = function (init) {
    var oInit = {
        "bDestroy": true,
        "sDom": 'rft<"bottom"lip>', // 元素布局
        "bPaginate": true, // 翻页功能
        "bLengthChange": true, // 改变每页显示数据数量
        "bFilter": false, // 过滤功能
        "bSort": false, // 排序功能
        "bInfo": true,// 页脚信息
        "bAutoWidth": false,// 自动宽度
        "bStateSave": false,// 保存条件等状态在cookie里
        "iDeferLoading": 0,//是否默认加载
        "iDisplayLength": 10,
        "fnStateLoadParams": function (oSettings, oData) {
            oData.iStart = "0"; // 不读取查询页数相关cookie
        },
        "oLanguage": {
            "sLengthMenu": "Every page shows _MENU_ items",
            "sZeroRecords": "No query to the data",
            "sProcessing": "querying...",
            "sInfo": "Current Article _START_ - _END_ item　total _TOTAL_ item",
            "sInfoEmpty": "no data",
            "sInfoFiltered": "(from _MAX_ items records are filtered)",
            "sSearch": "search for：",
            "oPaginate": {
                "sFirst": "Home",
                "sPrevious": "prev",
                "sNext": "next",
                "sLast": "Last"
            }
        },
        // "sPaginationType" : "listbox",
        "sPaginationType": "full_numbers",
        "aLengthMenu": [[10, 20, 50, 100], [10, 20, 50, 100]],
        "bProcessing": true,
        "bServerSide": true
    };
    $.extend(true, oInit, init);
    $(this).dataTable(oInit);
};
// 刷新数据
$.fn.refreshData = function () {
    var oTable = $(this).dataTable();
    oTable.fnPageChange("first");
};
// 控制dataTable列的显示和隐藏
$.fn.dtColumnManager = function (init) {
    var oTable = $(this).dataTable();
    var tableId = $(this).attr("id");
    var showid = init.listTargetID;
    var hideInList = init.hideInList;
    var colList = '';
    var settings = oTable.fnSettings().aoColumns;
    $(settings)
			.each(
					function (index, element) {
					    if ($.inArray(index, hideInList) == -1) {
					        colList += '<li>';
					        if (element.bVisible)
					            colList += '<input id="colum_'
										+ index
										+ '" type="checkbox" checked="checked" onclick="fnShowHide(\''
										+ tableId + '\',' + index + ')"/>';
					        else
					            colList += '<input  id="colum_'
										+ index
										+ '" type="checkbox" onclick="fnShowHide(\''
										+ tableId + '\',' + index + ')"/>';
					        colList += '<label for="colum_' + index + '">'
									+ element.sTitle + "</label>";
					        colList += '</li>';
					    }
					});
    if ($('#' + showid)) {
        $('#' + showid).append(colList);
    }
};
// dataTable列的显示和隐藏切换实现
var fnShowHide = function (tableId, iCol) {
    var oTable = $('#' + tableId).dataTable();
    var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
    oTable.fnSetColumnVis(iCol, bVis ? false : true);
};

$.fn.dataTableExt.oPagination.listbox = {
    "fnInit": function (oSettings, nPaging, fnCallbackDraw) {
        var nInput = document.createElement('select');
        var nPage = document.createElement('span');
        var nOf = document.createElement('span');
        nOf.className = "paginate_of";
        nPage.className = "paginate_page";
        if (oSettings.sTableId !== '') {
            nPaging.setAttribute('id', oSettings.sTableId + '_paginate');
        }
        nInput.style.display = "inline";
        nPage.innerHTML = "the";
        nPaging.appendChild(nPage);
        nPaging.appendChild(nInput);
        nPaging.appendChild(nOf);
        $(nInput).change(
				function (e) { // Set DataTables page property and redraw the
				    // grid on listbox change event.
				    window.scroll(0, 0); // scroll to top of page
				    if (this.value === "" || this.value.match(/[^0-9]/)) {
				        // Nothing entered or non-numeric character
				        return;
				    }
				    var iNewStart = oSettings._iDisplayLength
							* (this.value - 1);
				    if (iNewStart > oSettings.fnRecordsDisplay()) {
				        // Display overrun
				        oSettings._iDisplayStart = (Math.ceil((oSettings
								.fnRecordsDisplay() - 1)
								/ oSettings._iDisplayLength) - 1)
								* oSettings._iDisplayLength;
				        fnCallbackDraw(oSettings);
				        return;
				    }
				    oSettings._iDisplayStart = iNewStart;
				    fnCallbackDraw(oSettings);
				}); /* Take the brutal approach to cancelling text selection */
        $('span', nPaging).bind('mousedown', function () {
            return false;
        });
        $('span', nPaging).bind('selectstart', function () {
            return false;
        });
    },

    "fnUpdate": function (oSettings, fnCallbackDraw) {
        if (!oSettings.aanFeatures.p) {
            return;
        }
        var iPages = Math.ceil((oSettings.fnRecordsDisplay())
				/ oSettings._iDisplayLength);
        var iCurrentPage = Math.ceil(oSettings._iDisplayStart
				/ oSettings._iDisplayLength) + 1;
        var an = oSettings.aanFeatures.p;
        for (var i = 0, iLen = an.length; i < iLen; i++) {
            var spans = an[i].getElementsByTagName('span');
            var inputs = an[i].getElementsByTagName('select');
            var elSel = inputs[0];
            if (elSel.options.length != iPages) {
                elSel.options.length = 0; // clear the listbox contents
                for (var j = 0; j < iPages; j++) { // add the pages
                    var oOption = document.createElement('option');
                    oOption.text = j + 1;
                    oOption.value = j + 1;
                    try {
                        elSel.add(oOption, null); // standards compliant;
                        // doesn't work in IE
                    } catch (ex) {
                        elSel.add(oOption); // IE only
                    }
                }
                spans[1].innerHTML = "page&nbsp;Total" + iPages + "pages";
            }
            elSel.value = iCurrentPage;
        }
    }
};