<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String membernum = "no";
	if(session.getAttribute("membernum") == null) {  }
	else {	membernum = (String) session.getAttribute("membernum"); }
%>
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>

<head>
<style>
.button {
    background-color: #FF8F00; /* Green */
    border: none;
    color: white;
    padding: 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

.button1 {padding: 8px 60px;}
.button2 {padding: 8px 140px;}
.button3 {padding: 8px 20px; background-color: #e7e7e7; color: black;}
.button4 {padding: 8px 60px;}
.button5 {border-radius: 50%;}
</style>
</head>


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
         <table border="0" width="170px" align="center" cellspacing="10" cellpadding="5">
            <tr>
                <td><input type="email" name="id" id="id" placeholder="아이디"></td>
            </tr>
            <tr>
                <td><input type="password" name="password" id="password" placeholder="패스워드"></td>
            </tr>
           
            <tr>
                <td colspan="2" align="center">

                    <button type="button" id="log" class="button button1">로그인</button>
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
         <table border="0" width="370px" cellspacing="15" cellpadding="10" align="center">
            <tr center>
                <td align="center">아이디</td>
                <td align="center"><input type="email" name="id" id="rId" width="150px">
                <span id="checkResultId"></span></td>
            </tr>
            
            <tr>
                <td align="center">비밀번호</td>
                <td align="center"><input type="password" name="password" id="rPassword">
               		</td>
            </tr>
            
            <tr>
                <td align="center">비밀번호 확인</td>
                <td align="center"><input type="password" name="pwCheck" id="rPwCheck">
                <span id="checkResultPw"></span></td>
            
            </tr>
            
            <tr>
                <td align="center">닉네임</td>
                <td align="center"><input type="text" name="nickname" id="rNickname">
                <span id="checkResultNickname"></span></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="reg" class="button button2">가입하기</button>
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
        
        <table border="0" width="370px" cellspacing="15" cellpadding="10" align="center">
        	<tr>
        		<td align="center"><button id="logBtn" style="width: 150px;" class="button button3">로그인</button>&nbsp;<button id="regBtn" style="width: 150px;" class="button button3">회원가입</button></td>
        		<td align="center"><button id="pwBtn" style="width: 150px;" data-toggle="modal" data-target="#pwModal" class="button button3">패스워드 분실</button></td>
        	</tr>
        <!-- 	<tr><td></td><td></td></tr> -->
        	<tr>
        		<td align="center" data-toggle="modal" data-target="#terms" ><span style="color:#007BFF">이용약관</span></td>
				<td align="center"data-toggle="modal" data-target="#privPolicy" ><span style="color:#007BFF">개인정보보호정책</span></td>
			</tr>
		</table>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>    
  
 <!-- Modal 비밀번호 발송-->
  <div class="modal fade" id="pwModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">임시 비밀번호 발송</h4>
          <button type="button" class="close" data-dismiss="modal" data-toggle="modal" data-target="#pwModal">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal3">
         <table border="0" width="170px" align="center" cellspacing="10" cellpadding="5">
         
            <tr>
                <td align="center"><input type="email" name="pwCk" id="pwCk" placeholder="이메일 주소"></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="sendPw" class="button button4">보내기</button>
                </td>
            </tr>
        </table>
         </form>
         </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
         </div>
         </div>
         </div> 
         
          <!-- 이용약관-->
  <div class="modal fade" id="terms" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"><span style="color:#007BFF">이용약관</span></h4>
          <button type="button" class="close" data-dismiss="modal" data-toggle="modal" data-target="terms">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal4">
    		<span style = " font-size:0.66em;"> 
    		<pre>    
    제1조 [목적]
    본 약관은 (주)예담직업전문학교(이하 “회사”라 합니다)가 웹 사이트(www.tourplan.com)를 
    통하여 제공하는 관련 제반 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 회사와 회원과의 
    권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

    제2조 [정의]
    이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
    - "회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 
    	체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
    - "아이디(ID)"라 함은 "회원"의 식별과 서비스 이용을 위하여 "회원"이 정하고 
		"회사"가 승인하는 “회원”의 전자우편 주소를 의미합니다.
    - "비밀번호"라 함은 "회원"이 "아이디“와 일치되는 "회원"임을 확인하고 비밀보호를 
		위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
    - "게시물"이라 함은 회원이 서비스를 이용함에 있어 서비스 상에 게시한 정보 형태의 
		글, 사진, 그림, 동영상 및 각종 파일과 링크 등을 의미합니다.
    - “전자우편(E-mail)”이라 함은 인터넷을 통한 우편 혹은 전기적 매체를 이용한 
    	우편을 말합니다.
    - “운영자(관리자)”라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 
    	선정한 사람 또는 회사를 말합니다.
    - “제휴사”라 함은 회사와 계약 하에 서비스에 제휴사의 상품을 노출하는 목적으로 정보를 
    	제공하고 있는 법인을 말합니다.
    - “콘텐츠”라 함은 정보통신망에서 사용되는 부호•문자•음성•음향•이미지 또는 영상 등으로 
    	표현된 자료 또는 정보로서, 그 보존 및 이용에 있어서 효용을 높일 수 있도록 
    	전자적 형태로 제작 또는 처리된 것을 말합니다.
    - “마일리지”란 “회원”의 “서비스” 이용실적에 따라 “회사”가 정한 정책에 의하여 
    	“회원”에게 지급되어 “서비스” 이용 시 회원 등급의 상승 또는 유료 콘텐츠 구입에 
    	사용할 수 있는 포인트를 말합니다.

    제3조 [약관의 게시와 개정]
    1) "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
    2) "회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호에관한법률
    	(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
    3) "회원"이 개정약관에 동의하지 않는 경우 회사는 개정약관의 내용을 적용할 수 없으며, 
    	이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 
    	사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.
    4) 회사가 약관을 개정할 경우에는 제9조의 방법으로 회원에게 통지합니다.

    제4조 [약관의 해석]
    1) 회사는 개별 서비스에 대해서는 별도의 이용약관 및 정책("기타 약관 등"이라 함)을 
    	둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 
    	"기타 약관 등"이 우선하여 적용됩니다.
    2) 이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "기타 약관 등" 및 관계법령 
    	또는 상관례에 따릅니다.

    제5조 [이용계약 체결]
    1) 이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 
    	동의를 한 다음 회원가입신청을 하고 "회사"가 
    	이러한 신청에 대하여 승낙함으로써 체결됩니다.
    2) "회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 
    	다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 
    	사후에 이용계약을 해지할 수 있습니다.
    - 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
    - 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
    - 이용자의 귀책사유로 인하여 승인이 불가능하거나 
    	기타 규정한 제반 사항을 위반하며 신청하는 경우
    - 기타 서비스 제공에 장애 발생이 우려되는 경우

    제6조 [회원정보의 변경]
    1) "회원“은 서비스를 이용하기 위해서 국적, 생일, 성별 정보를 입력합니다. 
    	입력한 정보에 대해서 비공개처리를 할 수 있으며, ”아이디“, ”전자우편“을 제외한 
    	나머지 정보는 익명으로 처리되어 ”서비스“ 통계자료로 활용될 수 있습니다.
    2) "회원"은 개인정보관리화면을 통하여 언제든지 
    	본인의 개인정보를 열람하고 수정할 수 있습니다. 
    	다만, 서비스 관리를 위해 필요한 아이디 등은 수정이 불가능합니다.
    3) "회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 
    	온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여
    	그 변경사항을 알려야 합니다.
    4)　제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 
    	"회사"는 책임지지 않습니다.

    제7조 [개인정보보호 의무]
    1) "회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 "개인정보"를 
    	보호하기 위해 노력합니다. "개인정보"의 보호 및 사용에 대해서는 관련법 및 
    	"회사"의 개인정보 취급방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 
    	링크된 사이트에서는 "회사"의 개인정보 취급방침이 적용되지 않습니다.

    제8조 ["회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무]
    1) "회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 
    	이를 제3자가 이용하도록 하여서는 안 됩니다.
    2) "회사"는 회원의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 
    	미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인한 우려가 있는 경우, 
    	해당 "아이디"의 이용을 제한할 수 있습니다.
    3) "회원"은 "아이디"및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 
    	인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
    4) 제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 
    	"회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.

    제9조 ["회원"에 대한 통지]
    1) "회사"가 "회원"에 대한 통지를 하는 경우 본 약관에 별도 규정이 없는 한 "회원"이 
    	지정한 전자우편주소로 할 수 있습니다.
    2) "회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 
    	제1항의 통지에 갈음할 수 있습니다.

    제10조 ["회사"의 의무]
    1) "회사"는 관련법과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 
    	계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
    2) "회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 
    	개인정보(신용정보 포함)보호를 	위해 보안시스템을 갖추어야 하며 
    	개인정보 취급방침을 공시하고 준수합니다.
    3) "회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 
    	인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 
    	게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.

    제11조 [서비스 이용의 중지 또는 계약의 해지]
    1) "회원"은 다음 행위를 하여서는 안 됩니다.
    - 신청 또는 변경 시 허위내용 기재 및 타인의 정보도용
    - "회사"에 게시된 정보의 변경
    - "회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
    - "회사"와 기타 제3자의 저작권 등 지적재산권에 대한 침해
    - "회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
    - 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 
    	"회사"에 공개 또는 게시하는 행위
    - 회사의 사전 서면 동의 없이 영리를 목적으로 서비스를 사용하는 행위
    - 다른 회원의 개인정보를 수집하거나 이를 위해 유인하는 행위
    - 범죄를 목적으로 하는 등 범죄행위와 관련된 행위
    - 제3자에게 접속권한을 부여하는 행위
    - 허위 내용을 전송•게시하거나 다른 회원에게 불쾌감을 주는 행위를 반복하는 행위
    - 다른 회원의 서비스 이용을 방해하거나 전자상거래 질서를 위협하는 행위
    - 회사의 사전 서면 동의 없이 상업적 광고•홍보 또는 상거래를 하는 행위
    - 기타 “회사”에게 위해가 될 수 있는 불법적이거나 부당한 행위를 하여서는 안 됩니다.
    2) "회원"은 관계법, 본 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항,
    	"회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 
    	방해되는 행위를 하여서는 안 됩니다.

    제12조 [서비스의 제공 및 이용료]
    1) 회사는 회원에게 아래와 같은 서비스를 제공합니다.
	tourplan : 운영자 또는 사용자가 등록한 여행 정보의 관리/저장/공유를 위한 
		여행관련 서비스, 기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 
		회원에게 제공하는 일체의 서비스를 포함
	tourplan+ : “제휴사”가 등록한 상품 정보나 제휴사의 여행 정보 기타 제휴사가 
		사용키로 한 컨텐츠만 별도로 제공하는 서비스로서 tourplan의 일부 
		또는 부가적으로 제공하는 일체의 서비스를 포함
    2) 서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
    3) 회사는 서비스를 일정범위로 분할하여 각 범위 별로 이용가능시간을 
    	별도로 지정할 수 있습니다. 다만 이러한 경우에는 그 내용을 사전에 공지하며, 
    	부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
    4) "회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 
    	운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 
    	이 경우 "회사"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 
    	다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 
    	사후에 통지할 수 있습니다.
    5) "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 
    	서비스 제공화면에 공시한 바에 따릅니다.
    6) “회사”가 제공하는 서비스는 “이용자”와 “제휴사”간에 재화 또는 용역을 
    	거래할 수 있도록 서비스 이용을 허락하거나, 통신판매를 중개하고 재화 또는 용역의 
    	정보만을 제공하는 것을 목적으로 하며, 서비스에서 제공되는 모든 재화 또는 용역의 
    	정보에 관련해서는 “제휴사”가 일체의 책임을 가지고 있습니다.
    7) “회원” 및 비회원 이용자들에 대한 이용료는 무료로 제공합니다.
    8) “회사”는 “제휴사”에 전자상거래에 관한 서비스를 제공하는 대가로 “회사”의 
    	내부 정책에 따라 서비스 이용료를 부과할 수 있습니다.


    제13조 [서비스의 변경]
    1) “회사”는 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 
    	일부 서비스를 변경할 수 있습니다.
    2) 서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 
    	변경될 서비스의 내용 및 제공일자 등은 그 변경 전 
    	서비스 초기화면에 제공하도록 합니다.

    제14조 [정보의 제공 및 광고의 게재]
    1) “회사"는 "회원"이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 
    	전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다.
    2) "회원"은 관련법에 따른 거래관련 정보, 고객센터 답변 등을 제외하고 언제든지 
    	전자우편 등을 통하여 수신 거절을 할 수 있습니다.
    3) "회사"는 "서비스"의 운영과 관련하여 서비스화면, 홈페이지, 전자우편 등에 
    	광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 
    	수신거절을 "회사"에게 할 수 있습니다.
    4) 회원이 광고를 이용함으로써 발생하는 모든 손해는 회원과 광고주가 직접 
    	해결하여야 하며, 이와 관련하여 회사 또는 제휴업체는 어떠한 책임도 지지 않습니다.

    제15조 [게시물의 저작권]
    1) "회원"이 서비스 내에 게시한 게시물의 저작권은 해당 게시물을 게시한 회원에게 귀속됩니다.
    2) 회원이 게시물을 게시하는 경우 회사가 이를 전세계적이고 비독점적으로 사용료 없이 
    	이용하는 것을 허락한 것으로 봅니다.
    3) "회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 또는 "서비스" 및 
    	관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 
    	일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 
    	준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 
    	해당 게시물에 대한 삭제, 비공개 등의 조치를 취할 수 있습니다.
    4) "회사"는 그 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우에는 
    	전화, 팩스, 전자우편 등을 통해 사전에 회원의 동의를 얻어야 합니다.

    제16조 [게시물의 관리]
    1) 회사는 회원의 게시물이 다음 각 호에 해당하는 경우 사전 통지나 동의 없이도 이를 삭제 
    	또는 30일의 범위 내에서 접근을 차단하고 해당 사실을 회원에게 통지합니다.
    - 본 약관을 위반한 경우
    - 타인을 모욕, 비방하거나 명예를 훼손하는 경우 및 범죄행위를 목적으로 하거나 
    	교사 또는 방조하는 내용인 경우
    - 타인의 저작권 등 지적재산권을 침해하는 내용인 경우
    - 정보통신시스템, 데이터 또는 프로그램 등을 훼손•멸실•변경•위조하거나 
    그 운용을 방해하는 내용인 경우
    - 음란, 저속하거나 폭력적 또는 공포심이나 불안감을 유발하는 등 
    	선량한 풍속 기타 사회지서에 반하는 경우
    - 탈퇴자가 게시한 게시물인 경우
    - 정보통신망법을 위반한 청소년유해매체물인 경우
    -기타 법령에 위배되는 경우
    2) "회원"의 게시물이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 
    	포함하는 경우, 또는 게시물로 인하여 법률상 권리를 침해 당한 다른 회원 또는 
    	제3자는 관련법 및 회사가 별도로 정한 절차에 따라 해당 게시물의 게시중단, 
    	삭제 또는 반박내용의 게재 등을 요청할 수 있으며, "회사"는 관련법 및 
    	내부 절차에 따라 조치를 취한 후 요청자에게 통지여야 합니다.
    3) "회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 
    	사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 
    	해당 게시물에 대해 임시조치 등을 취할 수 있습니다. 본 조항에 따른 세부절차는 
    	"정보통신망법" 및 "저작권법"이 규정한 범위 내에서 회사가 정한 
    	게시중단요청서비스에 따릅니다.

    제17조 [권리의 귀속]
    1) "서비스"에 대한 저작권 및 지적재산권은 회사에 귀속됩니다. 
    	단, 회원의 게시물 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
    2) "회사"는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 
    	계정, 아이디, 콘텐츠 등을 이용할 수 있는 이용권만을 부여하며, 
    	"회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.

    제18조 [유료 콘텐츠]
    1) "회사”는 “회원”에게 유료로 일부 콘텐츠 이용권을 제공할 수 있으며, 
    	이 경우에도 해당 콘텐츠에 대한 저작권 등 일체의 권리는 “회사”에 있으므로 
    	“회원”은 구입한 콘텐츠의 양도, 판매, 담보제공 등의 처분행위는 물론, 
    	복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 
    	제3자엑 이용하게 하여서는 아니 됩니다.
    2) “회원”이 “회사”가 제공하는 유료 콘텐츠를 이용하고자 할 경우 다음과 같은 절차에 
    	의하여 이용신청을 하여야 합니다.
    - "콘텐츠" 목록의 열람 및 선택
    - 성명, 주소, 전화번호(또는 이동전화번호), 전자우편주소 등 필요한 정보의 입력
    - 약관내용, 청약철회가 불가능한 "콘텐츠"에 대해 
    	"회사"가 취한 조치에 관련한 내용에 대한 확인
    - 이 약관에 동의하고 위 제3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
    - "콘텐츠"의 이용신청에 관한 확인 또는 "회사"의 확인에 대한 동의
    - 결제방법의 선택
    3) "회사"는 "회원"의 이용신청이 다음 각 호에 해당하는 경우에는 
    	승낙하지 않거나 승낙을 유보할 수 있습니다.
    - 실명이 아니거나 타인의 명의를 이용한 경우
    - 허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
    - 미성년자가 청소년보호법에 의해서 이용이 금지되는 "콘텐츠"를 이용하고자 하는 경우
    - 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우3) 
    	"콘텐츠"의 이용에 대한 대금지급방법은 다음 각 호의 방법 중 가능한 방법으로 
    	할 수 있습니다. 단, “회사”는 사정에 따라 대금지급방법의 전부 또는 일부를 
    	“회사” 외의 제3자가 제공하는 온라인 결제 서비스 등으로 대체할 수 있으며, 이 경우 
    	제3자의 결제 대행 서비스에 관하여는 해당 제3자의 약관을 별도로 참고하시기 바랍니다.
    - 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
    - 선불카드, 직불카드, 신용카드 등의 각종 카드결제
    - 온라인무통장입금
    - 전자화폐에 의한 결제
    - 마일리지 등 "회사"가 지급한 포인트에 의한 결제
    - "회사"와 계약을 맺었거나 "회사"가 인정한 상품권에 의한 결제
    - 전화 또는 휴대전화를 이용한 결제
    - 기타 전자적 지급방법에 의한 대금지급 등
    4) "회사"와 "콘텐츠"의 이용에 관한 계약을 체결한 "회원"은 수신확인의 통지를 
    	받은 날로부터 7일 이내에는 청약의 철회를 할 수 있습니다. 
    	다만, "회사"가 다음 각 호중 하나의 조치를 취한 경우에는 
    	"회원"의 청약철회권이 제한될 수 있습니다.
    - 청약의 철회가 불가능한 "콘텐츠"에 대한 사실을 표시사항에 포함한 경우
    - 시용상품을 제공한 경우
    - 한시적 또는 일부이용 등의 방법을 제공한 경우
    5) “회사”가 “회원”에게 청약철회 또는 유료 콘텐츠 이용계약의 해제•해지 등으로 
    	인하여 결제 대금을 반환할 경우, “회사”는 결제 대금에서 “회사”가 
    	온라인 결제 서비스 제공자 등 제3자에게 지급한 수수료 및 “회사가” 
    	별도로 정한 수수료를 공제한 잔액만을 반환합니다. 
    	단, 마일리지로 결제된 경우에는 제19조 제2항에 따라 
    	환산된 마일리지가 공제되며, 마일리지와 기타 결제 방법이 혼용된 경우에는 
    	기타 결제 방법에서 먼저 공제하고 부족함이 있을 때 마일리지에서 공제합니다.
    6) “회사”는 유료 콘텐츠의 사실 여부, 신뢰도, 정확성 등 내용에 관하여 
    	“회원”에게 어떠한 보증도 하지 않으며, “회원”은 유료 콘텐츠를 
    	“회원” 스스로의 판단과 책임하에 구입, 사용하여야 합니다.

    제19조 [마일리지]
    향후 수립

    제20조 ["회원"의 계약해제, 해지 등]
    1) "회원"은 언제든지 개인정보 관리 메뉴를 통하여 서비스 탈퇴 신청을 할 수 있으며, 
    "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
    2) "회원"이 계약을 해지할 경우, 관련법 및 개인정보 취급방침에 따라 회사가 회원정보를 
    	보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터는 소멸됩니다.
    3) "회원"이 계약을 해지하였으나 본인 계정에 등록하고 공개한 “게시물”은 보존됩니다.

    제21조 [이용제한 등]
    1) "회사"는 "회원"이 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우, 
    	“운영자”의 권한으로 “회원”의 서비스이용을 제한할 수 있습니다.
    2) "회사"는 전항에도 불구하고, "저작권법"을 위반한 불법프로그램의 제공 및 운영방해, 
    	"정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 
    	등과 같이 관련법을 위반한 경우에는 즉시 계약해지를 할 수 있습니다. 
    	본 항에 따른 계약해지 시 서비스 이용을 통해 획득한 혜택 등도 모두 소멸되며, 
    	회사는 이에 대해 별도로 보상하지 않습니다.
    3) "회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 
    	이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 
    	회사는 즉시 서비스의 이용을 재개합니다.

    제22조 [서비스 종료]
    회사가 제9조의 방법으로 회원에게 공지 또는 통지함으로써 서비스를 종료할 수 있습니다

    제23조 [손해배상]
    1) 회원이 본 약관을 위반함으로 인하여 회사에 손해가 발생한 경우, 본 약관을 위반한 회원은 
    	회사에 발생한 모든 손해를 배상하여야 합니다.
    2) 회원이 서비스를 이용함에 있어 본 약관을 위반하거나 불법행위를 하여 회사가 제3자로부터 
    	손해배상을 청구 받는 경우 당해 회원은 자신의 책임과 비용으로 회사를 면책시켜야 하며 
    	그로 인하여 회사에 발생하는 모든 손해를 배상하여야 합니다.

    제24조 [책임제한]
    1) “회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 
    	제공할 수 없는 경우, 제12조에 따라 서비스를 제한•중단하거나 제13조에 따라 
    	서비스를 변경하는 경우 및 제19조와 제22조에 따라 서비스를 종료하여 
    	기존 서비스를 더 이상 제공하지 않는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다
    2) “회사"는 "회원" 의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.
    3) "회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 
    	내용에 관하여는 책임을 지지 않습니다.
    4) "회사"는 "회원" 간 또는 "회원"과 “제휴사”를 포함한 제3자 상호간에 
    	"서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
    5) "회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 
    	특별한 규정이 없는 한 책임을 지지 않습니다.
    6) “회사”는 “제휴사”의 귀책사유로 발생한 서비스 장애에 대해서는 책임을 지지 않습니다.

    제25조 [외국 회원]
    대한민국 외의 국가에서 서버를 이용하는 회원은 회원의 개인정보가 대한민국에 전송되고 
    대한민국 내에서 처리되는 것에 동의합니다.

    제26조 [준거법 및 재판관할]
    1) "회사"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.
    2) "회사"와 "회원"간 발생한 분쟁에 관한 소송은 대한민국 서울특별시에 있는 
    	서울중앙지방법원 전속관할로 합니다. 단, 제18조의 유료 콘텐츠에 관한 분쟁은 
    	“회원”의 주소지를 관할하는 법원으로 합니다.
    3) 본 약관은 한글로 작성되었으며, 영어 등 다른 언어로 번역된 경우에도 한글 원본이 우선합니다.


    부칙

    본 약관은 2018년 01월 01일부터 적용됩니다.
    	</pre>
		</span>
         </form>
         </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
         </div>
         </div>
         </div> 
         
         
          <!-- 개인정보보호정책-->
  <div class="modal fade" id="privPolicy" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"><span style="color:#007BFF">개인정보보호정책</span></h4>
          <button type="button" class="close" data-dismiss="modal" data-toggle="modal" data-target="privPolicy">&times;</button>
        </div>
        <div class="modal-body">
        
         <form id="frmModal5">
         <span style = " font-size:0.66em;">   
         <pre>
㈜투어플랜 개인정보 취급방침
(주)투어플랜(이하 "회사"라 함)은 정보통신망 이용촉진 및 정보보호 등에 관한 법률
(이하 “정보통신망법”이라 함) 등 정보통신서비스 제공자가 준수하여야 할 관련
법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보 취급방침을
정하여 이용자 권익 보호에 최선을 다하고 있습니다.

1. 수집하는 개인정보 항목 및 수집방법
가. 수집하는 개인정보의 항목
1) 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시
   아래와 같은 개인정보를 수집하고 있습니다.
- 필수 항목 : 전자우편 주소, 비밀번호, 닉네임,  현재 위치정보 

2) 서비스 이용과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
- 이용자 상태정보, 접속아이피(IP), 쿠키(Cookie), 방문 일시, 서비스 이용 기록,
  불량 이용 기록, 휴대전화 SN(Serial Number) 및 모델명, 이동통신사 정보, 

나. 개인정보 수집방법
- 서비스 가입이나 사용 중 이용자의 자발적 제공을 통한 수집

2. 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용하며, 이용자가 제공한 모든 정보는 다음의
목적에 필요한 용도 이외로는 사용되지 않으며, 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.

가. 서비스 제공
운영자 또는 사용자가 등록한 여행 정보의 관리/저장/공유를 위한 여행관련 서비스, 기타 회사가
추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스를 제공 

나. 회원관리
회원제 서비스 이용에 따른 본인 확인, 개인식별, 불량회원의 부정 이용 방지, 가입 의사 확인,
불만 처리 등의 민원 처리, 고지사항 전달

다. 마케팅 및 광고에 활용
신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 인구통계학적 특성에 따른 서비스
제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 등 

3. 개인정보의 보유 및 이용기간
가. 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.
   단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로
   일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.
1) 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 사전에 일정한 보유목적,
   기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다. 
2) 계약 또는 청약철회 등에 관한 기록: 5년
3) 소비자의 불만 또는 분쟁처리에 관한 기록: 3년
4) 표시•광고에 관한 기록 : 6개월 
나. 회원의 동의를 받아 보유하고 있는 거래정보 등을 회원이 열람을 요구하는 경우 회사는 지체 없이
   그 열람•확인 할 수 있도록 조치 합니다. 

4. 개인정보의 제 3자 제공
회사는 고객님의 개인정보를 회사에서 제공하는 서비스 이용과 관련한 목적 외로 이용하거나 타인
또는 타기업이나 타 기관에 제공하지 않습니다. 그러나 보다 나은 서비스의 제공을 위하여 고객님의
개인정보를 협력업체 등과 공유할 필요가 있는 경우에는 제공받는 자, 제공 목적, 제공 정보 항목,
이용 및 보유 기간 등을 회원에게 고지하여 동의를 구합니다. 
다만, 아래의 경우에는 관련 법령의 규정에 의하여 고객님의 동의 없이 개인정보를 제공할 수도
있사오니 이점 양지해 주시기 바랍니다. 

이용자가 사전에 공개하거나 또는 제3자 제공에 동의한 경우. 단, 이 경우 회원은 동의를 거부할
수 있으나, 동의 거부시 서비스의 일부 또는 전부의 이용이 어려울 수 있습니다. 
관계법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가
있는 경우

5. 개인정보의 파기절차 및 방법
가. 파기절차
회원이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져
(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라
(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다. 
별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지
않습니다.
나. 파기방법
1) 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
2) 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.

6. 개인정보의 취급위탁
회사는 회원의 동의 없이 개인정보를 외부에 위탁하여 처리하지 않습니다.
가. 그러나 향후 더 나은 서비스 제공을 위하여 개인정보의 처리를 위탁하는 경우에는 미리 그 사실을
    귀하에게 고지 및 사전 동의 받겠습니다.
나. 개인정보의 처리를 위탁하는 경우에는 위탁계약 등을 통하여 서비스제공자의 개인정보보호 관련
    지시엄수, 개인정보에 관한 비밀유지, 제3자 제공의 금지 및 사고시의 책임부담 등을 명확히 
	규정하고 당해 계약내용을 서면 또는 전자적으로 보관하겠습니다.

7. 링크사이트에 대한 책임
회사는 회원님께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다.
이 경우 회사는 외부사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받는 서비스나
자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다. 회사가 포함하고 있는 링크를 
클릭(click)하여 타사이트(site)의 페이지로 옮겨갈 경우 해당 사이트의 개인정보보호정책은 회사와
무관하므로 새로 방문한 사이트의 정책을 검토해보시기 바랍니다.


8. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
회사는 회원에 대한 보다 빠른 서비스를 제공하기 위한 간단한 정보를 저장하고 수시로 찾아내는
'쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트가 회원의 컴퓨터 브라우저로 전송하는 소량의 정보
입니다. 
쿠키(cookie)는 회원의 컴퓨터(혹은 디바이스)를 식별하지만 귀하를 개인적으로 식별하지는 않습니다. 
쿠키(cookie)를 이용하여 회사는 회원의 서비스 이용형태를 파악함으로써 더욱 편리한 서비스를
만들어 제공할 수 있습니다.
귀하는 쿠키(cookie)에 대한 선택권이 있습니다. 웹 브라우저의 옵션을 조정함으로써 모든 쿠키
(cookie)를 다 받아들이거나, 쿠키(cookie)가 설치될 때 통지를 보내도록 하거나, 아니면 모든 
쿠키를 거부할 수 있는 선택권을 가질 수 있으며 수시로 변경, 삭제 등이 가능합니다. 
단, 회원이 쿠키(Cookie) 사용을 거부할 경우 서비스의 일부 또는 전부의 이용이 어려울 수
있습니다. 

9. 개인정보의 기술적/관리적 보호 대책
회사는 회원의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록
안전성 확보를 위하여 다음과 같은 기술적, 관리적 대책을 강구하고 있습니다.
가. 개인정보 암호화
이용자의 개인정보는 비밀번호에 의해 보호되며, 중요한 데이터는 저장 및 데이터 전송 시 암호화하여
보안기능을 통해 보호하고 있습니다. 
나. 해킹 등에 대비한 기술적 대책
회사는 해킹이나 컴퓨터 바이러스 등에 의해 이용자의 개인정보가 유출되거나 훼손되는 것을 막기
위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신
백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고
있으며, 암호화통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 
있습니다. 
그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로
보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.
다. 개인정보 취급 임직원의 최소화 및 교육
회사는 회사의 개인정보 취급자를 최소한으로 제한하며, 개인정보 취급자에 대한 교육 등 관리적
조치를 통해 개인정보보호의 중요성을 인식시키고 있습니다.

10. 개인정보에 관한 민원서비스
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련
부서 및 개인정보관리책임자를 지정하고 있습니다. 
- 개인정보관리책임자 성명 : 김윤희
- 전화번호 : 02-6376-0101
- 이메일 : tourplan@yedam.com

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. 
- 개인분쟁조정위원회 (www.1336.or.kr/1336) 
- 정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4) 
- 대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600) 
- 경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)

11. 고지의 의무
현 개인정보취급방침은 2018년 01월 01일부터 적용되며, 법령, 정책 또는 보안기술의 변경에 따라
내용의 추가, 삭제 및 수정이 있을 시에는 변경사항 시행일의 7일 전부터 서비스 내 '공지사항'
화면을 통해 공지할 것입니다.

- 시행일자 : 2018년 01월 01일 
- 공고일자 : 2018년 01월 01일 
		</pre>
		</span>
         </form>
         </div>
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
	$("#myModal .modal-title").text("로그인");
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
	$("#myModal .modal-title").text("로그인");
	$("#frmModal")[0].reset();
	$("#regBtn").show();
	$("#logBtn").hide();
});

//회원가입 폼 보기
$("#regBtn").click(function () {
	$("#frmModal").hide();
	$("#frmModal2").show();
	$("#myModal .modal-title").text("회원가입");
	$("#frmModal2")[0].reset();
	$("#regBtn").hide();
	$("#logBtn").show();
	$("#rPwCheck").prop('disabled', true);//비밀번호 확인 칸 비활성화
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

//로그인 처리 
$("#log").click(function() {
	
	//입력값 체크
	if($("#id").val() == ""){
        alert("아이디를 입력하세요.");
        $("#id").focus(); // 입력포커스 이동
        return; // 함수 종료
    }

	if($("#password").val() == ""){
        alert("패스워드를 입력하세요.");
        $("#password").focus(); // 입력포커스 이동
        return; // 함수 종료
    }
	
	var param = $("#frmModal").serialize();//frmModal안의 값을 가져온다
	$.getJSON("../memberAjax/select", param, function(data,status){ //form안 값 = param안의 값,  
		if(status =="success" ) {
			if(data.result == true) {
				alert(data.nickname+"님 환영합니다.");
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
				alert("회원 가입이 완료되었습니다.");
				$("#logBtn").click();
			} else {
				alert("오류");
			}
		} else {
			alert(status);
		}
	});
});

//패스워드 이메일 전송
$("#sendPw").click(function() {

	//입력값 체크
	if(memberIdCheck == 0){
        alert("아이디를 입력하세요.");
        $("#pwCk").focus(); // 입력포커스 이동
        return; // 함수 종료
    }

	var param = $("#frmModal3").serialize();
	$.getJSON("../memberAjax/passwordInit", param, function(data,status){ //뷰페이지 상에서 제이슨 형태로 데이터를 가져온다
		if(status =="success" ) {
			if(data == true) {
				alert("임시 비밀번호 전송이 완료되었습니다.");
				//부트스트랩 팝업창 닫기				$
				$("#logBtn").click();
			} else {
				alert("가입되어 있지 않은 이메일입니다.");
			}
		} else {
			alert(status);
		}
	});
});
</script>