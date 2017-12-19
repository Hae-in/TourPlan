/*
폼 필드의 입력 여부 체크
*/
function submit_check() {
	var ele = document.forms[0].elements;
	for(i=0;i<ele.length;i++) {
		if(ele[i].getAttribute("require") == "require" && ele[i].value == "") {
			alert(ele[i].getAttribute("title")+" 필수입력항목입니다. 입력해주세요.");
			ele[i].focus();
			return false;
		}
	}
	    if(document.form1.idDuplication.value != "idcheck"){
	        alert("아이디 중복체크를 해주세요.");
	        return false;
	    }
	   
	    if(document.form1.member_password.value != form1.member_passwordcheck.value ){
	        alert("비밀번호를 동일하게 입력하세요.");
	        return false;
	    }   
	    
	    if(document.form1.emailDuplication.value != "emailcheck"){
	        alert("이메일 중복체크를 해주세요.");
	        return false;
	    }
	    if(document.form1.agree.value != "y"){
	        alert("동의 약관을 체크해주세요.");
	        return false;
	    }
	return true;
}

// 문제지 등록/수정시 노출되는 카테고리 리스트(전체 카테고리)
function loadCategoryListAll(selectVal) {	
	new ajax.xhr.Request("../CategoryServletAjax","action=select",loadCategoryAllResult,"get",null,selectVal);
}

function loadCategoryAllResult(req,selectVal) {
	if(req.readyState == 4 && req.status == 200) {		
		var xmlDoc = req.responseXML;
		var code = xmlDoc.getElementsByTagName("code")[0].firstChild.nodeValue;
		var data = xmlDoc.getElementsByTagName("data")[0].firstChild.nodeValue;
		if(code == "success") {
			var list = eval('('+data+')');	//서버의 전송결과를 JSON 변환
			var listDiv = document.getElementsByName("category_no")[0];
			var selected = 0;
			for(i=0;i<list.length;i++) {
				var option = document.createElement("option");	//option 태그 생성				
				option.value = list[i].category_no;
				option.text = list[i].category_name;
  				if(list[i].category_no == selectVal){
					selected = i+1;
				}
				listDiv.add(option);				
			}
			listDiv.selectedIndex = selected;
		} else {
			alert("에러발생" + data);	
		}		
	}	
}

//1단계 : 문제관리 리스트박스에 노출되는 카테고리(등록된 카테고리만)
function loadCategoryList(selectVal) {	
	new ajax.xhr.Request("./CategoryServletAjax","action=select",loadCategoryResult,"get",null,selectVal);
}

function loadCategoryResult(req,selectVal) {
	if(req.readyState == 4 && req.status == 200) {		
		var xmlDoc = req.responseXML;
		var code = xmlDoc.getElementsByTagName("code")[0].firstChild.nodeValue;
		var data = xmlDoc.getElementsByTagName("data")[0].firstChild.nodeValue;
		if(code == "success") {
			var list = eval('('+data+')');	//서버의 전송결과를 JSON 변환
			var listDiv = document.getElementsByName("category_no")[0];
			var selected = 0;
			for(i=0;i<list.length;i++) {
				var option = document.createElement("option");	//option 태그 생성				
				option.value = list[i].category_no;
				option.text = list[i].category_name + "(" + list[i].category_count + ")";
  				if(list[i].category_no == selectVal){
					selected = i+1;
				}
				listDiv.add(option);				
			}
			listDiv.selectedIndex = selected;
		} else {
			alert("에러발생" + data);	
		}		
	}	
}

//2단계 : 문제관리 리스트박스에 노출되는 문제지 상태값
function loadConfirmList(selectVal, category_no) {	
	new ajax.xhr.Request("../PaperServletAjax","action=selectConfirm&category_no="+category_no,loadConfirmResult,"get",null,selectVal);
}

function loadConfirmResult(req,selectVal) {	
	if(req.readyState == 4 && req.status == 200) {		
		var xmlDoc = req.responseXML;
		var code = xmlDoc.getElementsByTagName("code")[0].firstChild.nodeValue;
		var data = xmlDoc.getElementsByTagName("data")[0].firstChild.nodeValue;
		if(code == "success") {
			var list = eval('('+data+')');	//서버의 전송결과를 JSON 변환
			var listDiv = document.getElementsByName("paper_confirm")[0];
			var selected = 0;
			for(i=0;i<list.length;i++) {
				var option = document.createElement("option");	//option 태그 생성				
				option.value = list[i].paper_confirm;
				option.text = list[i].paper_confirm_name+"("+list[i].confirm_count+")";
  				if(list[i].paper_confirm == selectVal){
					selected = i;
				}
				listDiv.add(option);				
			}
			listDiv.selectedIndex = selected;
		} else {
			alert("에러발생" + data);	
		}		
	}	
}

//3단계 : 문제관리 리스트박스에 노출되는 문제지 목록

function loadPaperList(selectVal, category_no, paper_confirm) {	
	new ajax.xhr.Request("../PaperServletAjax","action=select&category_no="+category_no+"&paper_confirm="+paper_confirm,loadPaperResult,"get",null,selectVal);
}

function loadPaperResult(req,selectVal) {	
	if(req.readyState == 4 && req.status == 200) {		
		var xmlDoc = req.responseXML;
		var code = xmlDoc.getElementsByTagName("code")[0].firstChild.nodeValue;
		var data = xmlDoc.getElementsByTagName("data")[0].firstChild.nodeValue;
		if(code == "success") {
			var list = eval('('+data+')');	//서버의 전송결과를 JSON 변환
			var listDiv = document.getElementsByName("paper_no")[0];
			var selected = 0;
			for(i=0;i<list.length;i++) {
				var option = document.createElement("option");	//option 태그 생성				
				option.value = list[i].paper_no;
				option.text = list[i].paper_name+"("+list[i].paper_confirm_name+")";
  				if(list[i].paper_no == selectVal){
					selected = i;
				}
				listDiv.add(option);				
			}
			listDiv.selectedIndex = selected;
		} else {
			alert("에러발생" + data);	
		}		
	}	
}