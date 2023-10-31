<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String productId=request.getParameter("productId");
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String unitprice=request.getParameter("unitprice");
	String orderQty=request.getParameter("orderQty");
	String address=request.getParameter("address");
	int Qty=Integer.parseInt(orderQty);
	try{
		String sql="insert into order1011 values(?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,orderDate);
		pstmt.setString(2,orderName);
		pstmt.setString(3,productId);
		pstmt.setString(4,unitprice);
		pstmt.setString(5,orderQty);
		pstmt.setString(6,address);
		pstmt.executeLargeUpdate();
		sql="update product1011 set unitInstock=unitInstock-? where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, Qty);
		pstmt.setString(2, productId);
		pstmt.executeUpdate();
		%>
		<script>
			alert("저장 완료");
			location.href="orderSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("저장 오류: "+e.getMessage());
	}
%>