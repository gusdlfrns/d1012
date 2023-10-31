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
		<h1>회원 정보 수정 화면</h1>
		<hr>
		<%@include file="dbconn.jsp" %>
		<%
			ResultSet rs=null;
			PreparedStatement pstmt=null;
			String id=request.getParameter("id");
			try{
				String sql="select * from member1011 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs=pstmt.executeQuery();
				if (rs.next()){
					String name=rs.getString("name");
					String pass=rs.getString("password");
					String gender=rs.getString("gender");
					String email=rs.getString("email");
					String phone=rs.getString("phone");
					String address=rs.getString("address");					
					String[] ema=email.split("@");//kkk@hanmail.net					
					String ph[]=phone.split("-");
		%>
		<form name="frm" method="post" action="memberUpdateProccess.jsp">
			<table id="tab1" border=1>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="in1" value="<%=id%>"></td>
			</tr>	
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="in1" value="<%=name%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="psw" id="in1" value="<%=pass%>"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pswc" id="in1" value="<%=pass%>"></td>
			</tr>
			<tr>
				<th>성별
					<td>
						<input type="radio" name="gender" value="남성" <%=gender.equals("남성") ?"checked":""%>>남성
						<input type="radio" name="gender" value="여성" <%=gender.equals("여성") ?"checked":""%>>여성
					</td>
				</th>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
				<input type="text" name="emailid" id="in2" value="<%=ema[0]%>">@
				<select name="emaildomain" value="<%=ema[1] %>">
					<option value="naver.com" <%=ema[1].equals("naver.com") ?"selected":""%>>naver.com</option>
					<option value="daum.net" <%=ema[1].equals("daum.net") ?"selected":""%>>daum.net</option>
					<option value="nate.com" <%=ema[1].equals("nate.com") ?"selected":""%>>nate.com</option>
					<option value="hotmail.com" <%=ema[1].equals("hotmail.com") ?"selected":""%>>hotmail.com</option>
					<option value="gmail.com" <%=ema[1].equals("gmail.com") ?"selected":""%>>gmail.com</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
				<select name="phonefirst" value="<%=ph[0] %>">
					<option value="010" <%=ph[0].equals("010") ?"selected":""%>>010</option>
					<option value="011" <%=ph[0].equals("011") ?"selected":""%>>011</option>
					<option value="091" <%=ph[0].equals("091") ?"selected":""%>>091</option>
					<option value="02" <%=ph[0].equals("02") ?"selected":""%>>02</option>
					<option value="051" <%=ph[0].equals("051") ?"selected":""%>>051</option>
				</select>-
				<input type="text" name="phonemid" id="in3" value="<%=ph[1] %>">-
				<input type="text" name="phoneend" id="in3" value="<%=ph[2] %>">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="in4" value="<%=address%>"></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input id="btn1" type="button" value="수정" onclick="check()">
					<input id="btn1" type="reset" value="취소">					
				</td>
			</tr>
			<%
					}
				}catch(SQLException e){
					System.out.println("읽기 에러 : "+e.getMessage());
			}
			%>
			</table>
		</form>
		<hr>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>