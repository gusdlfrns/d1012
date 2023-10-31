<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function test(){
	if(document.form.t1.value == ""){
		alert("1번 입력창을 입력하세요.");
		document.form.t1.focus();
		return false;
	}
	if(document.form.t1.value.length < 5 || document.form.t1.value.length > 12){
		alert("1번 입력창은 5~12 사이입니다.");
		document.form.t1.focus();
		return false;
	}
	if(document.form.t2.value == "0"){
		alert("2번을 입력하세요");
		document.form.t2.focus();
		return false;
	}
	
	var chk = document.getElementsByName("chk");
	var cnt = 0;
	for(var i = 0; i < chk.length; i++){
		if(chk[i].checked){
			cnt++;
			break;
		}
	}
	
	cnt = 0;
	var rdo = document.getElementsByName("rao");
	for(var i = 0; i < rdo.length; i++){
		if(rdo[i].checked){
			cnt++;
			break;
		}
	}
	if(cnt == 0){
		alert("4번을 체크하세요");
		return false;
	}
	
	alert("유효성 체크 완료");
	document.form.submit();
}
</script>
</head>
<body>
<form name="form" method="post" action="testProcess.jsp">
	1. Text<br>
	<input type="text" id="t1" name="t1"><br>
	2. select<선택안함 : 없음><br>
	<select name="t2">
		<option value="0">없음</option>
		<option value="1">가을</option>
		<option value="2">겨울</option>
		<option value="3">봄</option>
		<option value="4">여름</option>
	</select><br>
	3.checkbox<br>
	<input type="checkbox" name="chk" value="a">a 방법
	<input type="checkbox" name="chk" value="b">b 방법
	<input type="checkbox" name="chk" value="c">c 방법<br>
	4.radio button<br>
	<input type="radio" name="rao" value="male">남성
	<input type="radio" name="rao" value="female">여성
	<br>
	<input type ="button" value="유효성검사" onclick="test()">
</form>
</body>
</html>
