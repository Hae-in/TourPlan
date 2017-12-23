<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/css/ui.jqgrid.css'>
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery.jqGrid.min.js'></script>
<script src='<c:url value='/'/>resources/js/i18n/grid.locale-kr.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<style>
table td {
	font-size: large;
}
</style>
<script>
	$(function() {
		jQuery("#list2").jqGrid({
			url : '../helpdeskAjax/selectAll.do',
			editurl : '../helpdeskAjax/update.do',
			datatype : "json",
			colNames : [ '번호', '제목', '내용', '등록일' ],
			colModel : [ {
				name : 'num',
				index : 'num',
				num : 'num',
				key : true,
				width : 15,
				align : "center",

			}, {
				name : 'title',
				index : 'title',
				width : 50,
				editable : true
			}, {
				name : 'content',
				index : 'content',
				width : 65,
				editable : true
			}, {
				name : 'writedate',
				index : 'writedate',
				width : 30,
			} ],
			editable : true,
			autowidth : true,
			height : "500px",
			loadonce : true,
			multiselect : true,
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			pager : '#pager2',
			viewrecords : true,
			caption : "고객센터"
		});
		
		jQuery("#list2").jqGrid('navGrid', '#pager2', {
			edit : true,
			add : true,
			del : true
		}, // options for the Edit Dialog
		{
			beforeSubmit : function(postdata, form, oper) {
				if (confirm('수정하시겠습니까?')) {
					return [ true, '' ];
				} else {
					return [ false, '취소하셨습니다.' ];
				}
			},
			afterComplete : function(data) {
				jQuery("#list2").jqGrid('setGridParam', {
					datatype : 'json'
				}).trigger('reloadGrid');
			},
			recreateForm : true,
			closeAfterEdit : true,
			errorTextFormat : function(data) {
				return 'Error: ' + data.responseText
			}
		}, 
        // options for the Add Dialog
        {
        	beforeSubmit : function(postdata, form, oper) {
				if (confirm('추가하시겠습니까?')) {
					return [ true, '' ];
				} else {
					return [ false, '취소하셨습니다.' ];
				}
			},
			afterComplete : function(data) {
				jQuery("#list2").jqGrid('setGridParam', {
					datatype : 'json'
				}).trigger('reloadGrid');
			},
            recreateForm: true,
            closeAfterAdd: true,
            errorTextFormat: function (data) {
                return 'Error: ' + data.responseText
            }
        },
		// options for the Delete Dailog
		{
			errorTextFormat : function(data) {
				return 'Error: ' + data.responseText
			}
		});

	});
</script>
</head>
<body>
	<table id="list2"></table>
	<div id="pager2"></div>
	
</body>
</html>