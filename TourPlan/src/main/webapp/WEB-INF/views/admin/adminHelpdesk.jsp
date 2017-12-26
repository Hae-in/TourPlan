<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value='/'/>resources/js/css/ui.jqgrid-bootstrap.css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src='<c:url value='/'/>resources/js/jquery.jqGrid.min.js'></script>
<script src='<c:url value='/'/>resources/js/i18n/grid.locale-kr.js'></script>
<script>
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
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
				edittype : "textarea",
				editoptions : {
					rows : "2",
					cols : "20"
				},
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