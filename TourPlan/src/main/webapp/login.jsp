<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�α���������</title>
<%@ include file="../include/header.jsp" %>
<script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // ��ũ.val() : �±׿� �Էµ� ��
            // ��ũ.val("��") : �±��� ���� ���� 
            var userId = $("#userId").val();
            var userPw = $("#userPw").val();
            if(userId == ""){
                alert("���̵� �Է��ϼ���.");
                $("#userId").focus(); // �Է���Ŀ�� �̵�
                return; // �Լ� ����
            }
            if(userPw == ""){
                alert("���̵� �Է��ϼ���.");
                $("#userPw").focus();
                return;
            }
            // �� ������ �����͸� ������ �ּ�
            document.form1.action="${path}/member/loginCheck.do"
            // ����
            document.form1.submit();
        });
    });
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>�α���</h2>
    <form name="form1" method="post">
        <table border="1" width="400px">
            <tr>
                <td>���̵�</td>
                <td><input name="userId" id="userId"></td>
            </tr>
            <tr>
                <td>��й�ȣ</td>
                <td><input type="password" name="userPw" id="userPw"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="btnLogin">�α���</button>
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
</body>
</html>
