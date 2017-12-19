<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 관리</title>
  <!-- Bootstrap core CSS-->
  <link href="../resources/admin-thema/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="../resources/admin-thema/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="../resources/admin-thema/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="../resources/admin-thema/css/sb-admin.css" rel="stylesheet">

<script>
$(function() {
	$("#delete").click(function() {
		var id = new Array;
		id = $('input[type="checkbox"]:checked').attr("id");
		console.log(id);
	})
	
	//삭제 ajax요청
	/*$("#delte").on('click','',function(){
		var param = $("form").serialize();
		$.getJSON("../planAjax/selectAll", param, function(data,status){
			if(status =="success" ) {
				if( data.length > 0) {
					$("#contentDiv").hide();
					$("#searchDiv").empty();
					for(i=0; i<data.length; i++) {
						var div = "<div class=\"col-lg-4 portfolio-item\">"
				          + "<div class=\"card h-100\">"
				          + "<a href=\"#\"><img class=\"card-img-top\" src=\"http://placehold.it/700x400\" alt=\"\"></a>"
			              + "<div class=\"card-body\">"
			              + "<h4 class=\"card-title\">"
			              + "<a href=\"#\">" + data[i].planname + "</a>"
			              + "</h4>"
			              + "<p class=\"card-text\">test plan</p>"
			              + "</div></div></div>";
						$(div).appendTo($("#searchDiv"));
					}
				}
			} else {
				alert(status);
			}
		})*/
});
</script>
<style>
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
          <a href="#">
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
  
  <div class="content-wrapper">
    <div class="container-fluid" style="margin-left: 25px; margin-right: 20px; padding: 10px 30px;">
      <!-- Example DataTables Card-->
      <div class="card mb-3" style="positon: absolute; padding: 10px; margin: 10px;">
        <div class="card-header">
          <i class="fa fa-table"></i> 일정관리</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th style="width: 10px;"></th>
                  <th>아이디</th>
                  <th>일정명</th>
                  <th>상태</th>
                  <th>좋아요횟수</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th></th>
                  <th>아이디</th>
                  <th>일정명</th>
                  <th>상태</th>
                  <th>좋아요횟수</th>
                </tr>
              </tfoot>
              <tbody>
              <c:forEach items="${planList}" var="list">
                <tr>
                  <td><input type="checkbox" name="plannum" value="${list.plannum}"></td>
                  <td>${list.id}</td>
                  <td>${list.planname}</td>
                  <td>${list.state}</td>
                  <td>${list.likecount}</td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted"><button id="update">수정</button> <button id="delete">삭제</button></div>
      </div>
    </div>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
  </div>
  <!-- Bootstrap core JavaScript-->
    <script src="../resources/admin-thema/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/admin-thema/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="../resources/admin-thema/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="../resources/admin-thema/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../resources/admin-thema/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../resources/admin-thema/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="../resources/admin-thema/js/sb-admin-datatables.min.js"></script>
  
  
</body>

</html>
