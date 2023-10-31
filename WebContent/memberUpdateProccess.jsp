<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String pass=request.getParameter("psw");
	String gender=request.getParameter("gender");
	String email=request.getParameter("emailid")+"@"+request.getParameter("emaildomain");
	String phone=request.getParameter("phonefirst")+"-"+request.getParameter("phonemid")+"-"+request.getParameter("phoneend");
	String address=request.getParameter("address");
	try{
		String sql="update member1011 set name=?, password=?, gender=?,email=?, phone=?, address=? where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,pass);
		pstmt.setString(3,gender);
		pstmt.setString(4,email);
		pstmt.setString(5,phone);
		pstmt.setString(6,address);
		pstmt.setString(7,id);
		pstmt.executeUpdate();
		%>
			<script>
				alert("수정 완료");
				location.href="memberSelect.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("수정 실패 : "+e.getMessage());
	}
%>