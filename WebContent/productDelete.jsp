<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String productId=request.getParameter("productId");
	try{
		String sql="delete from product1011 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		pstmt.executeUpdate();
		%>
			<script>
				alert("삭제완료");
				location.href="productSelect.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("삭제 실패 : "+e.getMessage());
	}
%>

</body>
</html>