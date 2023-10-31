<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<section>
		<h1 id="h1">상품 조회 목록</h1>
		<table border=1 id="tab2">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>단가</th>
				<th>상세정보</th>				
				<th>분류</th>
				<th>제조사</th>
				<th>재고수량</th>
				<th>상태</th>
				<th>구분</th>
			</tr>
			<tr>
				<%
					ResultSet rs=null;
					PreparedStatement pstmt=null;
				try{
					String sql="select * from product1011";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String productId=rs.getString("productId");
						String name=rs.getString("name");
						String unitprice=rs.getString("unitprice");
						String description=rs.getString("description");
						String category=rs.getString("category");
						String manufacturer=rs.getString("manufacturer");
						String unitInstock=rs.getString("unitInstock");
						String condition=rs.getString("condition");
				%>
				<td><%=productId %></td>
				<td><%=name %></td>
				<td><%=unitprice %></td>
				<td><%=description %></td>
				<td><%=category %></td>
				<td><%=manufacturer %></td>
				<td><%=unitInstock %></td>
				<td><%=condition %></td>
				<td>
					<a href="productUpdate.jsp?productId=<%=productId %>">수정</a>/
					<a href="productDelete.jsp?productId=<%=productId %>"
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
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>