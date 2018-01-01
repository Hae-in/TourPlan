<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String membernum = "no";
	if(session.getAttribute("membernum") == null) {  }
	else {	membernum = (String) session.getAttribute("membernum"); }
%>
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal">
         <table border="0" width="400px">
            <tr>
                <td><input type="email" name="id" id="id" placeholder="아이디"></td>
            </tr>
            <tr>
                <td><input type="password" name="password" id="password" placeholder="패스워드"></td>
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
                <td><input type="email" name="id" id="rId" >
                <span id="checkResultId"></span></td>
            </tr>
            
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" id="rPassword">
               		</td>
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
                    <button type="button" id="reg">가입하기</button>
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
        
	    <button id="logBtn" style="width: 150px;">login</button>
        <button id="regBtn" style="width: 150px;">회원가입</button>
        <button id="pwBtn" style="width: 150px;">패스워드 찿기</button>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>    
  
<!--   <!-- Modal 비밀번호 발송
  <div class="modal fade" id="pwModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">임시 비밀번호 발송</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal3">
         <table border="0" width="400px">
            <tr>
                <td><input type="email" name="pwCk" id="pwCk" placeholder="이메일 주소"></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="log">이메일 전송</button>
                </td>
            </tr>
        </table>
         </form>
         </div>
         </div>
         </div>
         </div> -->
         
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
					href="../plan/selectAll.do?isopen=1&state=1">여행일정</a></li>
				<li class="nav-item"><a class="nav-link" href="../place/selectAll.do">명소</a></li>
				<li class="nav-item"><a class="nav-link" href="../helpdesk/selectAll.do">고객센터</a></li>
				<li class="nav-item"><a class="nav-link" href="../planTable/makePlan.do">일정만들기</a></li>
				
				<c:if test="${empty sessionScope.memberid}">
				<li class="nav-item"><a class="nav-link" id="menuLogin" style="cursor: pointer;" data-toggle="modal" data-target="#myModal">로그인</a></li>
				</c:if>
				
				<c:if test="${!(empty sessionScope.memberid) }">
				<c:choose>
					<c:when test="${sessionScope.state == '9'}">
						<li class="nav-item"><a class="nav-link" href="../admin/plan.do">관리자</a></li>
						<li class="nav-item"><a class="nav-link" id="menuLogout" style="cursor: pointer;">로그아웃</a></li>
					</c:when>
					<c:when test="${sessionScope.state != '9'}">
						<li class="nav-item"><a class="nav-link" id="menuMy" href="../member/select.do?membernum=<%=membernum%>">Mypage</a></li>
						<li class="nav-item"><a class="nav-link" id="menuLogout" style="cursor: pointer;">로그아웃</a></li>
					</c:when>
				</c:choose>
				</c:if>
				
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

//메뉴바 로그인 버튼 클릭 시 로그인창 초기화
$("#menuLogin").click(function () {
	$("#frmModal")[0].reset();
	$("#frmModal2")[0].reset();
	$("#frmModal2").hide();
	$("#frmModal").show();
	$("#regBtn").show();
	$("#logBtn").hide();
	$(".modal-title").text("로그인");
	memberIdCheck = 0;
	passwordCheck = 0;
	nicknameCheck = 0;
	$("#checkResultId").text("");
	$("#checkResultPw").text("");
	$("#checkResultNickname").text("");

	
});

//로그인 폼 보기
$("#logBtn").click(function () {
	$("#frmModal2").hide();
	$("#frmModal").show();
	$(".modal-title").text("로그인");
	$("#frmModal")[0].reset();
	$("#regBtn").show();
	$("#logBtn").hide();
});

//회원가입 폼 보기
$("#regBtn").click(function () {
	$("#frmModal").hide();
	$("#frmModal2").show();
	$(".modal-title").text("회원가입");
	$("#frmModal2")[0].reset();
	$("#regBtn").hide();
	$("#logBtn").show();
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


$("#rPwCheck").prop('disabled', true);//비밀번호 확인 칸 비활성화
$("#rPassword").change(function() {
	$("#checkResultPw").text("");

	// 비밀번호 숫자/영문/특수문자 혼합, 8~16자 체크
	if(!chkPwd( $.trim($('#rPassword').val()))){
		   $('#rPassword').val('');
		   $('#rPassword').focus();
		   return false;
	}

	$("#rPwCheck").prop('disabled', false);//비밀번호 확인 칸 활성화


	//비밀번호 중복체크 첫 번째 칸
	if($("#rPassword").val() !="" && $("#rPwCheck").val() !="" ){
		if($("#rPassword").val() == $("#rPwCheck").val()){
			passwordCheck=1;
		}
		else {
			passwordCheck=0;
			$("#checkResultPw").text("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
		}
	}	
});

//비밀번호 영문/숫자/특수문자 혼합 입력, 8~16자 체크
function chkPwd(str){

	 var pw = str;
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 8 || pw.length > 16){
		  alert("8자리 ~ 16자리 이내로 입력해주세요.");
		  return false;
	 }

	 if(pw.search(/₩s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
	 } 
	 
	 if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		  return false;
	 }

	 return true;
}

	
//비밀번호 중복체크 두 번째 칸
$("#rPwCheck").change(function() {


	if($("#rPassword").val() !="" && $("#rPwCheck").val() !="" ){
		if($("#rPassword").val() == $("#rPwCheck").val()){
			passwordCheck=1;
		}
		else {
			passwordCheck=0;
			$("#checkResultPw").text("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
			$("#rPwCheck").val("");
			$('#rPwCheck').focus();
		}
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

/* $("#sendPw").click(function() {

	//입력값 체크
	if(memberIdCheck == 0){
        alert("아이디를 입력하세요.");
        $("#rId").focus(); // 입력포커스 이동
        return; // 함수 종료
    }
} */
</script>