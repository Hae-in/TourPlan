<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
	var xhttp = new XMLHttpRequest();
	var xhttp2 = new XMLHttpRequest();
	var timer = null;
	var i = 0;
	
	function loadXML() {
		if (timer != null) {
			clearTimeout(timer);
		}
		xhttp.onreadystatechange = callback;

		xhttp.open("GET", "./plan/selectAll.do", true);
		xhttp.send();
	}

	function callback() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var str = xhttp.responseText;
			var obj = eval( '(' + str + ')');
			
			for(i=0; i<obj.length; i++) {
				$('<div>' + obj[i].placename + '</div>').appendTo($("#"+obj[i].tr));
			}	0
			
		}
		
		loadXML2();
	}

	function loadXML2() {
		xhttp2.onreadystatechange = callback2;

		xhttp2.open("GET", "./plan/selectAll.do", true);
		xhttp2.send();
	}

	function callback2() {
		if (xhttp2.readyState == 4 && xhttp2.status == 200) {
			var str = xhttp2.responseText;
			var obj = eval( '(' + str + ')');
			
			for(i=0; i<5; i++) {
				var sw = 1;
				for(j=0; j<obj.length; j++) {
					if(i == obj[j].tr) {
						document.getElementById(i).innerHTML = "<div>" + obj[j].placename + "</div>";
						sw = 0;
					}
				}
				
				if(sw == 1) {
					document.getElementById(i).innerHTML = "";
				}
			}
			
			var reloadFunc = function() {
				model.loadMessage.apply(model);
			}
			
			timer = setTimeout(loadXML2, 1000);
		}
	}
window.addEventListener("load", loadXML, false); 
</script>
</head>
<body>
<table border="1">
	<tr height="50">
		<td id="0"></td>
	</tr>
	<tr height="50">
		<td id="1"></td>
	</tr>
	<tr height="50">
		<td id="2"></td>
	</tr>
	<tr height="50">
		<td id="3"></td>
	</tr>
	<tr height="50">
		<td id="4"></td>
	</tr>
</table>
</body>
</html>