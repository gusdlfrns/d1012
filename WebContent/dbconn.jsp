<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	Connection conn=null;
	try{
		String url="jdbc:oracle:thin:@//localhost:1521/xe";
		String user="system";
		String pass="1234";
		String Driver="oracle.jdbc.OracleDriver";
		Class.forName(Driver);
		conn=DriverManager.getConnection(url, user, pass);
		System.out.println("database 연결 성공");
	}catch(SQLException e){
		System.out.println("database 연결 오류 : "+e.getMessage());
	}
%>