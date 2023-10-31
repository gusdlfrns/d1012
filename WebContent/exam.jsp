<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function myFunction(){
	document.getElementByID("exam").innerHTML="변경후"
} 
</script>
</head>
<body>
<h1>JavaScript init</h1>
<p id="exam">변경전</p>
<button type="button" onclick="myFunction()">변경</button>
</body>
</html>