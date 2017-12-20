<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<!-- Bootstrap core CSS -->
<link href="<c:url value='/'/>resources/thema/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/'/>resources/thema/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
</head>
<body>
<nav
	class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="../main/main.do"><img
			src="../resources/images/white_logo.png" style="width:130px;"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="../plan/selectAll.do">��������</a></li>
				<li class="nav-item"><a class="nav-link" href="../place/selectAll.do">���</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="contact.html">������</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../planTable/planTableView.do">���������</a></li>
				<li class="nav-item"><a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#myModal">�α���</a></li>
				<!-- <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">�α���</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio"> 
						<a class="dropdown-item" href="portfolio-1-col.html">�α���</a> 
						<a class="dropdown-item" href="portfolio-2-col.html">ȸ������</a> 
					</div></li>
				 <li class="nav-item">
            	<a class="btn btn-primary" href="contact.html">���������</a>
            </li>
            <li class="nav-item">
            	<a class="btn btn-primary" href="contact.html">�α���</a>
            </li> -->
			</ul>
		</div>
	</div>
</nav>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
         <form id="frmModal">
          id : <input type="text" name="id">
          pw : <input type="text" name="password">
          <button type="button" id="log">�α���</button>
         </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script src="../resources/thema/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
$("#log").click(function() {
	console.log("�Լ�����");
	var param = $("#frmModal").serialize();
	$.getJSON("../memberAjax/select", param, function(data,status){
		if(status =="success" ) {
			if(data == true) {
				alert("�α��μ���");
			} else {
				alert("���̵�� ��й�ȣ�� Ȯ���� �ּ���");
			}
		} else {
			alert(status);
		}
	});
});

</script>

</body>
</html>