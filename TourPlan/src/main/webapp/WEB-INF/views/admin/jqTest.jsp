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
.sidenav {
	height: 100%;
	width: 300px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #cccccc;
	overflow-x: hidden;
	margin: 0px auto;
}

.outContainer {
	position: absolute;
	top: 20%;
	left: 20%;
	widht: 200px;
	height: 300px;
	margin: -50px 0 0 -50px;
}

/* Side navigation links */
.sidenav a {
	width: 200px;
	height: 50px;
	color: white;
	padding: 16px;
	text-align: center;
	vertical-align: middle;
	text-decoration: none;
	display: block;
	background-color: #666666;
	border-radius: 8px;
}

/* Change color on hover */
.sidenav a:hover {
	background-color: #ddd;
	color: black;
}
li {
	list-style-type:none;
}
</style>  
<script>
	$(function() {
		jQuery("#list2").jqGrid({
			url : '../adminAjax/select',
			editurl: "../plan/adminUpdate.do",
			datatype : "json",
			colNames : [ '일정번호', '아이디', '일정이름', '좋아요수' ],
			colModel : [ {
				name : 'plannum',
				index : 'plannum',
				id : 'plannum',
				key : true,
				editable : true,
				width : 15,
				align : "center",
				
			}, {
				name : 'userid',
				index : 'userid',
				width : 30,
				editable : true
			}, {
				name : 'planname',
				index : 'planname',
				width : 100,
				editable : true
			}, {
				name : 'likecount',
				index : 'likecount',
				width : 15,
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
		
	});
</script>
</head>
<body>
 <!-- Navigation-->
  	<nav>
  	<div class="sidenav">
  	<div class="outContainer">
      <ul>
        <li>
          <a href="index.html">
            회원관리
          </a>
        </li>
        <li><br></li>
        <li>
          <a href='<c:url value='/'/>admin/plan.do'>
            일정관리
          </a>
        </li>
        <li><br></li>
        <li>
          <a href="#">
            명소관리
          </a>
        </li>
        <li><br></li>
        <li>
          <a href="<c:url value='/'/>report/view">
            신고관리
          </a>
        </li>
        <li><br></li>
        <li>
          <a href="#">
            고객센터
          </a>
        </li>
        <li><br></li>
        <li>
          <a href="#">
            카테고리관리
          </a>
        </li>
      </ul>
  </div>
  </div>
  </nav>
  
  <!-------------------------------- nav끝 -------------------------------->
  	<table id="list2"></table>
	<div id="pager2"></div>
</body>
</html>