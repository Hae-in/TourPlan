<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String membernum = "no";
	if(session.getAttribute("membernum") == null) {  }
	else {	membernum = (String) session.getAttribute("membernum"); }
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
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 32px;
}
.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}
.slider:before {
	position: absolute;
	content: "";
	height: 24px;
	width: 24px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
/* Rounded sliders */
.slider.round {
	border-radius: 40px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</head>
<body>

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
                <td><input type="email" name="id" id="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" id="password"></td>
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
                        로그아웃 되었습니다.
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
                <td><input type="email" name="id" id="rId">
                <span id="checkResultId"></span></td>
            </tr>
            
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" id="rPassword"></td>
            </tr>
            
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="pwCheck" id="rPwCheck">
                <span id="checkResultPw"></span></td>
            
            </tr>
            
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname" id="rNickname">
                <span id="checkResultNickname"></span></td>
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
                        로그아웃 되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
         
         </form>
        </div>
        
<!--    <button id="logBtn" style="width: 200px;">login</button> -->
        <button id="regBtn" style="width: 200px;">회원가입</button>
        <button id="idPwBtn" style="width: 200px;">Id/PW 찿기</button>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    V
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
<<<<<<< HEAD
				<li class="nav-item"><a class="nav-link" href="contact.html">고객센터</a>
=======
				<li class="nav-item"><a class="nav-link" href="../helpdesk/selectAll.do">������</a>
>>>>>>> branch 'master' of https://github.com/JeonHyeJu/TourPlan.git
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

//로그인창 초기화
$("#menuLogin").click(function () {
	$("#frmModal")[0].reset();
	$("#frmModal2")[0].reset();
	memberIdCheck = 0;
	passwordCheck = 0;
	nicknameCheck = 0;
	$("#checkResultId").text("");
	$("#checkResultPw").text("");
	$("#checkResultNickname").text("");
	
});

$("#logBtn").click(function () {
	$("#frmModal2").hide();
	$("#frmModal").show();
	$("#frmModal")[0].reset();
});

$("#regBtn").click(function () {
	$("#frmModal").hide();
	$("#frmModal2").show();
	$("#frmModal2")[0].reset();
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

var memberIdCheck = 0;
var passwordCheck = 0;
var nicknameCheck = 0;

//아이디 중복체크
$("#rId").change(function() {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if(!re.test($("#rId").val())){
		$("#checkResultId").text("이메일 주소를 입력하세요.");
		return; 
	};
	var param = "id="+$("#rId").val();
	$.getJSON("../memberAjax/memberIdCheck", param, function(data,status){ //뷰페이지 상에서 제이슨 형태로 데이터를 가져온다
		if(status =="success" ) {
			if(data == true) {
				$("#checkResultId").text("사용가능한 아이디입니다.");
				memberIdCheck = 1;
			} else {
				$("#checkResultId").text("이미 사용 중인 아이디입니다.");
				memberIdCheck = 0;
			}
		} 
	});
});

//닉네임 중복체크
$("#rNickname").change(function() {
	var param = "nickname="+$("#rNickname").val();
	$.getJSON("../memberAjax/nicknameCheck", param, function(data,status){ //뷰페이지 상에서 제이슨 형태로 데이터를 가져온다
		if(status =="success" ) {
			if(data == true) {
				$("#checkResultNickname").text("사용가능한 닉네임입니다.");
				nicknameCheck = 1;
			} else {
				$("#checkResultNickname").text("이미 사용 중인 닉네임입니다.");
				nicknameCheck = 0;
			}
		} 
	});
});

//비밀번호 중복체크 첫 번째 칸
$("#rPwCheck").prop('disabled', true);
	
$("#rPassword").change(function() {
	$("#rPwCheck").prop('disabled', false);
	
	if($("#rPassword").val() !="" && $("#rPwCheck").val() !="" 
			&& $("#rPassword").val() == $("#rPwCheck").val())
		passwordCheck=1;
	else {
		passwordCheck=0;
		$("#checkResultPw").text("패스워드가 일치하지 않습니다.");
	}
});
/* 
<script language='javascript'>

//checkvalue 기능
function checkvalue() {

//a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
if(test.a.value && test.b.value) {

// 두 필드의 값이 서로 다를 때
if(test.a.value!=test.b.value){

// status 필드에 일치하지 않는다는 문장 출력
test.status.value = "[ 일치하지 않습니다 ]";

// 그에 맞게 길이 수정
test.status.style.width = 120;

// 두 필드의 값이 동일 할 때
} else {

// status 필드에 일치한다는 문장 출력
test.status.value = "[ 일치합니다 ]";

// 역시 그에 맞게 길이 수정
test.status.style.width = 83;
}

//a 텍스트 필드와 b 텍스트 필드 두중하나라도 값이 없을 때
} else {

// 아무것도 입력이 안 되어 있으므로 비밀번호를 입력해 달라는 메세지를 status 필드에 출력 함
test.status.value = "[ 비밀번호를 입력해 주세요 ]";

// 그에 맞게 길이 수정
test.status.style.width = 160;
} */

//비밀번호 중복체크 두 번째 칸

$("#rPwCheck").change(function() {
	if($("#rPassword").val() !="" && $("#rPwCheck").val() !="" 
			&& $("#rPassword").val() ==$("#rPwCheck").val())
		passwordCheck=1;
	else {
		passwordCheck=0;
		$("#checkResultPw").text("패스워드가 일치하지 않습니다.");
	}
});


// 회원가입
$("#reg").click(function() {

	//입력값 체크
	if(memberIdCheck == 0){
        alert("아이디를 입력하세요.");
        $("#rId").focus(); // 입력포커스 이동
        return; // 함수 종료
    }

	if(passwordCheck == 0){
        alert("패스워드가 일치하지 않습니다.");
        $("#rPassword").focus(); // 입력포커스 이동
        return; // 함수 종료
    }

	if(memberIdCheck == 0){
        alert("이미 사용 중인 닉네임입니다."); 
        $("#rNickname").focus(); // 입력포커스 이동
        return; // 함수 종료
    }

	var param = $("#frmModal2").serialize();
	$.getJSON("../memberAjax/insert", param, function(data,status){ //뷰페이지 상에서 제이슨 형태로 데이터를 가져온다
		if(status =="success" ) {
			if(data == true) {
				alert("회원가입 완료");
				$("#frmModal2").hide();
				$("#frmModal2").reset();
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

</body>
</html>