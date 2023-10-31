<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.frm.id.value==""){
			alert("아이디를 입력하세요");
			document.frm.id.focus();
			return false;
		}
		if(document.frm.name.value==""){
			alert("이름을 입력하세요");
			document.frm.name.focus();
			return false;
		}
		if(document.frm.psw.value==""){
			alert("비밀번호를 입력하세요");
			document.frm.psw.focus();
			return false;
		}
		if(document.frm.pswc.value==""){
			alert("확인 비밀번호를 입력하세요");
			document.frm.pswc.focus();
			return false;
		}
		if(document.frm.psw.value != document.frm.pswc.value){
			alert("비밀번호와 확인 비밀번호가 다릅니다.");
			document.frm.pswc.focus();
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h1>회원 가입 등록 화면</h1>
		<hr>
		<form name="frm" method="post" action="memberProccess.jsp">
			<table id="tab1" border=1>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="in1"></td>
			</tr>	
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="in1"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="psw" id="in1"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pswc" id="in1"></td>
			</tr>
			<tr>
				<th>성별
					<td>
						<input type="radio" name="gender" value="남성">남성
						<input type="radio" name="gender" value="여성">여성
					</td>
				</th>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
				<input type="text" name="emailid" id="in2">@
				<select name="emaildomain">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="gmail.com">gmail.com</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
				<select name="phonefirst">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="091">091</option>
					<option value="02">02</option>
					<option value="051">051</option>
				</select>-
				<input type="text" name="phonemid" id="in3">-
				<input type="text" name="phoneend" id="in3">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="in4"></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input id="btn1" type="button" value="등록" onclick="check()">
					<input id="btn1" type="reset" value="취소">					
				</td>
			</tr>
			</table>
		</form>
		<hr>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>