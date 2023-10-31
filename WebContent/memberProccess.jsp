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
		String sql="insert into member1011 values(?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,name);
		pstmt.setString(3,pass);
		pstmt.setString(4,gender);
		pstmt.setString(5,email);
		pstmt.setString(6,phone);
		pstmt.setString(7,address);
		pstmt.executeUpdate();
		%>
			<script>
				alert("저장 완료");
				location.href="memberSelect.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("저장 실패 : "+e.getMessage());
	}
%>