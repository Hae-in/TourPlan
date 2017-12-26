<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String membernum = "no";
	if(session.getAttribute("membernum") == null) {  }
	else {	membernum = (String) session.getAttribute("membernum"); }
%>
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">회원가입</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal">
         <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="log">로그인</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
         </form>
        
         <form id="frmModal2">
         <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password"></td>
            </tr>
            
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname"></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="reg">회원가입</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
         
         </form>
        </div>
        
        <button id="logBtn" style="width: 200px;">로그인</button> 
        <button id="regBtn" style="width: 200px;">회원가입</button>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
   
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
					href="../plan/selectAll.do">여행일정</a></li>
				<li class="nav-item"><a class="nav-link" href="../place/selectAll.do">명소</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../helpdesk/selectAll.do">고객센터</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../planTable/makePlan.do">일정만들기</a></li>
				<li class="nav-item"><a class="nav-link" id="menuLogin" style="cursor: pointer;" data-toggle="modal" data-target="#myModal">로그인</a></li>
				<li class="nav-item"><a class="nav-link" id="menuMy" href="../member/select.do?membernum=<%=membernum%>">Mypage</a></li>
				<li class="nav-item"><a class="nav-link" id="menuLogout" style="cursor: pointer;">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" href="../admin/plan.do">관리자</a></li>
				<!-- <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio"> 
						<a class="dropdown-item" href="portfolio-1-col.html">로그인</a> 
						<a class="dropdown-item" href="portfolio-2-col.html">회원가입</a> 
					</div></li>
				 <li class="nav-item">
            	<a class="btn btn-primary" href="contact.html">일정만들기</a>
            </li>
            <li class="nav-item">
            	<a class="btn btn-primary" href="contact.html">로그인</a>
            </li> -->
			</ul>
		</div>
	</div>
</nav>

<script>
var membernum = "<%=membernum%>";

if(membernum == "no") {
	$("#menuMy").hide();
	$("#menuLogout").hide();
	$("#menuLogin").show();
} else {
	$("#menuLogin").hide();
	$("#menuMy").show();
	$("#menuLogout").show();
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

$("#menuLogout").click(function() {
	if(confirm('로그아웃 하시겠습니까?')) {
		$.getJSON("../memberAjax/logout", function(data,status){
			if(status =="success" ) {
				if(data == true) {
					location.reload();
				} else {
					alert("에러발생 관리자에게 문의하세요");
				}
			} else {
				alert("에러발생 관리자에게 문의하세요");
			}
		});
	} else {}
});

$("#log").click(function() {
	var param = $("#frmModal").serialize();//frmModal안의 값을 가져온다
	$.getJSON("../memberAjax/select", param, function(data,status){ //form안 값 = param안의 값,  
		if(status =="success" ) {
			if(data == true) {
				alert("로그인성공");
				location.reload();
			} else {
				alert("아이디와 비밀번호를 확인해 주세요");
			}
		} else {
			alert(status);
		}
	});
});

$("#reg").click(function() {
	var param = $("#frmModal2").serialize();
	$.getJSON("../memberAjax/insert", param, function(data,status){ //뷰페이지 상에서 제이슨 형태로 데이터를 가져온다
		if(status =="success" ) {
			if(data == true) {
				alert("회원가입 완료");
				$("#frmModal2").hide();
				$("#frmModal").show();
			} else {
				alert("오류");
			}
		} else {
			alert(status);
		}
	});
});

</script>