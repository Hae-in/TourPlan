<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Dialog - Modal form</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function modal_iframe(title, url, width, height) {
		$("#dialog-form").html("");
		$("#dialog-form").append("<iframe src='" + url + "' width='98%' height='98%' frameborder='0'></iframe>");
		dialog.dialog("open");
	}
	var dialog;
	$(function() {
		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 800,
			width : 1000,
			modal : true
		});
	});
</script>
</head>
<body>
<div id="dialog-form"></div>

	<div id="users-contain" class="ui-widget">
		<h1>Existing Users:</h1>
		<table id="users" class="ui-widget ui-widget-content">
			<thead>
				<tr class="ui-widget-header ">
					<th>Name</th>
					<th>Email</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John Doe</td>
					<td>john.doe@example.com</td>
					<td>johndoe1</td>
				</tr>
			</tbody>
		</table>
	</div>
	<button onclick="modal_iframe('명소등록','place/form.do','500','500')">Create
		new user</button>


</body>
</html>