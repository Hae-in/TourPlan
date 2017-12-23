<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String membernum = "";
	membernum = (String) session.getAttribute("membernum");
%>
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
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script src="../resources/thema/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
				<li class="nav-item">
				<a class="nav-link" id="menuLogin" style="cursor: pointer;" data-toggle="modal" data-target="#myModal">�α���</a>
				<a class="nav-link" id="menuMy" href="../planTable/planTableView.do">Mypage</a></li>
				<li class="nav-item"><a class="nav-link" href="../admin/plan.do">������</a></li>
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
          <h4 class="modal-title">ȸ������</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal">
         <table border="1" width="400px">
            <tr>
                <td>���̵�</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>��й�ȣ</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="log">�α���</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        ���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        �α׾ƿ��Ǿ����ϴ�.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
         </form>
        
         <form id="frmModal2">
         <table border="1" width="400px">
            <tr>
                <td>���̵�</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>��й�ȣ</td>
                <td><input type="password" name="password"></td>
            </tr>
            
            <tr>
                <td>�г���</td>
                <td><input type="text" name="nickname"></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="reg">ȸ������</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        ���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        �α׾ƿ��Ǿ����ϴ�.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
         
         </form>
        </div>
        
        <button id="logBtn" style="width: 200px;">�α���</button> 
        <button id="regBtn" style="width: 200px;">ȸ������</button>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<script>
var membernum = <%=membernum%>;
if(membernum == null || membernum == "") {

	$("#menuMy").hide();
	$("#menuLogin").show();
} else {
	$("#menuLogin").hide();
	$("#menuMy").show();
}

$("#frmModal2").hide();

$("#logBtn").click(function () {
	$("#frmModal2").hide();
	$("#frmModal").show();
});
$("#regBtn").click(function () {
	$("#frmModal").hide();
	$("#frmModal2").show();
});

$("#log").click(function() {
	console.log("�Լ�����");
	var param = $("#frmModal").serialize();//frmModal���� ���� �����´�
	$.getJSON("../memberAjax/select", param, function(data,status){ //form�� �� = param���� ��,  
		if(status =="success" ) {
			if(data == true) {
				alert("�α��μ���");
				$('#myModal').modal('hide');
			} else {
				alert("���̵�� ��й�ȣ�� Ȯ���� �ּ���");
			}
		} else {
			alert(status);
		}
	});
});

$("#reg").click(function() {
	console.log("�Լ�����");
	var param = $("#frmModal2").serialize();
	$.getJSON("../memberAjax/insert", param, function(data,status){ //�������� �󿡼� ���̽� ���·� �����͸� �����´�
		if(status =="success" ) {
			if(data == true) {
				alert("ȸ������ �Ϸ�");
				$("#frmModal2").hide();
				$("#frmModal").show();
			} else {
				alert("����");
			}
		} else {
			alert(status);
		}
	});
});
</script>

</body>
</html>