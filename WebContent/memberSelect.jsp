<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
	<form name="frm" method="post" action="memberProccess.jsp">
	<table id="tab2" border=1>
		<h1>회원 정보 조회</h1>
		<tr>
			<td>이름</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>성별</td>
			<td>이메일</td>
			<td>연락처</td>
			<td>주소</td>
			<td>구분</td>
		</tr>
		<%@include file="dbconn.jsp" %>
		<%
			ResultSet rs=null;
			PreparedStatement pstmt=null;
			try{
				String sql="select * from member1011";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String id=rs.getString("id");
					String name=rs.getString("name");
					String pass=rs.getString("password");
					String gender=rs.getString("gender");
					String email=rs.getString("email");
					String phone=rs.getString("phone");
					String address=rs.getString("address");
		%>
		<tr>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=pass %></td>
			<td><%=gender %></td>
			<td><%=email %></td>
			<td><%=phone %></td>
			<td><%=address %></td>
			<td>
				<a href="productUpdate.jsp?id=<%=id %>">수정</a>/
				<a href="productDelect.jsp?id=<%=id %>"
				onclick="if(!confirm('정말로 삭제할까요?')) return false;"
				>삭제</a>
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
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>