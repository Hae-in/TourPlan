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
<script src='<c:url value='/'/>resources/js/jquery.jqGrid.min.js'></script>
<script src='<c:url value='/'/>resources/js/i18n/grid.locale-kr.js'></script>
<script>
	$.jgrid.defaults.responsive = true;
</script>
<style>
table td {
	font-size: large;
}
</style>
<script> 
	$(function() {
		jQuery("#list2").jqGrid({
			url : '../adminAjax/select',
			editurl: "../plan/adminUpdate.do",
			datatype : "json",
			colNames : [ '일정번호', '아이디', '일정이름', '상태', '등록일' ],
			colModel : [ {
				name : 'plannum',
				index : 'plannum',
				id : 'plannum',
				key : true,
				width : 15,
				align : "center",
				formatter:formatOpt
			}, {
				name : 'userid',
				index : 'userid',
				width : 45,
			}, {
				name : 'planname',
				index : 'planname',
				width : 100,
			}, {
				name : 'state',
				index : 'state',
				width : 30,
				align : "center",
				formatter:'select', 
				formatoptions: {
					value : "0:기본;1:승인;2:승인대기;3:차단;"
				},
				editable : true,
				edittype : "select",
				editoptions : {
					value : "0:대기;1:승인;2:승인대기;3:차단;"
				}
			}, {
				name : 'writedate',
				index : 'writedate',
				width : 60,
				align : "center"
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
			caption : "일정관리"  
		});
		jQuery("#list2").jqGrid('navGrid', '#pager2', {
			edit : true,
			add : false,
			del : true
		},   // options for the Edit Dialog
        {
			beforeSubmit : function( postdata, form , oper) {
				if( confirm('수정하시겠습니까?') ) {
					return [true,''];
				} else {
					return [false, '취소하셨습니다.'];
				}
			},
			afterComplete:function(data) {
				jQuery("#list2").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
	        },
            recreateForm: true,
            closeAfterEdit: true,
            errorTextFormat: function (data) {
                return 'Error: ' + data.responseText
            }
        },   // options for the Delete Dailog
        {
            errorTextFormat: function (data) {
                return 'Error: ' + data.responseText
            }
        });
		
		
		function formatOpt(cellvalue, options, rowObject){      
			return '<a href="../plan/select.do?plannum='+cellvalue+'" style="color: red;">'+cellvalue+'</a>'; 
		}
	});
</script>
</head>
<body>
  	<table id="list2"></table>
	<div id="pager2"></div>
</body>
</html>