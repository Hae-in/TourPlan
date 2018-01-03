<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- We support more than 40 localizations -->
<script type="text/ecmascript"
	src="<c:url value='/'/>resources/js/i18n/grid.locale-kr.js"></script>
<!-- This is the Javascript file of jqGrid -->
<script type="text/ecmascript"
	src="<c:url value='/'/>resources/js/jquery.jqGrid.min.js"></script>
<!-- A link to a Boostrap  and jqGrid Bootstrap CSS siles-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="<c:url value='/'/>resources/js/css/ui.jqgrid-bootstrap.css" />
<script>
	$.jgrid.defaults.width = $(".col-lg-9").width();
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';

	$("body").css("padding-top", 0);
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<meta charset="utf-8" />
<title>카테고리관리</title>
</head>
<body>
	<div class="col-lg-9 mb-8" style="margin-left: -15px">
		<table id="jqGrid"></table>
		<div id="jqGridPager"></div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#jqGrid").jqGrid({
				url : '../categoryAjax/selectAll.do',
				editurl : '../categoryAjax/updateAdmin.do',
				datatype : 'json',
				colModel : [ {
					label : '번호',
					name : 'categorynum',
					width : 50,
					key : true,
					editable : true,
					editoptions : {
						readonly : true
					}
				}, {
					label : '카테고리명',
					name : 'categoryname',
					width : 165,
					editable : true
				}, {
					label : '구분',
					name : 'categorygroup',
					width : 100,
					formatter : 'select',
					formatoptions : {
						value : "1:명소;2:일정"
					},
					editable : true,
					edittype : "select",
					editoptions : {
						value : "1:명소;2:일정"
					}
				} ],
				loadonce : true,
				viewrecords : true,
				multiselect : false,
				height : 400,
				rowNum : 10,
				pager : "#jqGridPager"
			});

			$('#jqGrid').navGrid('#jqGridPager',
			// the buttons to appear on the toolbar of the grid
			{
				edit : true,
				add : true,
				del : true,
				search : true,
				refresh : false,
				view : false,
				position : "left",
				cloneToTop : false
			},
			// options for the Edit Dialog
			{
				editCaption : "The Edit Dialog",
				recreateForm : true,
				checkOnUpdate : true,
				checkOnSubmit : true,
				closeAfterEdit : true,
				afterComplete : function(data) {
					$(this).jqGrid('setGridParam', {
						datatype : 'json'
					}).trigger('reloadGrid');
				},
				errorTextFormat : function(data) {
					return 'Error: ' + data.responseText
				}
			},
			// options for the Add Dialog
			{
				closeAfterAdd : true,
				recreateForm : true,
				afterComplete : function(data) {
					$(this).jqGrid('setGridParam', {
						datatype : 'json'
					}).trigger('reloadGrid');
				},
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
	
</body>
</html>