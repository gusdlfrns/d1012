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
		<h1 id=h1>주문 정보 목록</h1>
		<%@ include file="dbconn.jsp" %>
		<table id="tab2" border=1>
			<tr>
				<th>no</th>
				<th>주문일자</th>
				<th>주문자서명</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>단가</th>
				<th>주문수량</th>				
				<th>주문자 주소</th>
				<th>구분</th>
			</tr>
			<%				
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				int no=0;
				try{
					String sql="select to_char(orderDate,'yyyy-mm-dd'), orderName,a.productId,b.name,a.unitprice,orderQty, orderAddress  from order1011 a, product1011 b where a.productId=b.productId";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String orderDate=rs.getString(1);
						String orderName=rs.getString("orderName");
						String productId=rs.getString(3);
						String name=rs.getString(4);
						String unitprice=rs.getString(5);
						String orderQty=rs.getString("orderQty");
						String orderAddress=rs.getString("orderAddress");
						no++;
					
			%>
			<tr>
				<td><%=no %></td>
				<td><%=orderDate %></td>
				<td><%=orderName %></td>
				<td><%=productId %></td>
				<td><%=name %></td>
				<td><%=unitprice %></td>
				<td><%=orderQty %></td>				
				<td><%=orderAddress %></td>
				<td>
					<a href="orderUpdate.jsp?orderDate=<%=orderDate %>&orderName=<%=orderName %>">수정</a>
					/<a href="orderDelete.jsp?orderDate=<%=orderDate %>&orderName=<%=orderName %>"
					onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
				</td>
				
			</tr>
			<%
					}
				}catch(SQLException e){
					System.out.println("읽기 오류 : "+e.getMessage());
				}
			%>
		</table>
		
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>