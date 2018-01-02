<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value='/'/>resources/js/css/ui.jqgrid-bootstrap.css'>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script src='<c:url value='/'/>resources/js/jquery.jqGrid.min.js'></script>
<script src='<c:url value='/'/>resources/js/i18n/grid.locale-kr.js'></script>
<script>
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	//$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<style>
table td {
	font-size: large;
}
</style>
<script>
	$(function() {
		jQuery("#list2").jqGrid({
			url : '../placeAjax/selectAllAdmin.do',
			editurl : '../placeAjax/updateAdmin.do',
			datatype : "json",
			colNames : [ '번호', '명소명', '상태', '등록일' ],
			colModel : [ {
				name : 'placenum',
				index : 'placenum',
				key : true,
				width : 20,
				align : "center",
				editable : true
			}, {
				name : 'placename',
				index : 'placename',
				editable : true
			}, {
				name : 'state',
				index : 'state',
				width : 30,
				align : "center",
				formatter:'select', 
				formatoptions: {
					value : "0:대기;1:승인;3:차단"
				},
				editable : true,
				edittype : "select",
				editoptions : {
					value : "0:대기;1:승인;3:차단;"
				}		
			}, {				
				name : 'writedate',
				index : 'writedate',
				width : 80,
				align : "center"
			} ],
			editable : true,
			autowidth : true,
			height : "500px",
			align : "center",
			loadonce : true,
			multiselect : true,
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			pager : '#pager2',
			viewrecords : true,
			caption : "명소관리"
		});

		jQuery("#list2").jqGrid('navGrid', '#pager2', {
			edit : true,
			add : false,
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
				recreateForm : true,
				closeAfterAdd : true,
				errorTextFormat : function(data) {
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