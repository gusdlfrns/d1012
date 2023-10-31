<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	
	//String productId=request.getParameter("productId");
	try{
		String sql="update product1011 set name=?, unitprice=?, description=?, category=?, manufacturer=?, unitsInstock=?, condition=? where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(8,request.getParameter("productId"));
		pstmt.setString(1,request.getParameter("name"));
		pstmt.setString(2,request.getParameter("unitprice"));
		pstmt.setString(3,request.getParameter("description"));
		pstmt.setString(4,request.getParameter("category"));
		pstmt.setString(5,request.getParameter("manufacturer"));
		pstmt.setString(6,request.getParameter("unitsInstock"));
		pstmt.setString(7,request.getParameter("condition"));
		pstmt.executeUpdate();
		%>
			<script>
				alert("저장 완료");
				location.href="productSelect.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("저장 실패 : "+e.getMessage());
	}
%>